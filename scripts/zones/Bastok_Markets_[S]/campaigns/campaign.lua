-----------------------------------
-- Area: North_Gustaberg_[S]
-- Campaign Battle Code
-----------------------------------
local ID = require("scripts/zones/North_Gustaberg_[S]/IDs")
require("scripts/globals/campaign")
require("scripts/globals/keyitems")
-----------------------------------

function onCampaignInitial(zone)
end

function onCampaignStart(zone)
	startCampaign(zone);
end

function onCampaignEnd(zone)
	endCampaign(zone);
end
