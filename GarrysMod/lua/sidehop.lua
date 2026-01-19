-- The red is your forward velocity
-- Blue / green = side velocity (what you should be looking at to accelerate)
--
-- Rest of script
local color_blue = Color(0, 0, 255, 255) -- It looks like a gizmo now (not on purpose). I'm not sure how gizmos are actually colored... i just used the simplest colors
local color_green = Color(0, 255, 0, 255)
local color_red = Color(255, 0, 0, 255)
hook.Add("PostPlayerDraw", "Sidehop", function(ply)
    local vel = Vector(ply:GetVelocity().x, ply:GetVelocity().y, 0)
    vel:Normalize()
    local pos = ply:GetPos() + ply:OBBCenter()
    render.DrawLine(pos, pos + vel * 75, color_red) -- forward 
    vel:Rotate(Angle(0, 90, 0))
    render.DrawLine(pos, pos + vel * 75, color_blue) -- the left
    vel:Rotate(Angle(0, -180, 0))
    render.DrawLine(pos, pos + vel * 75, color_green) -- the right
end)
