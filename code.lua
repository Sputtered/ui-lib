local VapeLite = {}

function VapeLite.CreateFrame(name, parent)
    local frame = Instance.new("Frame")
    frame.Name = name
    frame.Parent = parent
    frame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    frame.BorderSizePixel = 0
    frame.Position = UDim2.new(0, 0, 0, 0)
    frame.Size = UDim2.new(0, 200, 0, 150)

    return frame
end

function VapeLite.CreateTextLabel(name, parent, text)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Parent = parent
    label.BackgroundTransparency = 1
    label.BorderSizePixel = 0
    label.Position = UDim2.new(0, 10, 0, 10)
    label.Size = UDim2.new(1, -20, 1, -20)
    label.Font = Enum.Font.SourceSans
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.TextWrapped = true

    return label
end

function VapeLite.CreateButton(name, parent, text, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = parent
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.BorderSizePixel = 0
    button.Position = UDim2.new(0, 10, 0, 100)
    button.Size = UDim2.new(1, -20, 0, 40)
    button.Font = Enum.Font.SourceSans
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextScaled = true

    button.MouseButton1Click:Connect(callback)

    return button
end

return VapeLite
