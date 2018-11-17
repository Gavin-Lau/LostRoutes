
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

local breakInfoFun,xpcallFun = require("LuaDebug")("localhost", 9009)
cc.Director:getInstance():getScheduler():scheduleScriptFunc(breakInfoFun, 0.3, false)

require "config"
require "cocos.init"

local function main()
    require("app.MyApp"):create():run()
end

function G__TRACKBACK(errorMessage)
    debugXpCall();
    print("----------------------------------------")
    local msg = debug.traceback(errorMessage, 3)
    print(msg)
    print("----------------------------------------")
end

local status, msg = xpcall(main, G__TRACKBACK)
