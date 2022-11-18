include("autorun/shared.lua")   


net.Receive("GTB_TabPress", function()
    local GTB_PLAYERNAME_CL = net.ReadString()
    local Frame = vgui.Create( "DFrame" )
    Frame:SetPos( 400, 300 ) 
    Frame:SetSize( 858  , 715 ) 
    Frame:SetTitle( "Gmod Toolbox" ) 
    Frame:SetVisible( true ) 
    Frame:SetDraggable( true ) 
    Frame:ShowCloseButton( true ) 
    Frame:MakePopup()
    Frame:MakePopup()
    Frame.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
        draw.RoundedBox( 0, 0, 0, w, h, Color( 71, 68, 67, 150)  ) 
    end
    local Button = vgui.Create("DButton", Frame)
    Button:SetText( "Health Settings" )
    Button:SetTextColor( Color(255,255,255) )
    --Button:SetTextSize()
    Button:SetPos( 60, 70 )
    Button:SetSize( 200, 60 )
    Button.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, Color(  34, 128, 192, 250) ) -- Draw a blue button
    end
    Button.DoClick = function()
        
    end
    local NameLabel = vgui.Create("DLabel", Frame)
    NameLabel:SetText(" Hello " .. GTB_PLAYERNAME_CL .. "!")
    NameLabel:SetTextColor( Color(0, 153, 255, 250) )
    NameLabel:SetPos(60,20)
    NameLabel:SetSize("100, 100")
    NameLabel:SetFont( "DermaLarge" )
    NameLabel:SizeToContents()
    

end)



function GTB_HEALTHPANEL() 
    local fhealth = vgui.Create( "DFrame" )
    fhealth:SetPos( 400, 300 ) 
    fhealth:SetSize( 858  , 715 ) 
    fhealth:SetTitle( "Gmod Toolbox" ) 
    fhealth:SetVisible( true ) 
    fhealth:SetDraggable( true ) 
    fhealth:ShowCloseButton( true ) 
    fhealth:MakePopup()
    fhealth:MakePopup()
    fhealth.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
        draw.RoundedBox( 0, 0, 0, w, h, Color( 71, 68, 67, 150)  ) 
end