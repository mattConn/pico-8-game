GAME = pico-8-game
PP = gpp

$(GAME).p8: global.lua update.lua draw.lua main.p8
	$(PP) main.script > main.lua; $(PP) main.p8 > $@; rm main.lua

clean:
	rm $(GAME).p8
