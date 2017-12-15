--
-- Author: hongjie
-- Date: 2017-12-15 15:16:24
--

--[[
还有以下方法
getStringLength()
]]
local TextBMFont = class("TextBMFont", function ()
	return ccui.TextBMFont:create()
end)

function TextBMFont:ctor(fontFile, str)
	self:setFntFile(fontFile)
	self:setString(str)
end

function TextBMFont:string(val)
	if val then
		self:setString(val)
		return self
	end
	return self:getString()
end

return TextBMFont
