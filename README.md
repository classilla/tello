# Tello World: Fast Character I/O for the Tomy Tutor

[Another Old VCR Heartwarming Moment!](https://oldvcr.blogspot.com/2024/03/after-41-years-my-first-assembly.html)

Copyright (C) 2024 Cameron Kaiser.  
All rights reserved.  
BSD 3-clause license.

## Hello, Tomy

This is a sample demonstration of a character I/O package for the Tomy Tutor written in TMS 9900/9995 assembly language. It features a character set organized to match true ASCII, so you can read and write ASCII characters directly to and from VDP memory; full support (with its own modified font) for 40 column text; and a full N-key rollover input routine that can finally keep up with your typing. [See the blog post](https://oldvcr.blogspot.com/2024/03/after-41-years-my-first-assembly.html) for more details on its construction and use.

## How to build

To build a simple ROM cartridge file you can run in something like MAME, all you need is the assembler and `p2bin` tool from [the Macroassembler AS](http://john.ccac.rwth-aachen.de:8000/as/). Type either `make tello.rom` or `make tello40.rom` to make the 32-column or 40-column version respectively. The fonts are the two `.bin` files and can be changed with any character set editor. If you intend to use something like Ultrafont+ to edit them on a Commodore 64, remember to add a two byte starting address (for Ultrafont+, use `00 70`) and remove it when you're done.

To build and run in MAME, try `make run` or `make run40`. By default, this will execute `mame tutor -skip_gameinfo -cart tello.rom` or `tello40.rom`, as appropriate.

If you have a TeamEurope or compatible flashcart image stored as `tutor.bin` in your home directory and an SST39SF040 512K flash ROM in your minipro-compatible programmer, you can `make burn` to splice it into the flashcart image at offset 0x70000 through 0x78000 and update the flash ROM. The [`minipro`](https://gitlab.com/DavidGriffith/minipro) utility is required. I recommend using an older burner like the TL866-II+ for compatibility since the newer T48 and T56 units may not be fully supported. *WARNING!* I am not responsible for you burning crap to your multicart ROM!

## Don't file bugs or pull requests

... unless you intend to fix them yourself. Feature requests without code will be closed and probably deleted. Refactors to your favourite assembler will be ignored; fork the project and make me proud.

## License

Copyright (C) 2024 Cameron Kaiser. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. The name of the author may not be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE, SO THERE.

