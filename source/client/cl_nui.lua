RegisterNUICallback("anti_devtools", function(body)
    local difference <const> = body.difference

    if Config.enabled then
        if difference and tonumber(difference) > 50 then
            return TriggerServerEvent("anti_devtools:drop")
        end
    end
end)
