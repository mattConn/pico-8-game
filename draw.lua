function _draw()
	cls()

	print(player.x)
	print(platform.x)

	spr(player.sprite,player.x,player.y)
	spr(platform.sprite,platform.x,platform.y)
end
