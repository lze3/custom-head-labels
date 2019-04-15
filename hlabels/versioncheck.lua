local curVersion = json.decode(LoadResourceFile(GetCurrentResourceName(), "version.json")).version
Citizen.CreateThread(function()
    PerformHttpRequest("https://raw.githubusercontent.com/JHodgson1/custom-head-labels/master/hlabels/version.json", function(err, response, header)
        local data = json.decode(response)

        if curVersion ~= data.version and tonumber(curVersion) < tonumber(data.version) then
            print("\n##################################")
            print("        ^1Version Mismatch^0              \n")
            print("   " .. GetCurrentResourceName() .. " is ^1outdated^0, please consider updating.")
            print("   Current Version: ^5" .. data.version .. "^0")
            print("   Your Version: ^5" .. curVersion .. "^0\n")
            print("   Change Log:\n^5   " .. table.concat(data.changelog, "\n   ") .. "^0")
            print("\n##################################\n^0")
        elseif tonumber(curVersion) > tonumber(data.version) then
            print("\n##################################")
            print("        ^1Version Mismatch^0              \n")
            print("   " .. GetCurrentResourceName() .. " is currently running a version higher than the latest stable version.\n")
            print("   Please consider downgrading to the latest stable version as the version you are\n   currently running may contain bugs.")
            print("\n##################################")
        else
            print("Congratulations! Your version of " .. GetCurrentResourceName() .. " is correct and up-to-date, you're awesome!")
        end

    end, "GET", "", {version = 'this'})
end)