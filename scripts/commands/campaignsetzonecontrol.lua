---------------------------------------------------------------------------------------------------
-- func: campaignzonecontrol
-- desc: Updates zone control specific army
-- Sandy = 0, Bastok = 1, Windurst = 2, Beastmen = 3
---------------------------------------------------------------------------------------------------
require("scripts/globals/campaign")

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!campaignzonecontrol <armyid>")
end

function onTrigger(player, armyId)
	local zoneid

    if (armyId == nil) then
        error(player, "You must supply an Army ID.")
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
	
	tpz.campaign.setZoneControl(player:getZone(), armyId);
end

