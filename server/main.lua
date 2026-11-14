RegisterNetEvent(GetCurrentResourceName() .. ':ping', function()
	local src = source
	if not Config.ServerWillPing(src) then return end
	if Config.Debug then
		print(('[%s] ping from %s (%s)'):format(GetCurrentResourceName(), src, Framework.GetIdentifier(src)))
	end
	Config.ServerPinged(src)
end)
