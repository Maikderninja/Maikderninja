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

P = game:GetService("Players").LocalPlayer
P.CharacterAdded:Connect(function(char)
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

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/Test.lua"))();

local Window = Library.CreateLib("Ninja legends PWNERS", "Ocean")

local Tab1 = Window:NewTab("Main")
local Tab2 = Window:NewTab("Misc")

local Section1 = Tab1:NewSection("Main")
local Section2 = Tab2:NewSection("Misc")

Section1:NewToggle("Auto swing", "Auto swing (auto farm)", function(v)
    getgenv().autoswing = v
    while true do
        if not getgenv().autoswing then return end
        for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:FindFirstChild("ninjitsuGain") then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                break
            end
        end
        local A_1 = "swingKatana"
        local Event = game:GetService("Players").LocalPlayer.ninjaEvent
        Event:FireServer(A_1)   
        wait(0.1)
    end
end)

Section1:NewToggle("Auto sell", "Auto sell (auot farm too)", function(v)
    getgenv().autosell = v
    while true do
        if getgenv().autosell == false then return end
        game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(0.0)
        game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
        wait(0.0)
    end
end)

Section1:NewToggle("Auto buy swords", "Auto buy swords", function(v)
    getgenv().buyswords = v
    while true do
        if not getgenv().buyswords then return end
        local A_1 = "buyAllSwords"
        local A_2 = "Blazing Vortex Island"
        local Event = game:GetService("Players").LocalPlayer.ninjaEvent
        Event:FireServer(A_1, A_2)
        wait(0.5)
    end
end)

Section1:NewToggle("Auto buy betls", "Auto buy belts", function(v)
    getgenv().buybelts = v
    while true do
        if not getgenv().buybelts then return end
        local A_1 = "buyAllBelts"
        local A_2 = "Blazing Vortex Island"
        local Event = game:GetService("Players").LocalPlayer.ninjaEvent
        Event:FireServer(A_1, A_2)
        wait(0.5)
    end
end)

Section1:NewToggle("Auto buy ranks", "Auto buy ranks", function(State)
    Ranks = State
    while Ranks do
    wait(1)
    local deku1 = "buyRank"
    local deku2 = {"Rookie", "Grasshopper", "Apprentice", "Samurai", "Assassin", "Shadow", "Ninja", "Master Ninja", "Sensei", "Master Sensei", "Ninja Legend", "Master Of Shadows", "Immortal Assassin", "Eternity Hunter", "Shadow Legend", "Dragon Warrior", "Dragon Master", "Chaos Sensei", "Chaos Legend", "Master Of Elements"
    , "Elemental Legend", "Ancient Battle Master", "Ancient Battle Legend", "Legendary Shadow Duelist", "Master Legend Assassin", "Mythic Shadowmaster", "Legendary Shadowmaster", "Awakened Scythemaster", "Awakened Scythe Legend", "Master Legend Zephyr", "Golden Sun Shuriken Master", "Golden Sun Shuriken Legend", "Dark Sun Samurai Legend", "Dragon Evolution Form I", "Dragon Evolution Form II", "Dragon Evolution Form III", "Dragon Evolution Form IV",
    "Dragon Evolution Form V", "Cybernetic Electro Master", "Cybernetic Electro Legend", "Shadow Chaos Assassin", "Shadow Chaos Legend", "Infinity Sensei", "Infinity Legend", "Aether Genesis Master Ninja", "Master Legend Sensei Hunter", "Skystorm Series Samurai Legend", "Master Elemental Hero", "Eclipse Series Soul Master",
    "Starstrike Master Sensei", "Evolved Series Master Ninja", "Dark Elements Guardian", "Elite Series Master Legend", "Infinity Shadows Master", "Lightning Storm Sensei", "Dark Elements Blademaster", "Rising Shadow Eternal Ninja", "Skyblade Ninja Master", "Shadow Storm Sensei", }
        
    for i = 1, #deku2 do
    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(deku1, deku2[i])
    end
    end
end)

Section1:NewButton("Unlock all islands", "Unlock all islands", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Enchanted Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Astral Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Mystical Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Space Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Tundra Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Eternal Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Sandstorm"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Thunderstorm"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Ancient Inferno Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Midnight Shadow Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Mythical Souls Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Winter Wonder Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Golden Master Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Dragon Legend Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Cybernetic Legends Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Skystorm Ultraus Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Chaos Legends Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Soul Fusion Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Dark Elements Island"].CFrame
    wait(0.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").islandUnlockParts["Blazing Vortex Island"].CFrame
  end)

Section1:NewButton("Get all elements", "get all elements with 1 click!", function()
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Frost")
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Shadow Charge")
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Shadowfire")
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Lightning")
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Inferno")
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Masterful Wrath")
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Electrical Chaos")
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Blazing Entity")
    game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer("Eternity Storm")
end)

Section2:NewKeybind("Toggle ui", "Toogle the ui lol", Enum.KeyCode.F6, function()
    Library:ToggleUI()
end)

Section2:NewButton("Copy discord invite link", "Copies the discord invite link to clipboard (JOIN!!!!)", function()
    setclipboard("https://discord.gg/rQEHvHFGNf")
end)
