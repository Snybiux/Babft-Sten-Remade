print("Test2")

local MainPart = Instance.new("ScreenGui")
local Window = Instance.new("ImageLabel")
local Bar = Instance.new("Frame")
local Toggle = Instance.new("ImageButton")
local Base = Instance.new("ImageLabel")
local Top = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local Tabs = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

MainPart.Parent = game:GetService("CoreGui")
MainPart.Name = "MainPart"

Window.Name = "Window"
Window.Position = UDim2.new(0, 715, 0, 40)
Window.Parent = MainPart
Window.Active = true
Window.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Window.BackgroundTransparency = 1.000
Window.ClipsDescendants = true
Window.Draggable = true
Window.Selectable = true
Window.Size = UDim2.new(0, 240, 0, 500)
Window.ZIndex = 11
Window.Image = "rbxassetid://2851926732"
Window.ImageColor3 = Color3.fromRGB(20, 21, 23)
Window.ScaleType = Enum.ScaleType.Slice
Window.SliceCenter = Rect.new(12, 12, 12, 12)
Window.Draggable = true

Bar.Name = "Bar"
Bar.Parent = Window
Bar.BackgroundColor3 = Color3.fromRGB(41, 74, 122)
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(0, 0, 0, 5)
Bar.Size = UDim2.new(1, 0, 0, 15)
Bar.ZIndex = 11

Toggle.Name = "Toggle"
Toggle.Parent = Bar
Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle.BackgroundTransparency = 1.000
Toggle.Position = UDim2.new(0, 5, 0, -2)
Toggle.Rotation = 90.000
Toggle.Size = UDim2.new(0, 20, 0, 20)
Toggle.ZIndex = 12
Toggle.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"

Base.Name = "Base"
Base.Parent = Bar
Base.BackgroundColor3 = Color3.fromRGB(41, 74, 122)
Base.BorderSizePixel = 0
Base.Position = UDim2.new(0, 0, 0.800000012, 0)
Base.Size = UDim2.new(1, 0, 0, 10)
Base.ZIndex = 11
Base.Image = "rbxassetid://2851926732"
Base.ImageColor3 = Color3.fromRGB(41, 74, 122)
Base.ScaleType = Enum.ScaleType.Slice
Base.SliceCenter = Rect.new(12, 12, 12, 12)

Top.Name = "Top"
Top.Parent = Bar
Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Top.BackgroundTransparency = 1.000
Top.Position = UDim2.new(0, 0, 0, -5)
Top.Size = UDim2.new(1, 0, 0, 10)
Top.ZIndex = 11
Top.Image = "rbxassetid://2851926732"
Top.ImageColor3 = Color3.fromRGB(41, 74, 122)
Top.ScaleType = Enum.ScaleType.Slice
Top.SliceCenter = Rect.new(12, 12, 12, 12)

Title.Name = "Title"
Title.Parent = Window
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 30, 0, 3)
Title.Size = UDim2.new(0, 200, 0, 20)
Title.ZIndex = 11
Title.Font = Enum.Font.GothamBold
Title.Text = "Block Listing"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14.000
Title.TextXAlignment = Enum.TextXAlignment.Left

Tabs.Name = "Tabs"
Tabs.Parent = Window
Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tabs.BackgroundTransparency = 1.000
Tabs.Position = UDim2.new(0, 0, 0, 28)
Tabs.Size = UDim2.new(1, 0, 1, -30)
Tabs.ZIndex = 11

ScrollingFrame.Parent = Tabs
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderColor3 = Color3.fromRGB(41, 74, 122)
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.ScrollBarThickness = 4

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local TextButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

TextButton.Parent = Bar
TextButton.BackgroundColor3 = Color3.fromRGB(230, 0, 0)
TextButton.Size = UDim2.new(0, 40, 0, 20)
TextButton.Font = Enum.Font.GothamMedium
TextButton.Text = "Clear"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 13
TextButton.Size = UDim2.new(0, 60, 0, 20)
TextButton.Position = UDim2.new(1, -64, 0, -1)
TextButton.ZIndex = 99

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = TextButton

