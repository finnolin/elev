
local tArgs = { ... }
 
if (#tArgs ~= 3) then
  print( "USAGE: github get <GITHUB-PATH> <PROGRAM-NAME>" )
  return
end
 
local action = tArgs[1]
local program = tArgs[2]
local github_path = tArgs[3]

github_url = "https://raw.github.com/finnolin/elev/master/"..github_path
tApps = {"github" , "initfloors"} 

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
if "update" = action then
    print( "Updating Apps" )
  
    for i=1, #tApps do
        write(tApps[i])
    end
   
    local request = http.get( github_url )
    local response = request.readAll()
    request.close()
   
    --local file = fs.open( program, "w" )
    --file.write( response )
    --file.close()
  
    return
end

print("done!")