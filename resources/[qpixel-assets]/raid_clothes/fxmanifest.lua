fx_version 'cerulean'
games { 'gta5' }

--[[ dependencies {
  "qpixel-lib"
} ]]--

ui_page 'client/html/index.html'

files {
  'client/html/*.html',
  'client/html/*.js',
  'client/html/*.css',
  'client/html/webfonts/*.eot',
  'client/html/webfonts/*.svg',
  'client/html/webfonts/*.ttf',
  'client/html/webfonts/*.woff',
  'client/html/webfonts/*.woff2',
  'client/html/css/*',
}

client_scripts {
  '@qpixel-lib/client/cl_interface.lua',
  '@qpixel-errorlog/client/cl_errorlog.lua',
  '@qpixel-lib/client/cl_rpc.lua',
  '@qpixel-lib/client/cl_ui.lua',
  'client/cl_tattooshop.lua',
  'client/cl_*.lua',
}

shared_script {
  '@qpixel-lib/shared/sh_util.lua',
  'shared/sh_*.*',
}

server_scripts {
  '@qpixel-lib/server/sv_rpc.lua',
  'server/sv_*.lua',
}

export "CreateHashList"
export "GetTatCategs"
export "GetCustomSkins"
export "isNearClothing"
