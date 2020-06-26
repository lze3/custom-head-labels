-- colours that determine the success level
colours = 
{
    ERROR = { 238, 167, 74 },
    SUCCESS = { 114, 210, 80 }
}

distances = {
    close = {
        shortname = "C",
        name = "CLOSE",
        distance = 15
    },

    med = {
        shortname = "M",
        name = "MEDIUM",
        distance = 200
    },

    far = {
        shortname = "F",
        name = "FAR",
        distance = 10000
    }
}

RegisterCommand('hlrange', function(source, args)
    if not IsPlayerAceAllowed(source, "hlabels.hlrange") then
        return TriggerClientEvent("chat:addMessage", source, {
            args = { "Head Labels", "You do not have permission to execute this command (hlrange)." },
            color = colours.ERROR
        })
    end

    if #args < 1 then
        return TriggerClientEvent('chat:addMessage', source, {
            args = { "Head Labels", "Invalid amount of arguments provided." },
            color = colours.ERROR
        })
    end

    local foundRange
    for k, v in pairs(distances) do
        if v["shortname"]:lower() == args[1]:lower() then
            foundRange = v
            break
        end
    end

    if not foundRange then 
        return TriggerClientEvent("chat:addMessage", source, {
            args = { "Head Labels", "Unknown distance provided." },
            color = colours.ERROR
        })
    end

    TriggerClientEvent("setHeadLabelDistance", source, foundRange.distance)
    TriggerClientEvent("chat:addMessage", source, {
        args = { "Head Labels", "You have set your head label display range to: [ " .. foundRange.name:upper() .. " ]." },
        color = colours.SUCCESS
    })
end, false)

RegisterNetEvent("onClientHeadLabelRangeChange")
AddEventHandler("onClientHeadLabelRangeChange", function(change)
    local source = source
    -- ok, this is bad!
    if not IsPlayerAceAllowed(source, "hlabels.hlrange") then
        local thisResourceName = {
            DROP = GetCurrentResourceName() .. " (hlabels)",
            CONSOLE = "^7[^4" .. GetCurrentResourceName() .. "^7]"
        }
        local message = "Detected an unauthorized altercation of"
        print("^1(ALERT) " .. thisResourceName.CONSOLE .. ": ^3" .. message .. " player [ " .. GetPlayerName(source) .. " | " .. source .. " ] head label range. ^1Dropping the " ..
            "player from the server now.^7")
        DropPlayer(source, "Dropped as a protection of the " .. thisResourceName.DROP .. " resource. " .. message .. " your head label range.")
    end
end)