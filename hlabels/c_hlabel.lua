                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    --[[
---------------------------------------------------
HEAD LABELS (C_HLABELS.LUA) by MrDaGree | Edited by Jack
---------------------------------------------------
Last revision: APR 15 2019
---------------------------------------------------
NOTES 
	
---------------------------------------------------
	
]]

local ignorePlayerNameDistance = false
local disPlayerNames = 15

RegisterNetEvent('setHeadLabelDistance')
AddEventHandler('setHeadLabelDistance', function(distance)
	disPlayerNames = distance
end)

function DrawText3D(x, y, z, text) 
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local dist = GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1)
	local ped_l = PlayerPedId()

	local scale = (4.00001/dist) * 0.3
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
		SetTextColour(210, 210, 210, 180)
		SetTextCentre(true)
		SetTextDropshadow(50, 210, 210, 210, 255)
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString(text)
		DrawText(_x,_y - 0.025)
  	end
end

Citizen.CreateThread(function()
	while true do

		for id = 0, 255 do
			if NetworkIsPlayerActive(id)--[[ and iPed ~= lPed]] then	

				local iPed = GetPlayerPed(id) -- indexed ped
				local lPed = PlayerPedId() -- local ped
				local lPlayer = PlayerId()
				if DoesEntityExist(iPed) then
					local headLabellId = CreateMpGamerTag(iPed, " ", 0, 0, " ", 0)
										 SetMpGamerTagName(headLabelId, " ")
										 SetMpGamerTagVisibility(headLabelId, 0, false)
										 RemoveMpGamerTag(headLabelId)

					distance = math.floor(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),  GetEntityCoords(GetPlayerPed(id)),  true))
					if distance < disPlayerNames then
						if not ignorePlayerNameDistance then
							if NetworkIsPlayerTalking(id) then
								DrawText3D(GetEntityCoords(iPed)["x"], GetEntityCoords(iPed)["y"], GetEntityCoords(iPed)["z"]+1, GetPlayerServerId(id) .. "  |  " .. string.sub(GetPlayerName(id), 1, 44) .. "~n~~g~Talking...")
							else
								DrawText3D(GetEntityCoords(iPed)["x"], GetEntityCoords(iPed)["y"], GetEntityCoords(iPed)["z"]+1, GetPlayerServerId(id) .. "  |  " .. string.sub(GetPlayerName(id), 1, 44) .. "")
							end
						end
					end
				end
			end
		end
		Citizen.Wait(0)
	end
end)