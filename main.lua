-- world
SCREEN = 128 -- screen dimensions
CELL = 8 -- cell dimensions
BOUND = SCREEN - CELL -- floor, wall location

-- player
player = {
	x = 20,
	y = 20,
	jumping = false,
	timer = 0,
	sprite = 0,
	speed = 4,
	weight = 8
}

-- platform
platform = {
	sprite = 16,
	x = BOUND-8*3,
	y = BOUND
}

function move()
	player.moving = true
	player.sprite += 1

	if player.sprite > 1 then
		player.sprite = 0
	end
end

function _init()
	last = time()
end
function _update()
	player.moving = false

	if btn(0) and player.x != 0 then -- left
		if player.x+8 == platform.x then
			player.x -= player.speed

			move()
		end
	end
	if btn(1) and player.x != BOUND and player.x != platform.x-8 then -- right
		player.x += player.speed
		move()
	end

	-- jumping
	if btnp(4) then
		player.jumping = true
	end
	if player.jumping then
		if player.timer < 5 then
			player.y -= player.weight
			player.timer += 1
		else
			player.jumping = false
			player.timer = 0
		end
	end

	if not player.moving then -- stationary
		player.sprite = 0
	end

	-- falling
	if player.y < BOUND and not player.jumping then
		player.y += player.weight
	end
	if player.y > BOUND then -- fix falling through floor
		player.y = BOUND
	end

	-- enldess running
	if player.x == BOUND then
		player.x = 0
	elseif player.x == 0 then
		player.x = BOUND
	end

end

function _draw()
	cls()

	print(player.x)
	print(platform.x)

	spr(player.sprite,player.x,player.y)
	spr(platform.sprite,platform.x,platform.y)
end
