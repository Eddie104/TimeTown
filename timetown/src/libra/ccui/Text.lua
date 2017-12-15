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
	-- print(hAlign == 'right' and cc.TEXT_ALIGNMENT_RIGHT or (hAlign == 'center' and cc.TEXT_ALIGNMENT_CENTER or cc.TEXT_ALIGNMENT_LEFT))
	-- return display.newTTFLabel({
	-- 	text = string,
	-- 	textAlign = hAlign == 'right' and cc.TEXT_ALIGNMENT_RIGHT or (hAlign == 'center' and cc.TEXT_ALIGNMENT_CENTER or cc.TEXT_ALIGNMENT_LEFT),
	-- 	dimensions = cc.size(640, 200)
	-- })
end)

function Text:ctor(string, fontSize, hAlign, vAlign)
	self:ignoreContentAdaptWithSize(false)
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
	self:fontSize(display.DEFAULT_TTF_FONT_SIZE)
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
		return self
	end
	return self:getTextAreaSize()
end

return Text
        