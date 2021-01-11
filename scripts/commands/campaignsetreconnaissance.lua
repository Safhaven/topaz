---------------------------------------------------------------------------------------------------
-- func: campaignsetreconnaissance
-- desc: Updates campaign reconnaissance for specific army for current zone
-- values: arg1 = armyid, arg2 = reconnaissance amount(max 250)
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
    player:PrintToPlayer("!campaignsetreconnaissance <armyid> <reconnaissance>")
end

function onTrigger(player, armyId, reconnaissance)
	local zoneid

    if (armyId == nil or reconnaissance == nil) then
        error(player, "You must supply an Army ID and/or reconnaissance amount.")
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
	
	tpz.campaign.setReconnaissance(player:getZone(), armyId, reconnaissance);
end

