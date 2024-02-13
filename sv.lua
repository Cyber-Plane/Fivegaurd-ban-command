RegisterCommand(Config.Commandname, function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, Config.Aceperms) then
        -- Permission check passed
        if args[1] then
            local targetPlayerId = args[1]
            print("Command issuer with permission targeting player ID: " .. targetPlayerId)
            exports[Config.FivegaurdResource]:fg_BanPlayer(
                targetPlayerId --[[ integer ]],
                Config.banreason --[[ string ]],
                true --[[ boolean ]]
            )
        else
            -- No player ID provided
            TriggerClientEvent(Config.ChatClientevent, source, {
                args = {"^1SYSTEM", "Usage: /abschieben [playerId]"}
            })
        end
    else
        -- Permission check failed
        TriggerClientEvent(Config.ChatClientevent, source, {
            args = {"^1SYSTEM", "You do not have permission to use this command."}
        })
    end
end, false) 
