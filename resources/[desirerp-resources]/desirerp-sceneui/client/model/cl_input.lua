local InputRequests, InputCount = {}, 0

RegisterNUICallback('desirerp-ui:applicationClosed', function(data, cb)
    if (data.name ~= 'textbox' or data.callbackUrl ~= 'desirerp-ui:inputResponse') then return end

    local request = InputRequests[data.key]

    if (not request) then return end

    request.response:resolve(nil)

    InputRequests[data.key] = nil
end)

RegisterNUICallback('desirerp-sceneui:inputResponse', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "done" } })

    local request = InputRequests[data.key]

    if (not request) then return end

    local success = request.validation == nil and true or request.validation(data.values)

    if (not success) then return end

    request.response:resolve(data.values)

    InputRequests[data.key] = nil

    exports['desirerp-sceneui']:closeApplication('textbox')
end)

function OpenInputMenu(pEntries, pValidation)
    local inputId = InputCount + 1

    InputCount = inputId

    local response = promise:new()

    InputRequests[inputId] = { response = response, validation = pValidation}

    exports['desirerp-sceneui']:openApplication('textbox', {
        callbackUrl = 'desirerp-ui:inputResponse',
        key = inputId,
        items = pEntries,
        show = true,
    })

    return Citizen.Await(response)
end

exports('OpenInputMenu', OpenInputMenu)