DNPC = {} -- Don't touch it


DNPC.BlacklistNPC = { -- -- NPC that will not give money to players, to know it, open your props menu and right click on an item and then "Copy to clipboard"
    	["npc_crow"] = true,
    	["npc_seagull"] = true,
    	["npc_pigeon"] = true,
}


DNPC.ShouldResetOnDeath = true -- Should we remove the amount the player has won when he died/changing job... ?
DNPC.MoneyPerNPC = 50 -- How much money should we give to the player for each NPC he killed (except the blaclist below)
