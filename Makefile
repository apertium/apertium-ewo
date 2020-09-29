all:
	hfst-regexp2fst -S -o ewo.spellrelax.hfst < apertium-ewo.ewo.spellrelax
	hfst-lexc apertium-ewo.ewo_Miss.phon | hfst-invert | hfst-compose -1 - -2 ewo.spellrelax.hfst | hfst-invert | hfst-fst2fst -w -o ewo_OGC-ewo_Miss.autoconv.hfst

clean:
	rm *.hfst
