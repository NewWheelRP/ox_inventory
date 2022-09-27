local onLogout = ...

RegisterNetEvent('NW:PlayerLogout', onLogout)

RegisterNetEvent('NW:PlayerDataUpdated', function(data)
    if source == '' then return end
    PlayerData.groups = type(data.groups) == 'string' and {[data.groups] = 0} or data.groups
    OnPlayerData('groups', PlayerData.groups)
end)
