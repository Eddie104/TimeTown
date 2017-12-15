--
-- Author: hongjie
-- Date: 2017-12-14 13:19:57
--

--[[
还有的方法：
setTitleOffset(x, y)
setPressedActionEnabled(bool)
]]
local Button = class("Button", function ()
	return ccui.Button:create()
end)

function Button:ctor(normal, selected, disabled)
	assert(normal, "libra.ccui.Button - invalid param:normal is nil")
	selected = selected or normal
	self:loadTextures(normal, selected, disabled)
    self:addTouchEventListener(function(sender, eventType)
        if 2 == eventType then
            if type(self._onTap) == 'function' then
            	self._onTap(sender)
            end
        end
    end)
end

function Button:onTap(fun)
	self._onTap = fun
	return self
end

function Button:title(title, color, fontSize, fontName)
	if title or fontSize or color or fontName then
		if title then
			self:setTitleText(title)
		end
		if color then
			self:setTitleColor(color)
		end
		if fontSize then
			self:setTitleFontSize(fontSize)
		end
		if fontName then
			self:setTitleFontName(fontName)
		end
		return self
	end
	return self:getTitleText()
end

function Button:zoomScale(val)
	if val then
		self:setZoomScale(val)
		return self
	end
	return self:getZoomScale()
end

function Button:scale9Enabled(val)
	if val == true or val == false then
		self:setScale9Enabled(val)
		return self
	end
	return self:isScale9Enabled()
end

function Button:capInsets(val)
	if val then
		self:setCapInsets(val)
		return self
	end
end

return Button
