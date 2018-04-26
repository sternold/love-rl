if love.filesystem then
	require 'rocks' ()
end

function love.conf(t)
	t.identity = "love-rl"
	t.version = "0.10.2"
	t.dependencies = {
	}
end
