-- Gui to Lua
-- Version: 3.2

-- Instances:

local Toggle = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")

--Properties:

Toggle.Name = "Toggle"
Toggle.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Toggle.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Toggle.DisplayOrder = 999999998

Frame.Parent = Toggle
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.500
Frame.Position = UDim2.new(0.846244156, 0, 0.0386473425, 0)
Frame.Size = UDim2.new(0.131455392, 0, 0.270531386, 0)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Pwnerhub"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 30.000
TextButton.MouseButton1Down:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true, "F6" ,false ,game)
end)

--------------Toggles--------------

--Rebirth
getgenv().arebirth = false
getgenv().amegarebirth = false

--Sell
getgenv().asell = false
--Pet
getgenv().atame = false
getgenv().pet = nil

--Wheat Farm
getgenv().agold = false
getgenv().arainbow = false
getgenv().awheat = false
getgenv().aifarm = false
getgenv().Color = Color3.fromRGB(255, 255, 255)
getgenv().esp = false
--Shop
getgenv().aupgrade = false

--------------Toggle Functions--------------

--Rebirth
function arebirth()
    while getgenv().arebirth do
        wait(0.3)
        local Event = game:GetService("ReplicatedStorage").RemoteFunctions.Rebirth
        Event:InvokeServer()
    end
end

function amegarebirth()
    while getgenv().amegarebirth do
        wait(0.3)
        local A_1 = true
        local Event = game:GetService("ReplicatedStorage").RemoteFunctions.Rebirth
        Event:InvokeServer(A_1)
    end
end

--Pet
function atame()
    while getgenv().atame do
        wait()
        for _,v in pairs(game.Workspace:GetChildren()) do
            if v.Name == getgenv().pet then
                local args = {
                    [1] = workspace[getgenv().pet],
                    [2] = getgenv().pet
                }

                game:GetService("ReplicatedStorage").RemoteFunctions.Tame:InvokeServer(unpack(args))
            end
        end
    end
end

--Sell
function asell()
    local player = game.Players.LocalPlayer.Character.HumanoidRootPart
    local sellpart = game:GetService("Workspace").Sell
    while getgenv().asell do
        firetouchinterest(player, sellpart, 0)
        wait(0.1)
        firetouchinterest(player, sellpart, 1)
    end
end

--Wheat Farm
function arainbow()
    spawn(function()
        while arainbow do
            wait()
            for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if string.sub(v.Name, 1, 7) == "Rainbow" then
                    if not getgenv().arainbow then break end
                    wait(0.1)
                    local succ, err=pcall(function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Hitbox.Position)
                    end)
                    if not succ then
                        break
                    end
                end
            end
        end
    end)
end

function agold()
    spawn(function()
        while agold do
            wait()
            for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if string.sub(v.Name, 1, 6) == "Golden" then
                    if not getgenv().agold then break end
                    wait(0.1)
                    local succ, err=pcall(function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Hitbox.Position)
                    end)
                    if not succ then
                        break
                    end
                end
            end
        end
    end)
end

function aifarm()
    while aifarm do
        wait()
        if not getgenv().aifarm then break end
        local tween_s = game:GetService('TweenService')
        local tweeninfo = TweenInfo.new(10,Enum.EasingStyle.Linear)
        local lp = game.Players.LocalPlayer
        
        if lp.Character and lp.Character:FindFirstChild('HumanoidRootPart') then
            local cf = CFrame.new(123.18338775634766, 120, -213.020751953125)
            local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
            a:Play()
            wait(10)
            if not getgenv().aifarm then break end
            local cf = CFrame.new(133.8654327392578, 120, 203.76153564453125)
            local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
            a:Play()
            wait(10)
            if not getgenv().aifarm then break end
            local cf = CFrame.new(525.6304931640625, 120, -210.6663818359375)
            local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
            a:Play()
            wait(10)
            if not getgenv().aifarm then break end
            local cf = CFrame.new(525.5975341796875, 120, 210.14569091796875)
            local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
            a:Play()
            wait(10)
            if not getgenv().aifarm then break end
        end
    end
end

