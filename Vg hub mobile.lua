local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}


local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Player = Players.LocalPlayer
local wait = task.wait 
local spawn = task.spawn 

local Name = "Arsenal.txt"

Des = {}
if makefolder then
    makefolder("V.G Hub")
end

local Settings

if
    not pcall(
        function()
            readfile("V.G Hub//" .. Name)
        end
    )
 then
    writefile("V.G Hub//" .. Name, HttpService:JSONEncode(Des))
end

Settings = HttpService:JSONDecode(readfile("V.G Hub//" .. Name))

local function Save()
    writefile("V.G Hub//" .. Name, HttpService:JSONEncode(Settings))
end

function getUserRole(i, v)
    return i:GetRoleInGroup(v)
end
Players.PlayerAdded:Connect(
    function(v)
        if
            getUserRole(v, 2613928) == "Game Moderators" or getUserRole(v, 2613928) == "Interns" or
                getUserRole(v, 2613928) == "Contractors" or
                getUserRole(v, 2613928) == "Contributors" or
                getUserRole(v, 2613928) == "Beloved" or
                getUserRole(v, 2613928) == "Main Developers" or
                getUserRole(v, 2613928) == "Founder/Main Developer"
         then
            local PlaceID = game.PlaceId
            local AllIDs = {}
            local foundAnything = ""
            local actualHour = os.date("!*t").hour
            local Deleted = false
            function TPReturner()
                local Site
                if foundAnything == "" then
                    Site =
                        game.HttpService:JSONDecode(
                        game:HttpGet(
                            "https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100"
                        )
                    )
                else
                    Site =
                        game.HttpService:JSONDecode(
                        game:HttpGet(
                            "https://games.roblox.com/v1/games/" ..
                                PlaceID .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. foundAnything
                        )
                    )
                end
                local ID = ""
                if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                    foundAnything = Site.nextPageCursor
                end
                local num = 0
                for i, v in pairs(Site.data) do
                    local Possible = true
                    ID = tostring(v.id)
                    if tonumber(v.maxPlayers) > tonumber(v.playing) then
                        for _, Existing in pairs(AllIDs) do
                            if num ~= 0 then
                                if ID == tostring(Existing) then
                                    Possible = false
                                end
                            else
                                if tonumber(actualHour) ~= tonumber(Existing) then
                                    local delFile =
                                        pcall(
                                        function()
                                            delfile("NotSameServers.json")
                                            AllIDs = {}
                                            table.insert(AllIDs, actualHour)
                                        end
                                    )
                                end
                            end
                            num = num + 1
                        end
                        if Possible == true then
                            table.insert(AllIDs, ID)
                            wait()
                            pcall(
                                function()
                                    writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
                                    wait()
                                    game:GetService("TeleportService"):TeleportToPlaceInstance(
                                        PlaceID,
                                        ID,
                                        Player
                                    )
                                end
                            )
                            wait(4)
                        end
                    end
                end
            end

            function Teleport()
                while wait() do
                    pcall(
                        function()
                            TPReturner()
                            if foundAnything ~= "" then
                                TPReturner()
                            end
                        end
                    )
                end
            end

            -- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
            Teleport() --CharWars
        end
    end
)
local test = getsenv(game.Players.LocalPlayer.PlayerGui.GUI.Client
)
local Join = test.JoinTeam 

local function Nope()
    Player.PlayerGui.Menew.Enabled = false
    Player.PlayerGui.GUI.Enabled = true
    Player.PlayerGui.GUI.TeamSelection.Visible = false
    Player.PlayerGui.GUI.BottomFrame.Visible = false
    Player.PlayerGui.GUI.Interface.Visible = true
end
local Teams = {"TBC","TBC","TRC","TYC","Random"}
local function Spawn()
    repeat
        wait()
    until not ReplicatedStorage.wkspc.Status.RoundOver.Value == true
    wait(1)
    for i,v in pairs(Teams) do wait(1)
    if game.Players.LocalPlayer.Status.Team.Value == "Spectator" then
    Join(v)
    ReplicatedStorage.Events.LoadCharacter:FireServer()
    Nope()
    end 
    end 
end


local Circle = Drawing.new("Circle")
Circle.Color = Color3.fromRGB(22, 13, 56)
Circle.Thickness = 1
Circle.Radius = 250
Circle.Visible = false 
Circle.NumSides = 1000
Circle.Filled = false
Circle.Transparency = 1

