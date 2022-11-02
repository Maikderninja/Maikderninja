local function API_Check()

    if Drawing == nil then

        return "No"

    else

        return "Yes"

    end

end



local Find_Required = API_Check()



if Find_Required == "No" then

    game:GetService("StarterGui"):SetCore("SendNotification",{

        Title = "An error lol";

        Text = "Boxes script could not be loaded because your exploit is unsupported.";

        Duration = math.huge;

        Button1 = "OK"

    })



    return

end



local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local Camera = workspace.CurrentCamera



local Typing = false



_G.SendNotifications = false   -- If set to true then the script would notify you frequently on any changes applied and when loaded / errored. (If a game can detect this, it is recommended to set it to false)

_G.DefaultSettings = false   -- If set to true then the boxes script would run with default settings regardless of any changes you made.



_G.TeamCheck = false   -- If set to true then the script would create boxes only for the enemy team members.



_G.BoxesVisible = true   -- If set to true then the boxes will be visible and vice versa.

_G.LineColor = Color3.fromRGB(255, 255, 255)   -- The color that the boxes would appear as.

_G.LineThickness = 1   -- The thickness of the boxes.

_G.LineTransparency = 0.7   -- The transparency of the boxes.

_G.SizeIncrease = 1   -- How much the box's size is increased (The size is multiplied by the value of this variable). (1 is default, anything more then 2 is not recommended) <float> / <int>



_G.DisableKey = Enum.KeyCode.RightAlt   -- The key that disables / enables the boxes.



