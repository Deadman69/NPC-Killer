local shouldResetMoneyOnDeath = DNPC.ShouldResetOnDeath
local moneyPerNPC = DNPC.MoneyPerNPC
local blacklistNPC = DNPC.BlacklistNPC

if shouldResetMoneyOnDeath then
	hook.Add("PlayerSpawn", "DeadmanNPCKillerReset", function(ply)
		ply:SetNWInt("DeadmanKillerPrice", 0)
	end)
end


hook.Add("OnNPCKilled", "DeadmanNPCKillerCounter", function(npc, attacker, inflictor)
	if not attacker:IsValid() or not attacker:IsPlayer() or not attacker:Alive() then return end
	if not blacklistNPC[npc:GetClass()] then
		attacker:SetNWInt("DeadmanKillerPrice", attacker:GetNWInt("DeadmanKillerPrice", 0) + moneyPerNPC)
	end

end)
