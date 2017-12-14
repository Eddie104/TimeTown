--
-- Author: hongjie
-- Date: 2017-12-14 18:01:55
--

local LoadingBar = class("LoadingBar", function ()
	return ccui.LoadingBar:create()
end)

function LoadingBar:ctor(textureName, percentage)
	self:loadTexture(textureName)
	percentage = percentage or 100
	self:setPercent(percentage)
end

function LoadingBar:percent(val)
	if val then
		self:setPercent(val)
		return self
	end
	return self:getPercent()
end

-- ccui.LoadingBarDirection = { LEFT = 0, RIGHT = 1}
function LoadingBar:direction(val)
	if val then
		self:setDirection(val)
		return self
	end
	return self:getDirection()
end

function LoadingBar:scale9Enabled(val)
	if val == true or val == false then
		self:setScale9Enabled(val)
		return self
	end
	return self:isScale9Enabled()
end

function LoadingBar:capInsets(rect)
	if rect then
		self:setCapInsets(rect)
		return self
	end
	return self:getCapInsets()
end

return LoadingBar