RunService.RenderStepped:Connect(
    function()
        local Mouse = UserInputService:GetMouseLocation()
        Circle.Position = Vector2.new(Mouse.X, Mouse.Y)
    end
)

Settings.Aimbot = {
    FreeForAll = false,
    WallCheck = false,
    Enabled = false,
    FOV = 250
}
local Shoot = false

function FreeForAll(v)
    if Settings.Aimbot.FreeForAll == false or Settings.T.FreeForAll == false then
        if Player.Team == v.Team then
            return false
        else
            return true
        end
    else
        return true
    end
end

function NotObstructing(i, v)
    if Settings.Aimbot.WallCheck then
        c = Workspace.CurrentCamera.CFrame.p
        a = Ray.new(c, i - c)
        f = Workspace:FindPartOnRayWithIgnoreList(a, v)
        return f == nil
    else
        return true
    end
end
UserInputService.InputBegan:Connect(
    function(v)
        if v.UserInputType == Enum.UserInputType.MouseButton2 then
            Shoot = true
        end
    end
)

UserInputService.InputEnded:Connect(
    function(v)
        if v.UserInputType == Enum.UserInputType.MouseButton2 then
            Shoot = false
        end
    end
)

function GetClosestToCuror()
    Closest = math.huge
    Target = nil
    for _, v in pairs(Players:GetPlayers()) do
        if FreeForAll(v) then
            if
                v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and
                    v.Character:FindFirstChild("Humanoid") and
                    v.Character.Humanoid.Health ~= 0
             then
                Point, OnScreen = Workspace.CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if
                    OnScreen and
                        NotObstructing(
                            v.Character.HumanoidRootPart.Position,
                            {Player.Character, v.Character}
                        )
                 then
                    Distance =
                        (Vector2.new(Point.X, Point.Y) -
                        Vector2.new(Player:GetMouse().X, Player:GetMouse().Y)).magnitude
                    if Distance <= Settings.Aimbot.FOV then
                        Closest = Distance
                        Target = v
                    end
                end
            end
        end
    end
    return Target
end

RunService.Stepped:connect(
    function()
        pcall(
            function()
                if Settings.Aimbot.Enabled == false or Shoot == false then
                    return
                end
                ClosestPlayer = GetClosestToCuror()
                if ClosestPlayer then
                    Workspace.CurrentCamera.CFrame =
                        CFrame.new(Workspace.CurrentCamera.CFrame.p, ClosestPlayer.Character[Settings.AimPart].CFrame.p)
                end
            end
        )
    end
)
Settings.T = {
    TeamCheck = false,
    Delay = 0.01,
    Enabled = false
}

local Aim = false
UserInputService.InputBegan:connect(
    function(v)
        if v.UserInputType == Enum.UserInputType.MouseButton2 and Settings.T.Enabled then
            Aim = true
            while Aim do
                wait()
                if
                    Player:GetMouse().Target and
                        Players:FindFirstChild(
                            Player:GetMouse().Target.Parent.Name
                        )
                 then
                    local Person =
                        Players:FindFirstChild(
                        Player:GetMouse().Target.Parent.Name
                    )
                    if Person.Team ~= Player.Team or not Settings.T.TeamCheck then
                        if Settings.T.Delay > 0 then
                            wait(0.01)
                        end
                        mouse1press()
                        wait()
                        mouse1release()
                    end
                end
                if not Settings.T.Enabled then
                    break
                end
            end
        end
    end
)

UserInputService.InputEnded:connect(
    function(v)
        if v.KeyCode == Enum.UserInputType.MouseButton2 and Settings.T.Enabled then
            Aim = false
        end
    end
)


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Arsenal")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")
local Section5 = Tab1:CreateSection("")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")

local Toggle1 = Section1:CreateToggle("Aimbot", Settings.Aimbot.Enabled, function(State)
    Settings.Aimbot.Enabled = State
end)


local Dropdown1 = Section1:CreateDropdown("HitPart", {"HumanoidRootPart","Head","UpperTorso","LowerTorso","Random"}, function(String)
	Settings.AimPart = String
end)
if Settings.AimPart == nil then
Settings.AimPart = "HumanoidRootPart"
end 

