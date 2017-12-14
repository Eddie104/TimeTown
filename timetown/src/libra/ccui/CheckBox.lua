--
-- Author: hongjie
-- Date: 2017-12-14 13:57:45
--

local CheckBox = class("CheckBox", function ()
	return ccui.CheckBox:create()
end)

-- backGround 背景图 可选
-- backGroundSeleted 按下时的背景图 可选
-- cross 选中的图
function CheckBox:ctor(backGround, backGroundSeleted, cross, backGroundDisabled, frontCrossDisabled)
	backGroundSeleted = backGroundSeleted or backGround
	self:loadTextures(backGround, backGroundSeleted, cross, backGroundDisabled, frontCrossDisabled)
	self:addEventListener(function (sender, eventType)
		if type(self._onChange) == 'function' then
			self._onChange(self:selected())
		end
	end)
end

function CheckBox:onChange(val)
	self._onChange = val
	return self
end

function CheckBox:selected(val)
	if val == true or val == false then
		self:setSelected(val)
		return self
	end
	return self:isSelected()
end

return CheckBox
