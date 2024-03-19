ASL=asl
MAME=mame
PERL=perl
P2BIN=p2bin
SPLICE=splice
MINIPRO=minipro

ASLARGS=-CPU TMS9995 -i .
MAMEARGS=-skip_gameinfo

# for burning
# location of ROM file we will splice into (used with TeamEurope flashcarts)
BASEROM=$(HOME)/tutor.bin
# device we're burning to (used with TeamEurope flashcarts)
MINIPRODEV=SST39SF040

.PHONY: run run40 burn clean

.SUFFIXES: .rom .bld .a99

run: tello.rom
	$(MAME) tutor $(MAMEARGS) -cart $?

run40: tello40.rom
	$(MAME) tutor $(MAMEARGS) -cart $?

burn: tello.rom tello40.rom
	# TeamEurope's flash cart has games at 16K intervals
	# use DIP patterns 00011 and 00010
	$(PERL) $(SPLICE) $(BASEROM) 0x70000 tello.rom 0x2000
	$(PERL) $(SPLICE) $(BASEROM) 0x74000 tello40.rom 0x2000
	$(MINIPRO) -p $(MINIPRODEV) -z
	$(MINIPRO) -p $(MINIPRODEV) -w $(BASEROM)

clean:
	rm -rf *.bld *.rom *.lst


tello.bld: tello.a99 tomykeys.tbl tomyscii.bin
	$(ASL) tello.a99 -L -olist $@.lst $(ASLARGS) -o $@

tello40.bld: tello.a99 tomykeys.tbl tomysc40.bin
	$(ASL) tello.a99 -D COLS40 -L -olist $@.lst $(ASLARGS) -o $@


.bld.rom:
	$(P2BIN) $? $@

.a99.bld:
	$(ASL) $? -L -olist $@.lst $(ASLARGS) -o $@

