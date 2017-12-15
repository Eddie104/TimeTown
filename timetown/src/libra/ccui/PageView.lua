--
-- Author: hongjie
-- Date: 2017-12-15 15:18:29
--

--[[
还有以下方法
addPage(page: widget)
insertPage(page, index: int)
removePage(page: widget)
removeAllPages()
getPages()
getPage(index: int)
getCurPageIndex()
removePageAtIndex(index: int)
scrollToPage(index: int)
addEventListener(fun: func)
addWidgetToPage(widget: widget, index: int)
]]
local PageView = class("PageView", function ()
	return ccui.PageView:create()
end)

function PageView:ctor()

end

-- 自定义滚动临界值
function PageView:customScrollThreshold(val)
	if val then
		self:setCustomScrollThreshold(val)
		return self
	end
	return self:getCustomScrollThreshold()
end

function PageView:usingCustomScrollThreshold(bool)
	if bool == true or bool == false then
		self:setUsingCustomScrollThreshold(bool)
		return self
	end
	return self:isUsingCustomScrollThreshold()
end

return PageView
