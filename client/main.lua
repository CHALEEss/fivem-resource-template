local isOpen = false

local function setOpen(state)
	isOpen = state
	SetNuiFocus(state, state)
	SendNUIMessage({ action = 'setVisible', data = state })
end

RegisterCommand(Config.Command, function()
	if isOpen then return end
	if not Config.ClientWillOpen() then
		return Config.ClientNotify(_L('denied'))
	end
	setOpen(true)
	Config.ClientNotify(_L('opened'))
	Config.ClientOpened()
end, false)

RegisterNUICallback('close', function(_, cb)
	setOpen(false)
	cb('ok')
end)

RegisterNUICallback('ping', function(_, cb)
	TriggerServerEvent(GetCurrentResourceName() .. ':ping')
	cb('ok')
end)

AddEventHandler('onResourceStop', function(res)
	if res == GetCurrentResourceName() and isOpen then
		SetNuiFocus(false, false)
	end
end)
