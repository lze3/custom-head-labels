-- colours that determine the success level
colours = 
{
    ["error"] = {238, 167, 74},
    ["success"] = {114, 210, 80}
}


RegisterCommand('hlrange', function(source, args)
    if #args < 1 then
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Head Labels", "Invalid amount of arguments provided."},
            color = colours.error
        })
        return
    end
       
    if args[1] == 'c' then
        TriggerClientEvent('setHeadLabelDistance', source, 15)
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Head Labels", "You have set your head label display range to close."},
            color = colours.success
        })
    elseif args[1] == 'm' then
        TriggerClientEvent('setHeadLabelDistance', source, 200)
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Head Labels", "You have set your head label display range to medium."},
            color = colours.success
        })
    elseif args[1] == 'f' then
        TriggerClientEvent('setHeadLabelDistance', source, 10000)
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Head Labels", "You have set your head label display range to far."},
            color = colours.success
        })
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Head Labels", "Unknown distance provided."},
            color = colours.error
        })
    end
end, true)