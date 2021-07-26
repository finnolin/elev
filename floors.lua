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
    return textutils.unserialize(data)
    print("file loaded")
end

function listFloors(table)
    print("Current Floor List:")
    for i=1, #table do
        print(i.. "- " ..table[i].floorName.. " Level: ".. table[i].floorLevel)
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
    
end