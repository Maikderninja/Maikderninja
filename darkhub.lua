  function Message(text)
    if not text then return false end
    x = game:GetService("Players").LocalPlayer.PlayerGui.Menew.Main.LAZYBUTTON
    x.Visible = true
    x.Text = "\240\159\147\162 "..text
end
Message("‎D‎a‎‎rk H‎‎u‎b Ars‎enal 1.6.3")


Client = {
    Modules = {
        ClientEnvoirment,
        ClientMain,
        CreateProj,
        CretTrail,
        ModsShit
    },
    Toggles = {
        Walkspeed = false,
        JumpPower = false,
        BHop = false,
        InstantRespawn = false,
        AntiAim = false,
        AutoAmmo = false,
        AutoHealth = false,
        Godmode = false,
        CrazyArrows = false,
        FFA = false,
        Baseball = false,
        Snow = false,
        Trac = false,
        Sight = false,
        FOV = false,
        GreenSmoke = false,
        Visiblecheck = false,
        SilentAim = false,
        FireRate = false,
        Bombs = false
    },
    Values = {
        JumpPower = 50,
        LookMeth = 'Look Up',
        FOV = 150,
        ChatMsg = 'DarkHub Winning',
        AimPart = 'Head'
    }
}

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Mikehales7/Darkhub-UI-Library/main/.lua"))()
main = lib:Window()
CombatW = main:Tab('Combat')
PlayerW = main:Tab('LocalPlayer')
ServerW = main:Tab('Trolling')
VisualsW = main:Tab('Visuals')
FarmingW = main:Tab('Farming')
MiscW = main:Tab('Misc')

--GC
for i,v in pairs(getgc(true)) do
    if type(v) == 'table' and rawget(v,'updateInventory') and rawget(v,'firebullet') then
        Client.Modules.ClientEnvoirment = getfenv(v.firebullet)
        Client.Modules.ClientMain = v.firebullet
        Client.Modules.ModsShit = v.updateInventory
    end
    if type(v) == 'table' and rawget(v,'CreateProjectile') then
        Client.Modules.CreateProj = v.CreateProjectile
    end
    if type(v) == 'table' and rawget(v,'createtrail') then
        Client.Modules.CretTrail = v.createtrail
    end
end

--Framework
function KillAll()
    local Gun = game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value);
    local Crit = math.random() > .6 and true or false;
    for i,v in pairs(game.Players:GetPlayers()) do
        if v and v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
            for i =1,10 do
                local Distance = (game.Players.LocalPlayer.Character.Head.Position - v.Character.Head.Position).magnitude 
                game.ReplicatedStorage.Events.HitPart:FireServer(v.Character.Head, -- Hit Part
                v.Character.Head.Position + Vector3.new(math.random(), math.random(), math.random()), -- Hit Position
                Gun.Name, 
                Crit and 2 or 1, 
                Distance,
                Backstab, 
                Crit, 
                false, 
                1, 
                false, 
                Gun.FireRate.Value,
                Gun.ReloadTime.Value,
                Gun.Ammo.Value,
                Gun.StoredAmmo.Value,
                Gun.Bullets.Value,
                Gun.EquipTime.Value,
                Gun.RecoilControl.Value,
                Gun.Auto.Value,
                Gun['Speed%'].Value,
                game.ReplicatedStorage.wkspc.DistributedTime.Value);
            end 
        end
    end
end
local CurrentCamera = workspace.CurrentCamera
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
function ClosestPlayer()
    local MaxDist, Closest = math.huge
    for i,v in pairs(Players.GetPlayers(Players)) do
        if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team and v.Character then
            local Head = v.Character.FindFirstChild(v.Character, "Head")
            if Head then 
                local Pos, Vis = CurrentCamera.WorldToScreenPoint(CurrentCamera, Head.Position)
                if Vis then
                    local MousePos, TheirPos = Vector2.new(Mouse.X, Mouse.Y), Vector2.new(Pos.X, Pos.Y)
                    local Dist = (TheirPos - MousePos).Magnitude
                    if Dist < MaxDist and Dist <= Client.Values.FOV then
                        MaxDist = Dist
                        Closest = v
                    end
                end
            end
        end
    end
    return Closest
end

function GetAimPart()
    if Client.Values.AimPart == 'Head' then
        return 'Head'
    end
    if Client.Values.AimPart == 'LowerTorso' then
        return 'LowerTorso'
    end
    if Client.Values.AimPart == 'Random' then
        if math.random(1,4) == 1 then
            return 'Head'
        else
            return 'LowerTorso'
        end
    end
end

local mt = getrawmetatable(game)
local namecallold = mt.__namecall
local index = mt.__index
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local Args = {...}
    NamecallMethod = getnamecallmethod()
    if tostring(NamecallMethod) == "FindPartOnRayWithIgnoreList" and Client.Toggles.WallBang then
        table.insert(Args[2], workspace.Map)
    end
    if NamecallMethod == "FindPartOnRayWithIgnoreList" and not checkcaller() and Client.Toggles.SilentAim then
        local CP = ClosestPlayer()
        if CP and CP.Character and CP.Character.FindFirstChild(CP.Character, GetAimPart()) then
            Args[1] = Ray.new(CurrentCamera.CFrame.Position, (CP.Character[GetAimPart()].Position - CurrentCamera.CFrame.Position).Unit * 1000)
            return namecallold(self, unpack(Args))
        end
    end
    if tostring(NamecallMethod) == "FireServer" and tostring(self) == "ControlTurn" then
        if Client.Toggles.AntiAim == true then
            if Client.Values.LookMeth == "Look Up" then
                Args[1] = 1.3962564026167
            end
            if Client.Values.LookMeth == "Look Down" then
                Args[1] = -1.5962564026167
            end
            if Client.Values.LookMeth == "Torso In Legs" then
                Args[1] = -6.1;
            end
            return namecallold(self, unpack(Args))
        end
    end
    return namecallold(self, ...)
