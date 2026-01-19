-- The red is your forward velocity
-- Blue / green = side velocity (what you should be looking at to accelerate)
--
-- Rest of script
local color_blue = Color(0, 0, 255, 255) -- It looks like a gizmo now (not on purpose). I'm not sure how gizmos are actually colored... i just used the simplest colors
local color_green = Color(0, 255, 0, 255)
local color_red = Color(255, 0, 0, 255)
hook.Add("PostPlayerDraw", "Sidehop", function(ply)
    local vel = ply:GetVelocity()
    local aimvec = ply:GetAimVector()
    local PlyMoving = vel:Length2DSqr() > 0
    local visualisation = (PlyMoving and Vector(vel.x, vel.y, 0)) or Vector(aimvec.x, aimvec.y, 0) -- If the player is moving, the visualisation is the velvec, otherwise use the aimvec 
    visualisation:Normalize()
    local pos = ply:GetPos() + ply:OBBCenter()
    render.DrawLine(pos, pos + visualisation * 75, color_red) -- forward 
    visualisation:Rotate(Angle(0, 90, 0))
    render.DrawLine(pos, pos + visualisation * 75, color_blue) -- the left
    visualisation:Rotate(Angle(0, -180, 0))
    render.DrawLine(pos, pos + visualisation * 75, color_green) -- the right]]
end)
