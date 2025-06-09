local input = tab:new("input", {
    text = "Username",
    placeholder = "Enter your username...",
    size = 200
})

input.event:Connect(function(text)
    print("Text changed to:", text)
end)

input:setText("Player1")

local current = input:getText()


function types.input(inputOptions)
    local self = { }
    self.event = event.new()
    self.eventBlock = false

    inputOptions = settings.new({
        text = "New Input",
        placeholder = "Enter text...",
        color = Color3.fromRGB(32, 59, 97),
        textcolor = Color3.new(1, 1, 1),
        rounding = options.rounding,
        size = 150,
    }).handle(inputOptions)

    local input = new("Slider")
    input.Parent = items
    input.Name = "Input"

    local outer = input:FindFirstChild("Outer")
    local inner = outer:FindFirstChild("Inner")
    local text = input:FindFirstChild("Text")
    local value = inner:FindFirstChild("Value")

    input:FindFirstChild("Slider"):Destroy()
    
    outer.SliceScale = inputOptions.rounding / 100
    inner.SliceScale = inputOptions.rounding / 100
    inner.ImageColor3 = inputOptions.color
    value.TextColor3 = inputOptions.textcolor
    value.Text = inputOptions.placeholder
    value.TextXAlignment = Enum.TextXAlignment.Left
    value.Position = UDim2.new(0, 5, 0, 0)
    
    text.Text = inputOptions.text
    outer.Size = UDim2.new(0, inputOptions.size, 0, 20)
    text.Position = UDim2.new(0, inputOptions.size + 8, 0, 0)
    input.Size = UDim2.new(0, inputOptions.size + 8 + text.TextBounds.X, 0, 20)

    local currentText = ""
    local inTextBox = false
    local lastTick = tick()
    local lastTickN = 1
    local canType = false
    local shift = false
    local backspace = false

    inner.MouseEnter:Connect(function()
        inTextBox = true
    end)
    
    inner.MouseLeave:Connect(function()
        inTextBox = false
    end)

    local function updateText()
        value.Text = currentText .. (lastTickN == 1 and "|" or "")
    end

    mouse.InputBegan:Connect(function()
        if inTextBox and findBrowsingTopMost() == main then
            canType = true
            value.TextColor3 = inputOptions.textcolor
            spawn(function()
                while canType do
                    updateText()
                    if (tick() - lastTick) >= 0.5 then
                        lastTick = tick()
                        lastTickN = 1 - lastTickN
                    end
                    RunService.Heartbeat:Wait()
                end
                lastTickN = 0
                updateText()
                if currentText == "" then
                    value.Text = inputOptions.placeholder
                end
            end)
        end
    end)

    mouse.InputEnded:Connect(function()
        canType = false
    end)

    UserInputService.InputBegan:Connect(function(inputObject)
        local keycode = inputObject.KeyCode
        
        if keycode == Enum.KeyCode.LeftShift then
            shift = true
        end
        
        if canType then
            if keycode == Enum.KeyCode.Backspace then
                backspace = true
                currentText = currentText:sub(1, -2)
                updateText()
                self.event:Fire(currentText)

                local backspaceTick = tick()
                local backspaceN = 0.5
                spawn(function()
                    while backspace do
                        if (tick() - backspaceTick) >= backspaceN then
                            backspaceN = 0.05
                            backspaceTick = tick()
                            currentText = currentText:sub(1, -2)
                            updateText()
                            self.event:Fire(currentText)
                        end
                        RunService.Heartbeat:Wait()
                    end
                    backspaceN = 0.5
                end)
            elseif keycode == Enum.KeyCode.Space then
                currentText = currentText .. " "
                updateText()
                self.event:Fire(currentText)
            -- Handle alphanumeric characters
            elseif betweenOpenInterval(keycode.Value, 48, 57) then -- 0-9
                local name = rawget({ Zero = "0", One = "1", Two = "2", Three = "3", Four = "4", Five = "5", Six = "6", Seven = "7", Eight = "8", Nine = "9" }, keycode.Name)
                currentText = currentText .. name
                updateText()
                self.event:Fire(currentText)
            elseif betweenOpenInterval(keycode.Value, 97, 122) then -- A-Z
                local name = (not shift) and keycode.Name:lower() or keycode.Name
                currentText = currentText .. name
                updateText()
                self.event:Fire(currentText)
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(inputObject)
        if inputObject.KeyCode == Enum.KeyCode.LeftShift then
            shift = false
        elseif inputObject.KeyCode == Enum.KeyCode.Backspace then
            backspace = false
        end
    end)

    function self.setText(text)
        currentText = text or ""
        if canType then
            updateText()
        else
            value.Text = currentText == "" and inputOptions.placeholder or currentText
        end
    end

    function self.getText()
        return currentText
    end

    function self.setColor(color)
        inner.ImageColor3 = color
    end

    function self.getColor()
        return inner.ImageColor3
    end

    function self:Destroy()
        input:Destroy()
    end

    self.options = inputOptions
    self.self = input
    return self
end
