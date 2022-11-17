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
local Close = Instance.new("TextButton")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
local Copy = Instance.new("TextButton")
local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
local france = Instance.new("TextLabel")
local france2 = Instance.new("TextLabel")
local Load = Instance.new("TextButton")
local UITextSizeConstraint_5 = Instance.new("UITextSizeConstraint")

--Properties:

Loader.Name = "Loader"
Loader.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Loader.DisplayOrder = 999999999

Frame.Parent = Loader
Frame.BackgroundColor3 = Color3.fromRGB(36, 34, 33)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.198103115, 0, 0.155139804, 0)
Frame.Size = UDim2.new(0.521183074, 0, 0.0391608402, 0)
Frame.ZIndex = 100000000

exe.Name = "exe"
exe.Parent = Frame
exe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
exe.BackgroundTransparency = 1.000
exe.Position = UDim2.new(-0.197520569, 0, -2.30193305, 0)
exe.Size = UDim2.new(0.576567352, 0, 5.5354147, 0)
exe.Font = Enum.Font.SourceSans
exe.Text = "zeltales.exe"
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
welcome.Text = "Welcome to france silent aim"
welcome.TextColor3 = Color3.fromRGB(255, 255, 255)
welcome.TextScaled = true
welcome.TextSize = 50.000
welcome.TextWrapped = true

UITextSizeConstraint_2.Parent = welcome
UITextSizeConstraint_2.MaxTextSize = 50

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

UITextSizeConstraint_3.Parent = Close
UITextSizeConstraint_3.MaxTextSize = 40

Copy.Name = "Copy"
Copy.Parent = Frame
Copy.BackgroundColor3 = Color3.fromRGB(21, 56, 255)
Copy.BackgroundTransparency = 0.500
Copy.Position = UDim2.new(0.223926395, 0, 9.73692799, 0)
Copy.Size = UDim2.new(0.523006141, 0, 4.07142878, 0)
Copy.Font = Enum.Font.SourceSans
Copy.Text = "Copy zeltales coordinates"
Copy.TextColor3 = Color3.fromRGB(255, 255, 255)
Copy.TextScaled = true
Copy.TextSize = 45.000
Copy.TextWrapped = true
Copy.MouseButton1Down:Connect(function()
	setclipboard("never gonna give you up")
end)

UITextSizeConstraint_4.Parent = Copy
UITextSizeConstraint_4.MaxTextSize = 45

france.Name = "france"
france.Parent = Frame
france.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
france.BackgroundTransparency = 1.000
france.Position = UDim2.new(0.637072086, 0, 1.29047263, 0)
france.Rotation = 30.000
france.Size = UDim2.new(0, 211, 0, 126)
france.Font = Enum.Font.SourceSans
france.Text = "🇫🇷"
france.TextColor3 = Color3.fromRGB(0, 0, 0)
france.TextSize = 100.000

france2.Name = "france2"
france2.Parent = Frame
france2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
france2.BackgroundTransparency = 1.000
france2.Position = UDim2.new(-0.0899397135, 0, 0.977630854, 0)
france2.Rotation = -30.000
france2.Size = UDim2.new(0, 211, 0, 126)
france2.Font = Enum.Font.SourceSans
france2.Text = "🇫🇷"
france2.TextColor3 = Color3.fromRGB(0, 0, 0)
france2.TextSize = 100.000

Load.Name = "Load"
Load.Parent = Frame
Load.BackgroundColor3 = Color3.fromRGB(21, 56, 255)
Load.BackgroundTransparency = 0.500
Load.Position = UDim2.new(0.22392638, 0, 5.35714293, 0)
Load.Size = UDim2.new(0.523006141, 0, 4.07142878, 0)
Load.Font = Enum.Font.SourceSans
Load.Text = " Load france silent aim"
Load.TextColor3 = Color3.fromRGB(255, 255, 255)
Load.TextScaled = true
Load.TextSize = 45.000
Load.TextWrapped = true
Load.MouseButton1Down:Connect(function()
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local hax = Instance.new("ScreenGui")
	local haxlol = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	local toggle = Instance.new("TextButton")

	--Properties:

	hax.Name = "hax"
	hax.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	hax.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	haxlol.Name = "haxlol"
	haxlol.Parent = hax
	haxlol.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	haxlol.BorderColor3 = Color3.fromRGB(0, 0, 0)
	haxlol.BorderSizePixel = 0
	haxlol.Position = UDim2.new(0.750976562, 0, 0.208269536, 0)
	haxlol.Size = UDim2.new(0.212890625, 0, 0.396630943, 0)

	TextLabel.Parent = haxlol
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0, 0, -0.227799237, 0)
	TextLabel.Size = UDim2.new(0.967889905, 0, 0.621621609, 0)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.Text = "france silent aim!!!!!111!1!!!!🇫🇷🇫🇷🇫🇷🇫🇷🇫🇷🇫🇷🇫🇷"
	TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 20.000
	TextLabel.TextWrapped = true

	UITextSizeConstraint.Parent = TextLabel
	UITextSizeConstraint.MaxTextSize = 14

	toggle.Name = "toggle"
	toggle.Parent = haxlol
	toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	toggle.BorderSizePixel = 0
	toggle.Position = UDim2.new(0.0412844047, 0, 0.285714298, 0)
	toggle.Size = UDim2.new(0.917431176, 0, 0.65250963, 0)
	toggle.Font = Enum.Font.SourceSans
	toggle.Text = ""
	toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
	toggle.TextSize = 14.000

	-- Scripts:

	local function NQESIWD_fake_script() -- toggle.LocalScript 
		local script = Instance.new('LocalScript', toggle)

		toggle = false
		script.Parent.MouseButton1Down:connect(function()

			if toggle == true then 
				toggle = false 
			else
				toggle = true
			end
			if toggle == true then 
				script.Parent.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
			end
			if toggle == false then 
				script.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			end

			if toggle == true then
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
			end
			if toggle == false then 
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
						local MousePos, TheirPos = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 0, workspace.CurrentCamera.ViewportSize.Y / 0), Vector2.new(Pos.X, Pos.Y)
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
			end
		end)
	end
	coroutine.wrap(NQESIWD_fake_script)()
end)

UITextSizeConstraint_5.Parent = Load
UITextSizeConstraint_5.MaxTextSize = 45

-- Scripts:

local function QQIBV_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	frame = script.Parent.Parent.Frame
	frame.Draggable = true
	frame.Active = true
	frame.Selectable = true
end
coroutine.wrap(QQIBV_fake_script)()
