--[[ 
    This script lets you load convars on joining a server
    the reason for this is that some convars like cl_detaildist will reset back to their default value on joining a server
    this cannot be fixed in configs (i think), so we have to use a script to set cl_detaildist to its desired

    The script also lets you set the rate of cl_cmdrate (to match tickrate), cl_updaterate (to match tick rate), and rate (to max)
    https://github.com/RaphaelIT7/gmod-gameevent/releases/ required for the hooks, put the DLL in garrysmod/lua/bin
    put this script in garrysmod/lua/menu and put this in garrysmod/lua/menu/menu.lua:
    include("convarload.lua")

]]
if util.IsBinaryModuleInstalled("gameevent") then
    require("gameevent")
else
    print("no gameevent")
end

------------------------------------------------------------------------------------------
-- Put your stuff here
------------------------------------------------------------------------------------------
local ConvarTable = {
    -- put convars you want to set when you load in here
    ["cl_detaildist"] = "0",
    --["cl_yourconvar"] = "desiredvalue",
}

local AutoloadConvars = true -- set to false if you dont want to set everything in the convartable on server join
local SetRates = true -- set to false if you dont want to set cl_updaterate, cl_cmdrate to match tickrate
local SetInterp = false -- set to false if you dont want lerp to be adjusted towards ~30ms
------------------------------------------------------------------------------------------
-- Actual code section
------------------------------------------------------------------------------------------
local TickRate = nil
local function SetConvarNotify(convar, value)
    RunConsoleCommand(convar, value)
    timer.Simple(0.01, function()
        -- the convar values dont print correctly if there is no delay
        print("Setting  " .. convar .. " to " .. value)
        print("Game says " .. convar .. " == " .. GetConVar(convar):GetString()) -- prove we set the convar correctly
    end)
end

local InitialRun = true
gameevent.Listen("client_disconnect")
hook.Add("client_disconnect", "SetInitialRun", function()
    InitialRun = true -- set InitialRun back to true because we disconnected to join another server
end)

local function SetConvars()
    if InitialRun == true then -- make sure were only running this when loaded into a server for the first time 
        if AutoloadConvars == true then
            for convar, value in pairs(ConvarTable) do
                SetConvarNotify(convar, value)
            end
        end

        if SetRates == true then
            TickRate = 1 / engine.TickInterval()
            SetConvarNotify("cl_cmdrate", TickRate)
            SetConvarNotify("cl_updaterate", TickRate)
            SetConvarNotify("rate", GetConVar("sv_maxrate"):GetString() == "0" and "2097152" or GetConVar("sv_maxrate"):GetString()) -- set to gmod's max rate or the server's max rate
        end

        if SetInterp == true then
            if TickRate >= 33 and TickRate <= 66 then
                RunConsoleCommand("cl_interp_ratio", 1)
            elseif TickRate >= 66 and TickRate <= 100 then
                RunConsoleCommand("cl_interp_ratio", 2)
            elseif TickRate >= 100 then
                RunConsoleCommand("cl_interp_ratio", 3)
            else -- fallback for tickrates not accounted for
                RunConsoleCommand("cl_interp_ratio", 1)
            end
        end

        InitialRun = false
    end
end

gameevent.Listen("player_activate") -- "Called when a player has entered the game (connected and loaded)."
hook.Add("player_activate", "SetConvars", SetConvars)
