-- CONFIG
local UseWorkshopDLL = false

-- DON't TOUCH
if not SERVER then return end
if UseWorkshopDLL then
    resource.AddWorkshop("")
else
    resource.AddFile("materials/everyadmin/icon_user.png")
end

print("CONFIG INITIALIZED")