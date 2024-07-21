fx_version "cerulean"
game "gta5"
lua54 "yes"

author "Edward Lewis"
description "A script that blocks clients from using NUI Dev Tools"

ui_page "source/web/index.html"

client_script "source/client/cl_nui.lua"

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "source/server/sv_nui.lua"
} 

shared_script "config.lua"

files {
    "source/web/index.html",
    "config.lua"
}