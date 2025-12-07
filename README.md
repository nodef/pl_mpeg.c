## PL_MPEG - MPEG1 Video decoder, MP2 Audio decoder, MPEG-PS demuxer

Single-file MIT licensed library for C/C++, by [Dominic Szablewski](https://github.com/phoboslab).

See [pl_mpeg.h](https://github.com/phoboslab/pl_mpeg/blob/master/pl_mpeg.h) for
the documentation.

<br>


### Why?

This is meant as a simple way to get video playback into your app or game. Other
solutions, such as ffmpeg require huge libraries and a lot of glue code.

MPEG1 is an old and inefficient codec, but it's still good enough for many use
cases. All patents related to MPEG1 and MP2 have expired, so it's completely
free now.

This library does not make use of any SIMD instructions, but because of
the relative simplicity of the codec it still manages to decode 4k60fps video
on a single CPU core (on my i7-6700k at least).

<br>


### Installing

Run:
```bash
$ npm i pl_mpeg.c
```

And then include `pl_mpeg.h` as follows:
```c
// main.c
#define PL_MPEG_IMPLEMENTATION
#include "node_modules/pl_mpeg.c/pl_mpeg.h"

int main() { /* ... */ }
```

And then compile with `clang` or `gcc` as usual.

```bash
$ clang main.c  # or, use gcc
$ gcc   main.c
```

You may also use a simpler approach:

```c
// main.c
#define PL_MPEG_IMPLEMENTATION
#include <pl_mpeg.h>

int main() { /* ... */ }
```

If you add the path to `node_modules/pl_mpeg.c` to your compiler's include paths.

```bash
$ clang -I./node_modules/pl_mpeg.c main.c  # or, use gcc
$ gcc   -I./node_modules/pl_mpeg.c main.c
```

<br>


### Encoding for PL_MPEG

Most [MPEG-PS](https://en.wikipedia.org/wiki/MPEG_program_stream) (`.mpg`) files
containing MPEG1 Video ("mpeg1") and MPEG1 Audio Layer II ("mp2") streams should
work with PL_MPEG. Note that `.mpg` files can also contain MPEG2 Video, which is
not supported by this library.

You can encode video in a suitable format using ffmpeg:

```
ffmpeg -i input.mp4 -c:v mpeg1video -q:v 0 -c:a libtwolame -b:a 224k -format mpeg output.mpg
```

`-q:v` sets a fixed video quality with a variable bitrate, where `0` is the
highest. You may use `-b:v` to set a fixed bitrate instead; e.g.
`-b:v 2000k` for 2000 kbit/s. Please refer to the
[ffmpeg documentation](http://ffmpeg.org/ffmpeg.html#Options) for more details.

If you just want to quickly test the library, try this file:

https://phoboslab.org/files/bjork-all-is-full-of-love.mpg

<br>


### Limitations

- No error reporting. PL_MPEG will silently ignore any invalid data.
- The PTS (presentation time stamp) for packets in the MPEG-PS container is
ignored. This may cause sync issues with some files.
- Bugs, probably.

<br>
<br>


[![ORG](https://img.shields.io/badge/org-nodef-green?logo=Org)](https://nodef.github.io)
![](https://ga-beacon.deno.dev/G-RC63DPBH3P:SH3Eq-NoQ9mwgYeHWxu7cw/github.com/nodef/pl_mpeg.c)
