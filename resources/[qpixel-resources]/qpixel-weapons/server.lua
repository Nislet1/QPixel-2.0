RegisterNetEvent("qpixel-weapons:attackedByCash")
AddEventHandler("qpixel-weapons:attackedByCash", function(pAttacker)
    local victim = source
    TriggerClientEvent("qpixel-weapons:hitPlayerWithCash", pAttacker, victim)
end)

RegisterNetEvent("qpixel-weapons:processGiveCashAmount")
AddEventHandler("qpixel-weapons:processGiveCashAmount", function(pTarget, pAmount, pId)
    local attacker = source
    local victim = pTarget
    local victimUser = exports["qpixel-base"]:getModule("Player"):GetUser(victim)

    victimUser:addMoney(pAmount)
            
    exports["qpixel-log"]:AddLog("Weapons", 
        source, "Get thrown money", { victim = tostring(victim), victimName = GetPlayerName(victim) })
end)


RPC.register("weapons:getAmmo", function(source)
    return weaponsGetAmmo(source)
end)

RegisterNetEvent("cash:roll")
AddEventHandler("cash:roll", function(src, pAmount)
    local user = exports["qpixel-base"]:getModule("Player"):GetUser(src)
    local amount = tonumber(pAmount)
    if amount ~= nil then
        if user:getCash() >= amount then
            user:removeMoney(amount)
            TriggerClientEvent("player:receiveItem", src,"571920712",1, false,{amount = amount})

            exports["qpixel-log"]:AddLog("Weapons", 
                src, "Create Throwable Cash", {amount = amount})
            return
        end
    end

    return
end)



RegisterNetEvent('qpixel-weapons:getAmmo')
AddEventHandler('qpixel-weapons:getAmmo', function()
    local ammoTable = {}
    local src = source
	local user = exports["qpixel-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.ghmattimysql:execute("SELECT type, ammo FROM characters_weapons WHERE id = @id", {['id'] = char.id}, function(result)
        for i = 1, #result do
            if ammoTable["" .. result[i].type .. ""] == nil then
                ammoTable["" .. result[i].type .. ""] = {}
                ammoTable["" .. result[i].type .. ""]["ammo"] = result[i].ammo
                ammoTable["" .. result[i].type .. ""]["type"] = ""..result[i].type..""
            end
        end
        TriggerClientEvent('qpixel-items:SetAmmo', src, ammoTable)
    end)
end)

RegisterNetEvent('qpixel-weapons:updateAmmo')
AddEventHandler('qpixel-weapons:updateAmmo', function(newammo,ammoType,ammoTable)
    local src = source
	local user = exports["qpixel-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.ghmattimysql:execute('SELECT ammo FROM characters_weapons WHERE type = @type AND id = @identifier',{['@type'] = ammoType, ['@identifier'] = char.id}, function(result)
        if result[1] == nil then
            exports.ghmattimysql:execute('INSERT INTO characters_weapons (id, type, ammo) VALUES (@identifier, @type, @ammo)', {
                ['@identifier'] = char.id,
                ['@type'] = ammoType,
                ['@ammo'] = newammo
            }, function()
            end)
        else
            exports.ghmattimysql:execute('UPDATE characters_weapons SET ammo = @newammo WHERE type = @type AND ammo = @ammo AND id = @identifier', {
                ['@identifier'] = char.id,
                ['@type'] = ammoType,
                ['@ammo'] = result[1].ammo,
                ['@newammo'] = newammo
            }, function()
            end)
        end
    end)
end)


RegisterCommand("rollcash", function(src, args)
    TriggerEvent('cash:roll', src, args[1])
end)