local function CreateBoxes()

    for _, v in next, Players:GetPlayers() do

        if v.Name ~= Players.LocalPlayer.Name then

            local TopLeftLine = Drawing.new("Line")

            local TopRightLine = Drawing.new("Line")

            local BottomLeftLine = Drawing.new("Line")

            local BottomRightLine = Drawing.new("Line")



            RunService.RenderStepped:Connect(function()

                if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then 

                    TopLeftLine.Thickness = _G.LineThickness

                    TopLeftLine.Transparency = _G.LineTransparency

                    TopLeftLine.Color = _G.LineColor



                    TopRightLine.Thickness = _G.LineThickness

                    TopRightLine.Transparency = _G.LineTransparency

                    TopRightLine.Color = _G.LineColor



                    BottomLeftLine.Thickness = _G.LineThickness

                    BottomLeftLine.Transparency = _G.LineTransparency

                    BottomLeftLine.Color = _G.LineColor



                    BottomRightLine.Thickness = _G.LineThickness

                    BottomRightLine.Transparency = _G.LineTransparency

                    BottomRightLine.Color = _G.LineColor

                    

                    local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * _G.SizeIncrease



                    local TopLeftPosition, TopLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)

                    local TopRightPosition, TopRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)

                    local BottomLeftPosition, BottomLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)

                    local BottomRightPosition, BottomRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)



                    if TopLeftVisible == true then

                        TopLeftLine.From = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)

                        TopLeftLine.To = Vector2.new(TopRightPosition.X, TopRightPosition.Y)

                        if _G.TeamCheck == true then 

                            if Players.LocalPlayer.Team ~= v.Team then

                                TopLeftLine.Visible = _G.BoxesVisible

                            else

                                TopLeftLine.Visible = false

                            end

                        else

                            TopLeftLine.Visible = _G.BoxesVisible

                        end

                    else

                        TopLeftLine.Visible = false

                    end



                    if TopRightVisible == true and _G.BoxesVisible == true then

                        TopRightLine.From = Vector2.new(TopRightPosition.X, TopRightPosition.Y)

                        TopRightLine.To = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)

                        if _G.TeamCheck == true then 

                            if Players.LocalPlayer.Team ~= v.Team then

                                TopRightLine.Visible = _G.BoxesVisible

                            else

                                TopRightLine.Visible = false

                            end

                        else

                            TopRightLine.Visible = _G.BoxesVisible

                        end

                    else

                        TopRightLine.Visible = false

                    end



                    if BottomLeftVisible == true and _G.BoxesVisible == true then

                        BottomLeftLine.From = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)

                        BottomLeftLine.To = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)

                        if _G.TeamCheck == true then 

                            if Players.LocalPlayer.Team ~= v.Team then

                                BottomLeftLine.Visible = _G.BoxesVisible

                            else

                                BottomLeftLine.Visible = false

                            end

                        else

                            BottomLeftLine.Visible = _G.BoxesVisible

                        end

                    else

                        BottomLeftLine.Visible = false

                    end



                    if BottomRightVisible == true and _G.BoxesVisible == true then

                        BottomRightLine.From = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)

                        BottomRightLine.To = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)

                        if _G.TeamCheck == true then 

                            if Players.LocalPlayer.Team ~= v.Team then

                                BottomRightLine.Visible = _G.BoxesVisible

                            else

                                BottomRightLine.Visible = false

                            end

                        else

                            BottomRightLine.Visible = _G.BoxesVisible

                        end

                    else

                        BottomRightLine.Visible = false

                    end

                else

                    TopRightLine.Visible = false

                    TopLeftLine.Visible = false

                    BottomLeftLine.Visible = false

                    BottomRightLine.Visible = false

                end

            end)



            Players.PlayerRemoving:Connect(function()

                TopRightLine.Visible = false

                TopLeftLine.Visible = false

                BottomLeftLine.Visible = false

                BottomRightLine.Visible = false

            end)

        end

    end



    Players.PlayerAdded:Connect(function(Player)

        Player.CharacterAdded:Connect(function(v)

            if v.Name ~= Players.LocalPlayer.Name then

                local TopLeftLine = Drawing.new("Line")

                local TopRightLine = Drawing.new("Line")

                local BottomLeftLine = Drawing.new("Line")

                local BottomRightLine = Drawing.new("Line")

    

                RunService.RenderStepped:Connect(function()

                    if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then 

                        TopLeftLine.Thickness = _G.LineThickness

                        TopLeftLine.Transparency = _G.LineTransparency

                        TopLeftLine.Color = _G.LineColor

    

                        TopRightLine.Thickness = _G.LineThickness

                        TopRightLine.Transparency = _G.LineTransparency

                        TopRightLine.Color = _G.LineColor

    

                        BottomLeftLine.Thickness = _G.LineThickness

                        BottomLeftLine.Transparency = _G.LineTransparency

                        BottomLeftLine.Color = _G.LineColor

    

                        BottomRightLine.Thickness = _G.LineThickness

                        BottomRightLine.Transparency = _G.LineTransparency

                        BottomRightLine.Color = _G.LineColor

                        

                        local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * _G.SizeIncrease

    

                        local TopLeftPosition, TopLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)

                        local TopRightPosition, TopRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)

                        local BottomLeftPosition, BottomLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)

                        local BottomRightPosition, BottomRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)

    

                        if TopLeftVisible == true then

                            TopLeftLine.From = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)

                            TopLeftLine.To = Vector2.new(TopRightPosition.X, TopRightPosition.Y)

                            if _G.TeamCheck == true then 

                                if Players.LocalPlayer.Team ~= Player.Team then

                                    TopLeftLine.Visible = _G.BoxesVisible

                                else

                                    TopLeftLine.Visible = false

                                end

                            else

                                TopLeftLine.Visible = _G.BoxesVisible

                            end

                        else

                            TopLeftLine.Visible = false

                        end

    

                        if TopRightVisible == true and _G.BoxesVisible == true then

                            TopRightLine.From = Vector2.new(TopRightPosition.X, TopRightPosition.Y)

                            TopRightLine.To = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)

                            if _G.TeamCheck == true then 

                                if Players.LocalPlayer.Team ~= Player.Team then

                                    TopRightLine.Visible = _G.BoxesVisible

                                else

                                    TopRightLine.Visible = false

                                end

                            else

                                TopRightLine.Visible = _G.BoxesVisible

                            end

                        else

                            TopRightLine.Visible = false

                        end

    

                        if BottomLeftVisible == true and _G.BoxesVisible == true then

                            BottomLeftLine.From = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)

                            BottomLeftLine.To = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)

                            if _G.TeamCheck == true then 

                                if Players.LocalPlayer.Team ~= Player.Team then

                                    BottomLeftLine.Visible = _G.BoxesVisible

                                else

                                    BottomLeftLine.Visible = false

                                end

                            else

                                BottomLeftLine.Visible = _G.BoxesVisible

                            end

                        else

                            BottomLeftLine.Visible = false

                        end

    

                        if BottomRightVisible == true and _G.BoxesVisible == true then

                            BottomRightLine.From = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)

                            BottomRightLine.To = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)

                            if _G.TeamCheck == true then 

                                if Players.LocalPlayer.Team ~= Player.Team then

                                    BottomRightLine.Visible = _G.BoxesVisible

                                else

                                    BottomRightLine.Visible = false

                                end

                            else

                                BottomRightLine.Visible = _G.BoxesVisible

                            end

                        else

                            BottomRightLine.Visible = false

                        end

                    else

                        TopRightLine.Visible = false

                        TopLeftLine.Visible = false

                        BottomLeftLine.Visible = false

                        BottomRightLine.Visible = false

                    end

                end)

    

                Players.PlayerRemoving:Connect(function()

                    TopRightLine.Visible = false

                    TopLeftLine.Visible = false

                    BottomLeftLine.Visible = false

                    BottomRightLine.Visible = false

                end)

            end

        end)

    end)

