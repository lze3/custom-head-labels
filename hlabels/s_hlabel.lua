-- a colour to show there is a problem
col_err = {238, 167, 74}
col_succ = {114, 210, 80}

RegisterCommand('hlrange', function(source, args)
    if #args < 1 then
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Head Labels", "Invalid amount of arguments provided."},
            color = col_err
        })
        return
    end
       
    if args[1] == 'c' then
        TriggerClientEvent('setHeadLabelDistance', source, 15)
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Head Labels", "You have set your head label display range to close."},
            color = col_succ
        })
    elseif args[1] == 'm' then
        TriggerClientEvent('setHeadLabelDistance', source, 200)
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Head Labels", "You have set your head label display range to medium."},
            color = col_succ
        })
    elseif args[1] == 'f' then
        TriggerClientEvent('setHeadLabelDistance', source, 10000)
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Head Labels", "You have set your head label display range to far."},
            color = col_succ
        })
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Head Labels", "Unknown distance provided."},
            color = col_err
        })
    end
end, true)