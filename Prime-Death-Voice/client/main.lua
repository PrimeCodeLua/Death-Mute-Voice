local isDead = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local deadStatus = exports.brutal_ambulancejob:IsDead()

        if deadStatus and not isDead then
            isDead = true
            DisableVoice()
        elseif not deadStatus and isDead then
            isDead = false
            EnableVoice()
        end
    end
end)

AddEventHandler('brutal_ambulancejob:revive', function()
    if isDead then
        isDead = false
        EnableVoice()
    end
end)

AddEventHandler('brutal_ambulancejob:server:heal', function()
    if isDead then
        isDead = false
        EnableVoice()
    end
end)

function DisableVoice()
    exports['pma-voice']:setVoiceProperty('radioEnabled', false)
    exports['pma-voice']:setVoiceProperty('micClicks', false)
    exports['pma-voice']:removePlayerFromCall()
    exports['pma-voice']:removePlayerFromRadio()
    exports['pma-voice']:setVoiceProperty('proximity', 0.0) -- Réduit la portée à 0
    exports['pma-voice']:setVoiceProperty('enabled', false) -- Désactive la voix 
    exports['pma-voice']:setVoiceProperty('voiceEnabled', false) -- Forcer désactivation
    MumbleSetVolumeOverride(PlayerId(), -1.0) -- Couper totalement le son du joueur
end


function EnableVoice()
    exports['pma-voice']:setVoiceProperty('radioEnabled', true)
    exports['pma-voice']:setVoiceProperty('micClicks', true)
    exports['pma-voice']:setVoiceProperty('enabled', true) -- Réactive la voix
    exports['pma-voice']:setVoiceProperty('voiceEnabled', true) -- Forcer réactivation
    exports['pma-voice']:setVoiceProperty('proximity', 2.0) -- Remet la portée normale
    MumbleSetVolumeOverride(PlayerId(), 1.0) -- Remet le volume à la normale
end
