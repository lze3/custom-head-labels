                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    --[[
---------------------------------------------------
HEAD LABELS(C_HLABELS.LUA) by MrDaGree | Edited by Jack
---------------------------------------------------
Last revision: APR 13 2018
---------------------------------------------------
NOTES 
	x Scale stays the same regarless of distance.
	x Working on a /hlset args command. 
	
---------------------------------------------------
	
]]
local showPlayerBlips = false
local ignorePlayerNameDistance = false
local disPlayerNames = 15
local playerSource = 0

RegisterNetEvent('setHeadLabelDistance')
AddEventHandler('setHeadLabelDistance', function(distance)
	disPlayerNames = distance
end)

function DrawText3D(x,y,z, text) -- some useful function, use it if you want!
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local ped_l = PlayerPedId()

	local scale = (4.00001/dist)*0.3
	if scale > 0.2 then
		scale = 0.2
	elseif scale < 0.15 then
		scale = 0.15
	end

	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov

	if onScreen then
    	SetTextFont(4)
		SetTextScale(scale, scale)
    	SetTextProportional(true)
    	SetTextColour(255, 255, 255, 255)
		SetTextCentre(true)
    	SetTextDropshadow(0, 0, 0, 0, 0)
    	SetTextOutline()
    	SetTextEntry("STRING")
    	AddTextComponentString(text)
    	DrawText(_x,_y - 0.025)
  	end
end

Citizen.CreateThread(function()
	while true do
    	for id = 0, 255 do
    		if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
        		iPed = GetPlayerPed(id) -- indexed ped
        		distance = math.floor(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),  GetEntityCoords(GetPlayerPed(id)),  true))
				if distance < disPlayerNames then
					if not ignorePlayerNameDistance then
						if NetworkIsPlayerTalking(id) then
							DrawText3D(x2, y2, z2+1, "~c~" .. GetPlayerServerId(id) .. "  |  " .. string.sub(GetPlayerName(id), 1, 44) .. "~n~~g~Talking...")
						else
							DrawText3D(x2, y2, z2+1, "~c~" .. GetPlayerServerId(id) .. "  |  " .. string.sub(GetPlayerName(id), 1, 44) .. "")
						end
					end
				end
			end
		end
		Citizen.Wait(0)
	end
end)