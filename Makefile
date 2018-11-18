.PHONY:	all clean byte native profile debug test

OCB_FLAGS = -tag bin_annot
OCB = 		ocamlbuild $(OCB_FLAGS)

all: native byte # profile debug

clean:
	$(OCB) -clean

native:
	$(OCB) blackjack.native

byte:
	$(OCB) blackjack.byte

profile:
	$(OCB) -tag profile blackjack.native

debug:
	$(OCB) -tag debug blackjack.byte
