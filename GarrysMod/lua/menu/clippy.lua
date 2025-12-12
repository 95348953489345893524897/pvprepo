--[[
    Primitive imitation of clipping software using demos
    It doesn't work the same as something like shadowplay because true clipping software is constantly shaving off seconds while also continuously recording, which isn't doable with demos
    Use "gm_demo_to_video demoname" if you want to render the demos into .webms

    Put script in lua/menu and put:
    include("clippy.lua")
    in lua/menu/menu.lua

    Script process:
    1. Start recording 
    2. Stop clip after clippy_time seconds (the convar's value)
    3. Delete the last clip if clippy_autodelete set to 1 or the clip wasn't saved from deletion by clippy_save
    4. Repeat
]]
CreateClientConVar("clippy_time", "300", false, false, "Clip length in seconds", 5)
CreateClientConVar("clippy_autodelete", "1", false, false, "Whether or not to auto-discard unsaved clips")
CreateClientConVar("clippy_strict", "1", false, false, "1 = Attempt to delete last demo on startup by saving its name in lastdemo.txt (WARNING: Malicious server owners can put ANY demo name in the txt file, letting them make this script delete any demo they want. Set this to 1 only if you don't care.),\n - 0 = The demo being recorded before quitting the game may linger in your files")
CreateClientConVar("clippy_servercheckdelay", "30", false, false, "Interval in seconds to check whether or not you're on a server (to start recordings on time)")
local SavedClips = {}
local CurrentClipName = nil
local PreviousClipName = nil
local clippy_time = GetConVar("clippy_time"):GetInt()
local clippy_autodelete = GetConVar("clippy_autodelete"):GetBool()
local clippy_strict = GetConVar("clippy_strict"):GetBool()
local clippy_servercheckdelay = GetConVar("clippy_servercheckdelay"):GetInt()
local function DiscardClip(DemoName)
    if not DemoName then return end
    if not clippy_autodelete then return end
    if string.GetExtensionFromFilename("garrysmod/" .. DemoName .. ".dem") ~= "dem" then
        print("DemoName wasn't a demo, not discarding")
        return
    end

    timer.Create("TryDiscardingClip", 0.2, 0, function()
        if DemoName and not SavedClips[DemoName] then
            print("Attempting to delete " .. DemoName)
            if file.Exists(DemoName .. ".dem", "MOD") then
                file.Delete(DemoName .. ".dem", "MOD")
            else
                timer.Remove("TryDiscardingClip") -- hopefully the clip is discarded by now
            end
        end
    end)
end

local LastDemo = file.Read("lastdemo.txt", "DATA")
if clippy_strict == true and LastDemo then
    DiscardClip(LastDemo)
    file.Delete("lastdemo.txt", "DATA")
end

local function StartRecording()
    if IsInGame() and not engine.IsRecordingDemo() and not engine.IsPlayingDemo() then
        CurrentClipName = os.date("%Y-%m-%d %H-%M-%S", os.time())
        --print("Starting " .. CurrentClipName)
        RunConsoleCommand("record", CurrentClipName)
        if clippy_strict == true then --
            file.Write("lastdemo.txt", CurrentClipName)
            print("Wrote info to lastdemo.txt")
        end
    end
end

local function GetConvarChanges()
    -- update convar values since we dont have callbacks in menustate (iirc)
    -- should make this a for loop later, lazy right now
    clippy_time = GetConVar("clippy_time"):GetInt()
    clippy_autodelete = GetConVar("clippy_autodelete"):GetBool()
    clippy_strict = GetConVar("clippy_strict"):GetBool()
    clippy_servercheckdelay = GetConvar("clippy_servercheckdelay"):GetInt()
end

timer.Create("CheckIfInServer", clippy_servercheckdelay, 0, function()
    -- i don't trust the way i wrote this, hopefully it's fine 
    if not engine.IsPlayingDemo() and not engine.IsRecordingDemo() and IsInGame() then
        StartRecording()
        timer.Create("StartClip", clippy_time, 0, function()
            GetConvarChanges()
            ----
            if PreviousClipName then
                DiscardClip(PreviousClipName)
                --print("Deleting " .. PreviousClipName .. ".dem")
            end

            StartRecording()
        end)
    end
end)

timer.Create("EndClip", clippy_time - 0.01, 0, function()
    --
    if engine.IsRecordingDemo() then
        RunConsoleCommand("stop")
        if CurrentClipName then
            PreviousClipName = CurrentClipName
            --print("Stopped " .. CurrentClipName)
        end
    end
end)

concommand.Add("clippy_save", function()
    RunConsoleCommand("stop")
    if CurrentClipName then --
        print("Saving " .. CurrentClipName)
    end

    SavedClips[CurrentClipName] = true
    CurrentClipName = nil
    timer.Create("TryRecordingAgain", 0.2, 0, function()
        if engine.IsRecordingDemo then
            StartRecording()
        else
            timer.Remove("TryRecordingAgain")
        end
    end)
end)

local clippy_running = true
concommand.Add("clippy_toggle", function()
    clippy_running = not clippy_running or false
    print("Clippy running: " .. tostring(clippy_running))
    if not clippy_running then
        RunConsoleCommand("stop")
        if CurrentClipName then DiscardClip(CurrentClipName) end
        timer.Stop("StartClip")
        timer.Stop("EndClip")
    else
        timer.Start("StartClip")
        timer.Start("EndClip")
        StartRecording()
    end
end)

concommand.Add("clippy_listsavedclips", function()
    --
    PrintTable(table.GetKeys(SavedClips))
end)
