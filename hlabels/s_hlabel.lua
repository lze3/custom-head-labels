col_err = {238, 167, 74}

RegisterCommand('hlrange', function(source, args)
    if #args < 1 then
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Head Labels", "Invalid amount of arguments provided."},
            color = col_err
        })
    end
       
    if args[1] == 'c' then
        TriggerClientEvent('setHeadLabelDistance', source, 15)
        -- maybe notify the client also :shrug:
    elseif args[1] == 'm' then
        TriggerClientEvent('setHeadLabelDistance', source, 200)
    elseif args[1] == 'f' then
        TriggerClientEvent('setHeadLabelDistance', source, 10000)
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Head Labels", "Unknown distance provided."},
            color = col_err
        })
    end
end, true)