end



if _G.DefaultSettings == true then

    _G.TeamCheck = false

    _G.BoxesVisible = rue

    _G.LineColor = Color3.fromRGB(40, 90, 255)

    _G.LineThickness = 1

    _G.LineTransparency = 0.5

    _G.SizeIncrease = 1.5

    _G.DisableKey = Enum.KeyCode.Q

end



UserInputService.TextBoxFocused:Connect(function()

    Typing = true

end)



UserInputService.TextBoxFocusReleased:Connect(function()

    Typing = false

end)



UserInputService.InputBegan:Connect(function(Input)

    if Input.KeyCode == _G.DisableKey and Typing == false then

        _G.BoxesVisible = not _G.BoxesVisible

        

        if _G.SendNotifications == true then

            game:GetService("StarterGui"):SetCore("SendNotification",{

                Title = "Exunys Developer";

                Text = "The boxes' visibility is now set to "..tostring(_G.BoxesVisible)..".";

                Duration = 5;

            })

        end

    end

end)



local Success, Errored = pcall(function()

    CreateBoxes()

end)



if Success and not Errored then

    if _G.SendNotifications == true then

        game:GetService("StarterGui"):SetCore("SendNotification",{

            Title = "Maik";

            Text = "Boxes script has successfully loaded.";

            Duration = 5;

        })

    end

elseif Errored and not Success then

    if _G.SendNotifications == true then

        game:GetService("StarterGui"):SetCore("SendNotification",{

            Title = "Exunys Developer";

            Text = "Boxes script has errored while loading, please check the developer console! (F9)";

            Duration = 5;

        })

    end

    TestService:Message("The boxes script has errored, please notify Exunys with the following information :")

    warn(Errored)

    print("!! IF THE ERROR IS A FALSE POSITIVE (says that a player cannot be found) THEN DO NOT BOTHER !!")

end

local function API_Check()

    if Drawing == nil then

        return "No"

    else

        return "Yes"

    end

end



local Find_Required = API_Check()



if Find_Required == "No" then

    game:GetService("StarterGui"):SetCore("SendNotification",{

        Title = "An error lol";

        Text = "ESP script could not be loaded because your exploit is unsupported.";

        Duration = math.huge;

        Button1 = "OK"

    })



    return

end



local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local Camera = workspace.CurrentCamera



local Typing = false



_G.SendNotifications = false   -- If set to true then the script would notify you frequently on any changes applied and when loaded / errored. (If a game can detect this, it is recommended to set it to false)

_G.DefaultSettings = false   -- If set to true then the ESP script would run with default settings regardless of any changes you made.



_G.TeamCheck = false   -- If set to true then the script would create ESP only for the enemy team members.



_G.ESPVisible = true   -- If set to true then the ESP will be visible and vice versa.

_G.TextColor = Color3.fromRGB(255, 255, 255)  -- The color that the boxes would appear as.

_G.TextSize = 14   -- The size of the text.

_G.Center = true   -- If set to true then the script would be located at the center of the label.

_G.Outline = false   -- If set to true then the text would have an outline.

_G.OutlineColor = Color3.fromRGB(0, 0, 0)   -- The outline color of the text.

_G.TextTransparency = 0.7   -- The transparency of the text.

_G.TextFont = Drawing.Fonts.UI   -- The font of the text. (UI, System, Plex, Monospace) 



