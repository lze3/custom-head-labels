local curVersion = json.decode(LoadResourceFile(GetCurrentResourceName(), "version.json")).version
Citizen.CreateThread(function()
    PerformHttpRequest("https://raw.githubusercontent.com/JHodgson1/custom-head-labels/master/hlabels/version.json", function(err, response, header)
        local data = json.decode(response)

        if curVersion ~= data.version and tonumber(curVersion) < tonumber(data.version) then
            print("\n^1##################################")
            print(GetCurrentResourceName() .. " is outdated, please consider updating.")
            print("Current Version: " .. data.version)
            print("Your Version: " .. curVersion)
            print("Update Change Log:\n^5" .. data.changelog)
            print("\n^1##################################\n^0")
        elseif tonumber(curVersion) > tonumber(data.version) then
            print("Your version of " .. GetCurrentResourceName() .. " appears to be higher than the latest stable version, consider downgrading to the latest " .. data.version .. " you may be on an unstable version!")
        else
            print("Congratulations! Your version of " .. GetCurrentResourceName() .. " is correct and up-to-date, you're awesome!")
        end

    end, "GET", "", {version = 'this'})
end)