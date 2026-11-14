-- adapter ของ ESX: เรียก ESX ผ่านไฟล์นี้ไฟล์เดียว
local ESX = exports['es_extended']:getSharedObject()

Framework = {}

function Framework.GetPlayer(source)
	return ESX.GetPlayerFromId(source)
end

function Framework.GetIdentifier(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	return xPlayer and xPlayer.identifier
end
