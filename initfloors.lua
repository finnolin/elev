elevFloors = {"Storage"}

print(elevFloors[1])

function save(elevFloors, elevFloors)
    local file = fs.open (elevFloors,"w")
    file.write(textutils.serialize (elevFloors))
    file.close()
end
