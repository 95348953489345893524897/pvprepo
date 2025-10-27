--https://wiki.facepunch.com/gmod/Enums/DMG
--https://wiki.facepunch.com/gmod/GM:EntityTakeDamage
-- makes some weapons have no damage like supers (props, fall damage, ar2 orb, rpg) 
hook.Add("EntityTakeDamage", "EntityDamage", function(target, dmginfo)
	if target:IsPlayer() then
		if dmginfo:IsDamageType(32) then -- Fall damage
			dmginfo:ScaleDamage(0)
		elseif dmginfo:IsDamageType(1) then -- Prop damage, also ar2 orb damage?
			dmginfo:ScaleDamage(0)
		elseif IsValid(dmginfo:GetWeapon()) and dmginfo:GetWeapon():GetClass() == "weapon_rpg" then -- rpg damage
			dmginfo:ScaleDamage(0)
		end
	end
end)
