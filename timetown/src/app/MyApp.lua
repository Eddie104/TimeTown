
-- require("config")
-- require("cocos.init")
-- require("framework.init")
require("libra.init")

-- define global module
-- game = {}
-- game.pomelo = require("app.net.pomelo.Pomelo").new()

local AppBase = require("framework.AppBase")
local MyApp = class("MyApp", AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    -- cc.FileUtils:getInstance():addSearchPath("res/")
    -- self:enterScene("MainScene")
    self:enterScene("TestScene")
end

return MyApp
