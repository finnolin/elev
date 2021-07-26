
local tArgs = { ... }
 
local action = tArgs[1]
local program = tArgs[2]
local github_path = tArgs[3]

local github_url = "https://raw.github.com/finnolin/elev/master/"
local tApps = {"github" , "initfloors"}

-- get
if "get" == action then

    if fs.exists( program ) then
        print( "File "..program.." already exists" )
        return
    end

    local request = http.get( github_url )
    local response = request.readAll()
    request.close()
 
    local file = fs.open( program, "w" )
    file.write( response )
    file.close()
    return
end

--update
if "update" == action then
    print( "Updating Apps" )
  
    for i=1, #tApps do
        print("Updating "..tApps[i].."...")
        local appUrl = github_url..tApps[i]..".lua"
        print("path: "..appUrl)

        local request = http.get( appUrl )
        local response = request.readAll()
        request.close()

        local file = fs.open( tApps[i], "w" )
        file.write( response )
        file.close()

    end
   

   
    --local file = fs.open( program, "w" )
    --file.write( response )
    --file.close()
  
    return
end

print("done!")