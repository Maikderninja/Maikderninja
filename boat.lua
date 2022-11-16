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

local Window = Library.CreateLib("BABFT PWNERS", "Ocean")

local Tab1 = Window:NewTab("Main")
local Tab2 = Window:NewTab("Misc")

local Section1 = Tab1:NewSection("Main")
local Section2 = Tab2:NewSection("Misc")

Section1:NewToggle("Auto farm", "Auto farms for you", function(value)
-- // Custom Settings
getgenv().TreasureAutoFarm = {
    Enabled = value, -- // Toggle the auto farm on and off
    Teleport = 2, -- // How fast between each teleport between the stages and stuff
    TimeBetweenRuns = 5 -- // How long to wait until it goes to the next run
}

-- // Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

-- // Vars
local LocalPlayer = Players.LocalPlayer

-- // Goes through all of the stages
local autoFarm = function(currentRun)
    -- // Variables
    local Character = LocalPlayer.Character
    local NormalStages = Workspace.BoatStages.NormalStages

    -- // Go to each stage thing
    for i = 1, 10 do
        local Stage = NormalStages["CaveStage" .. i]
        local DarknessPart = Stage:FindFirstChild("DarknessPart")

        if (DarknessPart) then
            -- // Teleport to next stage
            print("Teleporting to next stage: Stage " .. i)
            Character.HumanoidRootPart.CFrame = DarknessPart.CFrame

            -- // Create a temp part under you
            local Part = Instance.new("Part", LocalPlayer.Character)
            Part.Anchored = true
            Part.Position = LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 6, 0)

            -- // Wait and remove temp part
            wait(getgenv().TreasureAutoFarm.Teleport)
            Part:Destroy()
        end
    end

    -- // Go to end
    print("Teleporting to the end")
    repeat wait()
        Character.HumanoidRootPart.CFrame = NormalStages.TheEnd.GoldenChest.Trigger.CFrame
    until Lighting.ClockTime ~= 14

    -- // Wait until you have respawned
    local Respawned = false
    local Connection
    Connection = LocalPlayer.CharacterAdded:Connect(function()
        Respawned = true
        Connection:Disconnect()
    end)

    repeat wait() until Respawned
    wait(getgenv().TreasureAutoFarm.TimeBetweenRuns)
    print("Auto Farm: Run " .. currentRun .. " finished")
end

-- // Whilst the autofarm is enable, constantly do it
local autoFarmRun = 1
while wait() do
    if (getgenv().TreasureAutoFarm.Enabled) then
        print("Initialising Auto Farm: Run " .. autoFarmRun)
        autoFarm(autoFarmRun)
        autoFarmRun = autoFarmRun + 1
    end
end
end)

Section2:NewKeybind("Toggle the ui lol", "yeah", Enum.KeyCode.F6, function()
	Library:ToggleUI()
end)


Section2:NewButton("Copy discord invite link", "Copies the discord invite link to clipboard (JOIN!!!!)", function()
    setclipboard("https://discord.gg/rQEHvHFGNf")
end)
