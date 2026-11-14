-- hook แบบ "will": return false เพื่อบล็อก
Config.ServerWillPing = function(source)
	return true
end

-- hook แบบ "ed": ยิงแล้วไม่รอผล
Config.ServerPinged = function(source)
end
