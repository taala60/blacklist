-- CONFIG --

-- Blacklisted vehicle models
carblacklist = {
	"avisa",
	"dinghy5",
	"kosatka",
	"patrolboat",
	"cerberus",
	"cerberus2",
	"cerberus3",
	"phantom2",
	"issi3",
	"issi4",
	"issi5",
	"issi6",
	"buzzard",
	"akula",
	"annihilator",
	"savage",
	"valkyrie",
	"valkyrie2",
	"annihilator2",
	"dump",
	"apc",
	"insurgent2",
	"barrage",
	"chernobog",
	"halftrack",
	"khanjali",
	"minitank",
	"rhino",
	"rcbandito",
	"scarab",
	"scarab2",
	"scarab3",
	"thruster",
	"trailersmall2",
	"deathbike",
	"deathbike2",
	"deathbike3",
	"dominator4",
	"dominator5",
	"dominator6",
	"ruiner2",
	"slamvan4",
	"slamvan5",
	"slamvan6",
	"bruiser",
	"bruiser2",
	"bruiser3",
	"caracara",
	"brutus",
	"brutus2",
	"brutus3",
	"dune4",
	"dune5",
	"insurgent",
	"insurgent3",
	"avenger",
	"cargoplane",
	"hydra",
	"jet",
	"lazer",
	"molotok",
	"strikeforce",
	"starling",
	"deluxo",
	"scramjet",
	"alkonost"
}

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			checkCar(GetVehiclePedIsIn(playerPed, false))

			x, y, z = table.unpack(GetEntityCoords(playerPed, true))
			for _, blacklistedCar in pairs(carblacklist) do
				checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
			end
		end
	end
end)

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)

		if isCarBlacklisted(carModel) then
			_DeleteEntity(car)
		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(carblacklist) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end