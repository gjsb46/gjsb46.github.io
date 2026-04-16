function Para(el)
  local text = pandoc.utils.stringify(el)
  local filename = text:match("^!include (.+)$")
  if filename then
    local f = io.open(filename, "r")
    if f then
      local content = f:read("*all")
      f:close()
      return pandoc.read(content).blocks
    end
  end
end
