-- hook แบบ "will": return false เพื่อบล็อก
Config.ClientWillOpen = function()
	return true
end

-- hook แบบ "ed": ยิงแล้วไม่รอผล
Config.ClientOpened = function()
end

Config.ClientNotify = function(msg)
	BeginTextCommandThefeedPost('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandThefeedPostTicker(false, true)
end
