-- Tạo một ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui  -- Gán vào PlayerGui của người chơi

-- Tạo một Label để mở cửa sổ
local openLabel = Instance.new("TextLabel")
openLabel.Parent = screenGui
openLabel.Size = UDim2.new(0, 200, 0, 50)  -- Kích thước của Label
openLabel.Position = UDim2.new(0.5, -100, 0.2, 0)  -- Đặt vị trí của Label ở giữa màn hình, cao lên một chút
openLabel.Text = "Nhấn để Mở Cửa Sổ"  -- Nội dung Label
openLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Màu chữ trắng
openLabel.TextSize = 24  -- Kích thước chữ
openLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Màu nền Label đen
openLabel.TextAlign = Enum.TextAnchor.MiddleCenter  -- Canh giữa văn bản
openLabel.BorderSizePixel = 0  -- Không có viền

-- Tạo cửa sổ (Frame) để mở khi nhấn vào Label
local window = Instance.new("Frame")
window.Parent = screenGui
window.Size = UDim2.new(0, 400, 0, 300)  -- Kích thước của cửa sổ
window.Position = UDim2.new(0.5, -200, 0.5, -150)  -- Đặt cửa sổ ở vị trí trung tâm
window.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Màu nền xám
window.BackgroundTransparency = 0.2  -- Một chút trong suốt
window.Visible = false  -- Ban đầu cửa sổ không hiển thị

-- Tạo tiêu đề cho cửa sổ
local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = window
titleLabel.Size = UDim2.new(1, 0, 0, 30)  -- Đặt kích thước của tiêu đề
titleLabel.Position = UDim2.new(0, 0, 0, 0)  -- Vị trí của tiêu đề
titleLabel.Text = "Cửa Sổ Của Tôi"  -- Nội dung tiêu đề
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Màu chữ trắng
titleLabel.TextSize = 24  -- Kích thước chữ
titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Nền tiêu đề màu đen
titleLabel.TextAlign = Enum.TextAnchor.MiddleCenter  -- Canh giữa văn bản

-- Tạo một nút bấm (Button) để đóng cửa sổ
local closeButton = Instance.new("TextButton")
closeButton.Parent = window
closeButton.Size = UDim2.new(0, 100, 0, 40)  -- Kích thước nút
closeButton.Position = UDim2.new(1, -110, 1, -50)  -- Đặt vị trí nút ở góc dưới bên phải
closeButton.Text = "Đóng"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Nền nút màu đỏ
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Màu chữ trắng

-- Thêm sự kiện để đóng cửa sổ khi nút bấm được nhấn
closeButton.MouseButton1Click:Connect(function()
    window.Visible = false  -- Ẩn cửa sổ
end)

-- Thêm sự kiện để mở cửa sổ khi nhấn vào Label
openLabel.MouseButton1Click:Connect(function()
    window.Visible = true  -- Hiển thị cửa sổ khi nhấn vào Label
end)
