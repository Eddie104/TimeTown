
function __G__TRACKBACK__(errorMessage)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(errorMessage) .. "\n")
    print(debug.traceback("", 2))
    print("----------------------------------------")
end

package.path = package.path .. ";src/?.lua;src/framework/protobuf/?.lua"
cc.FileUtils:getInstance():setPopupNotify(false)
-- require("app.MyApp").new():run()
require("config")
require("cocos.init")
require("framework.init")
require("init")



--[[
android key store 密码 hongjie104 别名 key36 别名密码 hongjie104
]]