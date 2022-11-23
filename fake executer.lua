-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local drag = Instance.new("Frame")
local Frame = Instance.new("Frame")
local nameLabel = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local TextBox = Instance.new("TextBox")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local clear = Instance.new("TextButton")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
local execute = Instance.new("TextButton")
local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
local close = Instance.new("TextButton")
local UITextSizeConstraint_5 = Instance.new("UITextSizeConstraint")
local attachLabel = Instance.new("TextLabel")
local UITextSizeConstraint_6 = Instance.new("UITextSizeConstraint")
local attach = Instance.new("TextButton")
local UITextSizeConstraint_7 = Instance.new("UITextSizeConstraint")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999999999

drag.Name = "drag"
drag.Parent = ScreenGui
drag.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
drag.Position = UDim2.new(0.204787195, 0, 0.224697188, 0)
drag.Size = UDim2.new(0.590425551, 0, 0.583730817, 0)
drag.ZIndex = 999999999

Frame.Parent = drag
Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Frame.Position = UDim2.new(0.0165165626, 0, 0.096876584, 0)
Frame.Size = UDim2.new(0.953453541, 0, 0.770610452, 0)

nameLabel.Name = "nameLabel"
nameLabel.Parent = drag
nameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
nameLabel.BackgroundTransparency = 1.000
nameLabel.Position = UDim2.new(1.86264515e-09, 0, -0.0329002254, 0)
nameLabel.Size = UDim2.new(0.3003003, 0, 0.136239782, 0)
nameLabel.Font = Enum.Font.SourceSans
nameLabel.Text = "PWNER hub executer"
nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
nameLabel.TextScaled = true
nameLabel.TextSize = 30.000
nameLabel.TextWrapped = true

UITextSizeConstraint.Parent = nameLabel
UITextSizeConstraint.MaxTextSize = 27

TextBox.Parent = drag
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0311135873, 0, 0.124327183, 0)
TextBox.Size = UDim2.new(0.917835414, 0, 0.720531523, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top

UITextSizeConstraint_2.Parent = TextBox

clear.Name = "clear"
clear.Parent = drag
clear.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
clear.Position = UDim2.new(0.336336344, 0, 0.878892958, 0)
clear.Size = UDim2.new(0.3003003, 0, 0.104758278, 0)
clear.Font = Enum.Font.SourceSans
clear.Text = "Clear"
clear.TextColor3 = Color3.fromRGB(255, 255, 255)
clear.TextScaled = true
clear.TextSize = 50.000
clear.TextWrapped = true

UITextSizeConstraint_3.Parent = clear
UITextSizeConstraint_3.MaxTextSize = 39

execute.Name = "execute"
execute.Parent = drag
execute.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
execute.Position = UDim2.new(0.0180180185, 0, 0.878892958, 0)
execute.Size = UDim2.new(0.3003003, 0, 0.104758278, 0)
execute.Font = Enum.Font.SourceSans
execute.Text = "Execute"
execute.TextColor3 = Color3.fromRGB(255, 255, 255)
execute.TextScaled = true
execute.TextSize = 50.000
execute.TextWrapped = true

UITextSizeConstraint_4.Parent = execute
UITextSizeConstraint_4.MaxTextSize = 39

close.Name = "close"
close.Parent = drag
close.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
close.BorderSizePixel = 0
close.Position = UDim2.new(0.954955041, 0, 0, 0)
close.Size = UDim2.new(0.0450449511, 0, 0.0720381066, 0)
close.AutoButtonColor = false
close.Font = Enum.Font.SourceSans
close.Text = "x"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.TextScaled = true
close.TextSize = 14.000
close.TextWrapped = true
close.MouseButton1Down:Connect(function()
	ScreenGui:Destroy()
end)

UITextSizeConstraint_5.Parent = close
UITextSizeConstraint_5.MaxTextSize = 27

attachLabel.Name = "attachLabel"
attachLabel.Parent = drag
attachLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
attachLabel.BackgroundTransparency = 1.000
attachLabel.Position = UDim2.new(0.6996997, 0, -0.00928911008, 0)
attachLabel.Size = UDim2.new(0.223723724, 0, 0.104938336, 0)
attachLabel.Visible = false
attachLabel.Font = Enum.Font.SourceSans
attachLabel.Text = "Attached!"
attachLabel.TextColor3 = Color3.fromRGB(38, 255, 0)
attachLabel.TextScaled = true
attachLabel.TextSize = 13.000
attachLabel.TextWrapped = true

UITextSizeConstraint_6.Parent = attachLabel
UITextSizeConstraint_6.MaxTextSize = 39

attach.Name = "attach"
attach.Parent = drag
attach.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
attach.Position = UDim2.new(0.654654562, 0, 0.878892958, 0)
attach.Size = UDim2.new(0.315315485, 0, 0.104758278, 0)
attach.Font = Enum.Font.SourceSans
attach.Text = "Attach"
attach.TextColor3 = Color3.fromRGB(255, 255, 255)
attach.TextScaled = true
attach.TextSize = 50.000
attach.TextWrapped = true

UITextSizeConstraint_7.Parent = attach
UITextSizeConstraint_7.MaxTextSize = 39

-- Scripts:

local function EKQL_fake_script() -- clear.LocalScript 
	local script = Instance.new('LocalScript', clear)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent.TextBox.Text = " "
	end)
end
coroutine.wrap(EKQL_fake_script)()
local function AEKP_fake_script() -- execute.LocalScript 
	local script = Instance.new('LocalScript', execute)

	script.Parent.MouseButton1Down:Connect(function()
		if _G.attach == true then
			loadstring(script.Parent.Parent.TextBox.Text)()
			end
	end)
end
coroutine.wrap(AEKP_fake_script)()
local function DQTC_fake_script() -- drag.LocalScript 
	local script = Instance.new('LocalScript', drag)

	local frame = script.Parent
	frame.Draggable = true
	frame.Active = true
	frame.Selectable = true
end
coroutine.wrap(DQTC_fake_script)()
local function MTNR_fake_script() -- close.LocalScript 
	local script = Instance.new('LocalScript', close)

	local frame = script.Parent
	
	frame.MouseEnter:Connect(function()
		frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	end)
	
	frame.MouseLeave:Connect(function()
		frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	end)
end
coroutine.wrap(MTNR_fake_script)()
local function TTCMMCS_fake_script() -- attach.LocalScript 
	local script = Instance.new('LocalScript', attach)

	script.Parent.MouseButton1Down:Connect(function()
		wait(2.5)
		_G.attach = true
		script.Parent.Parent.attachLabel.Visible = true
	end)
end
coroutine.wrap(TTCMMCS_fake_script)()
