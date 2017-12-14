--
-- Author: hongjie
-- Date: 2017-12-14 16:42:21
--

local ImageView = class("ImageView", function ()
	return ccui.ImageView:create()
end)

function ImageView:ctor(imageFileName)
	self:loadTexture(imageFileName)
end

function ImageView:scale9Enabled(val)
	if val == true or val == false then
		self:setScale9Enabled(val)
		return self
	end
	return self:isScale9Enabled()
end

function ImageView:capInsets(val)
	if val then
		self:setCapInsets(val)
		return self
	end
	return self:getCapInsets()
end

function ImageView:textureRect(rect)
	if rect then
		self:setTextureRect(rect)
		return self
	end
end

return ImageView
