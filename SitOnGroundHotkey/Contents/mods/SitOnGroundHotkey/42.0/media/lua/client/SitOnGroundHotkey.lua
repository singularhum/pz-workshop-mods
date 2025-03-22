local SitOnGroundHotkey = {}

local options = PZAPI.ModOptions:create("sitOnGroundHotkeyOptions", getText("UI_options_sitongroundhotkey_name"))
SitOnGroundHotkey.keybind = options:addKeyBind("sitOnGroundHotkey", getText("UI_options_sitongroundhotkey_keybind_name"), 0, getText("UI_options_sitongroundhotkey_keybind_tooltip"))
SitOnGroundHotkey.removeFromContextMenu = options:addTickBox("removeInContextMenu", getText("UI_options_sitongroundhotkey_remove_cm_name"), false, getText("UI_options_sitongroundhotkey_remove_cm_tooltip"))

SitOnGroundHotkey.onKeyPressed = function(keyPressed)
	local player = getPlayer()
	if not player then
		return
	end
	if keyPressed == SitOnGroundHotkey.keybind:getValue() then
		player:reportEvent("EventSitOnGround")
	end
end

SitOnGroundHotkey.onFillWorldObjectContextMenu = function(playerNum, context, worldObjects, test)
	if SitOnGroundHotkey.removeFromContextMenu.value then
		local option = context:getOptionFromName(getText("ContextMenu_SitGround"))
		if option then
			context:removeOptionByName(option.name)
		end
	end
end

Events.OnKeyPressed.Add(SitOnGroundHotkey.onKeyPressed)
Events.OnFillWorldObjectContextMenu.Add(SitOnGroundHotkey.onFillWorldObjectContextMenu)