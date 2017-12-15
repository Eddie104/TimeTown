--
-- Author: hongjie
-- Date: 2017-12-15 11:45:17
--

--[[
还有以下方法:
scrollToTop(time: float, attenuated: boolean)
scrollToLeft(time: float, attenuated: boolean)
scrollToBottomLeft(time: float, attenuated: boolean)
scrollToTopLeft(time: float, attenuated: boolean)
scrollToBottom(time: float, attenuated: boolean)
scrollToBottomRight(time: float, attenuated: boolean)
scrollToRight(time: float, attenuated: boolean)
scrollToTopRight(time: float, attenuated: boolean)

scrollToPercentHorizontal(percent: float, time: float, attenuated: boolean)
scrollToPercentVertical(percent: float, time: float, attenuated: boolean)
scrollToPercentBothDirection(percent: float, time: float, attenuated: boolean)

jumpToBottom()
jumpToTopRight()
jumpToBottomLeft()
jumpToTopLeft()
jumpToBottomRight()
jumpToTop()
jumpToLeft()
jumpToRight()

jumpToPercentVertical(percent: float)
jumpToPercentHorizontal(percent: float)
jumpToPercentBothDirection(percent: float)

getInnerContainer()

addEventListener(fun: func)
]]
local ScrollView = class("ScrollView", function ()
	return ccui.ScrollView:create()
end)

-- @param contentSize 设置scrollView的大小，相当于是显示的区域
function ScrollView:ctor(contentSize, innerContainerSize)
	assert(contentSize, "libra.ccui.ScrollView - invalid param:contentSize is nil")
	self:setContentSize(contentSize)
	self:innerContainerSize(innerContainerSize)
end

--[[
ccui.ScrollViewDir = {
    none = 0,
    vertical = 1,
    horizontal = 2,
    both = 3,
}
]]
function ScrollView:direction(val)
	if val then
		self:setDirection(val)
		return self
	end
	return self:getDirection()
end

function ScrollView:inertiaScrollEnabled(val)
	if val == true or val == false then
		self:setInertiaScrollEnabl(val)
		return self
	end
	return self:isInertiaScrollEnabl()
end

function ScrollView:innerContainerSize(size)
	if size then
		self:setInnerContainerSize(size)
		return self
	end
	return self:getInnerContainerSize()
end

function ScrollView:bounceEnabled(bool)
	if bool == true or bool == false then
		self:setBounceEnabled(bool)
		return self
	end
	return self:isBounceEnabled()
end

return ScrollView