local Toggle1 = Section1:CreateToggle("FreeForAll", Settings.Aimbot.FreeForAll, function(State)
    Settings.Aimbot.FreeForAll = State
    Settings.T.TeamCheck = Settings.Aimbot.FreeForAll
end)

local Toggle1 = Section1:CreateToggle("TriggerBot", Settings.T.Enabled, function(State)
    Settings.T.Enabled = State
end)

local Toggle1 = Section1:CreateToggle("WallCheck", nil, function(State)
    Settings.Aimbot.WallCheck = State
end)

local Slider2 = Section1:CreateSlider("Aimbot Radius", 0,1000,Settings.Aimbot.FOV,false, function(Value)
    Settings.Aimbot.FOV = Circle.Radius 
    Settings.Aimbot.FOV = Value
end)

local Toggle1 = Section1:CreateToggle("Circle Visible", Settings.Visible, function(State)
   Circle.Visible = State
end)

local Colorpicker3 = Section1:CreateColorpicker("Circle Color", function(Color)
    Circle.Color = Color
    Circle.Color = Settings.Color
end)


local Toggle1 = Section1:CreateToggle("SilentAim", Settings.SilentAim, function(State)
Settings.SilentAim = State
local Players = Players
local LocalPlayer = Player
local Mouse = LocalPlayer:GetMouse()
function ClosestPlayerToCurser()
    local MaxDistance, Closest = math.huge
    for i,v in pairs(Players.GetPlayers(Players)) do
        if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team and v.Character then
            local H = v.Character.FindFirstChild(v.Character, "Head")
            if H then 
                local Pos, Vis = Workspace.CurrentCamera.WorldToScreenPoint(Workspace.CurrentCamera, H.Position)
                if Vis then
                    local A1, A2 = Vector2.new(Mouse.X, Mouse.Y), Vector2.new(Pos.X, Pos.Y)
                    local Dist = (A2 - A1).Magnitude
                    if Dist < MaxDistance and Dist <= 2500 then
                        MaxDistance = Dist
                        Closest = v
                    end
                end
            end
        end
    end
    return Closest
end
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(self,...)
    local Args = {...}
    if getnamecallmethod() == "FindPartOnRayWithIgnoreList" and not checkcaller() and Settings.SilentAim then
        local GivemeHead = ClosestPlayerToCurser()
        if GivemeHead and GivemeHead.Character and GivemeHead.Character.FindFirstChild(GivemeHead.Character, Settings.AimPart) then
            Args[1] = Ray.new(Workspace.CurrentCamera.CFrame.Position, (GivemeHead.Character[Settings.AimPart].Position - Workspace.CurrentCamera.CFrame.Position).Unit * 1000)
            return OldNameCall(self, unpack(Args))
        end
    end
    return OldNameCall(self, ...)
end)
end)


local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()

local Toggle1 = Section1:CreateToggle("Enable Esp", Settings.Esp, function(State)
    Settings.Esp = State
    ESP:Toggle(Settings.Esp)
    
end)

local Toggle1 = Section1:CreateToggle("PLayer Esp", Settings.PlayerEsp, function(State)
    Settings.PlayerEsp = State
    ESP.Players = Settings.PlayerEsp
end)

local Toggle1 = Section1:CreateToggle("Tracers Esp", Settings.Tracers, function(State)
    Settings.Tracers = State
    ESP.Tracers = Settings.Tracers
end)

local Toggle1 = Section1:CreateToggle("Name Esp", Settings.EspNames, function(State)
    ESP.Names = Settings.EspNames
    Settings.EspNames = State
end)

local Toggle1 = Section1:CreateToggle("Boxes Esp", Settings.Boxes, function(State)
    Settings.Boxes = State
    ESP.Boxes = Settings.Boxes
end)


local Toggle1 = Section1:CreateToggle("BHop", Settings.BHop, function(State)
Settings.BHop = State
spawn(function()
while wait() and Settings.BHop do
    Player.Character:WaitForChild("Humanoid").Jump = true
end
end)
end)


