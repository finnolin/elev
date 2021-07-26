elevFloors = {}


function save(elevFloors, "savedFloors")
    local file = fs.open ("savedFloors","w")
    file.write(textutils.serialize (elevFloors))
    file.close()
end

print(" floors initiated ")