end)
setreadonly(mt, true)
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.NumSides = 460
FOVCircle.Filled = false
FOVCircle.Transparency = 0.6
FOVCircle.Radius = Client.Values.FOV
FOVCircle.Color = Color3.new(0,255,0)
game:GetService("RunService").Stepped:Connect(function()
    if Client.Toggles.FireRate == true then
        Client.Modules.ClientEnvoirment.DISABLED = false
        Client.Modules.ClientEnvoirment.DISABLED2 = false
    end
    if Client.Toggles.NoRecoil == true then
        Client.Modules.ClientEnvoirment.recoil = 0
    end
    if Client.Toggles.NoSpread == true then
        Client.Modules.ClientEnvoirment.currentspread = 0
        Client.Modules.ClientEnvoirment.spreadmodifier = 0
    end
    if Client.Toggles.AlwaysAuto == true then
        Client.Modules.ClientEnvoirment.mode = 'automatic'
    end
    if Client.Toggles.InfAmmo == true then
        debug.setupvalue(Client.Modules.ModsShit, 3, 70)
    end
    FOVCircle.Radius = Client.Values.FOV
    if Client.Toggles.FOV == true then
        FOVCircle.Visible = true
    else
        FOVCircle.Visible = false
    end
    FOVCircle.Position = game:GetService('UserInputService'):GetMouseLocation()
end)
spawn(function()
    while true do wait()
        if Client.Toggles.KillAura then
            for i,v in pairs(game.Players:GetPlayers()) do
                if v and v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then    
                    local Distance = (game.Players.LocalPlayer.Character.PrimaryPart.Position - v.Character.PrimaryPart.Position).magnitude 
                    if Distance <= 12 then
                        game:GetService("ReplicatedStorage").Events.FallDamage:FireServer(1000, v.Character:FindFirstChild("Hitbox"))
                    end
                end
            end
        end
    end
end)
game:GetService("RunService").Stepped:Connect(function()
    if Client.Toggles.CrazyArrows == true then
        if Client.Toggles.FFA == false then
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Team ~= game.Players.LocalPlayer.Team and v ~= game.Players.LocalPlayer then
                    YesTable = {
                        [1] = game:GetService("Workspace").Map.Clips,
                        [2] = game:GetService("Workspace").Debris,
                        [3] = game.Players.LocalPlayer.Character,
                        [4] = game:GetService("Workspace")["Ray_Ignore"],
                        [5] = game:GetService("Workspace").Map.Spawns,
                        [6] = game:GetService("Workspace").Map.Ignore
                    }
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if v.Character then
                            YesTable[6 + i] = v
                        end
                    end
                    local v1 = {
                        [1] = "Arrow",
                        [2] = 800,
                        [3] = v.Character.Head.Position,
                        [4] = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame,
                        [5] = 100,
                        [6] = 0,
                        [7] = 0,
                        [8] = 0,
                        [9] = "Crossbow",
                        [10] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position,
                        [11] = false,
                        [13] = YesTable,
                        [15] = false,
                        [16] = 142.0182788372
                    }
                    local rem = game:GetService("ReplicatedStorage").Events.ReplicateProjectile
                    rem:FireServer(v1)
                    Client.Modules.CreateProj(game.Players.LocalPlayer.Name, unpack(v1))
                end
            end
        else
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    YesTable = {
                        [1] = game:GetService("Workspace").Map.Clips,
                        [2] = game:GetService("Workspace").Debris,
                        [3] = game.Players.LocalPlayer.Character,
                        [4] = game:GetService("Workspace")["Ray_Ignore"],
                        [5] = game:GetService("Workspace").Map.Spawns,
                        [6] = game:GetService("Workspace").Map.Ignore
                    }
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if v.Character then
                            YesTable[6 + i] = v
                        end
                    end
                    local v1 = {
                        [1] = "Arrow",
                        [2] = 800,
                        [3] = v.Character.Head.Position,
                        [4] = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame,
                        [5] = 100,
                        [6] = 0,
                        [7] = 0,
                        [8] = 0,
                        [9] = "Crossbow",
                        [10] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position,
                        [11] = false,
                        [13] = YesTable,
                        [15] = false,
                        [16] = 142.0182788372
                    }
                    local rem = game:GetService("ReplicatedStorage").Events.ReplicateProjectile
                    rem:FireServer(v1)
                    Client.Modules.CreateProj(game.Players.LocalPlayer.Name, unpack(v1))
                end
            end
        end
    end
end)

