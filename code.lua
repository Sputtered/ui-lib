local VapeLiteUI = {}

function VapeLiteUI.CreateUI()
    local uiSize = Vector2.new(807, 537)

    -- Create the main UI frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "VapeLiteUI"
    mainFrame.Size = UDim2.new(0, uiSize.X, 0, uiSize.Y)
    mainFrame.Position = UDim2.new(0.5, -uiSize.X/2, 0.5, -uiSize.Y/2)
    mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = game.Players.LocalPlayer.PlayerGui

    -- Create the top bar
    local topBar = Instance.new("Frame")
    topBar.Name = "TopBar"
    topBar.Size = UDim2.new(1, 0, 0, 30)
    topBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    topBar.BorderSizePixel = 0
    topBar.Parent = mainFrame

    -- Create the "Home" button
    local homeButton = Instance.new("TextButton")
    homeButton.Name = "HomeButton"
    homeButton.Size = UDim2.new(0, 100, 1, 0)
    homeButton.Position = UDim2.new(0, 0, 0, 0)
    homeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    homeButton.BorderSizePixel = 0
    homeButton.Font = Enum.Font.SourceSansBold
    homeButton.Text = "Home"
    homeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    homeButton.Parent = topBar

    -- Create the "Configs" button
    local configsButton = Instance.new("TextButton")
    configsButton.Name = "ConfigsButton"
    configsButton.Size = UDim2.new(0, 100, 1, 0)
    configsButton.Position = UDim2.new(1, -100, 0, 0)
    configsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    configsButton.BorderSizePixel = 0
    configsButton.Font = Enum.Font.SourceSansBold
    configsButton.Text = "Configs"
    configsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    configsButton.Parent = topBar

    -- Create the tab container
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabContainer"
    tabContainer.Size = UDim2.new(1, 0, 1, -30)
    tabContainer.Position = UDim2.new(0, 0, 0, 30)
    tabContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tabContainer.BorderSizePixel = 0
    tabContainer.Parent = mainFrame

    -- Function to create tabs
    function VapeLiteUI.CreateTab(name)
        local tabButton = Instance.new("TextButton")
        tabButton.Name = name
        tabButton.Size = UDim2.new(0, 100, 0, 30)
        tabButton.Position = UDim2.new(0, (#tabContainer:GetChildren() + 1) * 100, 0, 0)
        tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        tabButton.BorderSizePixel = 0
        tabButton.Font = Enum.Font.SourceSansBold
        tabButton.Text = name
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabButton.Parent = tabContainer

        return tabButton
    end

    -- Function to create a module within a tab
    function VapeLiteUI.CreateModule(tabButton, moduleName)
        local tabFrame = Instance.new("Frame")
        tabFrame.Name = moduleName
        tabFrame.Size = UDim2.new(1, 0, 1, 0)
        tabFrame.Position = UDim2.new(1, 0, 0, 0)
        tabFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        tabFrame.BorderSizePixel = 0
        tabFrame.Visible = false
        tabFrame.Parent = tabContainer

        -- Set up tab button to toggle module visibility
        tabButton.MouseButton1Click:Connect(function()
            tabFrame.Visible = not tabFrame.Visible
            for _, moduleFrame in pairs(tabContainer:GetChildren()) do
                if moduleFrame:IsA("Frame") and moduleFrame ~= tabFrame then
                    moduleFrame.Visible = false
                end
            end
        end)

        return tabFrame
    end

    return VapeLiteUI
end

return VapeLiteUI
