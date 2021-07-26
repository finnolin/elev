tFloors = {}
tFloors[1] = {"test", 1}


function save(table, name)
    local file = fs.open (name,"w")
    file.write(textutils.serialize (table))
    file.close()
    print(" floors initiated ")
end

save(tFloors, "dbFloors")