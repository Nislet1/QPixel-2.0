fx_version 'cerulean'
games { 'gta5' }

client_script "@desirerp-errorlog/client/cl_errorlog.lua"
client_script "@desirerp-lib/client/cl_interface.lua"
client_script "@desirerp-lib/client/cl_ui.lua"
client_script "@desirerp-lib/client/cl_interface.lua"

client_script "config.lua"

client_scripts {
  "client/cl_*.lua"
}
server_scripts {
  "server/sv_*.lua"
}