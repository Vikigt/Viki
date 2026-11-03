
-- VIK AUTO PNB
-- VIKI PROJECT
-- VERSION 1.1

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "VIK_AUTO_PNB"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Name = "MainWindow"
main.Size = UDim2.fromOffset(270, 300)
main.Position = UDim2.new(0.5, -135, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(19, 24, 35)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

-- HEADER
local header = Instance.new("TextButton")
header.Size = UDim2.new(1, 0, 0, 45)
header.BackgroundColor3 = Color3.fromRGB(30, 45, 68)
header.Text = "  VIK AUTO PNB"
header.TextColor3 = Color3.fromRGB(90, 170, 255)
header.TextSize = 17
header.Font = Enum.Font.GothamBold
header.TextXAlignment = Enum.TextXAlignment.Left
header.Parent = main

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = header

-- DRAG WINDOW
local dragging = false
local dragStart
local startPosition

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPosition = main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart

        main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- MINIMIZE
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.fromOffset(35, 35)
minimize.Position = UDim2.new(1, -75, 0, 5)
minimize.Text = "-"
minimize.TextSize = 22
minimize.TextColor3 = Color3.new(1, 1, 1)
minimize.BackgroundColor3 = Color3.fromRGB(45, 60, 80)
minimize.Parent = main

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(0, 7)
miniCorner.Parent = minimize

local content = Instance.new("Frame")
content.Size = UDim2.new(1, 0, 1, -45)
content.Position = UDim2.new(0, 0, 0, 45)
content.BackgroundTransparency = 1
content.Parent = main

local minimized = false

minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    content.Visible = not minimized
    main.Size = minimized
        and UDim2.fromOffset(270, 45)
        or UDim2.fromOffset(270, 300)
end)

-- CLOSE
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35, 35)
close.Position = UDim2.new(1, -40, 0, 5)
close.Text = "X"
close.TextSize = 15
close.TextColor3 = Color3.new(1, 1, 1)
close.BackgroundColor3 = Color3.fromRGB(170, 55, 65)
close.Parent = main

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 7)
closeCorner.Parent = close

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- MENU BUTTONS
local function createButton(name, y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -30, 0, 45)
    button.Position = UDim2.fromOffset(15, y)
    button.BackgroundColor3 = Color3.fromRGB(37, 47, 65)
    button.Text = name
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 14
    button.Font = Enum.Font.GothamBold
    button.Parent = content

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = button

    return button
end

createButton("AUTO FARM", 15)
createButton("AUTO PLANT", 70)
createButton("AUTO HARVEST", 125)

print("VIK AUTO PNB V1.1 LOADED")
