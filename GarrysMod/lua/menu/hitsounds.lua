-- put this script in garrysmod/lua/menu
-- then put 
-- include("hitsounds.lua")
-- in menu.lua
if util.IsBinaryModuleInstalled("gameevent") then  -- anything fun in menustate requires gameevent dll
    require("gameevent")
else
    print("no gameevent")
end

CreateClientConVar("cl_hitsounds", "garrysmod/balloon_pop_cute.wav", false, false, "Kill sound")
CreateClientConVar("cl_killsounds", "vo/ravenholm/monk_kill05.wav", false, false, "Kill sound")
LocalPlayerID = nil
gameevent.Listen("player_info")
hook.Add("player_info", "player_info_example", function(data)
    if data.name == GetConVar("name"):GetString() then --
        LocalPlayerID = data.userid
    end
end)

gameevent.Listen("player_hurt")
hook.Add("player_hurt", "PlaySounds", function(data)
    local HitSoundPath = GetConVar("cl_hitsounds"):GetString()
    local KillSoundPath = GetConVar("cl_killsounds"):GetString()
    if data.attacker == LocalPlayerID then --
        if data.health > 0 then
            --
            surface.PlaySound(HitSoundPath)
        else
            surface.PlaySound(KillSoundPath)
        end
    end
end)
