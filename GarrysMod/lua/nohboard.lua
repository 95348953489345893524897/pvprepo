--[[
    Improvement of old script I made to show key movements for guides, now also shows mouse movements
    Probably doesn't work in demos right now like the original version but I'll fix that eventually
        -- engine.IsPlayingDemo() and LocalPlayer():keydown maybe? 
]]
local posxCvar = CreateClientConVar("positionx", "750", true, false)
local posyCvar = CreateClientConVar("positiony", "650", true, false)
local MouseOffsetXCvar = CreateClientConVar("mouseoffsetx", "-1000", true, false) -- -100
local MouseOffsetYCvar = CreateClientConVar("mouseoffsety", "-100", true, false) -- 0
local PercentSize = 0.4
surface.CreateFont("CoolFont", {
    font = "Trebuchet MS",
    extended = false,
    size = 54 * PercentSize,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false,
})

local KeyboardInputs = {
    ["Esc"] = {
        input = KEY_ESCAPE,
        positionx = 0,
        positiony = 0,
        keysize = 100
    },
    ["F1"] = {
        input = KEY_F1,
        positionx = 100,
        positiony = 0,
        keysize = 100
    },
    ["F2"] = {
        input = KEY_F2,
        positionx = 200,
        positiony = 0,
        keysize = 100
    },
    ["F3"] = {
        input = KEY_F3,
        positionx = 300,
        positiony = 0,
        keysize = 100
    },
    ["F4"] = {
        input = KEY_F4,
        positionx = 400,
        positiony = 0,
        keysize = 100
    },
    ["F5"] = {
        input = KEY_F5,
        positionx = 500,
        positiony = 0,
        keysize = 100
    },
    ["F6"] = {
        input = KEY_F6,
        positionx = 600,
        positiony = 0,
        keysize = 100
    },
    ["F7"] = {
        input = KEY_F7,
        positionx = 700,
        positiony = 0,
        keysize = 100
    },
    ["F8"] = {
        input = KEY_F8,
        positionx = 800,
        positiony = 0,
        keysize = 100
    },
    ["F9"] = {
        input = KEY_F9,
        positionx = 900,
        positiony = 0,
        keysize = 100
    },
    ["F10"] = {
        input = KEY_F10,
        positionx = 1000,
        positiony = 0,
        keysize = 100
    },
    ["F11"] = {
        input = KEY_F11,
        positionx = 1100,
        positiony = 0,
        keysize = 100
    },
    ["F12"] = {
        input = KEY_F12,
        positionx = 1200,
        positiony = 0,
        keysize = 100
    },
    ["`"] = {
        input = KEY_BACKQUOTE,
        positionx = 0,
        positiony = 100,
        keysize = 100
    },
    ["1"] = {
        input = KEY_1,
        positionx = 100,
        positiony = 100,
        keysize = 100
    },
    ["2"] = {
        input = KEY_2,
        positionx = 200,
        positiony = 100,
        keysize = 100
    },
    ["3"] = {
        input = KEY_3,
        positionx = 300,
        positiony = 100,
        keysize = 100
    },
    ["4"] = {
        input = KEY_4,
        positionx = 400,
        positiony = 100,
        keysize = 100
    },
    ["5"] = {
        input = KEY_5,
        positionx = 500,
        positiony = 100,
        keysize = 100
    },
    ["6"] = {
        input = KEY_6,
        positionx = 600,
        positiony = 100,
        keysize = 100
    },
    ["7"] = {
        input = KEY_7,
        positionx = 700,
        positiony = 100,
        keysize = 100
    },
    ["8"] = {
        input = KEY_8,
        positionx = 800,
        positiony = 100,
        keysize = 100
    },
    ["9"] = {
        input = KEY_9,
        positionx = 900,
        positiony = 100,
        keysize = 100
    },
    ["0"] = {
        input = KEY_0,
        positionx = 1000,
        positiony = 100,
        keysize = 100
    },
    ["-"] = {
        input = KEY_MINUS,
        positionx = 1100,
        positiony = 100,
        keysize = 100
    },
    ["="] = {
        input = KEY_EQUAL,
        positionx = 1200,
        positiony = 100,
        keysize = 100
    },
    ["Backspace"] = {
        input = KEY_BACKSPACE,
        positionx = 1300,
        positiony = 100,
        keysize = 200
    },
    ["Tab"] = {
        input = KEY_TAB,
        positionx = 0,
        positiony = 200,
        keysize = 150
    },
    ["Q"] = {
        input = KEY_Q,
        positionx = 150,
        positiony = 200,
        keysize = 100
    },
    ["W"] = {
        input = KEY_W,
        positionx = 250,
        positiony = 200,
        keysize = 100
    },
    ["E"] = {
        input = KEY_E,
        positionx = 350,
        positiony = 200,
        keysize = 100
    },
    ["R"] = {
        input = KEY_R,
        positionx = 450,
        positiony = 200,
        keysize = 100
    },
    ["T"] = {
        input = KEY_T,
        positionx = 550,
        positiony = 200,
        keysize = 100
    },
    ["Y"] = {
        input = KEY_Y,
        positionx = 650,
        positiony = 200,
        keysize = 100
    },
    ["U"] = {
        input = KEY_U,
        positionx = 750,
        positiony = 200,
        keysize = 100
    },
    ["I"] = {
        input = KEY_I,
        positionx = 850,
        positiony = 200,
        keysize = 100
    },
    ["O"] = {
        input = KEY_O,
        positionx = 950,
        positiony = 200,
        keysize = 100
    },
    ["P"] = {
        input = KEY_P,
        positionx = 1050,
        positiony = 200,
        keysize = 100
    },
    ["["] = {
        input = KEY_LBRACKET,
        positionx = 1150,
        positiony = 200,
        keysize = 100
    },
    ["]"] = {
        input = KEY_RBRACKET,
        positionx = 1250,
        positiony = 200,
        keysize = 100
    },
    ["\\"] = {
        input = KEY_BACKSLASH,
        positionx = 1350,
        positiony = 200,
        keysize = 150
    },
    ["Capslock"] = {
        input = KEY_CAPSLOCK,
        positionx = 0,
        positiony = 300,
        keysize = 175
    },
    ["A"] = {
        input = KEY_A,
        positionx = 175,
        positiony = 300,
        keysize = 100
    },
    ["S"] = {
        input = KEY_S,
        positionx = 275,
        positiony = 300,
        keysize = 100
    },
    ["D"] = {
        input = KEY_D,
        positionx = 375,
        positiony = 300,
        keysize = 100
    },
    ["F"] = {
        input = KEY_F,
        positionx = 475,
        positiony = 300,
        keysize = 100
    },
    ["G"] = {
        input = KEY_G,
        positionx = 575,
        positiony = 300,
        keysize = 100
    },
    ["H"] = {
        input = KEY_H,
        positionx = 675,
        positiony = 300,
        keysize = 100
    },
    ["J"] = {
        input = KEY_J,
        positionx = 775,
        positiony = 300,
        keysize = 100
    },
    ["K"] = {
        input = KEY_K,
        positionx = 875,
        positiony = 300,
        keysize = 100
    },
    ["L"] = {
        input = KEY_L,
        positionx = 975,
        positiony = 300,
        keysize = 100
    },
    [";"] = {
        input = KEY_SEMICOLON,
        positionx = 1075,
        positiony = 300,
        keysize = 100
    },
    ["'"] = {
        input = KEY_APOSTROPHE,
        positionx = 1175,
        positiony = 300,
        keysize = 100
    },
    ["Enter"] = {
        input = KEY_ENTER,
        positionx = 1275,
        positiony = 300,
        keysize = 225
    },
    ["LShift"] = {
        input = KEY_LSHIFT,
        positionx = 0,
        positiony = 400,
        keysize = 225
    },
    ["Z"] = {
        input = KEY_Z,
        positionx = 225,
        positiony = 400,
        keysize = 100
    },
    ["X"] = {
        input = KEY_X,
        positionx = 325,
        positiony = 400,
        keysize = 100
    },
    ["C"] = {
        input = KEY_C,
        positionx = 425,
        positiony = 400,
        keysize = 100
    },
    ["V"] = {
        input = KEY_V,
        positionx = 525,
        positiony = 400,
        keysize = 100
    },
    ["B"] = {
        input = KEY_B,
        positionx = 625,
        positiony = 400,
        keysize = 100
    },
    ["N"] = {
        input = KEY_N,
        positionx = 725,
        positiony = 400,
        keysize = 100
    },
    ["M"] = {
        input = KEY_M,
        positionx = 825,
        positiony = 400,
        keysize = 100
    },
    [","] = {
        input = KEY_COMMA,
        positionx = 925,
        positiony = 400,
        keysize = 100
    },
    ["."] = {
        input = KEY_PERIOD,
        positionx = 1025,
        positiony = 400,
        keysize = 100
    },
    ["/"] = {
        input = KEY_SLASH,
        positionx = 1125,
        positiony = 400,
        keysize = 100
    },
    ["RShift"] = {
        input = KEY_RSHIFT,
        positionx = 1225,
        positiony = 400,
        keysize = 275
    },
    ["LCtrl"] = {
        input = KEY_LCONTROL,
        positionx = 0,
        positiony = 500,
        keysize = 125
    },
    ["LWin"] = {
        input = KEY_LWIN,
        positionx = 125,
        positiony = 500,
        keysize = 125
    },
    ["LAlt"] = {
        input = KEY_LALT,
        positionx = 250,
        positiony = 500,
        keysize = 125
    },
    ["Space"] = {
        input = KEY_SPACE,
        positionx = 375,
        positiony = 500,
        keysize = 625
    },
    ["RAlt"] = {
        input = KEY_RALT,
        positionx = 1000,
        positiony = 500,
        keysize = 125
    },
    ["RWin"] = {
        input = KEY_RWIN,
        positionx = 1125,
        positiony = 500,
        keysize = 125
    },
    ["Menu"] = {
        input = KEY_APP,
        positionx = 1250,
        positiony = 500,
        keysize = 125
    },
    ["RCtrl"] = {
        input = KEY_RCONTROL,
        positionx = 1375,
        positiony = 500,
        keysize = 125
    },
    ["Up"] = {
        input = KEY_UP,
        positionx = 1650,
        positiony = 400,
        keysize = 100
    },
    ["Left"] = {
        input = KEY_LEFT,
        positionx = 1550,
        positiony = 500,
        keysize = 100
    },
    ["Down"] = {
        input = KEY_DOWN,
        positionx = 1650,
        positiony = 500,
        keysize = 100
    },
    ["Right"] = {
        input = KEY_RIGHT,
        positionx = 1750,
        positiony = 500,
        keysize = 100
    },
}

