include("autorun/shared.lua")
print("TEST")  

util.AddNetworkString( "GTB_TabPress" )
util.AddNetworkString( "GTB_SetHealthAmount")
util.AddNetworkString( "GTB_SetArmorAmount" )
util.AddNetworkString( "GTB_UnlimitedButton")
util.AddNetworkString( "GTB_WalkSpeed")
util.AddNetworkString( "GTB_RunSpeed")
util.AddNetworkString( "GTB_ResetButtonPlayer")

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
    GTB_plyentity:SetArmor( GTB_playerarmor )
end)

net.Receive( "GTB_UnlimitedButton", function()
    GTB_plyentity:SetHealth(99999999999)
end)

net.Receive( "GTB_WalkSpeed", function()
    GTB_walkspeed = net.ReadString()
    GTB_plyentity:SetWalkSpeed(GTB_walkspeed)
end)

net.Receive( "GTB_RunSpeed", function()
    GTB_runspeed = net.ReadString()
    GTB_plyentity:SetRunSpeed(GTB_runspeed)
end)

net.Receive( "GTB_ResetButtonPlayer", function()
    GTB_plyentity:SetWalkSpeed(400)
    GTB_plyentity:SetRunSpeed(600)
end)