hook.Add("OnPhysgunPickup", "NoCollideProp", function(ply, ent)
    if ent:IsValid() then -- on supers it would become translucent and red(?) on pickup, but im too lazy
        ent:SetCollisionGroup(1)
    end
end)

hook.Add("PhysgunDrop", "RecollideProp", function(ply, ent)
    if ent:isValid() then --
        ent:SetCollisionGroup(0)
    end
end)
