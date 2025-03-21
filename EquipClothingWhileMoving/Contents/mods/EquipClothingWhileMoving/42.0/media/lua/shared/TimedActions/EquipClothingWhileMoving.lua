require "TimedActions/ISWearClothing"

local original_new = ISWearClothing.new

function ISWearClothing:new(character, item)
	local o = original_new(self, character, item);
	o.stopOnWalk = false;
	o.stopOnAim = false;
	return o;
end