spawn(function()
    while true do
        wait(0.1)
        pcall(function()
            if Client.Toggles.Baseball then
                for i, v in pairs(game.Players:GetPlayers()) do
                    YesTable = {
                        [1] = game:GetService("Workspace").Map.Clips,
                        [2] = game:GetService("Workspace").Debris,
                        [3] = game.Players.LocalPlayer.Character,
                        [4] = game:GetService("Workspace")["Ray_Ignore"],
                        [5] = game:GetService("Workspace").Map.Spawns,
                        [6] = game:GetService("Workspace").Map.Ignore
                    }
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if v.Character then
                            YesTable[6 + i] = v
                        end
                    end
                    local v1 = {
                        [1] = "Baseball",
                        [2] = 173,
                        [3] = v.Character.Head.Position,
                        [4] = v.Character.HumanoidRootPart.CFrame + Vector3.new(-10, math.random(0, 15), 0),
                        [5] = 100,
                        [6] = 0,
                        [7] = 0,
                        [8] = 0,
                        [9] = "Baseball Launcher",
                        [10] = v.Character.HumanoidRootPart.Position,
                        [11] = false,
                        [13] = YesTable,
                        [15] = false,
                        [16] = 142.0182788372
                    }
                    local rem = game:GetService("ReplicatedStorage").Events.ReplicateProjectile
                
                    rem:FireServer(v1)
                    Client.Modules.CreateProj(v.Name, unpack(v1))
                end       
                for i, v in pairs(game.Players:GetPlayers()) do
                    YesTable = {
                        [1] = game:GetService("Workspace").Map.Clips,
                        [2] = game:GetService("Workspace").Debris,
                        [3] = game.Players.LocalPlayer.Character,
                        [4] = game:GetService("Workspace")["Ray_Ignore"],
                        [5] = game:GetService("Workspace").Map.Spawns,
                        [6] = game:GetService("Workspace").Map.Ignore
                    }
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if v.Character then
                            YesTable[6 + i] = v
                        end
                    end
                    local v1 = {
                        [1] = "Baseball",
                        [2] = 173,
                        [3] = v.Character.Head.Position,
                        [4] = v.Character.HumanoidRootPart.CFrame + Vector3.new(-10, math.random(0, 15), 0),
                        [5] = 100,
                        [6] = 0,
                        [7] = 0,
                        [8] = 0,
                        [9] = "Baseball Launcher",
                        [10] = v.Character.HumanoidRootPart.Position,
                        [11] = false,
                        [13] = YesTable,
                        [15] = false,
                        [16] = 142.0182788372
                    }
                    local rem = game:GetService("ReplicatedStorage").Events.ReplicateProjectile
                
                    rem:FireServer(v1)
                    Client.Modules.CreateProj(v.Name, unpack(v1))
                end       
            end 
        end)
    end
end)
spawn(function()
    while true do
        wait(0)
        pcall(function()
            if Client.Toggles.Snow then
                for i, v in pairs(game.Players:GetPlayers()) do
                    YesTable = {
                        [1] = game:GetService("Workspace").Map.Clips,
                        [2] = game:GetService("Workspace").Debris,
                        [3] = game.Players.LocalPlayer.Character,
                        [4] = game:GetService("Workspace")["Ray_Ignore"],
                        [5] = game:GetService("Workspace").Map.Spawns,
                        [6] = game:GetService("Workspace").Map.Ignore
                    }
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if v.Character then
                            YesTable[6 + i] = v
                        end
                    end
                    local v1 = {
                        [1] = "Baseball",
                        [2] = 173,
                        [3] = v.Character.Head.Position,
                        [4] = v.Character.HumanoidRootPart.CFrame + Vector3.new(-10, math.random(0, 15), 0),
                        [5] = 100,
                        [6] = 0,
                        [7] = 0,
                        [8] = 0,
                        [9] = "Snowball",
                        [10] = v.Character.HumanoidRootPart.Position,
                        [11] = false,
                        [13] = YesTable,
                        [15] = false,
                        [16] = 142.0182788372
                    }
                    local rem = game:GetService("ReplicatedStorage").Events.ReplicateProjectile
                
                    rem:FireServer(v1)
                    Client.Modules.CreateProj(v.Name, unpack(v1))
                    YesTable = {
                        [1] = game:GetService("Workspace").Map.Clips,
                        [2] = game:GetService("Workspace").Debris,
                        [3] = game.Players.LocalPlayer.Character,
                        [4] = game:GetService("Workspace")["Ray_Ignore"],
                        [5] = game:GetService("Workspace").Map.Spawns,
                        [6] = game:GetService("Workspace").Map.Ignore
                    }
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if v.Character then
                            YesTable[6 + i] = v
                        end
                    end
                    local v1 = {
                        [1] = "Baseball",
                        [2] = 173,
                        [3] = v.Character.Head.Position,
                        [4] = v.Character.HumanoidRootPart.CFrame + Vector3.new(-10, math.random(0, 15), 0),
                        [5] = 100,
                        [6] = 0,
                        [7] = 0,
                        [8] = 0,
                        [9] = "Snowball",
                        [10] = v.Character.HumanoidRootPart.Position,
                        [11] = false,
                        [13] = YesTable,
                        [15] = false,
                        [16] = 142.0182788372
                    }
                    local rem = game:GetService("ReplicatedStorage").Events.ReplicateProjectile
                
                    rem:FireServer(v1)
                    Client.Modules.CreateProj(v.Name, unpack(v1))
                end       
            end
            if Client.Toggles.Bombs then
                for i, v in pairs(game.Players:GetPlayers()) do
                    YesTable = {
                        [1] = game:GetService("Workspace").Map.Clips,
                        [2] = game:GetService("Workspace").Debris,
                        [3] = game.Players.LocalPlayer.Character,
                        [4] = game:GetService("Workspace")["Ray_Ignore"],
                        [5] = game:GetService("Workspace").Map.Spawns,
                        [6] = game:GetService("Workspace").Map.Ignore
                    }
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if v.Character then
                            YesTable[6 + i] = v
                        end
                    end
                    local v1 = {
                        [1] = "Baseball",
                        [2] = 173,
                        [3] = v.Character.Head.Position,
                        [4] = v.Character.HumanoidRootPart.CFrame + Vector3.new(-10, math.random(0, 15), 0),
                        [5] = 100,
                        [6] = 0,
                        [7] = 0,
                        [8] = 0,
                        [9] = "Flaming Pumpkin",
                        [10] = v.Character.HumanoidRootPart.Position,
                        [11] = false,
                        [13] = YesTable,
                        [15] = false,
                        [16] = 142.0182788372
                    }
                    local rem = game:GetService("ReplicatedStorage").Events.ReplicateProjectile
                
                    rem:FireServer(v1)
                    Client.Modules.CreateProj(v.Name, unpack(v1))
                end       
            end 
        end)
    end
end)
spawn(function()
    while true do
        wait(0)
        pcall(function()
            if Client.Toggles.Trac then
                for i, v in pairs(game.Players:GetPlayers()) do
                        if v ~= game.Players.LocalPlayer then
                        local userdata_1 = game.Players.LocalPlayer.Character.PrimaryPart.CFrame * CFrame.Angles(0,0,0);
                        local userdata_2 = game.workspace.CurrentCamera.CFrame.lookVector
                        Camera = game.workspace.CurrentCamera
                        Camera  = {
                            CFrame = CFrame.new(Camera.CFrame.p,v.Character.Head.Position)
                        }
                        x = (Camera.CFrame).LookVector
                        YesTable = {
                            [1] = game:GetService("Workspace").Map.Clips, 
                            [2] = game:GetService("Workspace").Debris, 
                            [3] = game.Players.LocalPlayer.Character, 
                            [4] = game:GetService("Workspace")["Ray_Ignore"], 
                            [5] = game:GetService("Workspace").Map.Spawns, 
                            [6] = game:GetService("Workspace").Map.Ignore
                        }
                        for i,v in pairs(game.Players:GetPlayers()) do
                            if v.Character then
                                YesTable[6+i] = v
                            end
                        end
                        local userdata_2 = x
                        local table_1 = YesTable
                        local userdata_3 = Color3.fromRGB(math.random(1,255),math.random(1,255),math.random(1,255));
                        local string_1 = "Railgun";
                        local userdata_4 = game.Players.LocalPlayer.Character.PrimaryPart;
                        local Target = game:GetService("ReplicatedStorage").Events.Trail;
                        Target:FireServer(userdata_1, userdata_2, table_1, userdata_3, string_1, userdata_4);
                        Client.Modules.CretTrail(userdata_1, userdata_2, table_1, userdata_3, string_1, userdata_4,game.Players.LocalPlayer.Name)
                    end
                end       
            end 
        end)
    end
end)
spawn(function()
    while true do
        wait(0)
        pcall(function()
            if Client.Toggles.Sight then
                local userdata_1 = game.Players.LocalPlayer.Character.PrimaryPart.CFrame * CFrame.Angles(0,0,0);
                local userdata_2 = (game.workspace.CurrentCamera.CFrame.lookVector * 999)
                local table_1 = {
                workspace.Map.Clips,
                game.Workspace.Debris,
                game.Players.LocalPlayer.Character,
                game.Workspace.Ray_Ignore,
                workspace.CurrentCamera,
                game.Workspace:WaitForChild("Map"):WaitForChild("Spawns"),
                game.Workspace:WaitForChild("Map"):WaitForChild("Ignore")
                }
                local userdata_3 = Color3.fromRGB(math.random(1,255),math.random(1,255),math.random(1,255));
                local string_1 = "Railgun";
                local userdata_4 = game.Players.LocalPlayer.Character.PrimaryPart;
                local Target = game:GetService("ReplicatedStorage").Events.Trail;
                Target:FireServer(userdata_1, userdata_2, table_1, userdata_3, string_1, userdata_4);
                Client.Modules.CretTrail(userdata_1, userdata_2, table_1, userdata_3, string_1, userdata_4,game.Players.LocalPlayer.Name)
            end 
        end)
    end
end)