local Toggle1 = Section1:CreateToggle("RainBow Gun", Settings.RainBowGun, function(State)
Settings.RainBowGun = State

RunService.RenderStepped:Connect(
    function()
        if Settings.RainBowGun then
            if Workspace.Camera:FindFirstChild("Arms") then
                for i, v in pairs(Workspace.Camera.Arms:GetChildren()) do 
                    if v.ClassName == "MeshPart" then
                        v.Color = Color3.fromHSV(tick()%5/5,1,1) -- changes Color
                    end
                end
            end
        end
    end
)
end)
local Toggle1 = Section1:CreateToggle("Auto Heal", Settings.AutoHeal, function(State)
Settings.AutoHeal = State
spawn(function()
while Settings.AutoHeal do
    wait()
    pcall(
        function()
            for i, v in pairs(Workspace.Debris:GetChildren()) do
                if v.Name == "DeadHP" then
                    v.CFrame = Player.Character.HumanoidRootPart.CFrame
                end
            end
        end
    )
end
end)
end)

local Toggle1 = Section2:CreateToggle("Infinite Ammo", Settings.Infinite, function(State)
Settings.Infinite = State
RunService.Stepped:connect(
    function()
        pcall(
            function()
                if Settings.Infinite then
                    Player.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
                    Player.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
                end
            end
        )
    end
)
end)

local Toggle1 = Section2:CreateToggle("Always Auto", Settings.Automtatic, function(State)
Settings.Automtatic = State
for _, v in pairs(ReplicatedStorage.Weapons:GetDescendants()) do
    if v.Name == "Auto" then
        if Settings.Automtatic then
            v.Value = true -- always auto
        else
            v.Value = false
        end
    end
end
end)

local Toggle1 = Section2:CreateToggle("FastFire Rate", Settings.FireRate, function(State)
Settings.FireRate = State
for _, v in pairs(ReplicatedStorage.Weapons:GetDescendants()) do
    if v.Name == "FireRate" then
        if Settings.FireRate then
            v.Value = 0.02 -- Fast Firerate
        else
            v.Value = 0.8
        end
    end
end
end)

local Toggle1 = Section2:CreateToggle("NoRecoil/Spread", Settings.Recoil, function(State)
Settings.Recoil = State
for i, v in pairs(ReplicatedStorage.Weapons:GetDescendants()) do
    if v.Name == "MaxSpread" or v.Name == "Spread" or v.Name == "RecoilControl" then
        if Settings.Recoil then
            v.Value = 0 -- no spread or recoil
        else
            v.Value = 1
        end
    end
end
end)

local Toggle1 = Section1:CreateToggle("Anti Aim", nil, function(State)
Settings.AntiAim = State
spawn(
    function()
        while wait(1) and Settings.AntiAim do
            getsenv(Player.PlayerGui.GUI.Client).lastlook = 10000
            if Player.Character then
                --remove legs
                for _, v in pairs(Player.Character:GetChildren()) do
                    if string.find(string.lower(v.Name), "foot") or string.find(string.lower(v.Name), "leg") then
                        if v:IsA("BasePart") then
                            v:Destroy()
                        end
                    end
                end

                if Player.Character:FindFirstChild("HeadHB") then
                    Player.Character:FindFirstChild("HeadHB"):Destroy()
                end
                if Player.Character:FindFirstChild("FakeHead") then
                    Player.Character:FindFirstChild("FakeHead"):Destroy()
                end
            end
        end

        local NewAnimation = Instance.new("Animation")
        NewAnimation.AnimationId = "rbxassetid://0"

        local OldNameCall = nil
        OldNameCall =
            hookmetamethod(
            game,
            "__namecall",
            function(A, B, C, ...)
                local Args = {...}
                local Self = Args[1]
                if getnamecallmethod() == "FireServer" and tostring(A) == "ControlTurn" then
                    B = math.rad(math.random(-360, 360))
                    C = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10))
                    Player.Character.HumanoidRootPart.CFrame =
                        CFrame.new(Player.Character.HumanoidRootPart.Position) *
                        CFrame.Angles(0, math.rad(math.random(-360, 360)), 0)
                elseif getnamecallmethod() == "LoadAnimation" and tostring(A) == "Humanoid" then
                    B = NewAnimation
                end
                return OldNameCall(A, B, C, ...)
            end
        )
        local OldNameCall = nil
        OldNameCall =
            hookmetamethod(
            game,
            "__namecall",
            function(A, B, C, ...)
                if tostring(A) == "Humanoid" and B == "AutoRotate" then
                    return oldnewIndex(A, B, false)
                end
                return oldnewIndex(A, B, C, ...)
            end
        )
    end
)

