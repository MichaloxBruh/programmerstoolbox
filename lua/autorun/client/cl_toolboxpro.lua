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
        draw.RoundedBox( 0, 0, 0, w, h, Color( 17, 72, 94, 150)  ) 
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
    
    local cButton = vgui.Create("DButton", Frame)
    cButton:SetText( "Player Settings" )
    cButton:SetTextColor( Color(255,255,255) )
    --hButton:SetTextSize()
    cButton:SetPos( 60, 250 )
    cButton:SetSize( 200, 60 )
    cButton.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, Color(  34, 128, 192, 250) ) -- Draw a blue button
    end
    cButton.DoClick = function()
        GTB_playerpanel() 
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
        draw.RoundedBox( 0, 0, 0, w, h, Color( 72, 151, 95, 150)  ) 
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
        draw.RoundedBox( 0, 0, 0, w, h, Color(  27, 82, 43, 150) ) 
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
            draw.RoundedBox( 0, 0, 0, w, h, Color( 42, 114, 156, 150)  ) 
        end
        
        local farmordwang = vgui.Create( "DNumSlider", farmor )
        farmordwang:SetPos( -102, 20 )				
        farmordwang:SetSize( 300, 100 )				
        farmordwang:SetMin( 0 )				 	
        farmordwang:SetMax( 500 )				
        farmordwang:SetDecimals( 0 )
        farmordwang.OnValueChanged = function( self, value2 )  
            net.Start("GTB_SetArmorAmount")
                net.WriteString( value2 )
            net.SendToServer() 
           
        end
    
        local CNameLabel = vgui.Create("DLabel", farmor)
        CNameLabel:SetText("Change Your Armor")
        CNameLabel:SetTextColor( Color(255, 255, 255, 250) )
        CNameLabel:SetPos(40, 50)
        CNameLabel:SetSize("100, 100")
        CNameLabel:SetFont( "DermaDefault" )
        CNameLabel:SizeToContents()
    
    
    
    end 




end

function GTB_playerpanel() 
    local playerst = vgui.Create( "DFrame" )
    playerst:SetPos( 500, 550 ) 
    playerst:SetSize( 608  , 294 ) 
    playerst:SetTitle( "Gmod Toolbox Health Change" ) 
    playerst:SetVisible( true ) 
    playerst:SetDraggable( true ) 
    playerst:ShowCloseButton( true ) 
    playerst:MakePopup()
    playerst:MakePopup()
    playerst.Paint = function( self, w, h ) 
        draw.RoundedBox( 0, 0, 0, w, h, Color( 3, 15, 17, 150)  ) 
    end

    local phealthdwang = vgui.Create( "DNumSlider", playerst )
    phealthdwang:SetPos( -102, 20 )				
    phealthdwang:SetSize( 300, 100 )				
    phealthdwang:SetMin( 6 )				 	
    phealthdwang:SetMax( 10000 )				
    phealthdwang:SetDecimals( 0 )
    phealthdwang.OnValueChanged = function( self, value )  
        net.Start("GTB_WalkSpeed")
            net.WriteString( value )
        net.SendToServer() 
       
    end

    local PENameLabel = vgui.Create("DLabel", playerst)
    PENameLabel:SetText("Change Your Walk Speed")
    PENameLabel:SetTextColor( Color(255, 255, 255, 250) )
    PENameLabel:SetPos(29, 50)
    PENameLabel:SetSize("100, 100")
    PENameLabel:SetFont( "DermaDefault" )
    PENameLabel:SizeToContents()
    
    
    local ehealthdwang = vgui.Create( "DNumSlider", playerst )
    ehealthdwang:SetPos( -102, 70 )				
    ehealthdwang:SetSize( 300, 100 )				
    ehealthdwang:SetMin( 6 )				 	
    ehealthdwang:SetMax( 10000 )				
    ehealthdwang:SetDecimals( 0 )
    ehealthdwang.OnValueChanged = function( self, value )  
        net.Start("GTB_RunSpeed")
            net.WriteString( value )
        net.SendToServer() 
       
    end

    local PANameLabel = vgui.Create("DLabel", playerst)
    PANameLabel:SetText("Change Your Run Speed")
    PANameLabel:SetTextColor( Color(255, 255, 255, 250) )
    PANameLabel:SetPos(29, 100)
    PANameLabel:SetSize("100, 100")
    PANameLabel:SetFont( "DermaDefault" )
    PANameLabel:SizeToContents()
    
    local resetset = vgui.Create("DButton", playerst)
    resetset:SetText("Reset To Default Settings")
    resetset:SetSize( 150, 30 )
    resetset:SetPos( 22, 160)
    resetset:SetTextColor( Color(255,255,255) )
    resetset.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, Color(  27, 82, 43, 150) ) 
    end
    resetset.DoClick = function()
        net.Start("GTB_ResetButtonPlayer")
        net.SendToServer()
    end






end 
