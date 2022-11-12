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
        
        _G.TeamCheck = true   -- If set to true then the script would create boxes only for the enemy team members.
        
        _G.BoxesVisible = box   -- If set to true then the boxes will be visible and vice versa.
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