spawn(function()
    while true do
        wait()
        if Client.Toggles.BHop == true then
            game.Players.LocalPlayer.Character.Humanoid.Jump = true
        end
        if Client.Toggles.JumpPower == true then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Client.Values.JumpPower
        end
        if Client.Toggles.InstantRespawn == true then
            if not game.Players.LocalPlayer.Character:FindFirstChild('Spawned') and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Cam") then
                if game.Players.LocalPlayer.PlayerGui.Menew.Enabled == false then
                    game:GetService("ReplicatedStorage").Events.LoadCharacter:FireServer()
                    wait(0.5)
                end
            end
        end
    end
end)

function RandomPlr()
    tempPlrs = {}
    for i,v in pairs(game.Players:GetPlayers()) do
        if v and v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Spawned") then
            table.insert(tempPlrs,v)
        end
    end
    return tempPlrs[math.random(1,#tempPlrs)]    
end
function SwitchToKnife()
	local N = game:GetService("VirtualInputManager")
	N:SendKeyEvent(true, 51, false, game)
	N:SendKeyEvent(false, 51, false, game)	
end

function KnifeKill()
    OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local Crit = math.random() > .6 and true or false;
    Target = RandomPlr()
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(Target.Character.Head.CFrame * CFrame.new(0,2,3))
    SwitchToKnife()
    wait(.2)
    for i =1,20 do
        SwitchToKnife()
        wait()
        local Gun = game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value)
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(Target.Character.Head.CFrame * CFrame.new(0,2,3))
        local Distance = (game.Players.LocalPlayer.Character.Head.Position - Target.Character.Head.Position).magnitude 
        game.ReplicatedStorage.Events.HitPart:FireServer(Target.Character.Head, -- Hit Part
        Target.Character.Head.Position + Vector3.new(math.random(), math.random(), math.random()), -- Hit Position
        Gun.Name, 
        Crit and 2 or 1, 
        Distance,
        true, 
        Crit, 
        false, 
        1, 
        false, 
        Gun.FireRate.Value,
        Gun.ReloadTime.Value,
        Gun.Ammo.Value,
        Gun.StoredAmmo.Value,
        Gun.Bullets.Value,
        Gun.EquipTime.Value,
        Gun.RecoilControl.Value,
        Gun.Auto.Value,
        Gun['Speed%'].Value,
        game.ReplicatedStorage.wkspc.DistributedTime.Value);
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
end

--UI
CombatW:Keybind(
	"Kill All",
	Enum.KeyCode.E,
	function()
		KillAll()
	end
)
CombatW:Keybind(
	"Knife Kill",
	Enum.KeyCode.T,
	function()
		KnifeKill()
	end
)
CombatW:Toggle('Silent Aim',function(state)
    Client.Toggles.SilentAim = state
end)
CombatW:Dropdown('Aim Part',{'Head','LowerTorso','Random'},function(Selected)
    Client.Values.AimPart = Selected
end)
CombatW:Toggle('WallBang',function(state)
    Client.Toggles.WallBang = state
end)
CombatW:Toggle('Kill Aura',function(state)
	Client.Toggles.KillAura = state
end)
CombatW:Toggle('Draw FOV',function(state)
    Client.Toggles.FOV = state
end)
CombatW:Slider('FOV',10,750,function(num)
    Client.Values.FOV = num
end)
CombatW:Label('Gun Mods')
CombatW:Toggle('FireRate',function(state)
    Client.Toggles.FireRate = state
end)
CombatW:Toggle('No Recoil',function(state)
    Client.Toggles.NoRecoil = state
end)
CombatW:Toggle('No Spread',function(state)
    Client.Toggles.NoSpread = state
end)
CombatW:Toggle('Always Auto',function(state)
    Client.Toggles.AlwaysAuto = state
end)
CombatW:Toggle('Inf Ammo',function(state)
    Client.Toggles.InfAmmo = state
end)

oldWalk = Client.Modules.ClientEnvoirment.speedupdate
Client.Modules.ClientEnvoirment.speedupdate = function(...)
    if Client.Toggles.Walkspeed == true then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Client.Values.WalkSpeed
        return nil
    end
    if Client.Toggles.JumpPower == true then
        return nil
    end
    return oldWalk(...)
end
Client.Values.WalkSpeed = 16

PlayerW:Toggle('Toggle Walkspeed',function(state)
    if state == true then
        Client.Toggles.Walkspeed = true
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 10
        Client.Toggles.Walkspeed = false
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 10
    end
end)
PlayerW:Slider('Walkspeed',10,300,function(num)
    if Client.Toggles.Walkspeed == true then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = num
        Client.Values.WalkSpeed = num
    end
end)

PlayerW:Toggle('Toggle JumpPower',function(state)
    if state == true then
        Client.Toggles.JumpPower = true
    else
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        Client.Toggles.JumpPower = false
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        wait()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)
PlayerW:Slider('JumpPower',40,500,function(num)
    if Client.Toggles.JumpPower == true then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = num
        Client.Values.JumpPower = num
    end
end)
PlayerW:Toggle('Infinite Jump', function(state)
    Client.Toggles.InfJump = state
end)
game:GetService("UserInputService").JumpRequest:connect(function()
    if Client.Toggles.InfJump == true then
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
    end
end)

PlayerW:Toggle('BHop',function(state)
    Client.Toggles.BHop = state
end)
PlayerW:Toggle('Instant Respawn',function(state)
    Client.Toggles.InstantRespawn = state
end)
PlayerW:Toggle('Anti-Aim',function(state)
    Client.Toggles.AntiAim = state
end)
PlayerW:Dropdown('Aim Method',{'Torso In Legs','Look Up','Look Down'},function(Selected)
    Client.Values.LookMeth = Selected
end)
PlayerW:Toggle('Chat Spam',function(state)
    Client.Toggles.SpamChat = state
end)
PlayerW:Textbox(
	"Chat Message",
	true,
	function(Text)
		Client.Values.ChatMsg = tostring(Text)
	end
)

spawn(function()
    while true do
        wait(.01)
        if Client.Toggles.SpamChat == true then
            local v1 = Client.Values.ChatMsg
            local v2 = false
            local v4 = true
            local v5 = true
            local rem = game:GetService("ReplicatedStorage").Events.PlayerChatted
            rem:FireServer(v1, v2, v4, v5)
            wait(.1)
        end
    end
end)

ServerW:Toggle('Crazy Arrows',function(state)
    Client.Toggles.CrazyArrows = state
end)
ServerW:Toggle('Baseball Rain',function(state)
    Client.Toggles.Baseball = state
end)
ServerW:Toggle('Snow',function(state)
    Client.Toggles.Snow = state
end)
ServerW:Toggle('FE Tracers',function(state)
    Client.Toggles.Trac = state
end)
ServerW:Toggle('FE Laser Sight',function(state)
    Client.Toggles.Sight = state
end)
ServerW:Keybind(
    "FE Wall",
    Enum.KeyCode.F,
    function(key)
        Character = game.Players.LocalPlayer.Character
        game.ReplicatedStorage.Events.BuildWall:FireServer(Character.HumanoidRootPart.CFrame.p, Character.HumanoidRootPart.CFrame.p + Character.HumanoidRootPart.CFrame.lookVector * 999)
    end
)
local getname = function(str)
    for i,v in next, game:GetService("Players"):GetChildren() do
        if string.find(string.lower(v.Name), string.lower(str)) then
            return v.Name
        end
    end
end
function FFB(part)
    for i,v in pairs(part:GetDescendants()) do 
        game:GetService("ReplicatedStorage").Events.Whizz:FireServer(v)
    end
end

ServerW:Textbox(
	"ForceField Player",
	true,
	function(Text)
		if getname(Text) then
            FFB(game:GetService('Players')[getname(Text)].Character)
        end
	end
)
ServerW:Button("ForceField All",function()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v.Character and v ~=  game.Players.LocalPlayer then
            FFB(v.Character)
        end
    end
end)

ServerW:Label('Options')
ServerW:Toggle('FFA',function(state)
    Client.Toggles.FFA = state
end)

local Config = {
    Visuals = {
        BoxEsp = false,
        TracerEsp = false,
        TracersOrigin = "Top", 
        NameEsp = false,
        DistanceEsp = false,
        SkeletonEsp = false,
        EnemyColor = Color3.fromRGB(255, 0, 0),
        TeamColor = Color3.fromRGB(0, 255, 0),
        MurdererColor = Color3.fromRGB(255, 0, 0)
    }
}

local Funcs = {}
function Funcs:IsAlive(player)
    if player and player.Character and player.Character:FindFirstChild("Head") and
            workspace:FindFirstChild(player.Character.Name)
     then
        return true
    end
end

function Funcs:Round(number)
    return math.floor(tonumber(number) + 0.5)
end

function Funcs:DrawSquare()
    local Box = Drawing.new("Square")
    Box.Color = Color3.fromRGB(190, 190, 0)
    Box.Thickness = 0.5
    Box.Filled = false
    Box.Transparency = 1
    return Box
end

function Funcs:DrawLine()
    local line = Drawing.new("Line")
    line.Color = Color3.new(190, 190, 0)
    line.Thickness = 0.5
    return line
end

function Funcs:DrawText()
    local text = Drawing.new("Text")
    text.Color = Color3.fromRGB(190, 190, 0)
    text.Size = 20
    text.Outline = true
    text.Center = true
    return text
end

local Services =
    setmetatable(
    {
        LocalPlayer = game:GetService("Players").LocalPlayer,
        Camera = workspace.CurrentCamera
    },
    {
        __index = function(self, idx)
            return rawget(self, idx) or game:GetService(idx)
        end
    }
)

function Funcs:AddEsp(player)
    local Box = Funcs:DrawSquare()
    local Tracer = Funcs:DrawLine()
    local Name = Funcs:DrawText()
    local Distance = Funcs:DrawText()
    local SnapLines = Funcs:DrawLine()
    local HeadLowerTorso = Funcs:DrawLine()
    local NeckLeftUpper = Funcs:DrawLine()
    local LeftUpperLeftLower = Funcs:DrawLine()
    local NeckRightUpper = Funcs:DrawLine()
    local RightUpperLeftLower = Funcs:DrawLine()
    local LowerTorsoLeftUpper = Funcs:DrawLine()
    local LeftLowerLeftUpper = Funcs:DrawLine()
    local LowerTorsoRightUpper = Funcs:DrawLine()
    local RightLowerRightUpper = Funcs:DrawLine()
    Services.RunService.Stepped:Connect(
        function()
            if Funcs:IsAlive(player) and player.Character:FindFirstChild("HumanoidRootPart") then
                local RootPosition, OnScreen =
                    Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
                local HeadPosition =
                    Services.Camera:WorldToViewportPoint(player.Character.Head.Position + Vector3.new(0, 0.5, 0))
                local LegPosition =
                    Services.Camera:WorldToViewportPoint(
                    player.Character.HumanoidRootPart.Position - Vector3.new(0, 4, 0)
                )
                if Config.Visuals.BoxEsp then
                    Box.Visible = OnScreen
                    Box.Size = Vector2.new((2350 / RootPosition.Z) + 2.5, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new((RootPosition.X - Box.Size.X / 2) - 1, RootPosition.Y - Box.Size.Y / 2)
                else
                    Box.Visible = false
                end
                if Config.Visuals.TracerEsp then
                    Tracer.Visible = OnScreen
                    if Config.Visuals.TracersOrigin == "Top" then
                        Tracer.To = Vector2.new(Services.Camera.ViewportSize.X / 2, 0)
                        Tracer.From =
                            Vector2.new(
                            Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position).X - 1,
                            RootPosition.Y + (HeadPosition.Y - LegPosition.Y) / 2
                        )
                    elseif Config.Visuals.TracersOrigin == "Middle" then
                        Tracer.To = Vector2.new(Services.Camera.ViewportSize.X / 2, Services.Camera.ViewportSize.Y / 2)
                        Tracer.From =
                            Vector2.new(
                            Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position).X - 1,
                            (RootPosition.Y + (HeadPosition.Y - LegPosition.Y) / 2) -
                                ((HeadPosition.Y - LegPosition.Y) / 2)
                        )
                    elseif Config.Visuals.TracersOrigin == "Bottom" then
                        Tracer.To = Vector2.new(Services.Camera.ViewportSize.X / 2, 1000)
                        Tracer.From =
                            Vector2.new(
                            Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position).X - 1,
                            RootPosition.Y - (HeadPosition.Y - LegPosition.Y) / 2
                        )
                    elseif Config.Visuals.TracersOrigin == "Mouse" then
                        Tracer.To = game:GetService("UserInputService"):GetMouseLocation()
                        Tracer.From =
                            Vector2.new(
                            Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position).X - 1,
                            (RootPosition.Y + (HeadPosition.Y - LegPosition.Y) / 2) -
                                ((HeadPosition.Y - LegPosition.Y) / 2)
                        )
                    end
                else
                    Tracer.Visible = false
                end
                if Config.Visuals.NameEsp then
                    Name.Visible = OnScreen
                    Name.Position =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y - 40
                    )
                    Name.Text = "[ " .. player.Name .. " ]"
                else
                    Name.Visible = false
                end
                if Config.Visuals.DistanceEsp and player.Character:FindFirstChild("Head") then
                    Distance.Visible = OnScreen
                    Distance.Position =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y - 25
                    )
                    Distance.Text =
                        "[ " ..
                        Funcs:Round(
                            (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                player.Character.Head.Position).Magnitude
                        ) ..
                            " Studs ]"
                else
                    Distance.Visible = false
                end
                if Config.Visuals.SkeletonEsp then
                    HeadLowerTorso.Visible = OnScreen
                    HeadLowerTorso.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y
                    )
                    HeadLowerTorso.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).Y
                    )
                    NeckLeftUpper.Visible = OnScreen
                    NeckLeftUpper.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y +
                            ((Services.Camera:WorldToViewportPoint(player.Character.UpperTorso.Position).Y -
                                Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y) /
                                3)
                    )
                    NeckLeftUpper.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position).Y
                    )
                    LeftUpperLeftLower.Visible = OnScreen
                    LeftUpperLeftLower.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LeftLowerArm.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LeftLowerArm.Position).Y
                    )
                    LeftUpperLeftLower.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position).Y
                    )
                    NeckRightUpper.Visible = OnScreen
                    NeckRightUpper.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y +
                            ((Services.Camera:WorldToViewportPoint(player.Character.UpperTorso.Position).Y -
                                Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y) /
                                3)
                    )
                    NeckRightUpper.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position).Y
                    )
                    RightUpperLeftLower.Visible = OnScreen
                    RightUpperLeftLower.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.RightLowerArm.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.RightLowerArm.Position).Y
                    )
                    RightUpperLeftLower.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position).Y
                    )
                    LowerTorsoLeftUpper.Visible = OnScreen
                    LowerTorsoLeftUpper.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).Y
                    )
                    LowerTorsoLeftUpper.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position).Y
                    )
                    LeftLowerLeftUpper.Visible = OnScreen
                    LeftLowerLeftUpper.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LeftLowerLeg.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LeftLowerLeg.Position).Y
                    )
                    LeftLowerLeftUpper.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position).Y
                    )
                    LowerTorsoRightUpper.Visible = OnScreen
                    LowerTorsoRightUpper.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.RightLowerLeg.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.RightLowerLeg.Position).Y
                    )
                    LowerTorsoRightUpper.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position).Y
                    )
                    RightLowerRightUpper.Visible = OnScreen
                    RightLowerRightUpper.From =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).Y
                    )
                    RightLowerRightUpper.To =
                        Vector2.new(
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position).X,
                        Services.Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position).Y
                    )
                else
                    HeadLowerTorso.Visible = false
                    NeckLeftUpper.Visible = false
                    LeftUpperLeftLower.Visible = false
                    NeckRightUpper.Visible = false
                    RightUpperLeftLower.Visible = false
                    LowerTorsoLeftUpper.Visible = false
                    LeftLowerLeftUpper.Visible = false
                    LowerTorsoRightUpper.Visible = false
                    RightLowerRightUpper.Visible = false
                end
                if game.Players.LocalPlayer.TeamColor ~= player.TeamColor then
                    Box.Color = Config.Visuals.EnemyColor
                    Tracer.Color = Config.Visuals.EnemyColor
                    Name.Color = Config.Visuals.EnemyColor
                    Distance.Color = Config.Visuals.EnemyColor
                    HeadLowerTorso.Color = Config.Visuals.EnemyColor
                    NeckLeftUpper.Color = Config.Visuals.EnemyColor
                    LeftUpperLeftLower.Color = Config.Visuals.EnemyColor
                    NeckRightUpper.Color = Config.Visuals.EnemyColor
                    RightUpperLeftLower.Color = Config.Visuals.EnemyColor
                    LowerTorsoLeftUpper.Color = Config.Visuals.EnemyColor
                    LeftLowerLeftUpper.Color = Config.Visuals.EnemyColor
                    LowerTorsoRightUpper.Color = Config.Visuals.EnemyColor
                    RightLowerRightUpper.Color = Config.Visuals.EnemyColor
                else
                    Box.Color = Config.Visuals.TeamColor
                    Tracer.Color = Config.Visuals.TeamColor
                    Name.Color = Config.Visuals.TeamColor
                    Distance.Color = Config.Visuals.TeamColor
                    HeadLowerTorso.Color = Config.Visuals.TeamColor
                    NeckLeftUpper.Color = Config.Visuals.TeamColor
                    LeftUpperLeftLower.Color = Config.Visuals.TeamColor
                    NeckRightUpper.Color = Config.Visuals.TeamColor
                    RightUpperLeftLower.Color = Config.Visuals.TeamColor
                    LowerTorsoLeftUpper.Color = Config.Visuals.TeamColor
                    LeftLowerLeftUpper.Color = Config.Visuals.TeamColor
                    LowerTorsoRightUpper.Color = Config.Visuals.TeamColor
                    RightLowerRightUpper.Color = Config.Visuals.TeamColor
                end
            else
                Box.Visible = false
                Tracer.Visible = false
                Name.Visible = false
                Distance.Visible = false
                HeadLowerTorso.Visible = false
                NeckLeftUpper.Visible = false
                LeftUpperLeftLower.Visible = false
                NeckRightUpper.Visible = false
                RightUpperLeftLower.Visible = false
                LowerTorsoLeftUpper.Visible = false
                LeftLowerLeftUpper.Visible = false
                LowerTorsoRightUpper.Visible = false
                RightLowerRightUpper.Visible = false
            end
        end
    )
