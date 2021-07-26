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