-- cl_init.lua
local UserStatsPanel = include("panels/userstats_panel.lua")

local function ShowMenu(ply)
    local Frame = vgui.Create( "DFrame" )
    Frame:SetSize(ScrW()/2, ScrH()/1.5)
    Frame:SetTitle("")
    Frame:SetVisible(true)
    Frame:SetDraggable(false)
    Frame:ShowCloseButton(false)
    Frame:MakePopup()
    Frame:Center()

    Frame.Paint = function(self, w, h)
        -- BG
        draw.RoundedBox(0, 0, 0, w, h, Color( 10,10,10 ))

        -- LeftPanel
        draw.SimpleText( "D", "Font", w/57, 15, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        draw.RoundedBox(15, w/67, h/13, w/27, 3, Color(255,255,255,100) )
    end

    local CustomPanel = vgui.Create( "DPanel", Frame )
    CustomPanel:SetSize(ScrW()/2, ScrH()/1.5)
    CustomPanel:SetPos(0, 0)

    Frame:AddItem(CustomPanel)

    -- Buttons
    local UserStatsButton = vgui.Create( "DImageButton", CustomPanel )
    UserStatsButton:SetPos( ScrW()/100, ScrH()/13 )
    UserStatsButton:SetSize( ScrW()/5, ScrH()/5 )
    UserStatsButton:SetImage( "materials/everyadmin/icon_user.png" )
    UserStatsButton:SizeToContents()
    UserStatsButton.DoClick = function()
        if Frame.UserStatsPanel then
            Frame.UserStatsPanel:Remove()
        end

        Frame.UserStatsPanel = UserStatsPanel.CreateUserStatsPanel(CustomPanel)
        Frame:AddItem(Frame.UserStatsPanel)
    end

    -- Create and add UserStats (RightPanel)
    Frame.UserStatsPanel = UserStatsPanel.CreateUserStatsPanel(CustomPanel)
    CustomPanel:AddItem(Frame.UserStatsPanel)
end

-- callbacks
concommand.Add("eadmin", ShowMenu)
concommand.Add("everyadmin", ShowMenu)
concommand.Add("everya", ShowMenu)