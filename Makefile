all:
	hfst-regexp2fst -S -o ewo.spellrelax.hfst < apertium-ewo.ewo.spellrelax
	hfst-lexc apertium-ewo.ewo_Miss.phon | hfst-invert | hfst-compose -1 - -2 ewo.spellrelax.hfst | hfst-invert -o ewo_AGLC-ewo_Miss.conv.hfst
	hfst-fst2fst -w ewo_AGLC-ewo_Miss.conv.hfst -o ewo_AGLC-ewo_Miss.autoconv.hfst
	hfst-lexc apertium-ewo.ewo.lexc -o ewo.lexc.hfst
	hfst-compose -1 ewo.lexc.hfst -2 ewo.spellrelax.hfst -o ewo.lexc.spell.hfst
	hfst-compose -1 ewo.lexc.hfst -2 ewo_AGLC-ewo_Miss.conv.hfst -o ewo.lexc.miss.hfst
	hfst-union -1 ewo.lexc.spell.hfst -2 ewo.lexc.miss.hfst | hfst-invert | hfst-fst2fst -w -o ewo.automorf.hfst

clean:
	rm *.hfst
