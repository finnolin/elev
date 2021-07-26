os.loadAPI("functions")
functions.load("dbFloors")

if fs.exists("prefs") == true then
    print("found preferences...")
    tFloors = load("prefs")
    print("preferences loaded")
else
    print("no preferences found")
    function type()
        print("is this a master or a slave")
        clientType = read()
        if "slave" == clientType then
            print("this is set as slave")
        elseif "master" == clientType then
            print("this device is now set as master")
        else
            type()
        end
    end
end



current_floor = 0
current_direction = "down"
blockspeed = 0.4