function awheat()
    while awheat do
        for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if string.sub(v.Name, 1, 5) == "Wheat" and v.Name ~= "Wheat" and v:FindFirstChild("Hitbox") then
                if not getgenv().awheat then break end
                local mag = (v.Hitbox.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if mag < 100 then
                    v.Wheat.Transparency = 1
                    local A_1 = 
                    {
                        [1] = game:GetService("Workspace")[v.Name][v:FindFirstChildOfClass("Vector3Value").Name]
                    }
                    local Event = game:GetService("ReplicatedStorage").RemoteEvents.Harvest
                    Event:FireServer(A_1)
                    local player = game.Players.LocalPlayer.Character.HumanoidRootPart
                    local sellpart = game:GetService("Workspace").Sell                
                end
            end
        end
        wait(1)
    end
end

function esp()
    spawn(function()
        while wait() do
            wait()
            if not getgenv().esp then
                for _,v in pairs(game.Workspace:GetDescendants()) do
                    if v.Name == "Highlight" and v.Parent.Parent.Parent.Name == "Workspace" then
                        local Highlight = v
                        local BillboardGui = v.Parent.Parent:FindFirstChild("HumanoidRootPart"):FindFirstChild("BillboardGui")
                        Highlight.Enabled = false
                        BillboardGui.Enabled = false
                        wait()
                    end
                end
            else
                for _,v in pairs(game.Workspace:GetDescendants()) do
                    local succ, err=pcall(function()
                        if v.Name == "HumanoidRootPart" and v.Parent.Parent.Name == "Workspace" and v.Parent:FindFirstChild("Body") then
                            local num = string.sub(v.Parent.Name, 1, 4)
                            local nume = tonumber(num)
                            if nume == nil then
                                if v.Parent:FindFirstChild("Body"):FindFirstChild("Highlight") then
                                    local Highlight = v.Parent:FindFirstChild("Body"):FindFirstChild("Highlight")
                                    local BillboardGui = v:FindFirstChild("BillboardGui")
                                    Highlight.Enabled = true
                                    BillboardGui.Enabled = true
                                    wait()
                                else
                                    local Highlight = Instance.new("Highlight")
                                    Highlight.Parent = v.Parent:FindFirstChild("Body")
                                    Highlight.Enabled = true
                                    Highlight.FillColor = getgenv().Color
                                    local BillboardGui = Instance.new("BillboardGui")
                                    local TextLabel = Instance.new("TextLabel")
    
                                    BillboardGui.Parent = v
                                    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                    BillboardGui.Active = true
                                    BillboardGui.AlwaysOnTop = true
                                    BillboardGui.LightInfluence = 1.000
                                    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    
                                    TextLabel.Parent = BillboardGui
                                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    TextLabel.BackgroundTransparency = 1.000
                                    TextLabel.Size = UDim2.new(0, 200, 0, 50)
                                    TextLabel.Font = Enum.Font.SourceSans
                                    TextLabel.Text = v.Parent.Name
                                    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
                                    TextLabel.TextSize = 41.000
                                    wait()
                                end
                            end
                        end
                    end)
                    if not succ then
                        break
                    end
                end
            end
        end
    end)
end

--------------Button Functions--------------

--Codes
function redeemall()
    local codes = {"pets","taming", "megarebirth", "lavabeast", "tamepets"}
    for _,v in pairs(codes) do
        local args = {[1] = v}
        game:GetService("ReplicatedStorage").RemoteFunctions.Redeem:InvokeServer(unpack(args))
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/Test.lua"))();

local Window = Library.CreateLib("WFS PWNERS", "Sentinel")

local Tab1 = Window:NewTab("Main")
local Tab2 = Window:NewTab("Misc")

local Section1 = Tab1:NewSection("Farm")
local Section2 = Tab1:NewSection("Pets")
local Section4 = Tab1:NewSection("User")
local Section5 = Tab1:NewSection("Character")
local Section6 = Tab2:NewSection("Misc")

Section2:NewToggle("Pet esp", "Esp on animals lol", function(value)
    getgenv().esp = value
    if value then
        esp()
    end
end)

Section1:NewToggle("Auto sell", "Auto sell", function(value)
    getgenv().asell = value
    if value then
        asell()
    end
end)

Section1:NewToggle("Auto farm wheat", "Auto farm wheat", function(value)
    getgenv().awheat = value
    if value then
        awheat()
    end
end)

Section1:NewToggle("Auto farm golden wheat", "Auto farm golden wheat", function(value)
    getgenv().agold = value
    if value then
        agold()
    end
end)

Section1:NewToggle("Auto farm rainbow wheat", "Auto farm rainbow wheat", function(value)
    getgenv().arainbow = value
    if value then
        arainbow()
    end
end)

Section1:NewToggle("AI auto farm", "a ai that auto farms", function(value)
    getgenv().aifarm = value
    if value then
        aifarm()
    end
end)

Section4:NewButton("Redeem all codes", "Redeem all codes or smth", function()
    redeemall()
end)

Section4:NewToggle("Auto rebirth", "Auto rebirth", function(value)
    getgenv().arebirth = value
    if value then
        arebirth()
    end
end)

Section4:NewToggle("Auto mega rebirth", "Auto mega rebirth", function(value)
    getgenv().amegarebirth = value
    if value then
        amegarebirth()
    end
end)

Section5:NewTextBox("Walkspeed", "Walkspeed yes", function(value)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

Section5:NewTextBox("Fov changer", "Fov changer yes", function(value)
	game.Workspace.Camera.FieldOfView = value
end)

Section2:NewDropdown("Teleport pet", "Teleport to the pet", {"Cat", "Fox", "Bear", "Mouse", "Shadow Dominus", "Bat", "Light Bat", "Bunny", "Shark", "Jellyfish", "Burger", "Ice Golem", "Starfish", "Water Dragon", "Cow", "Spikeball", "Lava Lord", "Reindeer", "Builder", "Snowman", "Mythical Reindeer", "Gumdrop", "Mage", "Baby Dragon", "Anglerfish", "Demonic Dominus", "Panda", "Scorpion", "Koala", "Demon Bat", "Hell Scorpion", "Angel", "Mythical Crab", "Cyborg", "Robot", "Skeleton Deer", "Pig", "Duck", "Crab", "Skeletor Bear", "Skeleton Dog", "Destroyer", "Reaper", "Sea Monster", "Bull", "Octopus Lord", "Pumpkin", "Storm Cloud", "Cloud", "Turkey", "Bee", "Monkey", "Donut", "Strawberry", "Golden Cat", "Dog", "Light Dragon", "Lava Beast", "Octohex", "Buttermyths", "Zombie Dragon", "Zap", "Angelfly", "Bot Overlord", "Ultimus} function(text)
    getgenv().pet = text
end)

Section2:NewButton("Teleport to selected pet", "yes", function()
    for _,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == getgenv().pet then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChildOfClass("Part").Position)
            break
        end
    end
end)

Section2:NewToggle("Auto tame selected pet", "yes", function(value)
    getgenv().atame = value
    if value then
        atame()
    end
end)

Section6:NewKeybind("Toggle the ui lol", "yeah", Enum.KeyCode.F6, function()
	Library:ToggleUI()
end)


Section6:NewButton("Copy discord invite link", "Copies the discord invite link to clipboard (JOIN!!!!)", function()
    setclipboard("https://discord.gg/rQEHvHFGNf")
end)
