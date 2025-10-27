local PickupColor = Color(255, 0, 0, 120)
hook.Add("OnPhysgunPickup", "NoCollideProp", function(ply, ent)
    if ent:IsValid() then
        ent:SetCollisionGroup(1)
        ent.FormerColor = ent:GetColor()
        ent.FormerRenderMode = ent:GetRenderMode()
        ent:SetRenderMode(RENDERMODE_TRANSADD)
        ent:SetColor(PickupColor)
    end
end)

hook.Add("PhysgunDrop", "RecollideProp", function(ply, ent)
    if ent:IsValid() then
        ent:SetCollisionGroup(0)
        ent:SetColor(ent.FormerColor)
        ent:SetRenderMode(ent.FormerRenderMode)
    end
end)
