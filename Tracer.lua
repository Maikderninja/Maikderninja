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
        
        _G.TeamCheck = true   -- If set to true then the script would create tracers only for the enemy team members.
        
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
