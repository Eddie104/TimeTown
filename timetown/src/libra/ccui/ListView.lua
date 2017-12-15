--
-- Author: hongjie
-- Date: 2017-12-15 13:10:57
--

--[[
还有以下方法:
-- 设置重力
setGravity(ccui.ListViewGravity)
getIndex(item)
getItems()
getItem(index)
removeItem(index)
removeLastItem()
removeAllItems()
getCurSelectedIndex()
requestRefreshView()
refreshView()
addEventListener(fun: func)
doLayout()

setItemModel(item: widget)
pushBackDefaultItem()
pushBackCustomItem(item: widget)
insertDefaultItem(index)
insertCustomItem(item: widget, index: int)
]]

local ListView = class("ListView", function ()
	return ccui.ListView:create()
end)

function ListView:ctor(contentSize)
	assert(contentSize, "libra.ccui.ListView - invalid param:contentSize is nil")
	self:setContentSize(contentSize)
	self:addEventListener(function (sender, eventType)
		if eventType == 1 then
			if type(self._onTap) == 'function' then
				-- c++里面，索引是从0开始的，但是lua里是从1开始的，所以这里加个1
				self._onTap(self:getCurSelectedIndex() + 1)
			end
		end
	end)
end

function ListView:onTap(fun)
	self._onTap = fun
end

--[[
ccui.ListViewDirection = {
    none = 0,
    vertical = 1,
    horizontal = 2,
}
]]
function ListView:direction(val)
	if val then
		self:setDirection(val)
		return self
	end
	return self:getDirection()
end

function ListView:inertiaScrollEnabled(val)
	if val == true or val == false then
		self:setInertiaScrollEnabl(val)
		return self
	end
	return self:isInertiaScrollEnabl()
end

function ListView:innerContainerSize(size)
	if size then
		self:setInnerContainerSize(size)
		return self
	end
	return self:getInnerContainerSize()
end

function ListView:bounceEnabled(bool)
	if bool == true or bool == false then
		self:setBounceEnabled(bool)
		return self
	end
	return self:isBounceEnabled()
end

function ListView:itemsMargin(val)
	if val then
		self:setItemsMargin(val)
		return self
	end
	return self:getItemsMargin()
end

return ListView
