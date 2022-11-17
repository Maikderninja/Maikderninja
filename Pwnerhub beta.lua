-- Gui to Lua
-- Version: 3.2

-- Instances:

local Loader = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local exe = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local backround = Instance.new("ImageLabel")
local welcome = Instance.new("TextLabel")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local Load = Instance.new("TextButton")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
local Close = Instance.new("TextButton")
local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
local Copy = Instance.new("TextButton")
local UITextSizeConstraint_5 = Instance.new("UITextSizeConstraint")

--Properties:

Loader.Name = "Loader"
Loader.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Loader.DisplayOrder = 999999999

Frame.Parent = Loader
Frame.BackgroundColor3 = Color3.fromRGB(36, 34, 33)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.244001552, 0, 0.194956034, 0)
Frame.Size = UDim2.new(0.521183074, 0, 0.0391608402, 0)
Frame.ZIndex = 100000000

exe.Name = "exe"
exe.Parent = Frame
exe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
exe.BackgroundTransparency = 1.000
exe.Position = UDim2.new(-0.000777669251, 0, -0.463987261, 0)
exe.Size = UDim2.new(0.30674848, 0, 1.78571427, 0)
exe.Font = Enum.Font.SourceSans
exe.Text = "PWNER hub V3.exe"
exe.TextColor3 = Color3.fromRGB(255, 255, 255)
exe.TextScaled = true
exe.TextSize = 20.000
exe.TextWrapped = true

UITextSizeConstraint.Parent = exe
UITextSizeConstraint.MaxTextSize = 20

backround.Name = "backround"
backround.Parent = Frame
backround.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
backround.BorderSizePixel = 0
backround.Position = UDim2.new(-0.00031067431, 0, 0.973583341, 0)
backround.Size = UDim2.new(1, 0, 13.4285717, 0)
backround.Image = "rbxassetid://11582037548"

welcome.Name = "welcome"
welcome.Parent = backround
welcome.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
welcome.BackgroundTransparency = 1.000
welcome.Position = UDim2.new(0.26914379, 0, 0.0288753528, 0)
welcome.Size = UDim2.new(0.415954888, 0, 0.276283294, 0)
welcome.Font = Enum.Font.SourceSans
welcome.Text = "Welcome to PWNER hub V3!"
welcome.TextColor3 = Color3.fromRGB(255, 255, 255)
welcome.TextScaled = true
welcome.TextSize = 50.000
welcome.TextWrapped = true

UITextSizeConstraint_2.Parent = welcome
UITextSizeConstraint_2.MaxTextSize = 50

Load.Name = "Load"
Load.Parent = Frame
Load.BackgroundColor3 = Color3.fromRGB(21, 56, 255)
Load.BackgroundTransparency = 0.500
Load.Position = UDim2.new(0.22392638, 0, 5.35714293, 0)
Load.Size = UDim2.new(0.523006141, 0, 4.07142878, 0)
Load.Font = Enum.Font.SourceSans
Load.Text = "Load PWNER hub V3"
Load.TextColor3 = Color3.fromRGB(255, 255, 255)
Load.TextScaled = true
Load.TextSize = 45.000
Load.TextWrapped = true
Load.MouseButton1Down:Connect(function()
	if game.PlaceId == 286090429 then
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/Wjdhfhe.lua"), true))()
	end
	if game.PlaceId == 3956818381 then
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/ninja%20legends.lua"), true))()
	end
	if game.PlaceId == 10106105124 then
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/wfs.lua"), true))()
	end
	if game.PlaceId == 537413528 then
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/boat.lua"), true))()
	end
	if game.PlaceId == 3101667897 then
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/Legends%20of%20speed.lua"), true))()
	end
	if game.PlaceId == 3276265788 then
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/legends%20of%20speed%20desert.lua"), true))()
	end
	Loader:Destroy()
end)

UITextSizeConstraint_3.Parent = Load
UITextSizeConstraint_3.MaxTextSize = 45

Close.Name = "Close"
Close.Parent = Frame
Close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Close.BackgroundTransparency = 0.500
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.937116563, 0, 0, 0)
Close.Size = UDim2.new(0.0628834367, 0, 1, 0)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 40.000
Close.TextWrapped = true
Close.MouseButton1Down:Connect(function()
	Loader:Destroy()
end)

UITextSizeConstraint_4.Parent = Close
UITextSizeConstraint_4.MaxTextSize = 40

Copy.Name = "Copy"
Copy.Parent = Frame
Copy.BackgroundColor3 = Color3.fromRGB(21, 56, 255)
Copy.BackgroundTransparency = 0.500
Copy.Position = UDim2.new(0.223926395, 0, 9.73692799, 0)
Copy.Size = UDim2.new(0.523006141, 0, 4.07142878, 0)
Copy.Font = Enum.Font.SourceSans
Copy.Text = "Copy discord invite link"
Copy.TextColor3 = Color3.fromRGB(255, 255, 255)
Copy.TextScaled = true
Copy.TextSize = 45.000
Copy.TextWrapped = true
Copy.MouseButton1Down:Connect(function()
	setclipboard("https://discord.gg/rQEHvHFGNf")
end)

UITextSizeConstraint_5.Parent = Copy
UITextSizeConstraint_5.MaxTextSize = 45

-- Scripts:

local function IODIX_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	frame = script.Parent.Parent.Frame
	frame.Draggable = true
	frame.Active = true
	frame.Selectable = true
end
coroutine.wrap(IODIX_fake_script)()
