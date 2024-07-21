local isWhitelisted <const> = function(player)
    local identifier = GetPlayerIdentifierByType(player, Config.identifier)

    for _, value in pairs(Config.whitelisted) do
        if value == identifier then
            return true
        end
    end

    return false
end

local handlePunishment <const> = function(player)
    local identifier = GetPlayerIdentifierByType(player, "license")
    local formattedIdentifier = identifier and identifier:gsub("license:", "")

    if Config.punishment == "kick" then
        print(("^3[INFO]: Player %s was kicked for opening NUI Devtools"):format(GetPlayerName(player)))
        DropPlayer(player, Config.msg)
    else
        local query = MySQL.insert("INSERT INTO bans(identifier, reason) VALUES(?, ?)", { formattedIdentifier, "Tried to open NUI Dev Tools"})

        print(("^3[INFO]: Player %s was banned for opening NUI Devtools"):format(GetPlayerName(player)))
        DropPlayer(player, Config.msg)
    end
end


AddEventHandler("playerConnecting", function(name, setKickReason, defferals)
    local source <const> = source
    local identifier = GetPlayerIdentifierByType(source, "license")
    local formattedIdentifier = identifier and identifier:gsub("license:", "")

    Wait(0)

    defferals.update("Checking ban data, please wait...")

    local query = MySQL.query.await("SELECT reason FROM bans WHERE identifier = ?", { formattedIdentifier })

    Wait(0)

    if query[1] then
        return defferals.done(("\nYou have been banned by ANTI NUI TOOLS:\nReason: %s"):format(query[1].reason))
    end

    return defferals.done()
end)

RegisterNetEvent("anti_devtools:drop", function()
    local source <const> = source

    if source then
        if isWhitelisted(source) then
            return
        end

        handlePunishment(source)
    end
end)