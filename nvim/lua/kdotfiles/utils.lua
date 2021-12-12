local M = require('dotfiles.autoload')('kdotfiles.utils')

function M.file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function M.lines_from(file)
  if not M.file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

function M.get_os(lines)
  os_name = "Unknown"
  for k,v in pairs(lines) do
    if string.match(v, "^ID=") then
      os_name = string.sub(v, 4)
    end
  end
  return os_name
end

return M
