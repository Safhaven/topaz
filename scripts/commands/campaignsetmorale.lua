---------------------------------------------------------------------------------------------------
-- func: campaignsetmorale
-- desc: Updates campaign morale for specific army for current zone
-- values: arg1 = armyid, arg2 = morale amount(max 250)
-- Sandoria = 0, Bastok = 1, Windurst = 2, Beastmen = (Orcish = 3, Quadav = 4, Yagudo = 5, Kindred = 6)
---------------------------------------------------------------------------------------------------

require("scripts/globals/campaign")

cmdprops =
{
    permission = 1,
    parameters = "ii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!campaignsetmorale <armyid> <morale>")
end

function onTrigger(player, armyId, morale)
	local zoneid

    if (armyId == nil or morale == nil) then
        error(player, "You must supply an Army ID and/or morale amount.")
        return
    end
	
	--if zone is not a campaign zone
	for i, id in pairs(tpz.campaign.zone) do
		if (player:getZoneID() == id) then
			zoneid = player:getZoneID()
			break
		end	
	end
	
	if (zoneid == nil) then
        error(player, "Current player zone is not a valid Campaign zone.")
        return
    end
	
	tpz.campaign.setMorale(player:getZone(), armyId, morale);
end

