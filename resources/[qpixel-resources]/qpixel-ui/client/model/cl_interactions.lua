local lastMessage = ""

function showInteraction(text, type)
	local color = "#2196f3"

	if type == "success" then
		color = "#4caf50"
	elseif type == "error" then
		color = "#f44336"
	end

	SendNUIMessage({
		display = true,
		text = text,
		color = color
	})
end

function hideInteraction()
	SendNUIMessage({
		display = false
	})
end

exports("showInteraction", showInteraction)
exports("hideInteraction", hideInteraction)

AddEventHandler('closeinteraction', function()
	hideInteraction()
end)

RegisterCommand('inter', function()
    TriggerEvent("interactions")
end)

AddEventHandler("interactions", function(zone, data)
            exports["qpixel-interface"]:showInteraction("Shared PD")
end)

exports("showContextMenu", function(options, position)
    SendUIMessage({
        action = "contextmenu",
        show = true,
        data = {
            options = options
        }
    })
    SetUIFocus(true, true)
end)

RegisterNUICallback("closecontext", function(data,cb)
    
    SetUIFocus(false, false)
    cb("ok")
end)


RegisterCommand("testcontextmenu", function()
    local menuData = {
        {
            title = "Lockers",
            description = "Access your personal locker",
            action = "qpixel-police:handler",
            key = "EVENTS.LOCKERS"
        },
        {
            title = "Clothing",
            description = "Gotta look Sharp",
            action = "qpixel-police:handler",
            key = "EVENTS.CLOTHING"
        },
        {
            title = "Armory",
            description = "WEF - Weapons, Equipment, Fun!",
            action = "qpixel-police:handler",
            key = "EVENTS.ARMORY"
        },
        {
            title = "Evidence",
            description = "Drop off some evidence",
            action = "qpixel-police:handler",
            key = "EVENTS.EVIDENCE",
            children = {
                { title = "Confirm Purchase", action = "qpixel-interface:rentalPurchase", key = "EVENTS.EVIDENCE" },
            },
        },
        {
            title = "Trash",
            description = "Where Spaghetti Code belongs",
            action = "qpixel-police:handler",
            key = "EVENTS.TRASH"
        },
        {
            title = "Character switch",
            description = "Go bowling with your cousin",
            action = "qpixel-police:handler",
            key = "EVENTS.SWITCHER",
            children = {
                { title = "Confirm Purchase", action = "qpixel-interface:rentalPurchase", key = "EVENTS.SWITCHER" },
            },
        },
    }
    exports["qpixel-interface"]:showContextMenu(menuData)
end)
-- Example Using This
-- type 
-- error (bg : Red) or succes ( bg : Green) or info (bg : blue)
-- Show Interaction
-- exports["qpixel-interface"]:showInteraction(msg,type)

-- Hide Interaction
-- exports["qpixel-interface"]:showInteraction(msg,type)