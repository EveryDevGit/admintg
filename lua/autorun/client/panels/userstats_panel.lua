-- userstats_panel.lua
local function CreateUserStatsPanel(parent)
    local UserStats = vgui.Create( "DPanel", parent )
    UserStats:SetSize(ScrW()/3, ScrH()/2)
    UserStats:SetPos( ScrW()/70, ScrH()/20 )

    -- Add user stats content here
    return UserStats
end

return {
    CreateUserStatsPanel = CreateUserStatsPanel,
}