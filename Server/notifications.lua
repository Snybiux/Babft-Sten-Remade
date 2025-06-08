local NotifySystem = {}

local Notify = Instance.new("ScreenGui")
Notify.Name = "NotifySystem"
Notify.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Notify.ResetOnSpawn = false
Notify.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

function NotifySystem:CreateNotification(title, message, duration)
    local screenSize = workspace.CurrentCamera.ViewportSize
    local basePosition = UDim2.new(1, -300, 1, -100)
    
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.AnchorPoint = Vector2.new(1, 1)
    notification.Position = basePosition
    notification.Size = UDim2.new(0, 286, 0, 91)
    notification.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    notification.BorderSizePixel = 0
    notification.ClipsDescendants = true
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = notification
    
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(41, 74, 122)
    titleBar.BorderSizePixel = 0
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = titleBar
    
    local titleText = Instance.new("TextLabel")
    titleText.Name = "Title"
    titleText.Size = UDim2.new(1, -30, 1, 0)
    titleText.Position = UDim2.new(0, 10, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = title or "Notification"
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.TextSize = 18
    titleText.Font = Enum.Font.SourceSansBold
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    
    local icon = Instance.new("ImageLabel")
    icon.Name = "Icon"
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(1, -25, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://111630714337304"
    
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Name = "Message"
    messageLabel.Size = UDim2.new(1, -20, 1, -40)
    messageLabel.Position = UDim2.new(0, 10, 0, 35)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message or "No message provided"
    messageLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    messageLabel.TextSize = 16
    messageLabel.Font = Enum.Font.SourceSans
    messageLabel.TextWrapped = true
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    
    local timerText = Instance.new("TextLabel")
    timerText.Name = "Timer"
    timerText.Size = UDim2.new(0, 30, 0, 20)
    timerText.Position = UDim2.new(1, -35, 1, -25)
    timerText.BackgroundTransparency = 1
    timerText.Text = tostring(duration or "?")
    timerText.TextColor3 = Color3.fromRGB(180, 180, 180)
    timerText.TextSize = 14
    
    titleBar.Parent = notification
    titleText.Parent = notification
    icon.Parent = notification
    messageLabel.Parent = notification
    timerText.Parent = notification
    
    local startTime = tick()
    local endTime = startTime + (duration or 3)
    
    local function updateTimer()
        local remaining = math.ceil(endTime - tick())
        timerText.Text = remaining > 0 and tostring(remaining) or "0"
        return remaining > 0
    end
    
    local function animate()
        notification.Position = basePosition + UDim2.new(0, 300, 0, 0)
        notification.Visible = true
        
        local tweenIn = game:GetService("TweenService"):Create(
            notification,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = basePosition}
        )
        tweenIn:Play()
        
        while updateTimer() do
            task.wait(0.1)
        end
        
        local tweenOut = game:GetService("TweenService"):Create(
            notification,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {Position = basePosition + UDim2.new(0, 300, 0, 0)}
        )
        tweenOut:Play()
        
        tweenOut.Completed:Wait()
        notification:Destroy()
    end
    
    coroutine.wrap(animate)()
    
    self.Notifications = self.Notifications or {}
    table.insert(self.Notifications, notification)
    
    self:UpdatePositions()
    
    return notification
end

function NotifySystem:UpdatePositions()
    if not self.Notifications then return end
    
    local screenSize = workspace.CurrentCamera.ViewportSize
    local basePosition = UDim2.new(1, -300, 1, -100)
    
    for i, notification in ipairs(self.Notifications) do
        local offset = (i - 1) * 100
        notification.Position = basePosition - UDim2.new(0, 0, 0, offset)
    end
end

function NotifySystem:SendNotify(title, message, duration)
    return self:CreateNotification(title, message, duration)
end

return NotifySystem
