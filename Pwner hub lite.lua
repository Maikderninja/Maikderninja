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

while wait() do
        game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
        game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
    end

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
