local function tambahArmor()
    local playerPed = PlayerPedId()

    if GetPedArmour(playerPed) >= Config.ArmorSettings.amount then
        ESX.ShowNotification('Armor kamu sudah penuh!')
        return
    end

    ESX.TriggerServerCallback('pq-armor:cekDuitDanJob', function(bisaBeli, message)
        if bisaBeli then
            if lib.progressBar({
                duration = 10000,
                label = 'Memasang armor...',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    combat = true,
                    move = true
                },
                anim = {
                    dict = 'clothingshirt',
                    clip = 'try_shirt_positive_d'
                },
                prop = {
                    model = `prop_bodyarmour_02`,
                    pos = vec3(0.2, 0.0, 0.0),
                    rot = vec3(90.0, 0.0, 0.0)
                },
            }) then
                SetPedArmour(playerPed, Config.ArmorSettings.amount)
                ESX.ShowNotification('Kamu telah membeli armor!')
            else
                ESX.ShowNotification('Kamu membatalkan pemasangan armor.')
            end
        else
            ESX.ShowNotification(message or 'Tidak dapat membeli armor.')
        end
    end)
end

CreateThread(function()
    for _, point in pairs(Config.ArmorPoints) do
        exports.ox_target:addBoxZone({
            coords = point.coords,
            size = Config.ArmorSettings.boxSize,
            rotation = Config.ArmorSettings.rotation,
            options = {
                {
                    name = 'armor_point',
                    icon = 'fas fa-shield-alt',
                    label = point.label,
                    onSelect = function()
                        tambahArmor()
                    end
                }
            }
        })
    end
end)

-- Cuman buat tes hapus armor, kalo ga butuh hapus aja
RegisterCommand('hapusarmor', function()
    local playerPed = PlayerPedId()

    if GetPedArmour(playerPed) > 0 then
        SetPedArmour(playerPed, 0)
        ESX.ShowNotification('Armor kamu telah dihapus!')
    else
        ESX.ShowNotification('Kamu tidak memiliki armor untuk dihapus!')
    end
end, false)
