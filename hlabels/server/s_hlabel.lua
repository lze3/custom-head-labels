-- colours that determine the success level
colours = 
{
    ["error"] = {238, 167, 74},
    ["success"] = {114, 210, 80}
}

distances = {
    ["close"] = {
        ["shortname"] = "C",
        ["name"] = "CLOSE",
        ["distance"] = 15
    },

    ["med"] = {
        ["shortname"] = "M",
        ["name"] = "MEDIUM",
        ["distance"] = 200
    },

    ["far"] = {
        ["shortname"] = "F",
        ["name"] = "FAR",
        ["distance"] = 999*999*999
    }
}

RegisterCommand('hlrange', function(source, args)
    if IsPlayerAceAllowed(source, "hlabels.hlrange") then
        if #args < 1 then
            TriggerClientEvent('chat:addMessage', source, {
                args = {"Head Labels", "Invalid amount of arguments provided."},
                color = colours.error
            })
            return
        end

        local shouldRun
        local range
        for k, v in pairs(distances) do
            if v["shortname"]:lower() == args[1] then
                shouldRun = true
                range = v
                break
            end
        end

        if shouldRun then 
            TriggerClientEvent("setHeadLabelDistance", source, range.distance)
            TriggerClientEvent("chat:addMessage", source, {
                args = {"Head Labels", "You have set your head label display range to: [ " .. range.name:upper() .. " ]."},
                color = colours.success
            })
            shouldRun = not shouldRun
        else
            TriggerClientEvent("chat:addMessage", source, {
                args = {"Head Labels", "Unknown distance provided."},
                color = colours.error
            })
        end
    else
        TriggerClientEvent("chat:addMessage", source, {
            args = {"Head Labels", "You do not have permission to execute this command (hlrange)."},
            color = colours.error
        })
    end
end, false)