local MouseInputs = {
    ["ScU"] = {
        input = MOUSE_WHEEL_UP,
        positionx = 1750,
        positiony = 200,
        keysize = 100
    },
    ["LMB"] = {
        input = MOUSE_LEFT,
        positionx = 1650,
        positiony = 300,
        keysize = 100
    },
    ["MMB"] = {
        input = MOUSE_MIDDLE,
        positionx = 1750,
        positiony = 300,
        keysize = 100
    },
    ["RMB"] = {
        input = MOUSE_RIGHT,
        positionx = 1850,
        positiony = 300,
        keysize = 100
    },
    ["ScD"] = {
        input = MOUSE_WHEEL_DOWN,
        positionx = 1750,
        positiony = 400,
        keysize = 100
    },
    ["SMB"] = {
        input = MOUSE_4,
        positionx = 1750,
        positiony = 500,
        keysize = 100
    },
}

local RemovedKeys = {
    ["Esc"] = true,
    ["F1"] = true,
    ["F2"] = true,
    ["F3"] = true,
    ["F4"] = true,
    ["F5"] = true,
    ["F6"] = true,
    ["F7"] = true,
    ["F8"] = true,
    ["F9"] = true,
    ["F10"] = true,
    ["F11"] = true,
    ["F12"] = true,
    ["`"] = true,
    ["6"] = true,
    ["7"] = true,
    ["8"] = true,
    ["9"] = true,
    ["0"] = true,
    ["-"] = true,
    ["="] = true,
    ["Backspace"] = true,
    ["T"] = true,
    ["Y"] = true,
    ["U"] = true,
    ["I"] = true,
    ["O"] = true,
    ["P"] = true,
    ["["] = true,
    ["]"] = true,
    ["\\"] = true,
    ["Capslock"] = true,
    ["G"] = true,
    ["H"] = true,
    ["J"] = true,
    ["K"] = true,
    ["L"] = true,
    [";"] = true,
    ["'"] = true,
    ["Enter"] = true,
    ["LShift"] = true,
    ["B"] = true,
    ["N"] = true,
    ["M"] = true,
    [","] = true,
    ["."] = true,
    ["/"] = true,
    ["RShift"] = true,
    ["LWin"] = true,
    ["RAlt"] = true,
    ["RWin"] = true,
    ["Menu"] = true,
    ["RCtrl"] = true,
    ["Up"] = true,
    ["Left"] = true,
    ["Down"] = true,
    ["Right"] = true,
}

