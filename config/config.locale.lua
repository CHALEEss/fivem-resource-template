Config.Locales = {
	['th'] = {
		['opened'] = 'เปิดหน้าต่างแล้ว',
		['denied'] = 'ไม่สามารถเปิดได้',
	},
	['en'] = {
		['opened'] = 'Window opened',
		['denied'] = 'Cannot open',
	},
}

function _L(key)
	local t = Config.Locales[Config.Locale] or Config.Locales['en']
	return t[key] or key
end
