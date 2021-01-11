---------------------------------------------------------------------------------------------------
-- func: campaignsetbattlestatus
-- desc: Updates campaign battle status for current zone
---------------------------------------------------------------------------------------------------

require("scripts/globals/campaign")

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!campaignsetbattlestatus <status>")
end

function onTrigger(player, status)
	local zoneid

    if (status == nil) then
        error(player, "You must supply a status value.")
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
	
	tpz.campaign.setBattleStatus(player:getZone(), status);
end