local function RemoveKey(key)
    if not RemovedKeys[key] then --
        RemovedKeys[key] = true
    end

    PrintTable(RemovedKeys)
end

concommand.Add("RemoveKey", function(ply, cmd, args)
    RemoveKey(args[1])
end, nil, "Remove key")

local MouseDeltaX = 0
local MouseDeltaY = 0
hook.Add("StartCommand", "GetMouseDeltas", function(ply, cmd)
    MouseDeltaX = Lerp(0.1, MouseDeltaX + cmd:GetMouseX(), 0)
    MouseDeltaY = Lerp(0.1, MouseDeltaY + cmd:GetMouseY(), 0)
end)

local function DrawCircle(x, y, radius, seg) -- from https://wiki.facepunch.com/gmod/surface.DrawPoly#example
    local cir = {}
    table.insert(cir, {
        x = x,
        y = y,
        u = 0.5,
        v = 0.5
    })

    for i = 0, seg do
        local a = math.rad((i / seg) * -360)
        table.insert(cir, {
            x = x + math.sin(a) * radius,
            y = y + math.cos(a) * radius,
            u = math.sin(a) / 2 + 0.5,
            v = math.cos(a) / 2 + 0.5
        })
    end

    local a = math.rad(0) -- This is needed for non absolute segment counts
    table.insert(cir, {
        x = x + math.sin(a) * radius,
        y = y + math.cos(a) * radius,
        u = math.sin(a) / 2 + 0.5,
        v = math.cos(a) / 2 + 0.5
    })

    surface.DrawPoly(cir)
