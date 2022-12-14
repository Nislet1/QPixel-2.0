fx_version 'cerulean'
games { 'gta5' }

client_script "@dpx/client/lib.js"
server_script "@dpx/server/lib.js"
shared_script "@dpx/shared/lib.lua"

client_script "@qpixel-sync/client/lib.lua"
client_script "@qpixel-lib/client/cl_ui.lua"

client_scripts {
  '@qpixel-lib/client/cl_rpc.lua',
  'client/cl_*.lua',
  'client/cl_*.js',
}

server_scripts {
  "@oxmysql/lib/MySQL.lua",
	'@qpixel-lib/server/sv_rpc.lua',
	'@qpixel-lib/server/sv_sqlother.lua',
  'server/sv_*.lua',
  'server/sv_*.js',
}
