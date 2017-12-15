--
-- Author: hongjie
-- Date: 2017-12-15 14:20:06
--

--[[
有以下方法:
loadSlidBallTextures(normal: string, pressed: string, disabled: string)
loadSlidBallTextureNormal(filename: string)
loadSlidBallTexturePressed(filename: string)
loadSlidBallTextureDisabled(filename: string)

loadBarTexture(filename: string)
loadProgressBarTexture(filename: string)

setCapInsets(rect: cc.rect)
]]
local Slider = class("Slider", function ()
	return ccui.Slider:create()
end)

function Slider:ctor()

end

function Slider:percent(val)
	if val then
		self:setPercent(val)
		return self
	end
	return self:getPercent()
end

function Slider:capInsetProgressBarRebderer(rect)
	if rect then
		self:setCapInsetProgressBarRebderer(rect)
		return self
	end
	return self:getCapInsetsProgressBarRebderer()
end

function Slider:capInsetsBarRenderer(rect)
	if rect then
		self:setCapInsetsBarRenderer(rect)
		return self
	end
	return self:getCapInsetsBarRenderer()
end

function Slider:scale9Enabled(bool)
	if bool == true or bool == false then
		self:setScale9Enabled(bool)
		return self
	end
	return self:isScale9Enabled()
end

return Slider
