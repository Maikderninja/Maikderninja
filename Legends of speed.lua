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
Frame.Size = UDim2.new(0, 112, 0, 112)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.Size = UDim2.new(0, 112, 0, 112)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Pwnerhub"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 30.000
TextButton.MouseButton1Down:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true, "F6" ,false ,game)
end)

P = game:GetService("Players").LocalPlayer
P.CharacterAdded:Connect(function(char)
    character = char
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
Frame.Size = UDim2.new(0, 112, 0, 112)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.Size = UDim2.new(0, 112, 0, 112)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Pwnerhub"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 30.000
TextButton.MouseButton1Down:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true, "F6" ,false ,game)
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/Test.lua"))();

local Window = Library.CreateLib("Legends of speed PWNERS", "Ocean")

local Tab1 = Window:NewTab("Auto farm stuff")
local Tab2 = Window:NewTab("Teleport")
local Tab3 = Window:NewTab("Open crystals")
local Tab4 = Window:NewTab("Misc")

local Section1 = Tab1:NewSection("Auto farm stuff")
local Section2 = Tab2:NewSection("Teleport")
local Section3 = Tab3:NewSection("Open crystals")
local Section4 = Tab4:NewSection("Misc")

Section1:NewToggle("Auto farm orbs", ".", function(state)
    _G.Farm = (state and true or false)
	wait()
	while _G.Farm == true do
		wait()
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
		end
		end)

Section1:NewToggle("Auto farm hoops", ".", function(state)
	_G.Hoops = (state and true or false)
	wait()
	while _G.Hoops == true do
		wait()
    local children = workspace.Hoops:GetChildren()
    for i, child in ipairs(children) do
        if child.Name == "Hoop" then
            child.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
        end
        end
end)

Section1:NewToggle("Auto farm gems", ".", function(state)
    _G.Gems = (state and true or false)
	wait()
	while _G.Gems == true do
		wait()
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb","Gem","City")
		end
		end)

Section1:NewToggle("Auto rebirth", ".", function(state)
    _G.Rebirth = (state and true or false)
	wait()
	while _G.Rebirth == true do
		wait()
		game.ReplicatedStorage.rEvents.rebirthEvent:FireServer("rebirthRequest")
		end
		end)

Section1:NewToggle("Auto evolve pet", ".", function(state)
    _G.Evolve = (state and true or false)
	wait()
	while _G.Evolve == true do
		wait()
		game.Replicatedstorage.rEvents.petEvolveEvent:FireServer("evolvePet", "all")
		end
		end)

Section2:NewButton("Spawn", ".", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-559.2, -7.45058e-08, 417.4))
end)

Section2:NewButton("Snow city", ".", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-858.358, 0.5, 2170.35))
end)

Section2:NewButton("Magma city", ".", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(1707.25, 0.550008, 4331.05))
end)

Section2:NewButton("Legends highway", ".", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(3594.68, 214.804, 7274.56))
end)

Section3:NewToggle("Blue crystal", ".", function(state)
	_G.Blue = (state and true or false)
	wait()
	while _G.Blue == true do
		wait()
		game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", "Blue Crystal")
		end
		end)

Section3:NewToggle("Electro Legends Crystal", ".", function(state)
    _G.Electro = (state and true or false)
    wait()
    while _G.Electro == true do
    wait()
    game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", "Electro Legends Crystal")
    end
end)

Section3:NewToggle("Inferno Crystal", ".", function(state)
    _G.Inferno = (state and true or false)
    wait()
    while _G.Inferno == true do
    wait()
    game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", "Inferno Crystal")
    end
end)

Section3:NewToggle("Lava Crystal", ".", function(state)
    _G.Lava = (state and true or false)
    wait()
    while _G.Lava == true do
    wait()
    game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", "Lava Crystal")
    end
end)

Section3:NewToggle("Lightning Crystal", ".", function(state)
    _G.Lightning = (state and true or false)
    wait()
    while _G.Lightning == true do
    wait()
    game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", "Lightning Crystal")
    end
end)

Section3:NewToggle("Purple Crystal", ".", function(state)
    _G.Purple = (state and true or false)
    wait()
    while _G.Purple == true do
    wait()
    game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", "Purple Crystal")
    end
end)

Section3:NewToggle("Red Crystal", ".", function(state)
    _G.Red = (state and true or false)
    wait()
    while _G.Red == true do
    wait()
    game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", "Red Crystal")
    end
end)

Section3:NewToggle("Snow Crystal", ".", function(state)
    _G.Snow = (state and true or false)
    wait()
    while _G.Snow == true do
    wait()
    game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", "Snow Crystal")
    end
end)

Section3:NewToggle("Yellow Crystal", ".", function(state)
    _G.Yellow = (state and true or false)
    wait()
    while _G.Yellow == true do
    wait()
    game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", "Yellow Crystal")
    end
end)

Section4:NewKeybind("Toggle the ui lol", "yeah", Enum.KeyCode.F6, function()
	Library:ToggleUI()
end)


Section4:NewButton("Copy discord invite link", "Copies the discord invite link to clipboard (JOIN!!!!)", function()
    setclipboard("https://discord.gg/rQEHvHFGNf")
end)
