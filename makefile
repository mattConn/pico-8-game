GAME = pico-8-game
PP = gpp

$(GAME).p8: main.lua main.p8
	$(PP) main.p8 > $@

clean:
	rm $(GAME).p8