end)
if Settings.WalkSpeed == nil or Settings.JumpPower == nil then
Settings.WalkSpeed = 23 
Settings.JumpPower = 5
end 
local Toggle1 = Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
Settings.Go = State
RunService.Stepped:connect(
    function()
        if Settings.Go then
            Player.Character:WaitForChild("Humanoid").WalkSpeed = Settings.WalkSpeed
       	    if Player.Character:FindFirstChildOfClass('Humanoid').UseJumpPower then
			Player.Character:WaitForChild('Humanoid').JumpPower = Settings.JumpPower
		    else
			Player.Character:WaitForChild('Humanoid').JumpHeight  = Settings.JumpPower
			end 
            if not  UserInputService.WindowFocusReleased then
                pcall(function()
                setfpscap(Settings.Fps)
                end)
            end
        end
    end
)

end)

local TextBox1 = Section2:CreateTextBox("Fps Cap", "Only numbers", true, function(Value)
    Settings.Fps = Value
end)

local TextBox1 = Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)
    Settings.WalkSpeed = Value
end)
local TextBox1 = Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)
    Settings.JumpPower = Value
end)


local Toggle1 = Section2:CreateToggle("Infinite Jump", Settings.InfiniteJump, function(State)
Settings.InfiniteJump = State
UserInputService.JumpRequest:connect(
    function()
        if Settings.InfiniteJump then
            game:GetService "Players".LocalPlayer.Character:FindFirstChildOfClass "Humanoid":ChangeState("Jumping")
        end
    end
)
end)

local Toggle1 = Section2:CreateToggle("Invisicam", Settings.Sorry, function(State)
Settings.Sorry = State
if Settings.Sorry then
    Player.DevCameraOcclusionMode = "Invisicam"
else
    Player.DevCameraOcclusionMode = "Zoom"
end
end)

