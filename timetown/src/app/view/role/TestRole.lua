--
-- Author: hongjie
-- Date: 2017-12-15 16:02:20
--

local TestRole = class("TestRole", function ()
	return display.newSprite('#role_01.png')
end)

function TestRole:ctor()
	local frames = display.newFrames("role_%02d.png", 1, 4)
	-- 0.5 秒播放 4 桢
	local animation = display.newAnimation(frames, 0.5 / 4)
	-- self:playAnimationOnce(animation)
	transition.playAnimationForever(self, animation)

	-- playAnimationOnce(animation, removeWhenFinished, onComplete, delay)
end

return TestRole
