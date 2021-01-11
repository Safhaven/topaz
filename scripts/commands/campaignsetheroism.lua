---------------------------------------------------------------------------------------------------
-- func: campaignsetheroism
-- desc: Updates campaign heroism for current zone
-- values: arg1 = heroism amount(max 200)
---------------------------------------------------------------------------------------------------

require("scripts/globals/campaign")

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!campaignsetheroism <heroism>")
end

function onTrigger(player, heroism)
	local zoneid

    if (heroism == nil) then
        error(player, "You must supply a heroism amount.")
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
	
	tpz.campaign.setHeroism(player:getZone(), heroism);
end