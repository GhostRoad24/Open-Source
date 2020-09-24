AddCSLuaFile()

if CLIENT then
    net.Receive("dstaffmessage", function(len)
    local message = net.ReadString()
    chat.AddText(Color(255,255,0,255),"[Delta Force] ",Color(122,210,255,255),message)
    end)
end

properties.Add("staffrepair", {
    MenuLabel = "Repair Vehicle",
    Order = 100,
    Filter = function(self, ent, ply)
        if (!ent:IsVehicle()) then return false end
        if (!ply:IsStaff()) then return false end
        return true
    end,
    Action = function(self,ent)
        net.Start("dstaffrepair")
        net.WriteEntity(ent)
        net.SendToServer()
    end
})

properties.Add("staffdestroy", {
    MenuLabel = "Destroy Vehicle",
    Order = 101,
    Filter = function(self, ent, ply)
        if (!ent:IsVehicle()) then return false end
        if (!ply:IsStaff()) then return false end
        return true
    end,
    Action = function(self,ent)
        net.Start("dstaffdestroy")
        net.WriteEntity(ent)
        net.SendToServer()
    end
})

properties.Add("staffreturn", {
    MenuLabel = "Remove Vehicle",
    Order = 102,
    Filter = function(self, ent, ply)
        if (!ent:IsVehicle()) then return false end
        if (!ply:IsStaff()) then return false end
        return true
    end,
    Action = function(self,ent)
        net.Start("dstaffreturnvehicle")
        net.WriteEntity(ent)
        net.SendToServer()
    end
})

properties.Add("getmodel", {
    MenuLabel = "Get Model Name",
    Order = 103,
    Filter = function(self,ent,ply)
        if (!IsValid(ent)) then return false end
        if (!IsEntity(ent)) then return false end
        return true
    end,
    Action = function(self,ent)
        SetClipboardText(ent:GetModel())
    end
})

properties.Add("adminify", {
    MenuLabel = "Grant GodMode for vehicle",
    Order = 99,
    Filter = function(self,ent,ply)
        if (!ent:IsVehicle()) then return false end
        if (!ply:IsCool()) then return false end
        return true
    end,
    Action = function(self,ent)
        net.Start("dstaffadminify")
        net.WriteEntity(ent)
        net.SendToServer()
    end
})

properties.Add("togglelocks", {
    MenuLabel = "Toggle Locks",
    Order = 98,
    Filter = function(self,ent,ply)
        if (!ply:IsCool()) then return false end
        return true
    end,
    Action = function(self,ent)
        net.Start("dstafftoggle")
        net.WriteEntity(ent)
        net.SendToServer()
    end
})