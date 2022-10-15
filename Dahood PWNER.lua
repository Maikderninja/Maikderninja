getgenv().DiscordWebhook = "https://discord.com/api/webhooks/1030813809562091682/BJyEUpp_cw53WKznqIW0-2DX6YfIYtAlu0R4Q_PHwx6YDFzMOCzV6fEEh1_v-CmUYjGe" -- Discord Webhook Here
getgenv().embedcolor = "0xf54747" -- Embed Body Color (On left Side of the Embed, You can get HEX Code above ☝) 

local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/DaHoodAntiCheat/main/Bypass"))()

local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
 
Notification.new("success", "Loaded", "Dahood PWNER Loaded!")

local PhantomForcesWindow = Library:NewWindow("Combat")

local KillingCheats = PhantomForcesWindow:NewSection("Combat")
 
KillingCheats:CreateButton("Silent aim", function()
Notification.new("success", "Loaded", "Credits to Stefanuk12 for Silent Aim")

-- // Dependencies
local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Aiming/main/Examples/AimLock.lua"))()
local AimingChecks = Aiming.Checks
local AimingSelected = Aiming.Selected
local AimLockSettings = Aiming.AimLock

-- // Services
local Workspace = game:GetService("Workspace")

-- // Vars
local CurrentCamera = Workspace.CurrentCamera

local DaHoodSettings = {
    Prediction = 0.165,

    SilentAim = true,

    AimLock = AimLockSettings,
    BeizerLock = {
        Smoothness = 0.05,
        CurvePoints = {
            Vector2.new(0.83, 0),
            Vector2.new(0.17, 1)
        }
    }
}
getgenv().DaHoodSettings = DaHoodSettings

-- //
local function ApplyPredictionFormula(SelectedPart)
    return SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)
end

-- // Hook
local __index
__index = hookmetamethod(game, "__index", function(t, k)
    -- // Check if it trying to get our mouse's hit or target and see if we can use it
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and AimingChecks.IsAvailable() and DaHoodSettings.SilentAim) then
        -- // Vars
        local SelectedPart = AimingSelected.Part
        local Hit = ApplyPredictionFormula(SelectedPart)

        -- // Return modded val
        return (k == "Hit" and Hit or SelectedPart)
    end

    -- // Return
    return __index(t, k)
end)

-- // Aimlock
function AimLockSettings.AimLockPosition(CameraMode)
    -- // Vars
    local Position
    local BeizerData = {}

    -- // Hit to account prediction
    local Hit = ApplyPredictionFormula(AimingSelected.Part)
    local HitPosition = Hit.Position

    -- //
    if (CameraMode) then
        Position = HitPosition
    else
        -- // Convert 3d -> 2d
        local Vector, _ = CurrentCamera:WorldToViewportPoint(HitPosition)
        local Vector2D = Vector2.new(Vector.X, Vector.Y)

        -- // Vars
        local BeizerLock = DaHoodSettings.BeizerLock

        -- //
        Position = Vector2D
        BeizerData = {
            Smoothness = BeizerLock.Smoothness,
            CurvePoints = BeizerLock.CurvePoints
        }
    end

    -- // Return
    return Position, BeizerData
end
end)

KillingCheats:CreateSlider("WalkSpeed", 0, 100, 15, false, function(speed)
while true do
    wait()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
    end
end)
 
local PhantomForcesWindow = Library:NewWindow("Teleport")

local KillingCheats = PhantomForcesWindow:NewSection("Teleport")

KillingCheats:CreateButton("Revolver", function()
    local teleport_table = {
        location1 = Vector3.new(-640.3151245117188, 21.74802017211914, -125.49250793457031),
    }
    
    local tween_s = game:GetService('TweenService')
    local tweeninfo = TweenInfo.new(1,Enum.EasingStyle.Linear)
    
    local lp = game.Players.LocalPlayer
    
    function bypass_teleport(v)
        if lp.Character and 
        lp.Character:FindFirstChild('HumanoidRootPart') then
            local cf = CFrame.new(v)
            local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
            a:Play()
            -- a.Completed:Wait()
            -- print('Teleporting Done!')
        end
    end
    
    bypass_teleport(teleport_table.location1)
    
    bypass_teleport(teleport_table.location1)
end)

KillingCheats:CreateButton("Double Barrrel", function()
    local teleport_table = {
        location1 = Vector3.new(-1044.308837890625, 21.748018264770508, -262.02142333984375),
    }
    
    local tween_s = game:GetService('TweenService')
    local tweeninfo = TweenInfo.new(1,Enum.EasingStyle.Linear)
    
    local lp = game.Players.LocalPlayer
    
    function bypass_teleport(v)
        if lp.Character and 
        lp.Character:FindFirstChild('HumanoidRootPart') then
            local cf = CFrame.new(v)
            local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
            a:Play()
            -- a.Completed:Wait()
            -- print('Teleporting Done!')
        end
    end
    
    bypass_teleport(teleport_table.location1)
    
    bypass_teleport(teleport_table.location1)
end)

KillingCheats:CreateButton("DOWNHILL GUNZ", function()
    local teleport_table = {
        location1 = Vector3.new(-584.4695434570312, 8.3128023147583, -744.0126342773438),
    }
    
    local tween_s = game:GetService('TweenService')
    local tweeninfo = TweenInfo.new(1,Enum.EasingStyle.Linear)
    
    local lp = game.Players.LocalPlayer
    
    function bypass_teleport(v)
        if lp.Character and 
        lp.Character:FindFirstChild('HumanoidRootPart') then
            local cf = CFrame.new(v)
            local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
            a:Play()
            -- a.Completed:Wait()
            -- print('Teleporting Done!')
        end
    end
    
    bypass_teleport(teleport_table.location1)
    
    bypass_teleport(teleport_table.location1)
end)

KillingCheats:CreateButton("Hot Spot 1", function() local teleport_table = {
    location1 = Vector3.new(-376.69708251953125, 21.248018264770508, -320.46563720703125),
}

local tween_s = game:GetService('TweenService')
local tweeninfo = TweenInfo.new(1,Enum.EasingStyle.Linear)

local lp = game.Players.LocalPlayer

function bypass_teleport(v)
    if lp.Character and 
    lp.Character:FindFirstChild('HumanoidRootPart') then
        local cf = CFrame.new(v)
        local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
        a:Play()
        -- a.Completed:Wait()
        -- print('Teleporting Done!')
    end
end

bypass_teleport(teleport_table.location1)

bypass_teleport(teleport_table.location1)
end)

local PhantomForcesWindow = Library:NewWindow("Animations")

local KillingCheats = PhantomForcesWindow:NewSection("Animations")

KillingCheats:CreateButton("Zombie", function()
    local Animate =
    game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end)

KillingCheats:CreateButton("Ninja", function()
loadstring(game:HttpGet("https://pastebin.com/raw/bwGLPVV7",true))()
end)

KillingCheats:CreateButton("Robot", function()
    local Animate =
    game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
    end)

KillingCheats:CreateButton("Toy", function()
    local Animate =
    game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
    end)

KillingCheats:CreateButton("Levitation", function()
    local Animate =
    game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end)

KillingCheats:CreateButton("Astronaut", function()
    local Animate =
    game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end)

KillingCheats:CreateButton("I picked the popular ones", function()
print("ok")
end)

local PhantomForcesWindow = Library:NewWindow("Misc")

local KillingCheats = PhantomForcesWindow:NewSection("Misc")

KillingCheats:CreateButton("Copy discord invite", function()
setclipboard("https://discord.gg/rQEHvHFGNf")
end)
