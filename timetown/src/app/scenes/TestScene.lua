-- local Label = require("libra.ui.components.JLabel")
-- local Button = require("libra.ui.components.JButton")

local AStar = require("libra.aStar.AStar")

local TestScene = class("TestScene", function()
    return display.newScene("TestScene")
end)

function TestScene:ctor()
    -- display.newColorLayer(cc.c4b(255, 0, 0, 255)):size(display.width, display.height):addTo(self)
    --[[
    display.newSprite('logo@2x.png', display.cx, display.cy):addTo(self)
    local t = display.newTTFLabel({
        text = "Hello, World",
        -- font = "Marker Felt",
        size = 64,
        -- x = display.cx,
        -- y = display.cy,
        align = cc.TEXT_ALIGNMENT_CENTER -- 文字内部居中对齐
    }):addTo(self)

    transition.moveTo(t, {x = display.cx, y = display.cy, time = 1.5})

    local tests = {
        "Test_NodeFrameEvent",
        "Test_NodeEvent",
        "Test_KeypadEvent",
        "Test_NodeTouchEvent",
        "Test_AccelerometerEvent",
        "Test_CocosStudio",
        "Test_Audio",
    }

    local scrollView = ccui.ScrollView:create()
    scrollView:addTo(self)
    scrollView:align(display.TOP_CENTER, display.cx, display.top)
    self._scrollView = scrollView
    local total = 0
    local btnSize = nil
    for i = #tests, 1, -1 do
        local btn = ccui.Button:create()
        btn:setTitleText(tests[i])
        btn:setTitleFontSize(24)
        btn:addTouchEventListener(function(sender, eventType)
            if 2 == eventType then
                scrollView:setVisible(false)
                app:createView(tests[i]):addTo(self)
            end
        end)
        if not btnSize then
            btnSize = btn:getContentSize()
        end
        btn:pos((display.width - btnSize.width) / 2 + btnSize.width / 2,
                btnSize.height * total + btnSize.height / 2)
        total = total + 1

        scrollView:addChild(btn)
    end
    local totalHeight = btnSize.height * total
    scrollView:setInnerContainerSize(cc.size(display.width, totalHeight))
    local scrollHeight = display.height
    if totalHeight < scrollHeight then
        scrollHeight = totalHeight
    end
    scrollView:setContentSize(cc.size(display.width, scrollHeight))

    -- local map = {
    --     {0,1,0,1,0},
    --     {0,1,0,1,0},
    --     {0,1,1,1,0},
    --     {0,0,0,0,0},
    -- }
    -- self._astar = AStar.new(map, 0)
    -- self._astar:find(1, 1, 5, 1)
    ]]

    -- self:testButton()
    -- self:testCheckBox()
    -- self:testImageView()
    -- self:testText()
    -- self:testLoadingBar()
    -- self:testScrollView()
    -- self:testListView()
    -- self:testTextField()

    self:testRole()
end

function TestScene:testButton()
    self._ttt = '123'
    local Button = require('libra.ccui.Button')
    local btn = Button.new('logo@2x.png'):addTo(self):pos(display.cx, display.cy)
    btn:title('aa', display.COLOR_RED, 48)
    btn:onTap(function ()
        print(self._ttt)
    end)
end

function TestScene:testCheckBox()
    self._ttt = '123'
    local CheckBox = require('libra.ccui.CheckBox')
    local checkBox = CheckBox.new('btn_normal.png', 'btn_down.png', 'closeBtn_normal.png'):addTo(self):pos(display.cx, display.cy)
    checkBox:selected(true)
    checkBox:onChange(function (val)
        print(tostring(val) .. self._ttt)
    end)
end

function TestScene:testImageView()
    local imageView = require('libra.ccui.ImageView').new('btn_normal.png')
    imageView:addTo(self):pos(display.cx, display.cy)
    imageView:textureRect(cc.rect(0, 0, 10, 10))
end

function TestScene:testText()
    display.newRect(cc.rect(0, 0, 640, 200), {borderColor = cc.c4f(1, 0, 0, 1)}):addTo(self):pos(display.cx - 640 / 2, display.cy - 200 /2)
    local text = require('libra.ccui.Text').new('test')
    print(text:getType())
    text:size(cc.size(640, 200))
    text:color(display.COLOR_BLUE)
    dump(text:getContentSize())
    text:addTo(self):pos(display.cx, display.cy)
    text:enableOutline(cc.c4b(255, 255, 255, 255), 100)
    -- text:enableGlow(cc.c4b(255, 0, 0, 255))
    -- text:enableShadow(cc.c4b(255, 0, 0, 150), cc.size(20,-2))
end

function TestScene:testLoadingBar()
    local bar = require('libra.ccui.LoadingBar').new('logo@2x.png', 50)
    bar:addTo(self):pos(display.cx, display.cy)
    -- bar:direction(4)
end

function TestScene:testScrollView()
    local scrollView = require('libra.ccui.ScrollView').new(cc.size(300, 300), cc.size(400, 400))
    scrollView:align(display.BOTTOM_LEFT)
    scrollView:addChild(display.newSprite('timg.jpg'))
    scrollView:direction(3):bounceEnabled(true)
    scrollView:addTo(self)

    -- display.newSprite('timg.jpg', display.cx, display.cy):addTo(self)
end

function TestScene:testListView()
    display.newRect(cc.rect(0, 0, 300, 300), {borderColor = cc.c4f(1, 0, 0, 1)}):addTo(self)
    local listView = require('libra.ccui.ListView').new(cc.size(300, 300))
    local Button = require('libra.ccui.Button')
    local btn = Button.new('btn_normal.png', 'btn_down.png')
    listView:setItemModel(btn)
    for i = 1, 10 do
        listView:pushBackDefaultItem()
    end
    listView:bounceEnabled(true)
    listView:onTap(function (idx)
        print(idx)
    end)
    listView:addTo(self)
end

function TestScene:testTextField()
    local tf = require('libra.ccui.TextField').new('', display.COLOR_RED, 'lalala')
    tf:passwordEnabled(true)
    tf:addTo(self):pos(display.cx, display.cy)
end

function TestScene:testRole()
    self._ttt = '123'
    display.addSpriteFrames('role/test.plist', 'role/test.png')
    local role = require('app.view.role.TestRole').new()
    role:addTo(self):pos(display.cx, display.cy)
end

function TestScene:onEnter()
	sceneOnEnter(self)
end

function TestScene:onExit()
	sceneOnExit(self)
end

function TestScene:onEnterTransitionFinish()
	sceneOnEnterTransitionFinish(self)
end

return TestScene