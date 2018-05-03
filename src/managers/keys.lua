local keys = {}
function keys:initialize(player)
	self.player = player
end
function keys:handle(key)
    if key == "left" or key == "kp4" then self.player:move(-1, 0)
	elseif key == "right" or key == "kp6" then self.player:move(1, 0)       
	elseif key == "up" or key == "kp8" then self.player:move(0, -1)      
	elseif key == "down" or key == "kp2" then self.player:move(0, 1)
	else return false end
	return true
end
return keys