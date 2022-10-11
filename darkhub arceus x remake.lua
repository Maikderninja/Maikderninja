local BlekLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/bleklib/main/library.lua"))()

local win = BlekLib:Create({
    Name = "Darkhub arceus x remake",
    StartupSound = {
        Toggle = false,
        SoundID = "rbxassetid://6958727243", -- Win 11 Startup Sound
        TimePosition = 1
    }
})

local maintab = win:Tab('Combat')
local tab2 = win:Tab('Gun Mods')
local tab3 = win:Tab('Local Player')
local tab4 = win:Tab('Visuals')
local uitab = win:Tab('UI')

maintab:Toggle('Silent Aim', function(Silent)
local S = Silent

if S then
    local CurrentCamera = workspace.CurrentCamera
    local Players = game.Players
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    function ClosestPlayer()
        local MaxDist, Closest = math.huge
        for I,V in pairs(Players.GetPlayers(Players)) do
            if V == LocalPlayer then continue end
            if V.Team == LocalPlayer then continue end
            if not V.Character then continue end
            local Head = V.Character.FindFirstChild(V.Character, "Head")
            if not Head then continue end
            local Pos, Vis = CurrentCamera.WorldToScreenPoint(CurrentCamera, Head.Position)
            if not Vis then continue end
            local MousePos, TheirPos = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2), Vector2.new(Pos.X, Pos.Y)
            local Dist = (TheirPos - MousePos).Magnitude
            if Dist < MaxDist then
                MaxDist = Dist
                Closest = V
            end
        end
        return Closest
    end
    local MT = getrawmetatable(game)
    local OldNC = MT.__namecall
    local OldIDX = MT.__index
    setreadonly(MT, false)
    MT.__namecall = newcclosure(function(self, ...)
        local Args, Method = {...}, getnamecallmethod()
        if Method == "FindPartOnRayWithIgnoreList" and not checkcaller() then
            local CP = ClosestPlayer()
            if CP and CP.Character and CP.Character.FindFirstChild(CP.Character, "Head") then
                Args[1] = Ray.new(CurrentCamera.CFrame.Position, (CP.Character.Head.Position - CurrentCamera.CFrame.Position).Unit * 1000)
                return OldNC(self, unpack(Args))
            end
        end
        return OldNC(self, ...)
    end)
    MT.__index = newcclosure(function(self, K)
        if K == "Clips" then
            return workspace.Map
        end
        return OldIDX(self, K)
    end)
    setreadonly(MT, true)
end)

maintab:Toggle('wallbang', function(wallbang)
    _G.Enable = wallbang
    local MT = getrawmetatable(game)
    local OldIndex = MT.__index
    setreadonly(MT, false)
    MT.__index = newcclosure(function(A, B)
        if B == "Clips" then
            if _G.Enable then
                return workspace.Map
            end
        end
        return OldIndex(A, B)
    end)
    game:GetService("UserInputService").InputBegan:Connect(function(Key, _)
        if not _ and Key.KeyCode == Enum.KeyCode.T then
            _G.Enable = not _G.Enable
        end
    end)
end)

maintab:Toggle('FOV circle', function(circle)
    local dwCamera = workspace.CurrentCamera
local dwRunService = game:GetService("RunService")
local dwUIS = game:GetService("UserInputService")
local dwEntities = game:GetService("Players")
local dwLocalPlayer = dwEntities.LocalPlayer
local dwMouse = dwLocalPlayer:GetMouse()

local settings = {
    Aimbot_Draw_FOV = circle,
    Aimbot_FOV_Radius = 150,
    Aimbot_FOV_Color = Color3.fromRGB(255,255,255)
}

local fovcircle = Drawing.new("Circle")
fovcircle.Visible = settings.Aimbot_Draw_FOV
fovcircle.Radius = settings.Aimbot_FOV_Radius
fovcircle.Color = settings.Aimbot_FOV_Color
fovcircle.Thickness = 5
fovcircle.Filled = false
fovcircle.Transparency = 1

fovcircle.Position = Vector2.new(dwCamera.ViewportSize.X / 2, dwCamera.ViewportSize.Y / 2)

dwUIS.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton2 then
        settings.Aiming = false
    end
end)
end)

tab2:Toggle('FireRate', function(fire)
local F = fire
    
if F then
    local replicationstorage = game.ReplicatedStorage

    for i, v in pairs(replicationstorage.Weapons:GetDescendants()) do
        if v.Name == "FireRate" then
            v.Value = 0.05
        end
end)

