-- put in garrysmod/lua and do lua_openscript_cl sidehop.lua
hook.Add("PostPlayerDraw", "DrawArc", function(ply)
    if not LocalPlayer():ShouldDrawLocalPlayer() then return end
    if Vector(LocalPlayer():GetVelocity().x, LocalPlayer():GetVelocity().y, 0):Length2D() < 1 then return end
    render.DrawLine(LocalPlayer():GetShootPos(), LocalPlayer():GetShootPos() + Vector(LocalPlayer():GetVelocity().x, LocalPlayer():GetVelocity().y, 0):GetNormalized() * 50, Color(0, 255, 0), true)
    render.DrawLine(LocalPlayer():GetShootPos(), LocalPlayer():GetShootPos() + Vector(-Vector(LocalPlayer():GetVelocity().x, LocalPlayer():GetVelocity().y, 0).y, Vector(LocalPlayer():GetVelocity().x, LocalPlayer():GetVelocity().y, 0).x, 0):GetNormalized() * 50, Color(255, 0, 0), true)
end)
