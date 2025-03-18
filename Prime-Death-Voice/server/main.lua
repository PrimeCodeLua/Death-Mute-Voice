print('SCRIPT PRIME | Script crée par Prime')

RegisterNetEvent('brad-deathvoice:setVoiceState')
AddEventHandler('brad-deathvoice:setVoiceState', function(state)
    local src = source
    if state then
        exports['pma-voice']:toggleVoice(src, true)
    else
        exports['pma-voice']:toggleVoice(src, false)
    end
end)
