ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('pq-armor:cekDuitDanJob', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer and xPlayer.job.name == 'police' then
        if xPlayer.getMoney() >= Config.ArmorSettings.price then
            xPlayer.removeMoney(Config.ArmorSettings.price)
            cb(true)
        else
            cb(false, "Uang tidak cukup")
        end
    else
        cb(false, "Hanya polisi yang dapat membeli armor")
    end
end)
