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