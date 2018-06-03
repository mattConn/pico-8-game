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