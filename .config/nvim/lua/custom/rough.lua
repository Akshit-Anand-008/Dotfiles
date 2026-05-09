str = "r"
local i1 = string.sub(str, 1, 1)
local len = string.len(str)
local path
if i1 == "r" then
    len = len - 1
    path = "%:p:h"
    for _ = 1, len do
        path = path .. ":h"
    end
    path = vim.fn.expand(path)
elseif i1 == "." then
    len = len
    path = vim.fn.getcwd()
    for _ = 1, len do
        path = path .. "/.."
    end
end
vim.print(path)
