local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local PhantomForcesWindow = Library:NewWindow("Arsenal PWNERS V2")
local KillingCheats = PhantomForcesWindow:NewSection("Combat")
KillingCheats:CreateButton("Silent Aim", function()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Silent aim has been executed",
Text = "aim go brrrrrr", 
Duration = 5
})
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
KillingCheats:CreateToggle("Semi wallbang", function(wallbang)
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
KillingCheats:CreateToggle("Aimbot", function(aimbot)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local sc = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
local Down = true
local Inset = GuiService:GetGuiInset()
--// Options \\--
getgenv().Options = {
    Enabled = aimbot,
    TeamCheck = true,
    Triggerbot = true,
    Smoothness = true,
    AimPart = "Head",
    FOV = 150
}
--// Functions \\--
local gc = function()
	local nearest = math.huge
	local nearplr
	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= game:GetService("Players").LocalPlayer and v.Character and v.Character:FindFirstChild(Options.AimPart) then
			if Options.TeamCheck then
				if game:GetService("Players").LocalPlayer.Team ~= v.Team then
                    local pos = Camera:WorldToScreenPoint(v.Character[Options.AimPart].Position)
                    local diff = math.sqrt((pos.X - sc.X) ^ 2 + (pos.Y + Inset.Y - sc.Y) ^ 2)
                    if diff < nearest and diff < Options.FOV then
                        nearest = diff
                        nearplr = v
                    end
                end
			else
				local pos = Camera:WorldToScreenPoint(v.Character[Options.AimPart].Position)
				local diff = math.sqrt((pos.X - sc.X) ^ 2 + (pos.Y + Inset.Y - sc.Y) ^ 2)
				if diff < nearest and diff < Options.FOV then
					nearest = diff
					nearplr = v
                end
			end
		end
	end
	return nearplr
end -- google chrome made this but i modified it for it to use teamcheck
function Circle()
    local circ = Drawing.new('Circle')
    circ.Transparency = 1
    circ.Thickness = 1.5
    circ.Visible = true
    circ.Color = Color3.fromRGB(255,255,255)
	circ.Filled = false
	circ.NumSides = 150
    circ.Radius = Options.FOV
    return circ
end
curc = Circle()
--// Main \\--
UserInputService.InputBegan:Connect(function( input )
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Down = true
	end
end)
UserInputService.InputEnded:Connect(function( input )
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Down = false
    end
end)
RunService.RenderStepped:Connect(function( ... )
    if Options.Enabled then
        if Down then
            if gc() ~= nil and gc().Character:FindFirstChild(Options.AimPart) then
                if Options.Smoothness then
                    pcall(function( ... )
                        local Info = TweenInfo.new(0.05,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
                        game:GetService("TweenService"):Create(Camera,Info,{
                            CFrame = CFrame.new(Camera.CFrame.p,gc().Character[Options.AimPart].CFrame.p)
                        }):Play()
                    end)
                else
                    pcall(function()
                        Camera.CFrame = CFrame.new(Camera.CFrame.p,gc().Character[Options.AimPart].CFrame.p)
                    end)
                end
            end
        end
        curc.Visible = false
        curc.Position = Vector2.new(Mouse.X, Mouse.Y+Inset.Y)
    else
        -- do nothing except remove the fov
        curc.Visible = false
    end
end)
end)
local KillingCheats = PhantomForcesWindow:NewSection("Visuals")
KillingCheats:CreateButton("Esp box", function()
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
KillingCheats:CreateButton("Fov circle", function()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Fov circle has been executed lol",
Text = "Circle in front of your face lol", 
Duration = 5
})
local dwCamera = workspace.CurrentCamera
local dwRunService = game:GetService("RunService")
local dwUIS = game:GetService("UserInputService")
local dwEntities = game:GetService("Players")
local dwLocalPlayer = dwEntities.LocalPlayer
local dwMouse = dwLocalPlayer:GetMouse()
local settings = {
    Aimbot_Draw_FOV = true,
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
KillingCheats:CreateButton("Tracer", function()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Tracer has been executed lol",
Text = "Wallhax", 
Duration = 5
})
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
end)
end)
local KillingCheats = PhantomForcesWindow:NewSection("Gun Mods")
KillingCheats:CreateButton("Rapidfire", function()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Rapidfire has been executed",
Text = "Gun wrrrrrrrr", 
Duration = 5
})
local replicationstorage = game.ReplicatedStorage
for i, v in pairs(replicationstorage.Weapons:GetDescendants()) do
   if v.Name == "Auto" then
       v.Value = true
   end
   if v.Name == "RecoilControl" then
       v.Value = 0
   end
   if v.Name == "MaxSpread" then
       v.Value = 0
   end
   if v.Name == "ReloadTime" then
      v.Value = 0
   end
   if v.Name == "FireRate" then
       v.Value = 0.05
   end
   if v.Name == "Crit" then
       v.Value = 20
   end
end
end)
KillingCheats:CreateButton("RGB gun", function()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "RGB gun has been executed lol",
Text = "RBG = More fps (Joke)", 
Duration = 5
})
local c = 1 function zigzag(X)  return math.acos(math.cos(X * math.pi)) / math.pi end game:GetService("RunService").RenderStepped:Connect(function()  if game.Workspace.Camera:FindFirstChild('Arms') then   for i,v in pairs(game.Workspace.Camera.Arms:GetDescendants()) do    if v.ClassName == 'MeshPart' then      v.Color = Color3.fromHSV(zigzag(c),1,1)     c = c + .0001    end   end  end end)
end)
KillingCheats:CreateButton("Infinite ammo", function()
    while wait() do
        game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
        game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
    end
end)
local KillingCheats = PhantomForcesWindow:NewSection("Player")
KillingCheats:CreateDropdown("Speed", {"15", "30", "50", "70", "100"}, 2, function(speed)
while true do
wait()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end
end)
KillingCheats:CreateButton("Infinite Jump", function()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Infinite jump has been executed lol",
Text = "Fly fly lol", 
Duration = 5
})
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
KillingCheats:CreateButton("Invisible", function()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Invisible executed lol",
Text = "Pov: your dad", 
Duration = 5
})
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Cesare0328/my-scripts/main/arsenal%20updated%20invis.lua'),true))()
end)
local KillingCheats = PhantomForcesWindow:NewSection("Misc")
KillingCheats:CreateButton("Fps booster", function()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Low quality has been executed lol",
Text = "Epic", 
Duration = 5
})
local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
end)
KillingCheats:CreateButton("Fullbright", function()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "your shadows are gone💀",
Text = "executed Fullbright!", 
Duration = 5
})
local Light = game:GetService("Lighting")
function dofullbright()
Light.Ambient = Color3.new(1, 1, 1)
Light.ColorShift_Bottom = Color3.new(1, 1, 1)
Light.ColorShift_Top = Color3.new(1, 1, 1)
end
dofullbright()
Light.LightingChanged:Connect(dofullbright)
end)
KillingCheats:CreateButton("Copy discord invite", function()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Discord Copied to your clipboard",
Text = "Epic", 
Duration = 5
})
setclipboard("https://discord.gg/rQEHvHFGNf")
end)
