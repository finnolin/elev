tFloors = {}


function save(tFloors, savedFloors)
    local file = fs.open ("savedFloors","w")
    file.write(textutils.serialize (tFLoors))
    file.close()
    print(" floors initiated ")
end