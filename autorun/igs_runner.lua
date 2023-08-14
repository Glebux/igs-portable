--swag shit
IGS = IGS or {}
IGS.print = MsgC
if SERVER then
    include("igs-portable/stack.lua")
    include("igs-portable/bib.lua")
    include("igs-portable/cfg.lua")
    include("igs-portable/akupol_sv.lua")
    include("igs-portable/repeater.lua")
    include("igs-portable/apinator.lua")
    include("igs-portable/websocket.lua")
    include("igs-portable/serv_sv.lua")
end