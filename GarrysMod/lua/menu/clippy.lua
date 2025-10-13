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
local CurrentClipName = nil
local PreviousClipName = nil
local clippy_time = GetConVar("clippy_time"):GetInt()
local clippy_autodelete = GetConVar("clippy_autodelete"):GetBool()
local function StartRecording()
    if IsInGame() and not engine.IsRecordingDemo() then
        CurrentClipName = os.date("%Y-%m-%d %H-%M-%S", os.time())
        --print("Starting " .. CurrentClipName)
        RunConsoleCommand("record", CurrentClipName)
    end
end

--StartRecording() -- move this into a hook later?
timer.Create("StartClip", clippy_time, 0, function()
    -- update convar values since we dont have callbacks in menustate (iirc)
    clippy_time = GetConVar("clippy_time"):GetInt()
    clippy_autodelete = GetConVar("clippy_autodelete"):GetBool()
    ----
    if PreviousClipName and clippy_autodelete then
        file.Delete(PreviousClipName .. ".dem", "MOD")
        --print("Deleting " .. PreviousClipName .. ".dem")
    end

    StartRecording()
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
        timer.Create("TryDiscardingClip", 0.2, 0, function()
            if CurrentClipName then
                if file.Exists(CurrentClipName .. ".dem", "MOD") then
                    file.Delete(CurrentClipName .. ".dem", "MOD")
                else
                    timer.Remove("TryDiscardingClip") -- hopefully the clip is discarded by now
                end
            end
        end)

        timer.Stop("StartClip")
        timer.Stop("EndClip")
    else
        timer.Start("StartClip")
        timer.Start("EndClip")
        StartRecording()
    end
end)