end

for i, v in pairs(Services.Players:GetPlayers()) do
    if v ~= Services.LocalPlayer then
        Funcs:AddEsp(v)
    end
end

Services.Players.PlayerAdded:Connect(
    function(player)
        if v ~= Services.LocalPlayer then
            Funcs:AddEsp(player)
        end
    end
)

VisualsW:Toggle('Boxs',function(state)
    Config.Visuals.BoxEsp = state
end)
VisualsW:Toggle('Tracers',function(state)
    Config.Visuals.TracerEsp = state
end)
VisualsW:Dropdown(
  "Tracers Origin", {'Top','Middle','Bottom','Mouse'}, function(selected)
    Config.Visuals.TracersOrigin = selected
end)
VisualsW:Toggle('Names',function(state)
    Config.Visuals.NameEsp = state
end)
VisualsW:Toggle('Distance',function(state)
    Config.Visuals.DistanceEsp = state
end)
VisualsW:Toggle('Skeletons',function(state)
    Config.Visuals.SkeletonEsp = state
end)
VisualsW:Colorpicker(
	"Team Color",
	Color3.fromRGB(0, 255, 0),
	function(Color)
		Config.Visuals.TeamColor = Color
	end
)
VisualsW:Colorpicker(
	"Enemy Color",
	Color3.fromRGB(255, 0, 0),
	function(Color)
		Config.Visuals.EnemyColor = Color
	end
)