_G.DisableKey = Enum.KeyCode.RightAlt   -- The key that disables / enables the ESP.



local function CreateESP()

    for _, v in next, Players:GetPlayers() do

        if v.Name ~= Players.LocalPlayer.Name then

            local ESP = Drawing.new("Text")



            RunService.RenderStepped:Connect(function()

                if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then

                    local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)



                    ESP.Size = _G.TextSize

                    ESP.Center = _G.Center

                    ESP.Outline = _G.Outline

                    ESP.OutlineColor = _G.OutlineColor

                    ESP.Color = _G.TextColor

                    ESP.Transparency = _G.TextTransparency

                    ESP.Font = _G.TextFont



                    if OnScreen == true then

                        local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position

                        local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0

                        local Dist = (Part1 - Part2).Magnitude

                        ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)

                        ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")

                        if _G.TeamCheck == true then 

                            if Players.LocalPlayer.Team ~= v.Team then

                                ESP.Visible = _G.ESPVisible

                            else

                                ESP.Visible = false

                            end

                        else

                            ESP.Visible = _G.ESPVisible

                        end

                    else

                        ESP.Visible = false

                    end

                else

                    ESP.Visible = false

                end

            end)



            Players.PlayerRemoving:Connect(function()

                ESP.Visible = false

            end)

        end

    end



    Players.PlayerAdded:Connect(function(Player)

        Player.CharacterAdded:Connect(function(v)

            if v.Name ~= Players.LocalPlayer.Name then 

                local ESP = Drawing.new("Text")

    

                RunService.RenderStepped:Connect(function()

                    if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then

                        local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)

    

                        ESP.Size = _G.TextSize

                        ESP.Center = _G.Center

                        ESP.Outline = _G.Outline

                        ESP.OutlineColor = _G.OutlineColor

                        ESP.Color = _G.TextColor

                        ESP.Transparency = _G.TextTransparency

    

                        if OnScreen == true then

                            local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position

                        local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0

                            local Dist = (Part1 - Part2).Magnitude

                            ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)

                            ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")

                            if _G.TeamCheck == true then 

                                if Players.LocalPlayer.Team ~= Player.Team then

                                    ESP.Visible = _G.ESPVisible

                                else

                                    ESP.Visible = false

                                end

                            else

                                ESP.Visible = _G.ESPVisible

                            end

                        else

                            ESP.Visible = false

                        end

                    else

                        ESP.Visible = false

                    end

                end)

    

                Players.PlayerRemoving:Connect(function()

                    ESP.Visible = false

                end)

            end

        end)

    end)

end



if _G.DefaultSettings == true then

    _G.TeamCheck = false

    _G.ESPVisible = true

    _G.TextColor = Color3.fromRGB(40, 90, 255)

    _G.TextSize = 14

    _G.Center = true

    _G.Outline = false

    _G.OutlineColor = Color3.fromRGB(0, 0, 0)

    _G.DisableKey = Enum.KeyCode.Q

    _G.TextTransparency = 0.75

end



UserInputService.TextBoxFocused:Connect(function()

    Typing = true

end)



UserInputService.TextBoxFocusReleased:Connect(function()

    Typing = false

end)



UserInputService.InputBegan:Connect(function(Input)

    if Input.KeyCode == _G.DisableKey and Typing == false then

        _G.ESPVisible = not _G.ESPVisible

        

        if _G.SendNotifications == true then

            game:GetService("StarterGui"):SetCore("SendNotification",{

                Title = "Exunys Developer";

                Text = "The ESP's visibility is now set to "..tostring(_G.ESPVisible)..".";

                Duration = 5;

            })

        end

    end

end)



local Success, Errored = pcall(function()

    CreateESP()

end)



if Success and not Errored then

    if _G.SendNotifications == true then

        game:GetService("StarterGui"):SetCore("SendNotification",{

            Title = "Epic gamer esp";

            Text = "Epic gamer esp has been successful loaded";

            Duration = 5;

        })

    end

elseif Errored and not Success then

    if _G.SendNotifications == true then

        game:GetService("StarterGui"):SetCore("SendNotification",{

            Title = "Ash01 Developer";

            Text = "ESP script has errored while loading, please check the developer console! (F9)";

            Duration = 5;

        })

    end

    TestService:Message("The ESP script has errored, please notify Ash01 with the following information :")

    warn(Errored)

    print("!! IF THE ERROR IS A FALSE POSITIVE (says that a player cannot be found) THEN DO NOT BOTHER !!")

