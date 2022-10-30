local playerDropped = ...
local Inventory

CreateThread(function()
	Inventory = server.inventory
end)

AddEventHandler('NW:PlayerLogout', playerDropped)

AddEventHandler('NW:PlayerDataUpdated', function(source, data)
	local inventory = Inventory(source)

	if not inventory or not inventory.player then return end

	local groups = type(data.groups) == 'string' and {[data.groups] = 0} or data.groups
	inventory.player.groups = groups
end)
