--
-- Author: hongjie
-- Date: 2017-12-15 17:10:49
--

local ListView = require('libra.ccui.ListView')
local Text = require('libra.ccui.Text')
local Button = require('libra.ccui.Button')
local TextField = require('libra.ccui.TextField')

local Terminal = class("Terminal", function ()
	return display.newNode()
end)

function Terminal:ctor()
	self:retain()
	display.newColorLayer(cc.c4b(255, 0, 0, 255)):size(display.width, display.height):addTo(self)
	self._isShowing = false

	-- 输出列表
	self._listView = ListView.new(cc.size(display.width, display.height - 36)):pos(0, 36)
	-- self._listView:setItemModel(self:createListViewItemModel())
	for i = 1, 10 do
		self._listView:pushBackCustomItem(self:createListItem('111111111111'))
		self._listView:pushBackCustomItem(self:createListItem('2222222222'))
		self._listView:pushBackCustomItem(self:createListItem('abcdefghijklmnoqprstuvwxyzabcdefghijklmnoqprstuvwxyzabcdefghijklmnoqprstuvwxyzabcdefghijklmnoqprstuvwxyz'))
		self._listView:pushBackCustomItem(self:createListItem('4444444444444444'))
		self._listView:pushBackCustomItem(self:createListItem('111111111111'))
		self._listView:pushBackCustomItem(self:createListItem('111111111111'))
	end
	self._listView:addTo(self)

	-- 输入框
	self._inputTextField = TextField.new('输入命令')
	self._inputTextField:size(display.width, 36)
	self._inputTextField:addTo(self):pos(display.width / 2, 36 / 2)

	-- 监听个触摸事件，目的是截掉触摸事件
	self:addNodeEventListener(cc.NODE_TOUCH_EVENT, function (evt)
		if evt.name == 'began' then
			self._isMoved = false
			return true
		end
	end)
	self:setTouchEnabled(true)
end

function Terminal:show()
	if not self._isShowing then
		self:addTo(display.getRunningScene(), 1000000)
		self:y(display.height / 2 + display.height)
		transition.moveTo(self, {time = .3, y = 0, easing = "BACKOUT"})
		self._isShowing = true
	end
end

-- @priavte
-- function Terminal:createListViewItemModel()
-- 	return Text.new('this is a text'):size(cc.size(display.width, 10))
-- 	-- return Button.new('btn_normal.png', 'btn_down.png')
-- end

function Terminal:createListItem(content)
	local t = Text.new(content, nil, 'left')
	t:size(cc.size(display.width, 0))
	t:ignoreContentAdaptWithSize(false)
	return t
end

return Terminal
