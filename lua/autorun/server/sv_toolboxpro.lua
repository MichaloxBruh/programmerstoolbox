include("autorun/shared.lua")
print("TEST")  
util.AddNetworkString( "GTB_TabPress" )


hook.Add("PlayerConnect", "GTB_GetPlayerName", function(ply, ip )  
    
end)


hook.Add("KeyPress", "GTB_KeyPressDetection", function(ply, key )
    if ( key ==   IN_SCORE ) then 
        GTB_plyentity = ply 
        GTB_playername = ply:GetName()
        net.Start( "GTB_TabPress" )
            net.WriteString( GTB_playername )
        net.Broadcast() 
    end
end)

net.Receive("GTB_SetHealthAmount", function()
    GTB_playerhealth = net.ReadString()
    print(GTB_playerhealth)
    GTB_plyentity:SetHealth( GTB_playerhealth )
end)