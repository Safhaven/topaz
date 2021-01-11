---------------------------------------------------------------------------------------------------
-- func: updateconquest
-- desc: Updates all conquest guard. (Need modify in db first.)
---------------------------------------------------------------------------------------------------

require("scripts/globals/campaign")

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
end

function onTrigger(player, CZoneid)
	local zoneid

	--if zone is not a campaign zone
	for i, id in pairs(tpz.campaign.zone) do
		if(CZoneid ~= nil) then
			if(CZoneid == id) then
				zoneid = CZoneid
				break
			end
		elseif (player:getZoneID() == id) then
			zoneid = player:getZoneID()
			break
		end	
	end
			
	if (zoneid == nil) then
        error(player, "Selected/Current zone is not a valid Campaign zone.")
        return
    end

	CampaignEnd(zoneid);
end
