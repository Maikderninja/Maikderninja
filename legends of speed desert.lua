-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local F6 = Instance.new("TextButton")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

F6.Name = "F6"
F6.Parent = ScreenGui
F6.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
F6.BackgroundTransparency = 0.500
F6.Position = UDim2.new(0.806384563, 0, 0.0453872904, 0)
F6.Size = UDim2.new(0.159186631, 0, 0.285657197, 0)
F6.Font = Enum.Font.SourceSans
F6.Text = "Pwnerhub"
F6.TextColor3 = Color3.fromRGB(0, 0, 0)
F6.TextScaled = true
F6.TextSize = 30.000
F6.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
F6.TextStrokeTransparency = 0.000
F6.TextWrapped = true
F6.MouseButton1Down:Connect(function()
game:GetService("VirtualInputManager"):SendKeyEvent(true, "F6" ,false ,game)
end)

UITextSizeConstraint.Parent = F6
UITextSizeConstraint.MaxTextSize = 30

P = game:GetService("Players").LocalPlayer
P.CharacterAdded:Connect(function(char)
    character = char
-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local F6 = Instance.new("TextButton")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

F6.Name = "F6"
F6.Parent = ScreenGui
F6.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
F6.BackgroundTransparency = 0.500
F6.Position = UDim2.new(0.806384563, 0, 0.0453872904, 0)
F6.Size = UDim2.new(0.159186631, 0, 0.285657197, 0)
F6.Font = Enum.Font.SourceSans
F6.Text = "Pwnerhub"
F6.TextColor3 = Color3.fromRGB(0, 0, 0)
F6.TextScaled = true
F6.TextSize = 30.000
F6.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
F6.TextStrokeTransparency = 0.000
F6.TextWrapped = true
F6.MouseButton1Down:Connect(function()
game:GetService("VirtualInputManager"):SendKeyEvent(true, "F6" ,false ,game)
end)

UITextSizeConstraint.Parent = F6
UITextSizeConstraint.MaxTextSize = 30
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/Test.lua"))();

local Window = Library.CreateLib("Legends of speed Desert PWNERS", "Ocean")

local Tab1 = Window:NewTab("Auto farm stuff")
local Tab3 = Window:NewTab("Open crystals")
local Tab4 = Window:NewTab("Misc")

local Section1 = Tab1:NewSection("Auto farm stuff")
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

Section3:NewToggle("Desert Crystal", ".", function(state)
	_G.Blue = (state and true or false)
	wait()
	while _G.Blue == true do
		wait()
		game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", "Desert Crystal")
		end
		end)

Section3:NewToggle("Electro Crystal", ".", function(state)
	_G.Blue = (state and true or false)
	wait()
	while _G.Blue == true do
		wait()
		game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", "Electro Crystal")
		end
		end)


Section4:NewKeybind("Toggle the ui lol", "yeah", Enum.KeyCode.F6, function()
	Library:ToggleUI()
end)


Section4:NewButton("Copy discord invite link", "Copies the discord invite link to clipboard (JOIN!!!!)", function()
    setclipboard("https://discord.gg/rQEHvHFGNf")
end)
