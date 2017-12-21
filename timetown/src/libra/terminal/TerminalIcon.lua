--
-- Author: hongjie
-- Date: 2017-12-15 17:20:23
--

local TerminalIcon = class("TerminalIcon", function ()
	return display.newSprite('libra.png')
end)

function TerminalIcon:ctor(onTap)
	self:retain()
	local halfWidth, halfHeight = 25, 25
	self:pos(halfWidth, halfHeight)

	self:addNodeEventListener(cc.NODE_TOUCH_EVENT, function (evt)
		if evt.name == 'began' then
			self._isMoved = false
			return true
		elseif evt.name == 'moved' then
			self._isMoved = true
			local newX, newY = evt.x, evt.y
			if newX - halfWidth < 0 then
				newX = halfWidth
			elseif newX + halfWidth > display.width then
				newX = display.width - halfWidth
			end
			if newY - halfHeight < 0 then
				newY = halfHeight
			elseif newY + halfHeight > display.height then
				newY = display.height - halfHeight
			end
			self:pos(newX, newY)
		elseif evt.name == 'ended' then
			if not self._isMoved then
				if type(onTap) == 'function' then
					onTap()
				end
			end
		end
	end)
	self:setTouchEnabled(true)
end

return TerminalIcon
