local NotifySystem = {}

-- Create the base GUI
local Notify = Instance.new("ScreenGui")
Notify.Name = "NotifySystem"
Notify.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Notify.ResetOnSpawn = false
Notify.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Notification template
function NotifySystem:CreateNotification(title, message, duration)
    -- Calculate position based on screen size
    local screenSize = workspace.CurrentCamera.ViewportSize
    local basePosition = UDim2.new(1, -300, 1, -100) -- Bottom right
    
    -- Create notification frame
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.AnchorPoint = Vector2.new(1, 1)
    notification.Position = basePosition
    notification.Size = UDim2.new(0, 286, 0, 91)
    notification.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    notification.BorderSizePixel = 0
    notification.ClipsDescendants = true
    
    -- Add rounded corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = notification
    
    -- Title bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(41, 74, 122)
    titleBar.BorderSizePixel = 0
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = titleBar
    
    -- Title text
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
    
    -- Icon
    local icon = Instance.new("ImageLabel")
    icon.Name = "Icon"
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(1, -25, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://111630714337304"
    
    -- Message content
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
    
    -- Timer
    local timerText = Instance.new("TextLabel")
    timerText.Name = "Timer"
    timerText.Size = UDim2.new(0, 30, 0, 20)
    timerText.Position = UDim2.new(1, -35, 1, -25)
    timerText.BackgroundTransparency = 1
    timerText.Text = tostring(duration or "?")
    timerText.TextColor3 = Color3.fromRGB(180, 180, 180)
    timerText.TextSize = 14
    
    -- Assemble the notification
    titleBar.Parent = notification
    titleText.Parent = notification
    icon.Parent = notification
    messageLabel.Parent = notification
    timerText.Parent = notification
    
    -- Animation variables
    local startTime = tick()
    local endTime = startTime + (duration or 3)
    
    -- Function to update the timer
    local function updateTimer()
        local remaining = math.ceil(endTime - tick())
        timerText.Text = remaining > 0 and tostring(remaining) or "0"
        return remaining > 0
    end
    
    -- Function to animate the notification
    local function animate()
        -- Slide in animation
        notification.Position = basePosition + UDim2.new(0, 300, 0, 0)
        notification.Visible = true
        
        local tweenIn = game:GetService("TweenService"):Create(
            notification,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = basePosition}
        )
        tweenIn:Play()
        
        -- Wait for duration
        while updateTimer() do
            task.wait(0.1)
        end
        
        -- Slide out animation
        local tweenOut = game:GetService("TweenService"):Create(
            notification,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {Position = basePosition + UDim2.new(0, 300, 0, 0)}
        )
        tweenOut:Play()
        
        tweenOut.Completed:Wait()
        notification:Destroy()
    end
    
    -- Start the animation
    coroutine.wrap(animate)()
    
    -- Add to notifications list
    self.Notifications = self.Notifications or {}
    table.insert(self.Notifications, notification)
    
    -- Position this notification above others
    self:UpdatePositions()
    
    return notification
end

-- Update positions of all notifications
function NotifySystem:UpdatePositions()
    if not self.Notifications then return end
    
    local screenSize = workspace.CurrentCamera.ViewportSize
    local basePosition = UDim2.new(1, -300, 1, -100) -- Bottom right
    
    for i, notification in ipairs(self.Notifications) do
        local offset = (i - 1) * 100 -- 100 pixels between each notification
        notification.Position = basePosition - UDim2.new(0, 0, 0, offset)
    end
end

-- Send notification function
function NotifySystem:SendNotify(title, message, duration)
    return self:CreateNotification(title, message, duration)
end

-- Return the module
return NotifySystem
