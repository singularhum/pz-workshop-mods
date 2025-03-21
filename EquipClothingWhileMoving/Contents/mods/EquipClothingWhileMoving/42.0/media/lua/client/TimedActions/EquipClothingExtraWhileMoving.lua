require "TimedActions/ISClothingExtraAction"

local original_new = ISClothingExtraAction.new

function ISClothingExtraAction:new(character, item, extra)
	local o = original_new(self, character, item, extra);
	o.stopOnWalk = false;
	o.stopOnAim = false;
	return o;
end