tab2:Toggle('No Recoil', function(recoil)
local R = recoil

if R then
    local replicationstorage = game.ReplicatedStorage

    for i, v in pairs(replicationstorage.Weapons:GetDescendants()) do
        if v.Name == "RecoilControl" then
            v.Value = 0
        end
end)

tab2:Toggle('No Spred', function(spread)
local E = spread

if E then
    local replicationstorage = game.ReplicatedStorage

    for i, v in pairs(replicationstorage.Weapons:GetDescendants()) do
        if v.Name == "MaxSpread" then
            v.Value = 0
        end
end)

tab2:Toggle('Inf Ammo', function(ammo)
local I = ammo

if I then
while wait() do
    game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
    game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
end
end)

tab3:Textbox('WalkSpeed', function(speed)
while true do
    wait()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
    end
    end)

tab3:Textbox('JumpPower', function(jump)
    while true do
    wait()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = jump
    end
end)

tab3:Button('Infinite Jump', function()
-- Created By Zorkel

-- Instances:

local DropGUI = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local DropTool = Instance.new("TextButton")

--Properties:

DropGUI.Name = "Drop GUI"
DropGUI.Parent = game.CoreGui
DropGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.Name = "main"
main.Parent = DropGUI
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.Position = UDim2.new(0.0809101239, 0, 0.203790441, 0)
main.Size = UDim2.new(0, 100, 0, 100)
main.Active = true
main.Draggable = true

DropTool.Name = "Drop Tool"
DropTool.Parent = main
DropTool.BackgroundColor3 = Color3.fromRGB(350, 0, 0)
DropTool.Position = UDim2.new(0.0597826242, 0, 0.119906127, 0)
DropTool.Size = UDim2.new(0, 80, 0, 80)
DropTool.Font = Enum.Font.SourceSans
DropTool.Text = "^"
DropTool.TextColor3 = Color3.fromRGB(0, 0, 0)
DropTool.TextScaled = true
DropTool.TextSize = 14.000
DropTool.TextWrapped = true
DropTool.MouseButton1Down:Connect(function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)


game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
end)
end)

tab4:Toggle('Rainbow Gun', function(rgb)
local G = rgb

if G then
local c = 1 function zigzag(X)  return math.acos(math.cos(X * math.pi)) / math.pi end game:GetService("RunService").RenderStepped:Connect(function()  if game.Workspace.Camera:FindFirstChild('Arms') then   for i,v in pairs(game.Workspace.Camera.Arms:GetDescendants()) do    if v.ClassName == 'MeshPart' then      v.Color = Color3.fromHSV(zigzag(c),1,1)     c = c + .0001    end   end  end end)
end)

tab4:Toggle('Tracer', function(tracer)
    local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint

_G.TeamCheck = true-- Use True or False to toggle TeamCheck

for i,v in pairs(game.Players:GetChildren()) do
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function lineesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
                        --//Teammates
                        Tracer.Visible = true
                    else
                        --//Enemies
                        Tracer.Visible = true
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(lineesp)()
end

game.Players.PlayerAdded:Connect(function(v)
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function lineesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
                        --//Teammates
                        Tracer.Visible = false
                    else
                        --//Enemies
                        Tracer.Visible = tracer
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(lineesp)()
end)
end)

