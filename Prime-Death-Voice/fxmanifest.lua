fx_version 'cerulean'
game 'gta5'

author 'Prime'
description 'Désactive la voix quand un joueur est mort (adapté pour Brutal Ambulance Job)'
version '1.0.0'

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

dependencies {
    'brutal_ambulancejob',
    'pma-voice'
}