local ExampleBlock; do
    local Block = Instance.new("Frame")
    local TextButton = Instance.new("ImageLabel")
    local ImageLabel = Instance.new("ImageLabel")
    local TextLabel = Instance.new("TextLabel")
    
    Block.Name = "Block"
    Block.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Block.BackgroundTransparency = 1.000
    Block.Size = UDim2.new(1, 0, 0, 40)
    
    TextButton.Name = "TextButton"
    TextButton.Parent = Block
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BackgroundTransparency = 1.000
    TextButton.Position = UDim2.new(0, 5, 0, 5)
    TextButton.Size = UDim2.new(1, -15, 1, -5)
    TextButton.ZIndex = 11
    TextButton.Image = "rbxassetid://2851929490"
    TextButton.ImageColor3 = Color3.fromRGB(41, 74, 122)
    TextButton.ScaleType = Enum.ScaleType.Slice
    TextButton.SliceCenter = Rect.new(4, 4, 4, 4)
    
    ImageLabel.Parent = TextButton
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.BackgroundTransparency = 1.000
    ImageLabel.Size = UDim2.new(0, 40, 1, 0)
    ImageLabel.Image = "rbxassetid://845567732"
    ImageLabel.ZIndex = 12
    
    TextLabel.Parent = TextButton
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(0, 50, 0, 0)
    TextLabel.Size = UDim2.new(1, -50, 1, 0)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = "Needed : 1\nMissing : 0"
    TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    TextLabel.TextSize = 14.000
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.RichText = true
    TextLabel.ZIndex = 13

    ExampleBlock = Block
end

local images = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sybiux/Babft-Sten-Remade/refs/heads/main/Server/blockslist.lua"))()

local function Resize(part, new, delay)
	local tweenInfo = TweenInfo.new(delay or 0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	game:GetService("TweenService"):Create(part, tweenInfo, new):Play()
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if (input.KeyCode == Enum.KeyCode.RightShift) then
        Window.Visible = not Window.Visible
    end
end)

do -- [Open / Close] Window
    local open_close = Window:FindFirstChild("Bar"):FindFirstChild("Toggle")
    local open, canopen = true, true

    local oldwindowdata = {}
    local oldy = Window.AbsoluteSize.Y

    open_close.MouseButton1Click:Connect(function()
        if (not canopen) then return end

        canopen = false

        if (open) then oldwindowdata = {}
            for i, v in next, ScrollingFrame:GetChildren() do
                if (not v:IsA("UIListLayout")) then
                    oldwindowdata[v], v.Visible = v.Visible, false
                end
            end

            oldy = Window.AbsoluteSize.Y
        else
            for i,v in next, oldwindowdata do
                i.Visible = v
            end
        end

        Resize(open_close, {Rotation = open and 0 or 90}, 0.1)
        Resize(Window, {Size = UDim2.new(0, Window.AbsoluteSize.X, 0, open and 26 or oldy)}, 0.1)
        open_close.Parent:FindFirstChild("Base").Transparency = open and 0 or 1

        wait(0.1)
        open, canopen = not open, true
    end)
end

local Functions = {}

local COLORS = {
    RED = Color3.fromRGB(100, 30, 30),
    YELLOW = Color3.fromRGB(120, 90, 20),
    GREEN = Color3.fromRGB(30, 90, 30),
    NEUTRAL = Color3.fromRGB(80, 80, 80),
}

function Functions:Clear()
    for _, v in next, ScrollingFrame:GetChildren() do
        if not v:IsA("UIListLayout") then
            v:Destroy()
        end
    end
end

function Functions:Add(name, needed, missing)
    local newObject = ExampleBlock:Clone()
    newObject.Parent = ScrollingFrame

    newObject.TextButton.ImageLabel.Image = images[name]
    newObject.TextButton.TextLabel.Text = 'Needed: ' .. (needed or 0) .. '\nMissing: ' .. (missing or 0)

    local bgColor = COLORS.RED

    if needed and needed > 0 then
        local missingCount = missing or 0
        local missingPercentage = missingCount / needed

        if missingCount == 0 then
            bgColor = COLORS.GREEN
        elseif missingPercentage <= 0.5 and missingPercentage < 1 then
            bgColor = COLORS.YELLOW
        elseif missingPercentage > 0.5 or missingPercentage == 1 then
            bgColor = COLORS.RED
        end
    else
        bgColor = COLORS.GREEN
    end

    newObject.TextButton.ImageColor3 = bgColor
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, (#ScrollingFrame:GetChildren() * 40 - 35))
end

TextButton.MouseButton1Click:Connect(function()
    Functions:Clear()
end)

return Functions
