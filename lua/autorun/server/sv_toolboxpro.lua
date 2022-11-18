include("autorun/shared.lua")
print("TEST")  
util.AddNetworkString( "GTB_TabPress" )


hook.Add("PlayerConnect", "GTB_GetPlayerName", function(ply, ip )  
    
end)


hook.Add("KeyPress", "GTB_KeyPressDetection", function(ply, key )
    if ( key ==   IN_SCORE ) then 
        GTB_PLAYERNAME = ply:GetName()
        net.Start( "GTB_TabPress" )
            net.WriteString( GTB_PLAYERNAME )
        net.Broadcast() 
    end
end)
