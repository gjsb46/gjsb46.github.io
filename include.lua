function RawBlock(el)
  local filename = el.text:match("^!include (.+)$")
  if filename then
    local f = io.open(filename, "r")
    if f then
      local content = f:read("*all")
      f:close()
      return pandoc.read(content).blocks
    end
  end
end

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
Replace your current include.lua with this and commit. It now handles the !include syntax whether Pandoc treats it as a paragraph or a raw block.


