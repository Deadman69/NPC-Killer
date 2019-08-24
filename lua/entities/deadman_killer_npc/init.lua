AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/props_junk/wood_crate001a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType( SIMPLE_USE )
    local phys = self:GetPhysicsObject()
    phys:Wake()

end



function ENT:Use(activator, caller, usetype, value)

	if not activator:IsPlayer() or not activator:Alive() or not activator:IsValid() then return end

	local price = activator:GetNWInt("DeadmanKillerPrice", 0)
	if price == 0 then
		activator:ChatPrint("Sorry, you don't have kill any NPC")
	else
		activator:addMoney( price )
		activator:SetNWInt("DeadmanKillerPrice", 0)
		activator:ChatPrint("You have win $"..price )
	end

end
