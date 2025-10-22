--[[ 
    This script lets you load convars on joining a server
    the reason for this is that some convars like cl_detaildist will reset back to their default value on joining a server
    this cannot be fixed in configs (i think), so we have to use a script to set cl_detaildist to its desired

    https://github.com/RaphaelIT7/gmod-gameevent/releases/ required for the hooks, put the DLL in garrysmod/lua/bin
    put this script in garrysmod/lua/menu and put this in garrysmod/lua/menu/menu.lua:
    include("convarload.lua")

]]
if util.IsBinaryModuleInstalled("gameevent") then
    require("gameevent")
else
    print("no gameevent")
end

local ConvarTable = {
    -- put convars you want to set when you load in here
    ["cl_detaildist"] = "0",
}

--["cl_yourconvar"] = "desiredvalue",
local InitialRun = true
gameevent.Listen("client_disconnect")
hook.Add("client_disconnect", "SetInitialRun", function()
    InitialRun = true -- set InitialRun back to true because we disconnected to join another server
end)

local function SetConvars()
    if InitialRun == true then -- make sure were only running this when loaded into a server for the first time 
        for convar, argument in pairs(ConvarTable) do
            RunConsoleCommand(convar, argument)
            timer.Simple(0.01, function()
                -- the convar values print correctly if there is no delay
                print("Setting convar " .. convar .. " to " .. argument)
                print("Game says " .. convar .. " == " .. GetConVar(convar):GetString()) -- prove we set the convar correctly
            end)
        end

        InitialRun = false
    end
end

gameevent.Listen("player_activate") -- "Called when a player has entered the game (connected and loaded)."
hook.Add("player_activate", "SetConvars", SetConvars)
