local Label = require("libra.ui.components.JLabel")
local Button = require("libra.ui.components.JButton")

local AStar = require("libra.aStar.AStar")

local TestScene = class("TestScene", function()
    return display.newScene("TestScene")
end)

function TestScene:ctor()
    -- local test = {
    --     {id = "_testBtn", ui = "libra.ui.components.JButton", param = {normal = "ui/ty_anniu02.png", label = {text = "123", size = 24}}, x = display.cx, y = display.cy},
    --     {id = "_testBtn1", ui = "libra.ui.components.JButton", param = {normal = "ui/ty_anniu02.png", label = {text = "hello world", size = 24}}, x = display.cx, y = display.cy + 50}
    -- }
    -- uiManager:getUIContainer():createUI(test)
    
    local t = display.newTTFLabel({
        text = "Hello, World",
        font = "Marker Felt",
        size = 64,
        -- x = display.cx,
        -- y = display.cy,
        align = cc.TEXT_ALIGNMENT_CENTER -- 文字内部居中对齐
    }):addTo(self)

    transition.moveTo(t, {x = display.cx, y = display.cy, time = 1.5})
    -- transition.execute(t, MoveTo:create(1.5, cc.p(display.cx, display.cy)), {
    --     delay = 1.0,
    --     easing = "backout",
    --     onComplete = function()
    --         print("move completed")
    --     end,
    -- })

    local map = {
        {0,1,0,1,0},
        {0,1,0,1,0},
        {0,1,1,1,0},
        {0,0,0,0,0},
    }
    self._astar = AStar.new(map, 0)
    self._astar:find(1, 1, 5, 1)
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