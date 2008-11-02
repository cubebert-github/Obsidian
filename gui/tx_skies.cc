//------------------------------------------------------------------------
//  SKY GENERATION
//------------------------------------------------------------------------
//
//  Oblige Level Maker (C) 2008 Andrew Apted
//
//  This program is free software; you can redistribute it and/or
//  modify it under the terms of the GNU General Public License
//  as published by the Free Software Foundation; either version 2
//  of the License, or (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//------------------------------------------------------------------------

#include "headers.h"

#include "lib_util.h"
#include "main.h"

#include "twister.h"
#include "tx_forge.h"
#include "tx_skies.h"


byte * SKY_GenGradient(int W, int H, std::vector<byte> & colors)
{
  int numcol = (int)colors.size();

  SYS_ASSERT(numcol > 0);

  byte *pixels = new byte[W * H];

  for (int y = 0; y < H; y++)
  {
    // we assume that (in general) top is light, bottom is dark
    int idx = (H-1-y) * numcol / H;

    byte color = colors[idx];

    byte *dest  = & pixels[y * W];
    byte *d_end = dest + W;

    while (dest < d_end)
    {
      *dest++ = color;
    }
  }

  return pixels;
}


byte * SKY_GenClouds(int seed, int W, int H, std::vector<byte> & colors,
                     float squish, double fracdim, double powscale)
{
  // SYS_ASSERT(is_power_of_two(W))
  // SYS_ASSERT(is_power_of_two(H))

  SYS_ASSERT(W >= H);

  int numcol = (int)colors.size();

  SYS_ASSERT(numcol > 0);
  SYS_ASSERT(squish > 0);
  SYS_ASSERT(powscale > 0);

  float * synth = new float[W * W];

  TX_SpectralSynth(seed, synth, W, fracdim, powscale);

  byte *pixels = new byte[W * H];

  for (int y = 0; y < H; y++)
  {
    int sy = (int)(y * squish) & (W-1);

    const float *src = & synth[sy * W];

    byte *dest  = & pixels[y * W];
    byte *d_end = dest + W;

    while (dest < d_end)
    {
      int idx = (int)(*src++ * numcol);

      idx = CLAMP(0, idx, numcol-1);

      *dest++ = colors[idx];
    }
  }

  delete[] synth;

  return pixels;
}


byte * SKY_GenStars(int seed, int W, int H, std::vector<byte> & colors,
                    double powscale, double cutoff)
{
  int numcol = (int)colors.size();

  SYS_ASSERT(numcol >= 2);
  SYS_ASSERT(powscale > 0);
  SYS_ASSERT(cutoff > 0);

  MT_rand_c twist(seed);

  byte *pixels = new byte[W * H];

  memset(pixels, colors[0], W * H);

  for (int y = 0; y < H; y++)
  {
    byte *dest  = & pixels[y * W];
    byte *d_end = dest + W;

    while (dest < d_end)
    {
      double v  = twist.Rand_fp();
             v *= twist.Rand_fp();
             v *= twist.Rand_fp();

      v = pow(v, powscale);

      if (v < cutoff)
      {
        dest++;
        continue;
      }

      v = (v - cutoff) / (1.0 - cutoff);

      int idx = 1 + (int)(v * (numcol-1));

      idx = CLAMP(1, idx, numcol-1);

      *dest++ = colors[idx];
    }
  }

  return pixels;
}


void SKY_AddHills(int seed, byte *pixels, int W, int H,
                  std::vector<byte> & colors,
                  float min_h, float max_h,
                  double fracdim, double powscale)
{
  int numcol = (int)colors.size();

  SYS_ASSERT(numcol >= 2);
  SYS_ASSERT(powscale > 0);
  SYS_ASSERT(max_h >= min_h);

  float * height_map = new float[W * W];

  TX_SpectralSynth(seed, height_map, W, fracdim, powscale);


  max_h = max_h - min_h;

  MT_rand_c twist(seed ^ 1);


  // draw a column of pixels for every point on the height map.
  // optimised to only draw the visible parts.

  for (int x = 0; x < W; x++)
  {
    // remember the highest span for this column
    int high_span = 0;

    for (int z = 0; z < W; z++)
    {
      float f = height_map[z*W + x];

      f = min_h + f * max_h;

      int span = int(f*H);

      // hidden by previous spans?
      if (span <= high_span)
        continue;

      if (span >= H)
        span = H-1;

      float ity = abs(z - W/2) / float(W/2);

      ity = 1.0 - ity * 0.7;

      for (int y = high_span; y < span; y++)
      {
        float i2 = ity - 0.3 * twist.Rand_fp();

        int idx = (int)(i2 * numcol);

        idx = CLAMP(0, idx, numcol-1);

        pixels[(H-1-y)*W + x] = colors[idx];
      }

      high_span = span;
    }
  }

  delete[] height_map;
}

void SKY_AddBuilding(byte *pixels, int W, int H,
                     std::vector<byte> & colors,
                     int pos_x, int width, int base_h, int top_h,
                     int win_w, int win_h)
{
  int numcol = (int)colors.size();

  SYS_ASSERT(numcol >= 2);
 
  int x, y;

  for (y = 0; y < base_h + top_h; y++)
  {
    if (y >= H)
      break;

    int x1 = pos_x;
    int x2 = pos_x + width - 1;

    if (y >= base_h)
    {
      x1 = x1 + width / 8;
      x2 = x2 - width / 8;
    }

    for (x = x1; x <= x2; x++)
    {
      int idx = 0;

      // window?
      if (x > x1+1 && x < x2-1 &&
          y > 1 && y < top_h+base_h-1 &&
          (y < base_h-1 || y > base_h) &&
          (x % (win_w+1) > 0) &&
          (y % (win_h+1) > 0))
      {
        idx = 1;
        
        if (win_w == 1 && (rand() & 0x80))
          idx = 0;
      }

      pixels[(H-1-y)*W + (x % W)] = colors[idx];
    }
  }
}


//--- editor settings ---
// vi:ts=2:sw=2:expandtab