local Toggle1 = Section2:CreateToggle("N Noclip", Settings.Sex1, function(State)
noclips = false
Settings.Sex1 = State
Player:GetMouse().KeyDown:connect(
    function(v)
        if v == "n" then
            if Settings.Sex1 then
                noclips = not noclips
                for i, v in pairs(Player.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        pcall(function()
                        v.CanCollide = false
                        end)
                    end
                end
            end
        end
    end
)
RunService.Stepped:connect(
    function()
        if noclips then
            for i, v in pairs(Player.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    pcall(function()
                    v.CanCollide = false
                    end)
                end
            end
        end
    end
)

end)

local Toggle1 = Section2:CreateToggle("G Noclip", Settings.Sex, function(State)
Settings.Sex = State
noclip = false
RunService.Stepped:connect(
    function()
        if noclip then
            Player.Character.Humanoid:ChangeState(11)
        end
    end
)
Player:GetMouse().KeyDown:connect(
    function(v)
        if v == "g" then
            if Settings.Sex then
                noclip = not noclip
                Player.Character.Humanoid:ChangeState(11)
            end
        end
    end
)
end)
local Toggle1 = Section2:CreateToggle("H Fly", Settings.Sex2, function(State)
Settings.Sex2 = State
local Max = 0
local Players = Players
local LP = Player
local Mouse = LP:GetMouse()
Mouse.KeyDown:connect(
    function(k)
        if k:lower() == "h" then
            Max = Max + 1
            getgenv().Fly = false
            if Settings.Sex2 then
                local T = LP.Character.UpperTorso
                local S = {
                    F = 0,
                    B = 0,
                    L = 0,
                    R = 0
                }
                local S2 = {
                    F = 0,
                    B = 0,
                    L = 0,
                    R = 0
                }
                local SPEED = 5
                local function FLY()
                    getgenv().Fly = true
                    local BodyGyro = Instance.new("BodyGyro", T)
                    local BodyVelocity = Instance.new("BodyVelocity", T)
                    BodyGyro.P = 9e4
                    BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                    BodyGyro.cframe = T.CFrame
                    BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
                    BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
                    spawn(
                        function()
                            repeat
                                wait()
                                LP.Character.Humanoid.PlatformStand = false
                                if S.L + S.R ~= 0 or S.F + S.B ~= 0 then
                                    SPEED = 200
                                elseif not (S.L + S.R ~= 0 or S.F + S.B ~= 0) and SPEED ~= 0 then
                                    SPEED = 0
                                end
                                if (S.L + S.R) ~= 0 or (S.F + S.B) ~= 0 then
                                    BodyVelocity.velocity =
                                        ((Workspace.CurrentCamera.CoordinateFrame.lookVector * (S.F + S.B)) +
                                        ((Workspace.CurrentCamera.CoordinateFrame *
                                            CFrame.new(S.L + S.R, (S.F + S.B) * 0.2, 0).p) -
                                            Workspace.CurrentCamera.CoordinateFrame.p)) *
                                        SPEED
                                    S2 = {
                                        F = S.F,
                                        B = S.B,
                                        L = S.L,
                                        R = S.R
                                    }
                                elseif (S.L + S.R) == 0 and (S.F + S.B) == 0 and SPEED ~= 0 then
                                    BodyVelocity.velocity =
                                        ((Workspace.CurrentCamera.CoordinateFrame.lookVector * (S2.F + S2.B)) +
                                        ((Workspace.CurrentCamera.CoordinateFrame *
                                            CFrame.new(S2.L + S2.R, (S2.F + S2.B) * 0.2, 0).p) -
                                            Workspace.CurrentCamera.CoordinateFrame.p)) *
                                        SPEED
                                else
                                    BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
                                end
                                BodyGyro.cframe = Workspace.CurrentCamera.CoordinateFrame
                            until not getgenv().Fly
                            S = {
                                F = 0,
                                B = 0,
                                L = 0,
                                R = 0
                            }
                            S2 = {
                                F = 0,
                                B = 0,
                                L = 0,
                                R = 0
                            }
                            SPEED = 0
                            BodyGyro:destroy()
                            BodyVelocity:destroy()
                            LP.Character.Humanoid.PlatformStand = false
                        end
                    )
                end
                Mouse.KeyDown:connect(
                    function(k)
                        if k:lower() == "w" then
                            S.F = 1
                        elseif k:lower() == "s" then
                            S.B = -1
                        elseif k:lower() == "a" then
                            S.L = -1
                        elseif k:lower() == "d" then
                            S.R = 1
                        end
                    end
                )
                Mouse.KeyUp:connect(
                    function(k)
                        if k:lower() == "w" then
                            S.F = 0
                        elseif k:lower() == "s" then
                            S.B = 0
                        elseif k:lower() == "a" then
                            S.L = 0
                        elseif k:lower() == "d" then
                            S.R = 0
                        end
                    end
                )
                FLY()
                if Max == 2 then
                    getgenv().Fly = false
                    Max = 0
                end
            end
        end
    end
)
end)
local Button1 = Section2:CreateButton("Anti Lag", function()
for _, v in pairs(Workspace:GetDescendants()) do
    if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
        v.Material = Enum.Material.SmoothPlastic
        if v:IsA("Texture") then
            v:Destroy()
        end
    end
end
end)

local Button1 = Section2:CreateButton("Teleport to RandomPlayer", function()
local randomPlayer = Players:GetPlayers()[math.random(1, #Players:GetPlayers())]

Player.Character.HumanoidRootPart.CFrame =
    CFrame.new(
    Vector3.new(
        randomPlayer.Character.Head.Position.X,
        randomPlayer.Character.Head.Position.Y,
        randomPlayer.Character.Head.Position.Z
    )
)
end)
local Button1 = Section2:CreateButton("Lag Switch F3", function()
local ass = false
local bitch = settings()

game:service "UserInputService".InputEnded:connect(
    function(i)
        if i.KeyCode == Enum.KeyCode.F3 then
            ass = not ass
            bitch.Network.IncomingReplicationLag = ass and 10 or 0
        end
    end
)
 end) 
local Button1 = Section2:CreateButton("ServerHop", function()
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, Player)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport() 
end)
local Button1 = Section2:CreateButton("Rejoin", function()
game:GetService("TeleportService"):Teleport(game.PlaceId, Player) end)


local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)
Section3:CreateLabel("Credits DekuDimz#7960")
Section3:CreateLabel("Credits AlexR32#3232 Ui")
Section3:CreateLabel("Credits The3Bakers")
Section3:CreateLabel("Credits snake587")
local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

-- credits to jan for patterns
local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Default")

local Button1 = Section4:CreateButton("Save Settings", function()
Save()
end)

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)

