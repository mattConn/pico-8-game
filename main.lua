pl = { -- pl --
	x = 20,
	y = 20,
	sprite = 0,
	speed = 3
}

function move()
	pl.moving = true
	pl.sprite += 1

	if pl.sprite > 1 then
		pl.sprite = 0
	end
end

function _update()
	pl.moving = false

	if btn(0) then
		pl.x -= pl.speed
		move()
	end

	if btn(1) then
		pl.x += pl.speed
		move()
	end

	if btn(3) then
		pl.y += pl.speed
		move()
	end

	if btn(2) then
		pl.y -= pl.speed
		move()
	end

	if not pl.moving then
		pl.sprite = 0
	end
end

function _draw()
	cls()

	if(btn(0)) then
		print(btn(0))
	end

	spr(pl.sprite,pl.x,pl.y)
end
