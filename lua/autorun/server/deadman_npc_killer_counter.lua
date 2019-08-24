-- Config below

local shoudlresetmoneyondeath = true -- Should we remove the price they won when they spawn (die/change job...)
local moneyfornpc = 50 -- How much money should we give to the player for each NPC he killed (except the blaclist below)
local blacklistnpc = { -- NPC that will not give money to players
	"npc_crow",
	"npc_seagull",
	"npc_zombie",
}



-- DONT TOUCH BELOW THIS LINE      DONT TOUCH BELOW THIS LINE     DONT TOUCH BELOW THIS LINE
-- DONT TOUCH BELOW THIS LINE      DONT TOUCH BELOW THIS LINE     DONT TOUCH BELOW THIS LINE
-- DONT TOUCH BELOW THIS LINE      DONT TOUCH BELOW THIS LINE     DONT TOUCH BELOW THIS LINE



if shoudlresetmoneyondeath then
	hook.Add("PlayerSpawn", "DeadmanNPCKillerReset", function(ply)
		ply:SetNWInt("DeadmanKillerPrice", 0)
	end)
end


hook.Add("OnNPCKilled", "DeadmanNPCKillerCounter", function(npc, attacker, inflictor)
	if not attacker:IsPlayer() or not attacker:Alive() or not attacker:IsValid() then return end
	if not table.HasValue( blacklistnpc, npc:GetClass() ) then
		attacker:SetNWInt("DeadmanKillerPrice", attacker:GetNWInt("DeadmanKillerPrice", 0) + moneyfornpc)
	end

end)