local tArgs = { ... }

local action = tArgs[1]

function save(table, name)
    local file = fs.open (name,"w")
    file.write(textutils.serialize (table))
    file.close()
    print(" floors initiated ")
end

function load(name)
    local file = fs.open(name,"r")
    local data = file.readAll()
    file.close()
    return textutils.unserialize(data)
end

if fs.exists("dbFloors") == true then
    tFloors = load("dbFloors")
    print("Floor Data Base found, ... loading...")
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
        for i=1, #tFloors do
            Print(tFloors[i].floorName)
        end    
    else
        print("adding to table...")
        table.insert(tFloors, {floorName = newFloor, floorLevel= newFloorLevel})
        for i=1, #tFloors do
            Print(tFloors[i].floorName)
        end    
    end

    
end