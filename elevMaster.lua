os.loadAPI("functions")
functions.load("dbFloors")

if fs.exists("prefs") == true then
    print("found preferences...")
    tFloors = load("prefs")
    print("preferences loaded")
else
    print("no preferences found")
    function type()
        clientType
        repeat
        print("is this a master or a slave?")
        local input = read()

        if "slave" == input then
            print("this is set as slave")
            clientType == "slave"
        elseif "master" == input then
            print("this device is now set as master")
            clientType == "master"
        else
            print("i dont understand...")
        end
    until clientType ~= ""
    end
end



current_floor = 0
current_direction = "down"
blockspeed = 0.4


