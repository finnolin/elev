local tArgs = { ... }

local action = tArgs[1]

function load(savedFloors)
    local file = fs.open("savedFloors","r")
    local data = file.readAll()
    file.close()
    return textutils.unserialize(data)
end

load(saved_Floors)

if "new" == action then
    print("Floor Name:")
    local newFloor = read()
    print("Floor Level")
    local newFloorLevel = read()

end