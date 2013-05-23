local prefix=os.getenv("TORCH_PREPEND_PATH")
if prefix  and prefix ~= '' then
    print('Prepending ' .. prefix .. ' to package.path')
    package.path = prefix .. ';' .. package.path
end

local cprefix=os.getenv("TORCH_PREPEND_CPATH")
if cprefix  and cprefix ~= '' then
    print('Prepending ' .. cprefix .. ' to package.cpath')
    package.cpath = cprefix .. ';' .. package.cpath
end

