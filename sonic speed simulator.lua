local runService = game:GetService("RunService")  

getgenv().config = {
    autofarm = {
        autorun = false
    },
    user = {
        autorebirth = false,
        autocollectgifts = false
    },
    event = {
        infinitemooncandy = false
    }
}

function infinitemooncandy()
    while getgenv().config.event.infinitemooncandy do
        wait()
        local args = {
            [1] = "Pumpkin Hill",
            [2] = "1st",
            [3] = "BestRank",
            [4] = 3,
            [5] = true
        }
        game:GetService("ReplicatedStorage").Knit.Services.TrialService.RE.OnStatUpdate:FireServer(unpack(args))
    end
end

function autocollectgifts()
    while getgenv().config.user.autocollectgifts do
        local gifts = {1,2,3,4,5,6,7,8,9,10,11,12}
        for _,v in pairs(gifts) do
            local args = {
                [1] = v
            }

            game:GetService("ReplicatedStorage").Knit.Services.GratitudeService.RF.AcquireReward:InvokeServer(unpack(args))
        end
    end
end

function autorun()
    if getgenv().config.autofarm.autorun then
        conn = runService.RenderStepped:Connect(function()
            if not getgenv().config.autofarm.autorun then
                conn:Disconnect()
            end
            local args = {[1] = {["Character"] = game:GetService("Players").LocalPlayer.Character,["CFrame"] = CFrame.new(-10732.068359375, 114, -5884.9482421875) * CFrame.Angles(-0, 1.3379199504852295, -0),["IsRunning"] = true}}
            game:GetService("ReplicatedStorage").Knit.Services.CharacterService.RE.UpdateCharacterState:FireServer(unpack(args))

            local args = {[1] = {["Character"] = game:GetService("Players").LocalPlayer.Character,["CFrame"] = CFrame.new(-10764.572265625, 114, -5851.15478515625) * CFrame.Angles(-3.1415927410125732, -0.002709831576794386, -3.1415927410125732),["IsRunning"] = true}}
            game:GetService("ReplicatedStorage").Knit.Services.CharacterService.RE.UpdateCharacterState:FireServer(unpack(args))
        end)
    end
end

function autorebirth()
    while getgenv().config.user.autorebirth do
        wait()
        game:GetService("ReplicatedStorage").Knit.Services.LevelingService.RF.AttemptRebirth:InvokeServer()
    end
end

function collectallcurrency()
    for _,v in pairs(game:GetService("Workspace")["World Currencies"]:GetChildren()) do
        local args = {
            [1] = v.Name
        }

        game:GetService("ReplicatedStorage").Knit.Services.WorldCurrencyService.RE.PickupCurrency:FireServer(unpack(args))
    end
end