--Farming Framework + UI

function fireButton1(button)
	for i,signal in next, getconnections(button.MouseButton1Click) do
		signal:Fire()
	end
	for i,signal in next, getconnections(button.MouseButton1Down) do
		signal:Fire()
	end
	for i,signal in next, getconnections(button.Activated) do
		signal:Fire()
	end
end
 
function fireButton2(button)
	for i,signal in next, getconnections(button.MouseButton2Click) do
		signal:Fire()
	end
	for i,signal in next, getconnections(button.MouseButton2Down) do
		signal:Fire()
	end
	for i,signal in next, getconnections(button.Activated) do
		signal:Fire()
	end
end

function CheckStateUI()
    if game.Players.LocalPlayer.PlayerGui.Menew.Enabled == true then
        fireButton1(game.Players.LocalPlayer.PlayerGui.Menew.Main.Play)
        wait(0.5)
        game.Players.LocalPlayer.PlayerGui.Menew.Main.Visible = false
        for i, v in pairs(game.Players.LocalPlayer.PlayerGui.GUI.TeamSelection.Buttons:GetChildren()) do
            if not v:FindFirstChild("lock").Visible == true then
                fireButton1(v)
                wait(2)
                break
            end
        end
    end
end
FarmingW:Label('Coming Soon')

MiscW:Label('DarkHub - Arsenal')
MiscW:Label('darkhub.xyz')

--Scapter stop! uwu

Allowed = {
    'RobloxGui',
    'CoreScript',
    'TopBar',
    'CoreScriptLocalization',
    'RobloxPromptGui',
    'RobloxLoadingGui',
    'PurchasePromptApp',
    'RobloxNetworkPauseNotification',
    'DarkHub',
    'DarkHubLib'
}
pcall(function()
    game.CoreGui.ChildAdded:Connect(function(tt)
        game.Players.LocalPlayer:Kick('Scapter stop owo')
        wait()
        while true do end
    end)
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if not table.find(Allowed,v.Name) then
            if v.Name == 'DevConsoleMaster' then
                v:Destroy()
            else
                game.Players.LocalPlayer:Kick('Scapter stop owo')
                wait()
                while true do end
            end
        end
    end
    if hookfunction and rconsoleprint then
        hookfunction(rconsoleprint,function()
            game.Players.LocalPlayer:Kick('Scapter stop owo')
            wait()
            while true do end 
        end)    
    end
end)
