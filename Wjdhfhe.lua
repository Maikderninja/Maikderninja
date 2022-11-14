-- Gui to Lua
-- Version: 3.2

-- Instances:

local Chose = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local HighEnd = Instance.new("TextButton")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local LowEnd = Instance.new("TextButton")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
local TextLabel_2 = Instance.new("TextLabel")
local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
local TextLabel_3 = Instance.new("TextLabel")
local UITextSizeConstraint_5 = Instance.new("UITextSizeConstraint")

--Properties:

Chose.Name = "Chose"
Chose.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Chose.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Chose
Frame.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
Frame.Position = UDim2.new(0.299120247, 0, 0.215926498, 0)
Frame.Size = UDim2.new(0.441837728, 0, 0.718223572, 0)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.165929198, 0, 0, 0)
TextLabel.Size = UDim2.new(0.577433646, 0, 0.185501069, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Choose your device"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 40.000
TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextStrokeTransparency = 0.000
TextLabel.TextWrapped = true

UITextSizeConstraint.Parent = TextLabel
UITextSizeConstraint.MaxTextSize = 86

HighEnd.Name = "HighEnd"
HighEnd.Parent = Frame
HighEnd.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
HighEnd.Position = UDim2.new(0.252212375, 0, 0.211087421, 0)
HighEnd.Size = UDim2.new(0.440265477, 0, 0.106609806, 0)
HighEnd.Font = Enum.Font.SourceSans
HighEnd.Text = "High end"
HighEnd.TextColor3 = Color3.fromRGB(0, 0, 0)
HighEnd.TextScaled = true
HighEnd.TextSize = 40.000
HighEnd.TextWrapped = true
HighEnd.MouseButton1Down:Connect(function()
	Chose:Destroy()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/High%20end%20arsenal.lua"), true))()
end)


UITextSizeConstraint_2.Parent = HighEnd
UITextSizeConstraint_2.MaxTextSize = 50

LowEnd.Name = "LowEnd"
LowEnd.Parent = Frame
LowEnd.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
LowEnd.Position = UDim2.new(0.252212375, 0, 0.377398729, 0)
LowEnd.Size = UDim2.new(0.440265477, 0, 0.106609806, 0)
LowEnd.Font = Enum.Font.SourceSans
LowEnd.Text = "Low end"
LowEnd.TextColor3 = Color3.fromRGB(0, 0, 0)
LowEnd.TextScaled = true
LowEnd.TextSize = 40.000
LowEnd.TextWrapped = true
LowEnd.MouseButton1Down:Connect(function()
	Chose:Destroy()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/Low%20end%20arsenal.lua"), true))()
end)

UITextSizeConstraint_3.Parent = LowEnd
UITextSizeConstraint_3.MaxTextSize = 50

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.210176989, 0, 0.498933911, 0)
TextLabel_2.Size = UDim2.new(0.557522118, 0, 0.185501069, 0)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "High end are for good phones."
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 40.000
TextLabel_2.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextStrokeTransparency = 0.000
TextLabel_2.TextWrapped = true

UITextSizeConstraint_4.Parent = TextLabel_2
UITextSizeConstraint_4.MaxTextSize = 86

TextLabel_3.Parent = Frame
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.Position = UDim2.new(0.210176989, 0, 0.705756903, 0)
TextLabel_3.Size = UDim2.new(0.577433646, 0, 0.185501069, 0)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "Low end are for bad phones."
TextLabel_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 40.000
TextLabel_3.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextStrokeTransparency = 0.000
TextLabel_3.TextWrapped = true

UITextSizeConstraint_5.Parent = TextLabel_3
UITextSizeConstraint_5.MaxTextSize = 86