function completeallobbys()
    local args = {[1] = "Green Hill Obby 1"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.RequestTeleportToZone:InvokeServer(unpack(args))
    wait(0.1)
    local args = {[1] = "Green Hill 1"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.FinishObby:InvokeServer(unpack(args))
    wait(0.1)
    local args = {[1] = "Green Hill Obby 2"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.RequestTeleportToZone:InvokeServer(unpack(args))
    wait(0.1)
    local args = {[1] = "Green Hill 2"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.FinishObby:InvokeServer(unpack(args))
    wait(0.1)
    local args = {[1] = "Green Hill Obby 3"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.RequestTeleportToZone:InvokeServer(unpack(args))
    wait(0.1)
    local args = {[1] = "Green Hill 3"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.FinishObby:InvokeServer(unpack(args))
end

function unlockallworlds()
    local args = {[1] = "Lost Valley"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.RequestTeleportToZone:InvokeServer(unpack(args))
    wait(0.3)
    local args = {[1] = "Emerald Hill"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.RequestTeleportToZone:InvokeServer(unpack(args))
    wait(0.3)
    local args = {[1] = "Snow Valley"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.RequestTeleportToZone:InvokeServer(unpack(args))
    wait(0.3)
    local args = {[1] = "Hill Top Zone"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.RequestTeleportToZone:InvokeServer(unpack(args))
    wait(0.3)
    local args = {[1] = "Lost Valley"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.RequestTeleportToZone:InvokeServer(unpack(args))
    wait(0.3)
    local args = {[1] = "Chemical Plant"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.RequestTeleportToZone:InvokeServer(unpack(args))
    wait(0.3)
    local args = {[1] = "Green Hill"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.RequestTeleportToZone:InvokeServer(unpack(args))
end

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

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/Test.lua"))();

local Window = Library.CreateLib("SPS PWNERS", "Ocean")

local Tab1 = Window:NewTab("Farm")
local Tab2 = Window:NewTab("User")
local Tab3 = Window:NewTab("Event")
local Tab4 = Window:NewTab("Misc")

local Section1 = Tab1:NewSection("Farm")
local Section2 = Tab2:NewSection("User")
local Section3 = Tab3:NewSection("Event")
local Section4 = Tab4:NewSection("Misc")

Section1:NewToggle("Auto run", "Auto run (kinda like auto farm)", function(value)
    getgenv().config.autofarm.autorun = value
    autorun()
end)

Section1:NewToggle("Auto rebirth", "Auto rebirths for you", function(value)
    getgenv().config.user.autorebirth = value
    autorebirth()
end)

Section1:NewButton("Collect all currency", "Auto collects all currency ig", function()
    collectallcurrency()
end)

Section1:NewButton("Complete all obbys", "Auto completes the obbys for you", function()
    completeallobbys()
end)

Section2:NewToggle("Auto collect gifts", "Auto collects gifts for you", function(value)
    getgenv().config.user.autocollectgifts = value
    autocollectgifts()
end)

Section2:NewButton("Unlock all worlds", "Unlocks all worlds for you", function()
    unlockallworlds()
end)

Section2:NewDropdown("Unlock character", "DropdownInf", {"Sonic", "Tails", "Knuckles"}, function(text)
    game:GetService("ReplicatedStorage").Knit.Services.CharacterService.RE.CharacterDied:FireServer()
    wait(0.3)
    local args = {[1] = "Green Hill"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.RequestTeleportToZone:InvokeServer(unpack(args))
    wait(0.5)
    local args = {[1] = "Lost Valley"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.RequestTeleportToZone:InvokeServer(unpack(args))
    wait(0.5)
    local args = {[1] = "Emerald Hill"}
    game:GetService("ReplicatedStorage").Knit.Services.ZoneService.RF.RequestTeleportToZone:InvokeServer(unpack(args))
    wait(0.5)
    local args = {[1] = text}
    game:GetService("ReplicatedStorage").Knit.Services.CharacterService.RE.RequestUnlockCharacter:FireServer(unpack(args))
end)

Section3:NewToggle("Infinite moon medals & candy", "yeah", function(value)
	getgenv().config.event.infinitemooncandy = value
    infinitemooncandy()
end)

Section3:NewButton("Collect 20 hidden purified pearl", "too lazy for that", function()
    local args = {
        [1] = "AddEventProgress",
        [2] = "RougeHeist",
        [3] = "PurifiedPearls",
        [4] = 20
    }

    game:GetService("ReplicatedStorage").Knit.Services.MapStateService.RE.OnStateAction:FireServer(unpack(args))

end)

Section3:NewButton("Instant smash 40 pumpkin roots", "yeah", function()
    local args = {
        [1] = "AddEventProgress",
        [2] = "PumpkinPanic",
        [3] = "Roots",
        [4] = 40
    }

    game:GetService("ReplicatedStorage").Knit.Services.MapStateService.RE.OnStateAction:FireServer(unpack(args))
end)

Section3:NewButton("Instant destroy 60 pumpkin ghosts", "yeah", function()
    local args = {
        [1] = "AddEventProgress",
        [2] = "PumpkinPanic",
        [3] = "PumpkinGhosts",
        [4] = 60
    }

    game:GetService("ReplicatedStorage").Knit.Services.MapStateService.RE.OnStateAction:FireServer(unpack(args))
end)

Section3:NewButton("Turn off security switch", "yeah", function()
    local args = {
        [1] = "RougeHeistSecuritySwitch",
        [2] = 23,
        [3] = "Attacked",
        [4] = "Broken"
    }

    game:GetService("ReplicatedStorage").Knit.Services.MapStateService.RE.OnStateSwitch:FireServer(unpack(args))
end)

Section3:NewButton("Auto find froggy", "yeah", function()
    game:GetService("ReplicatedStorage").Knit.Services.FindFroggyService.RF.AttemptFroggyPickup:InvokeServer()
end)

Section4:NewKeybind("Toggle the ui lol", "yeah", Enum.KeyCode.F6, function()
	Library:ToggleUI()
end)

Section4:NewButton("Copy discord invite link", "Copies the discord invite link to clipboard (JOIN!!!!)", function()
    setclipboard("https://discord.gg/rQEHvHFGNf")
end)
