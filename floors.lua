function load(savedFloors)
    local file = fs.open("savedFloors","r")
    local data = file.readAll()
    file.close()
    return textutils.unserialize(data)
end

print("")