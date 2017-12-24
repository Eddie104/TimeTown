-- --
-- -- Author: zhouhongjie@apowo.com
-- -- Date: 2015-03-12 20:52:33
-- --

-- local JLabel = class("JLabel", function (param)
-- 	param = param or { }
-- 	if param and param.isBMFont then
-- 		--[[--

-- 		用位图字体创建文本显示对象，并返回 LabelBMFont 对象。

-- 		BMFont 通常用于显示英文内容，因为英文字母加数字和常用符号也不多，生成的 BMFont 文件较小。如果是中文，应该用 TTFLabel。

-- 		可用参数：

-- 		-    text: 要显示的文本
-- 		-    font: 字体文件名
-- 		-    align: 文字的水平对齐方式（可选）
-- 		-    x, y: 坐标（可选）

-- 		~~~ lua

-- 		local label = UILabel:newBMFontLabel({
-- 		    text = "Hello",
-- 		    font = "UIFont.fnt",
-- 		})

-- 		~~~

-- 		@param table params 参数表格对象

-- 		@return LabelBMFont LabelBMFont对象

-- 		]]
-- 		return display.newBMFontLabel(param)
-- 	else
		
-- 		-- 使用 TTF 字体创建文字显示对象，并返回 Label 对象。
-- 		-- @function [parent=#display] newTTFLabel
-- 		-- @param table params 参数表格对象
-- 		-- @return Label#Label ret (return value: cc.Label)  Label对象

-- 		--[[--

-- 		使用 TTF 字体创建文字显示对象，并返回 Label 对象。

-- 		可用参数：

-- 		-    text: 要显示的文本
-- 		-    font: 字体名，如果是非系统自带的 TTF 字体，那么指定为字体文件名
-- 		-    size: 文字尺寸，因为是 TTF 字体，所以可以任意指定尺寸
-- 		-    color: 文字颜色（可选），用 cc.c3b() 指定，默认为白色
-- 		-    align: 文字的水平对齐方式（可选）
-- 		-    valign: 文字的垂直对齐方式（可选），仅在指定了 dimensions 参数时有效
-- 		-    dimensions: 文字显示对象的尺寸（可选），使用 cc.size() 指定
-- 		-    x, y: 坐标（可选）

-- 		align 和 valign 参数可用的值：

-- 		-    cc.TEXT_ALIGNMENT_LEFT 左对齐
-- 		-    cc.TEXT_ALIGNMENT_CENTER 水平居中对齐
-- 		-    cc.TEXT_ALIGNMENT_RIGHT 右对齐
-- 		-    cc.VERTICAL_TEXT_ALIGNMENT_TOP 垂直顶部对齐
-- 		-    cc.VERTICAL_TEXT_ALIGNMENT_CENTER 垂直居中对齐
-- 		-    cc.VERTICAL_TEXT_ALIGNMENT_BOTTOM 垂直底部对齐

-- 		~~~ lua

-- 		-- 创建一个居中对齐的文字显示对象
-- 		local label = display.newTTFLabel({
-- 		    text = "Hello, World",
-- 		    font = "Marker Felt",
-- 		    size = 64,
-- 		    align = cc.TEXT_ALIGNMENT_CENTER -- 文字内部居中对齐
-- 		})

-- 		-- 左对齐，并且多行文字顶部对齐
-- 		local label = display.newTTFLabel({
-- 		    text = "Hello, World\n您好，世界",
-- 		    font = "Arial",
-- 		    size = 64,
-- 		    color = cc.c3b(255, 0, 0), -- 使用纯红色
-- 		    align = cc.TEXT_ALIGNMENT_LEFT,
-- 		    valign = cc.VERTICAL_TEXT_ALIGNMENT_TOP,
-- 		    dimensions = cc.size(400, 200)
-- 		})
-- 		~~~

-- 		@param table params 参数表格对象

-- 		@return LabelTTF LabelTTF对象

-- 		]]
-- 		return display.newTTFLabel(param)
-- 	end
-- end)

-- function JLabel:ctor(param)
-- 	self._param = param
-- 	-- makeUIComponent(self)
-- end

-- function JLabel:realign(x, y)
-- 	if self._param.align == cc.TEXT_ALIGNMENT_LEFT then
-- 		self:setPosition(math.round(x + self:getContentSize().width / 2), y)
-- 	elseif self._param.align == cc.TEXT_ALIGNMENT_RIGHT then
-- 		self:setPosition(x - math.round(self:getContentSize().width / 2), y)
-- 	else
-- 		self:setPosition(x, y)
-- 	end
-- end

-- return JLabel
-- ==================================================================================================================
--
-- Author: hongjie
-- Date: 2017-12-14 16:57:58
--

--[[
还有以下方法
getStringLength()
enableShadow(shadowColor: cc.c4b, offset: cc.size, blurRadius: int)
disableEffect()
enableOutline(outlineColor: cc.c4b, outlineSize: int)
enableGlow(glowColor: cc.c4b)
getType() => ccui.TextType = {
    SYSTEM = 0,
    TTF    = 1,
}
]]

--[[
	align 和 valign 参数可用的值：
-    cc.TEXT_ALIGNMENT_LEFT 左对齐
-    cc.TEXT_ALIGNMENT_CENTER 水平居中对齐
-    cc.TEXT_ALIGNMENT_RIGHT 右对齐
-    cc.VERTICAL_TEXT_ALIGNMENT_TOP 垂直顶部对齐
-    cc.VERTICAL_TEXT_ALIGNMENT_CENTER 垂直居中对齐
-    cc.VERTICAL_TEXT_ALIGNMENT_BOTTOM 垂直底部对齐
]]
local Text = class("Text", function (string, hAlign)
	return ccui.Text:create()
end)

function Text:ctor(string, fontSize, hAlign, vAlign)
	hAlign = hAlign or 'center'
	if hAlign == 'left' then
		self:horizontalAlignment(cc.TEXT_ALIGNMENT_LEFT)
	elseif hAlign == 'center' then
		self:horizontalAlignment(cc.TEXT_ALIGNMENT_CENTER)
	else
		self:horizontalAlignment(cc.TEXT_ALIGNMENT_RIGHT)
	end
	vAlign = vAlign or 'center'
	if vAlign == 'top' then
		self:verticalAlignment(cc.VERTICAL_TEXT_ALIGNMENT_TOP)
	elseif vAlign == 'center' then
		self:verticalAlignment(cc.VERTICAL_TEXT_ALIGNMENT_CENTER)
	else
		self:verticalAlignment(cc.VERTICAL_TEXT_ALIGNMENT_BOTTOM)
	end

	self:setString(string)
	-- self:ignoreContentAdaptWithSize(false)
	self:fontSize(fontSize or display.DEFAULT_TTF_FONT_SIZE)
	self:fontName(display.DEFAULT_TTF_FONT)
end

function Text:string(val)
	if val then
		self:setString(val)
		return self
	end
	return self:getString()
end

function Text:fontSize(size)
	if size then
		self:setFontSize(size)
		return self
	end
	return self:getFontSize()
end

function Text:color(val)
	if val then
		self:setTextColor(val)
		return self
	end
	return self:getTextColor()
end

function Text:fontName(val)
	if val then
		self:setFontName(val)
		return self
	end
	return self:getFontName()
end

function Text:verticalAlignment(val)
	if val then
		self:setTextVerticalAlignment(val)
		return self
	end
	return self:getTextVerticalAlignment()
end

function Text:horizontalAlignment(val)
	if val then
		self:setTextHorizontalAlignment(val)
		return self
	end
	return self:getTextHorizontalAlignment()
end

function Text:touchScaleChangeEnabled(val)
	if val == true or val == false then
		self:setTouchScaleChangeEnabled(val)
		return self
	end
	return self:isTouchScaleChangeEnabled()
end

function Text:size(size)
	if size then
		self:setTextAreaSize(size)
		-- display.newRect(cc.rect(0, 0, size.width, size.height), {borderColor = cc.c4f(1, 1, 1, 1)}):addTo(self)--:pos(display.cx - 640 / 2, display.cy - 200 /2)
		return self
	end
	return self:getTextAreaSize()
end

return Text
