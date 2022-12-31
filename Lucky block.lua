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
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/Test.lua"))();

local Window = Library.CreateLib("Lucky Block PWNERS", "Ocean")

local Tab1 = Window:NewTab("Main")
local Tab2 = Window:NewTab("Misc")

local Section1 = Tab1:NewSection("Main")
local Section2 = Tab2:NewSection("Misc")

Section1:NewButton("Give lucky block item", "gives an item from the normal lucky block", function()
game:GetService("ReplicatedStorage").SpawnLuckyBlock:FireServer()
end)

Section1:NewButton("Give superblock item", "gives an item from the superblock", function()
game:GetService("ReplicatedStorage").SpawnSuperBlock:FireServer()
end)

Section1:NewButton("Give DiamondBlock item", "gives an item from the DiamondBlock", function()
game:GetService("ReplicatedStorage").SpawnDiamondBlock:FireServer()
end)

Section1:NewButton("Give RainbowBlock item", "gives an item from the RainbowBlock", function()
game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
end)

Section1:NewButton("Clear inventory", "Clears your backpack", function()
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
v:Destroy()
end
end)

Section2:NewKeybind("Toggle the ui lol", "yeah", Enum.KeyCode.F6, function()
	Library:ToggleUI()
end)


Section2:NewButton("Copy discord invite link", "Copies the discord invite link to clipboard (JOIN!!!!)", function()
    setclipboard("https://discord.gg/rQEHvHFGNf")
end)
