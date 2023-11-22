-- boss key
-- hide all window except Finder

a=window.list()

for k,v in pairs(a) do
    if v.name ~= "Finder" then
        print("hide " .. v.name)
        window.hide(v.id)
    end
end