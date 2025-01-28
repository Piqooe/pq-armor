fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Piqooe'
description 'Add Armor'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

dependencies {
    'es_extended',
    'ox_target',
    'ox_lib'
}

