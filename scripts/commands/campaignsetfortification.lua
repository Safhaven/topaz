---------------------------------------------------------------------------------------------------
-- func: campaignsetfortification
-- desc: Updates campaign fortification min/max for current zone
-- values: arg1 = fortification amount, arg2 = fortification max amount(max 250)
---------------------------------------------------------------------------------------------------

require("scripts/globals/campaign")

cmdprops =
{
    permission = 1,
    parameters = "ii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!campaignsetfortification <minamount> {maxamount}")
end

function onTrigger(player, minamount, maxamount)
	local zoneid

    if (minamount == nil) then
        error(player, "You must supply a fortification amount.")
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
	
	if(maxamount ~= nil) then
		tpz.campaign.setMaxFortification(player:getZone(), maxamount);
	end
	
	tpz.campaign.setFortification(player:getZone(), minamount);
end

