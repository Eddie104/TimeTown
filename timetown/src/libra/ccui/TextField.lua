--
-- Author: hongjie
-- Date: 2017-12-15 14:42:01
--

--[[
还有以下方法
getStringLength()
hitTest(point: cc.p)
setTouchAreaEnabled(bool: boolean)
setTextVerticalAlignment(val: int)
setTextHorizontalAlignment(val: int)
setTextAreaSize(size: cc.size)
addEventListener(fun: func)
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
local TextField = class("TextField", function ()
	return ccui.TextField:create()
end)

function TextField:ctor(str, strColor, placeHolder)
	self:setString(str or '')
	self:setTextColor(strColor or display.COLOR_WHITE)
	self:setPlaceHolder(placeHolder or '')
end

function TextField:fontSize(size)
	if size then
		self:setFontSize(size)
		return self
	end
	return slef:getFontSize()
end

function TextField:fontName(font)
	if font then
		self:setFontName(font)
		return self
	end
	return slef:getFontName()
end

function TextField:string(str)
	if str then
		self:setString(str)
		return self
	end
	return self:getString()
end

function TextField:placeHolderColor(color)
	if color then
		self:setPlaceHolderColor(color)
		return self
	end
	return self:getPlaceHolderColor()
end

function TextField:passwordEnabled(bool)
	if bool == true or bool == false then
		self:setPasswordEnabled(bool)
		return self
	end
	return self:isPasswordEnabled()
end

function TextField:touchSize(size)
	if size then
		self:setTouchSize(size)
		return self
	end
	return self:getTouchSize()
end

function TextField:maxLength(val)
	if val then
		self:setMaxLength(val)
		return self
	end
	return self:getMaxLength()
end

function TextField:maxLengthEnabled(bool)
	if bool == true or bool == false then
		self:setMaxLengthEnabled(bool)
		return self
	end
	return self:isMaxLengthEnabled()
end

function TextField:insertText(val)
	if val then
		self:setInsertText(val)
		return self
	end
	return self:getInsertText()
end

-- 密码状态时，用什么样的字符来替换输入的字符
function TextField:passwordStyleText(val)
	if val then
		self:setPasswordStyleText(val)
		return self
	end
	return self:getPasswordStyleText()
end

-- 是否允许回退删除
function TextField:deleteBackward(bool)
	if bool == true or bool == false then
		self:setDeleteBackward(bool)
		return self
	end
	return self:getDeleteBackward()
end

return TextField

		-- tolua_function(tolua_S,"setAttachWithIME",lua_cocos2dx_ui_TextField_setAttachWithIME);
        
        
  --       tolua_function(tolua_S,"getAttachWithIME",lua_cocos2dx_ui_TextField_getAttachWithIME);
        
  --       tolua_function(tolua_S,"getDetachWithIME",lua_cocos2dx_ui_TextField_getDetachWithIME);
        
  --       tolua_function(tolua_S,"addEventListener",lua_cocos2dx_ui_TextField_addEventListener);
  --       tolua_function(tolua_S,"didNotSelectSelf",lua_cocos2dx_ui_TextField_didNotSelectSelf);
  --       tolua_function(tolua_S,"attachWithIME",lua_cocos2dx_ui_TextField_attachWithIME);
        
        
  --       tolua_function(tolua_S,"setDetachWithIME",lua_cocos2dx_ui_TextField_setDetachWithIME);
        
        
        
        