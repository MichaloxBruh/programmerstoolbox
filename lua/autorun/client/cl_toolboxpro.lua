include("autorun/shared.lua")   
GTB_playerhealth = ""
GTB_armorhealth = ""


net.Receive("GTB_TabPress", function()
    local GTB_playername_cl = net.ReadString()
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
    local hButton = vgui.Create("DButton", Frame)
    hButton:SetText( "Health Settings" )
    hButton:SetTextColor( Color(255,255,255) )
    --hButton:SetTextSize()
    hButton:SetPos( 60, 90 )
    hButton:SetSize( 200, 60 )
    hButton.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, Color(  34, 128, 192, 250) ) -- Draw a blue button
    end
    hButton.DoClick = function()
        GTB_healthpanel() 
    end
    
    local aButton = vgui.Create("DButton", Frame)
    aButton:SetText( "Armor Settings" )
    aButton:SetTextColor( Color(255,255,255) )
    --aButton:SetTextSize()
    aButton:SetPos( 60, 170 )
    aButton:SetSize( 200, 60 )
    aButton.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, Color(  34, 128, 192, 250) ) -- Draw a blue button
    end
    aButton.DoClick = function()
        GTB_armorpanel() 
    end
    
    local NameLabel = vgui.Create("DLabel", Frame)
    NameLabel:SetText(" Hello " .. GTB_playername_cl .. "!")
    NameLabel:SetTextColor( Color(0, 153, 255, 250) )
    NameLabel:SetPos(60,30)
    NameLabel:SetSize("100, 100")
    NameLabel:SetFont( "DermaLarge" )
    NameLabel:SizeToContents()
    

end)



function GTB_healthpanel() 
    
    local fhealth = vgui.Create( "DFrame" )
    fhealth:SetPos( 500, 550 ) 
    fhealth:SetSize( 608  , 294 ) 
    fhealth:SetTitle( "Gmod Toolbox Health Change" ) 
    fhealth:SetVisible( true ) 
    fhealth:SetDraggable( true ) 
    fhealth:ShowCloseButton( true ) 
    fhealth:MakePopup()
    fhealth:MakePopup()
    fhealth.Paint = function( self, w, h ) 
        draw.RoundedBox( 0, 0, 0, w, h, Color( 71, 138, 90, 150)  ) 
    end
    
    local DNameLabel = vgui.Create("DLabel", fhealth)
    DNameLabel:SetText("Change Your Health")
    DNameLabel:SetTextColor( Color(255, 255, 255, 250) )
    DNameLabel:SetPos(40, 50)
    DNameLabel:SetSize("100, 100")
    DNameLabel:SetFont( "DermaDefault" )
    DNameLabel:SizeToContents()
    
    
    local fhealthdwang = vgui.Create( "DNumSlider", fhealth )
    fhealthdwang:SetPos( -102, 20 )				
    fhealthdwang:SetSize( 300, 100 )				
    fhealthdwang:SetMin( 0 )				 	
    fhealthdwang:SetMax( 1000 )				
    fhealthdwang:SetDecimals( 0 )
    fhealthdwang.OnValueChanged = function( self, value )  
        net.Start("GTB_SetHealthAmount")
            net.WriteString( value )
        net.SendToServer() 
       
    end

    local unlimitedhpButton = vgui.Create("DButton", fhealth)
    unlimitedhpButton:SetText("Unlimited Health")
    unlimitedhpButton:SetSize( 150, 30 )
    unlimitedhpButton:SetPos( 22, 100)
    unlimitedhpButton:SetTextColor( Color(255,255,255) )
    unlimitedhpButton.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, Color(  34, 128, 192, 250) ) 
    end
    unlimitedhpButton.DoClick = function()
        net.Start("GTB_UnlimitedButton")
        net.SendToServer()
    end
    
    
    
    
    
    function GTB_armorpanel() 
        local farmor = vgui.Create( "DFrame" )
        farmor:SetPos( 500, 590 ) 
        farmor:SetSize( 608  , 294 ) 
        farmor:SetTitle( "Gmod Toolbox Armor Settings" ) 
        farmor:SetVisible( true ) 
        farmor:SetDraggable( true ) 
        farmor:ShowCloseButton( true ) 
        farmor:MakePopup()
        farmor.Paint = function( self, w, h ) 
            draw.RoundedBox( 0, 0, 0, w, h, Color( 32, 19, 98, 150)  ) 
        end
        
        local farmordwang = vgui.Create( "DNumSlider", farmor )
        farmordwang:SetPos( 50, 50 )				
        farmordwang:SetSize( 300, 100 )			
        farmordwang:SetText( "Set Your Armor" )	
        farmordwang:SetMin( 0 )				 	
        farmordwang:SetMax( 200 )				
        farmordwang:SetDecimals( 0 )
        farmordwang.OnValueChanged = function( self, value )  
            net.Start("GTB_SetArmorAmount")
                net.WriteString( value )
            net.SendToServer() 
           
        end
    end 




end