end

local Black = Color(0, 0, 0)
local Blackish = Color(0, 0, 0, 200)
local White = Color(255, 255, 255)
local Whitish = Color(255, 255, 200)
hook.Add("HUDPaint", "MakeKeyboard", function()
    -- make into its own function later
    local OriginX = posxCvar:GetInt()
    local OriginY = posyCvar:GetInt()
    local MouseOffsetX = MouseOffsetXCvar:GetInt()
    local MouseOffsetY = MouseOffsetYCvar:GetInt()
    for key, data in pairs(KeyboardInputs) do
        if not RemovedKeys[key] then
            surface.SetDrawColor((input.IsKeyDown(data.input) and Black) or White)
            surface.DrawRect(OriginX + (data.positionx * PercentSize), OriginY + (data.positiony * PercentSize), data.keysize * PercentSize, 100 * PercentSize)
            surface.SetDrawColor((input.IsKeyDown(data.input) and White) or Black)
            surface.DrawOutlinedRect(OriginX + (data.positionx * PercentSize), OriginY + (data.positiony * PercentSize), data.keysize * PercentSize, 100 * PercentSize, 1)
            surface.SetFont("CoolFont")
            local _, Height = surface.GetTextSize(key)
            draw.DrawText(key, "CoolFont", OriginX + (data.positionx * PercentSize) + (data.keysize * PercentSize / 2), OriginY + (data.positiony * PercentSize) + (50 * PercentSize) - (Height / 2), (input.IsKeyDown(data.input) and White) or Black, TEXT_ALIGN_CENTER)
        end
    end

    for button, data in pairs(MouseInputs) do
        surface.SetDrawColor((input.IsMouseDown(data.input) and Black) or White)
        surface.DrawRect(OriginX + MouseOffsetX * PercentSize + (data.positionx * PercentSize), OriginY + MouseOffsetY * PercentSize + (data.positiony * PercentSize), data.keysize * PercentSize, 100 * PercentSize)
        surface.SetDrawColor((input.IsMouseDown(data.input) and White) or Black)
        surface.DrawOutlinedRect(OriginX + MouseOffsetX * PercentSize + (data.positionx * PercentSize), OriginY + MouseOffsetY * PercentSize + (data.positiony * PercentSize), data.keysize * PercentSize, 100 * PercentSize, 1)
        surface.SetFont("CoolFont")
        local _, Height = surface.GetTextSize(button)
        draw.DrawText(button, "CoolFont", OriginX + MouseOffsetX * PercentSize + (data.positionx * PercentSize) + (data.keysize * PercentSize / 2), OriginY + MouseOffsetY * PercentSize + (data.positiony * PercentSize) + (50 * PercentSize) - (Height / 2), (input.IsMouseDown(data.input) and White) or Black, TEXT_ALIGN_CENTER)
    end

    surface.SetDrawColor(Blackish)
    DrawCircle(OriginX + MouseOffsetX * PercentSize + (200 * PercentSize) + 2000 * PercentSize, OriginY + MouseOffsetY * PercentSize + 400 * PercentSize, 150 * PercentSize, 100)
    surface.SetDrawColor(Whitish)
    DrawCircle(OriginX + MouseOffsetX * PercentSize + (200 * PercentSize) + 2000 * PercentSize + math.Clamp(MouseDeltaX, -100 * PercentSize, 100 * PercentSize), OriginY + MouseOffsetY * PercentSize + (400 * PercentSize) + math.Clamp(MouseDeltaY, -100 * PercentSize, 100 * PercentSize), 25 * PercentSize, 100)
end)
