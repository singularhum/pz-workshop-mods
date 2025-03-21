require "TimedActions/ISUninstallVehiclePart"

local original_complete = ISUninstallVehiclePart.complete

function ISUninstallVehiclePart:complete()
	if self.vehicle and self.part and self.part:getCategory() == "tire" then
		local tirePressure = self.part:getContainerContentAmount()
		local item = self.part:getInventoryItem()
		local valid = original_complete(self)
		if valid then
			item:setItemCapacity(tirePressure)
		end
		return valid
	else
		return original_complete(self)
	end
end