tab4:Toggle('Esp Box', function(box)
local H = box

if H then
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Esp box has been executed lol",
        Text = "Box in a esp form on a player lol", 
        
        Duration = 5
        })
        -- settings
        local settings = {
           defaultcolor = Color3.fromRGB(255,0,0),
           teamcheck = false,
           teamcolor = true
        };
        
        -- services
        local runService = game:GetService("RunService");
        local players = game:GetService("Players");
        
        -- variables
        local localPlayer = players.LocalPlayer;
        local camera = workspace.CurrentCamera;
        
        -- functions
        local newVector2, newColor3, newDrawing = Vector2.new, Color3.new, Drawing.new;
        local tan, rad = math.tan, math.rad;
        local round = function(...) local a = {}; for i,v in next, table.pack(...) do a[i] = math.round(v); end return unpack(a); end;
        local wtvp = function(...) local a, b = camera.WorldToViewportPoint(camera, ...) return newVector2(a.X, a.Y), b, a.Z end;
        
        local espCache = {};
        local function createEsp(player)
           local drawings = {};
           
           drawings.box = newDrawing("Square");
           drawings.box.Thickness = 1;
           drawings.box.Filled = false;
           drawings.box.Color = settings.defaultcolor;
           drawings.box.Visible = false;
           drawings.box.ZIndex = 2;
        
           drawings.boxoutline = newDrawing("Square");
           drawings.boxoutline.Thickness = 3;
           drawings.boxoutline.Filled = false;
           drawings.boxoutline.Color = newColor3();
           drawings.boxoutline.Visible = false;
           drawings.boxoutline.ZIndex = 1;
        
           espCache[player] = drawings;
        end
        
        local function removeEsp(player)
           if rawget(espCache, player) then
               for _, drawing in next, espCache[player] do
                   drawing:Remove();
               end
               espCache[player] = nil;
           end
        end
        
        local function updateEsp(player, esp)
           local character = player and player.Character;
           if character then
               local cframe = character:GetModelCFrame();
               local position, visible, depth = wtvp(cframe.Position);
               esp.box.Visible = visible;
               esp.boxoutline.Visible = visible;
        
               if cframe and visible then
                   local scaleFactor = 1 / (depth * tan(rad(camera.FieldOfView / 2)) * 2) * 1000;
                   local width, height = round(4 * scaleFactor, 5 * scaleFactor);
                   local x, y = round(position.X, position.Y);
        
                   esp.box.Size = newVector2(width, height);
                   esp.box.Position = newVector2(round(x - width / 2, y - height / 2));
                   esp.box.Color = settings.teamcolor and player.TeamColor.Color or settings.defaultcolor;
        
                   esp.boxoutline.Size = esp.box.Size;
                   esp.boxoutline.Position = esp.box.Position;
               end
           else
               esp.box.Visible = false;
               esp.boxoutline.Visible = false;
           end
        end
        
        -- main
        for _, player in next, players:GetPlayers() do
           if player ~= localPlayer then
               createEsp(player);
           end
        end
        
        players.PlayerAdded:Connect(function(player)
           createEsp(player);
        end);
        
        players.PlayerRemoving:Connect(function(player)
           removeEsp(player);
        end)
        
        runService:BindToRenderStep("esp", Enum.RenderPriority.Camera.Value, function()
           for player, drawings in next, espCache do
               if settings.teamcheck and player.Team == localPlayer.Team then
                   continue;
               end
        
               if drawings and player ~= localPlayer then
                   updateEsp(player, drawings);
               end
           end
        end)
        end)

tab4:Toggle('Names', function(name)
local n = name

if n then
    local c = workspace.CurrentCamera
    local ps = game:GetService("Players")
    local lp = ps.LocalPlayer
    local rs = game:GetService("RunService")
    
    local function esp(p,cr)
        local h = cr:WaitForChild("Humanoid")
        local hrp = cr:WaitForChild("HumanoidRootPart")
    
        local text = Drawing.new("Text")
        text.Visible = false
        text.Center = true
        text.Outline = true 
        text.Font = 2
        text.Color = Color3.fromRGB(255,255,255)
        text.Size = 13
    
        local c1
        local c2
        local c3
    
        local function dc()
            text.Visible = false
            text:Remove()
            if c1 then
                c1:Disconnect()
                c1 = nil 
            end
            if c2 then
                c2:Disconnect()
                c2 = nil 
            end
            if c3 then
                c3:Disconnect()
                c3 = nil 
            end
        end
    
        c2 = cr.AncestryChanged:Connect(function(_,parent)
            if not parent then
                dc()
            end
        end)
    
        c3 = h.HealthChanged:Connect(function(v)
            if (v<=0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
                dc()
            end
        end)
    
        c1 = rs.RenderStepped:Connect(function()
            local hrp_pos,hrp_onscreen = c:WorldToViewportPoint(hrp.Position)
            if hrp_onscreen then
                text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y)
                text.Text = p.Name
                text.Visible = true
            else
                text.Visible = false
            end
        end)
    end
    
    local function p_added(p)
        if p.Character then
            esp(p,p.Character)
        end
        p.CharacterAdded:Connect(function(cr)
            esp(p,cr)
        end)
    end
    
    for i,p in next, ps:GetPlayers() do 
        if p ~= lp then
            p_added(p)
        end
    end
    
    ps.PlayerAdded:Connect(p_added)
end)

uitab:Button('Destroy GUI', function()
    win:Exit()
end)
