fx_version 'cerulean'
game 'gta5'

description 'FiveM resource template'
version '1.0.0'
author 'your_name'

lua54 'yes'

dependency 'es_extended'

shared_scripts {
	'config/config.general.lua', -- ต้องมาเป็นไฟล์แรก (สร้าง Config = {})
}

server_scripts {
	-- '@oxmysql/lib/MySQL.lua', -- เอา comment ออกถ้าใช้ DB
	'config/functions/config.framework.server.lua',
	'config/functions/config.functions.server.lua',
	'server/main.lua',
}

client_scripts {
	'config/config.locale.lua',
	'config/functions/config.functions.client.lua',
	'client/main.lua',
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/assets/**/*.*',
}
