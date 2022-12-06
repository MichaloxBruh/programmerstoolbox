include("autorun/shared.lua")
print("TEST")  
util.AddNetworkString( "GTB_TabPress" )
util.AddNetworkString( "GTB_SetHealthAmount")
util.AddNetworkString( "GTB_SetArmorAmount" )
util.AddNetworkString( "GTB_UnlimitedButton")




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

net.Receive("GTB_SetArmorAmount", function()
    GTB_playerarmor = net.ReadString()
    print(GTB_playerarmor)
    GTB_plyentity:SetArmor( GTB_playerhealth )
end)

net.Receive( "GTB_UnlimitedButton", function()
    GTB_plyentity:SetHealth(99999999999)
end)