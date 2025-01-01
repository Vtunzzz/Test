--Gui
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local uiCorner = Instance.new("UICorner")
local uiGradient = Instance.new("UIGradient")

screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

frame.Parent = screenGui
frame.Size = UDim2.new(0.6, 0, 1, 0) -- Tăng chiều rộng và chiều cao
frame.Position = UDim2.new(0.25, 0, 0.25, 0) -- Căn giữa màn hình
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25) -- Màu nền cơ bản
frame.BorderColor3 = Color3.fromRGB(255, 255, 0) -- Viền màu vàng
frame.BorderSizePixel = 2 -- Độ dày viền

-- Thuộc tính ImageButton
local imageButton = Instance.new("ImageButton")
imageButton.Parent = screenGui

-- Đặt kích thước hình vuông
imageButton.Size = UDim2.new(0, 30, 0, 30) -- Cả chiều rộng và chiều cao đều bằng nhau
imageButton.Position = UDim2.new(0.05, 0, 0.2, 0) -- Vị trí nút
imageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Màu nền
imageButton.Image = "rbxassetid://70734752670140" -- Thay ID hình ảnh của bạn
imageButton.BorderSizePixel = 0 -- Không viền

-- Bo góc
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(1, 0) -- Bo tròn hoàn toàn
uiCorner.Parent = imageButton

-- Bo góc ImageButton
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = imageButton

-- Sự kiện khi nhấn ImageButton
imageButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible -- Bật/tắt Frame
end)

-- Hàm thêm tính năng kéo/thả
local function enableDrag(guiObject)
    local UIS = game:GetService('UserInputService')
    local dragToggle = false
    local dragStart = nil
    local startPos = nil

    local function updateInput(input)
        local delta = input.Position - dragStart
        local newPosition = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
        guiObject.Position = newPosition
    end

    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragToggle = true
            dragStart = input.Position
            startPos = guiObject.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragToggle and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateInput(input)
        end
    end)
end

-- Kích hoạt kéo/thả cho ImageButton và Frame
enableDrag(imageButton)
enableDrag(frame)
--Text
-- Thuộc tính MainFrame
-- Tạo mainFrame
local mainFrame = Instance.new("Frame")
mainFrame.Parent = frame
mainFrame.Size = UDim2.new(0, 27, 0, 27) -- Kích thước là 27 pixel cả chiều rộng và chiều cao
mainFrame.Position = UDim2.new(0, 10, 0, 10) 
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.BorderSizePixel = 0

-- Tạo UICorner để bo góc cho mainFrame
local uiCornerMainFrame = Instance.new("UICorner")
uiCornerMainFrame.CornerRadius = UDim.new(0, 5) -- Bo góc 5 pixel
uiCornerMainFrame.Parent = mainFrame

-- Thêm TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Parent = mainFrame
textLabel.Size = UDim2.new(1, 0, 1, 0) -- Bao phủ toàn bộ mainFrame
textLabel.BackgroundTransparency = 1 -- Nền trong suốt
textLabel.Text = "Main" -- Văn bản
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Màu chữ
textLabel.TextScaled = false -- Không tự động chỉnh kích thước chữ
textLabel.Font = Enum.Font.SourceSansBold -- Phông chữ
textLabel.TextSize = 20 -- Kích thước chữ là 14 (có thể chỉnh tùy ý)Bold -- Phông chữ