README

**Compile:**
```bash
$ make
hfst-regexp2fst -S -o ewo.spellrelax.hfst < apertium-ewo.ewo.spellrelax
hfst-lexc apertium-ewo.ewo_Miss.phon | hfst-invert | hfst-compose -1 - -2 ewo.spellrelax.hfst | hfst-invert | hfst-fst2fst -w -o ewo_OGC-ewo_Miss.autoconv.hfst
hfst-lexc: warning: Defaulting to OpenFst tropical type
Root...1 Loop...2 Trigraphs...3 Digraphs...9 Letters...
```

**Test:**
```bash
$ echo "Á mə̄tádí, ńdɔ Zambá á ngákom yób ai sí" | hfst-proc ewo_OGC-ewo_Miss.autoconv.hfst 
^Á/a$ ^mə̄tádí/metadi$, ^ńdɔ/ndo$ ^Zambá/Zamba$ ^á/a$ ^ngákom/ngakom$ ^yób/yob$ ^ai/ai$ ^sí/si$
```
