Config = {}

Config.enabled = true
Config.msg = "How about you stop trying to use Dev Tools"

---@type "discord" | "steam" | "license"
Config.identifier = "discord"

---@type "kick" | "ban"
Config.punishment = "kick"

Config.whitelisted = {
    "discord:discord_id"
}

return Config