end

local function API_Check()
            if Drawing == nil then
                return "No"
            else
                return "Yes"
            end
        end
        
        local Find_Required = API_Check()
        
        if Find_Required == "No" then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "An error lol";
                Text = "Tracer script could not be loaded because your exploit is unsupported.";
                Duration = math.huge;
                Button1 = "OK"
            })
        
            return
        end
        
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local Camera = game:GetService("Workspace").CurrentCamera
        local UserInputService = game:GetService("UserInputService")
        local TestService = game:GetService("TestService")
        
        local Typing = false
        
        _G.SendNotifications = false   -- If set to true then the script would notify you frequently on any changes applied and when loaded / errored. (If a game can detect this, it is recommended to set it to false)
        _G.DefaultSettings = false   -- If set to true then the tracer script would run with default settings regardless of any changes you made.
        
        _G.TeamCheck = false   -- If set to true then the script would create tracers only for the enemy team members.
        
        --[!]-- ONLY ONE OF THESE VALUES SHOULD BE SET TO TRUE TO NOT ERROR THE SCRIPT --[!]--
        
        _G.FromMouse = false   -- If set to true, the tracers will come from the position of your mouse curson on your screen.
        _G.FromCenter = false   -- If set to true, the tracers will come from the center of your screen.
        _G.FromBottom = true   -- If set to true, the tracers will come from the bottom of your screen.
        
        _G.TracersVisible = tracer   -- If set to true then the tracers will be visible and vice versa.
        _G.TracerColor = Color3.fromRGB(255, 255, 255)   -- The color that the tracers would appear as.
        _G.TracerThickness = 1   -- The thickness of the tracers.
        _G.TracerTransparency = 0.7   -- The transparency of the tracers.
        
        _G.ModeSkipKey = Enum.KeyCode.RightAlt   -- The key that changes between modes that indicate where will the tracers come from.
        _G.DisableKey = Enum.KeyCode.RightAlt   -- The key that disables / enables the tracers.
        
        local function CreateTracers()
            for _, v in next, Players:GetPlayers() do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    local TracerLine = Drawing.new("Line")
            
                    RunService.RenderStepped:Connect(function()
                        if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                            local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * 1
                            local Vector, OnScreen = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(0, -HumanoidRootPart_Size.Y, 0).p)
                            
                            TracerLine.Thickness = _G.TracerThickness
                            TracerLine.Transparency = _G.TracerTransparency
                            TracerLine.Color = _G.TracerColor
        
                            if _G.FromMouse == true and _G.FromCenter == false and _G.FromBottom == false then
                                TracerLine.From = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                            elseif _G.FromMouse == false and _G.FromCenter == true and _G.FromBottom == false then
                                TracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                            elseif _G.FromMouse == false and _G.FromCenter == false and _G.FromBottom == true then
                                TracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                            end
        
                            if OnScreen == true  then
                                TracerLine.To = Vector2.new(Vector.X, Vector.Y)
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= v.Team then
                                        TracerLine.Visible = _G.TracersVisible
                                    else
                                        TracerLine.Visible = false
                                    end
                                else
                                    TracerLine.Visible = _G.TracersVisible
                                end
                            else
                                TracerLine.Visible = false
                            end
                        else
                            TracerLine.Visible = false
                        end
                    end)
        
                    Players.PlayerRemoving:Connect(function()
                        TracerLine.Visible = false
                    end)
                end
            end
        
            Players.PlayerAdded:Connect(function(Player)
                Player.CharacterAdded:Connect(function(v)
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        local TracerLine = Drawing.new("Line")
                
                        RunService.RenderStepped:Connect(function()
                            if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                                local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * 1
                                local Vector, OnScreen = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(0, -HumanoidRootPart_Size.Y, 0).p)
                                
                                TracerLine.Thickness = _G.TracerThickness
                                TracerLine.Transparency = _G.TracerTransparency
                                TracerLine.Color = _G.TracerColor
        
                                if _G.FromMouse == true and _G.FromCenter == false and _G.FromBottom == false then
                                    TracerLine.From = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                                elseif _G.FromMouse == false and _G.FromCenter == true and _G.FromBottom == false then
                                    TracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                                elseif _G.FromMouse == false and _G.FromCenter == false and _G.FromBottom == true then
                                    TracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                                end
        
                                if OnScreen == true  then
                                    TracerLine.To = Vector2.new(Vector.X, Vector.Y)
                                    if _G.TeamCheck == true then 
                                        if Players.LocalPlayer.Team ~= Player.Team then
                                            TracerLine.Visible = _G.TracersVisible
                                        else
                                            TracerLine.Visible = false
                                        end
                                    else
                                        TracerLine.Visible = _G.TracersVisible
                                    end
                                else
                                    TracerLine.Visible = false
                                end
                            else
                                TracerLine.Visible = false
                            end
                        end)
        
                        Players.PlayerRemoving:Connect(function()
                            TracerLine.Visible = false
                        end)
                    end
                end)
            end)
        end
        
        UserInputService.TextBoxFocused:Connect(function()
            Typing = true
        end)
        
        UserInputService.TextBoxFocusReleased:Connect(function()
            Typing = false
        end)
        
        UserInputService.InputBegan:Connect(function(Input)
            if Input.KeyCode == _G.ModeSkipKey and Typing == false then
                if _G.FromMouse == true and _G.FromCenter == false and _G.FromBottom == false and _G.TracersVisible == true then
                    _G.FromCenter = false
                    _G.FromBottom = true
                    _G.FromMouse = false
        
                    if _G.SendNotifications == true then
                        game:GetService("StarterGui"):SetCore("SendNotification",{
                            Title = "Exunys Developer";
                            Text = "Tracers will be now coming from the bottom of your screen (Mode 1)";
                            Duration = 5;
                        })
                    end
                elseif _G.FromMouse == false and _G.FromCenter == false and _G.FromBottom == true and _G.TracersVisible == true then
                    _G.FromCenter = true
                    _G.FromBottom = false
                    _G.FromMouse = false
        
                    if _G.SendNotifications == true then
                        game:GetService("StarterGui"):SetCore("SendNotification",{
                            Title = "Exunys Developer";
                            Text = "Tracers will be now coming from the center of your screen (Mode 2)";
                            Duration = 5;
                        })
                    end
                elseif _G.FromMouse == false and _G.FromCenter == true and _G.FromBottom == false and _G.TracersVisible == true then
                    _G.FromCenter = false
                    _G.FromBottom = false
                    _G.FromMouse = true
        
                    if _G.SendNotifications == true then
                        game:GetService("StarterGui"):SetCore("SendNotification",{
                            Title = "Exunys Developer";
                            Text = "Tracers will be now coming from the position of your mouse cursor on your screen (Mode 3)";
                            Duration = 5;
                        })
                    end
                end
            elseif Input.KeyCode == _G.DisableKey and Typing == false then
                _G.TracersVisible = not _G.TracersVisible
                
                if _G.SendNotifications == true then
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Exunys Developer";
                        Text = "The tracers' visibility is now set to "..tostring(_G.TracersVisible)..".";
                        Duration = 5;
                    })
                end
            end
        end)
        
        if _G.DefaultSettings == true then
            _G.TeamCheck = false
            _G.FromMouse = false
            _G.FromCenter = false
            _G.FromBottom = true
            _G.TracersVisible = true
            _G.TracerColor = Color3.fromRGB(40, 90, 255)
            _G.TracerThickness = 1
            _G.TracerTransparency = 0.5
            _G.ModeSkipKey = Enum.KeyCode.E
            _G.DisableKey = Enum.KeyCode.Q
        end
        
        local Success, Errored = pcall(function()
            CreateTracers()
        end)
        
        if Success and not Errored then
            if _G.SendNotifications == true then
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "Maik Developer";
                    Text = "Tracer script has successfully loaded.";
                    Duration = 5;
                })
            end
        elseif Errored and not Success then
            if _G.SendNotifications == true then
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "Exunys Developer";
                    Text = "Tracer script has errored while loading, please check the developer console! (F9)";
                    Duration = 5;
                })
            end
            TestService:Message("The tracer script has errored, please notify Exunys with the following information :")
            warn(Errored)
            print("!! IF THE ERROR IS A FALSE POSITIVE (says that a player cannot be found) THEN DO NOT BOTHER !!")
        end

print("fick dich du nuttensohn")
