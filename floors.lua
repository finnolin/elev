local tArgs = { ... }

local action = tArgs[1]

function save(table, name)
    local file = fs.open (name,"w")
    file.write(textutils.serialize (table))
    file.close()
    print("file saved")
end

function load(name)
    local file = fs.open(name,"r")
    local data = file.readAll()
    file.close()
    print("file loaded")
    return textutils.unserialize(data)
end

function listFloors(table)
    print("---Floor List---")
    for i=1, #table do
        print(i.. " // " ..table[i].floorName.. " // Level: ".. table[i].floorLevel)
    end 
end


if fs.exists("dbFloors") == true then
    tFloors = load("dbFloors")
    print("Floor Data Base found")
end

if "new" == action then
    print("Floor Name:")
    local newFloor = read()
    print("Floor Level")
    local newFloorLevel = read()

    if tFloors == nil then
        print("table is empty, creating table...")
        tFloors = {}
        table.insert(tFloors, {floorName = newFloor, floorLevel= newFloorLevel})
    else
        print("adding to table...")
        table.insert(tFloors, {floorName = newFloor, floorLevel= newFloorLevel})
    end

    listFloors(tFloors)
    save(tFloors, "dbFloors")
    
    return
end

if "list" == action then
    listFloors(tFloors)
    return
end

if "remove" == action then
    print("Which floor should be removed?")
    local removedFloor = read()
    print("removing floor: "..tFloors[removedFloor].floorName)
    table.remove(tFloors, removedFloor)
    save(tFloors, "dbFloors")
    return
end
