local Update = {}

function Update:Window(keybind)
    local keybind = keybind or Enum.KeyCode.RightControl
    local yoo = string.gsub(tostring(keybind), "Enum.KeyCode.", "")

    -- Tạo cửa sổ UI
    local Anchor = Instance.new("ScreenGui")
    Anchor.Name = "Anchor"
    Anchor.Parent = game.CoreGui
    Anchor.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = Anchor
    Main.ClipsDescendants = true
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Main.BackgroundTransparency = .3
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 0, 0, 0)

    -- Tạo hiệu ứng hoạt hình (Tween) cho kích thước của cửa sổ
    Main:TweenSize(UDim2.new(0, 656, 0, 400), "Out", "Quad", 0, true)
    Main:TweenSize(UDim2.new(0, 656, 0, 350), "Out", "Quad", 0, true)
    Main:TweenSize(UDim2.new(0, 555, 0, 352), "Out", "Quad", 0, true)

    -- Thêm các thành phần khác như TextLabel, UIStroke, v.v.
    local BtnStroke = Instance.new("UIStroke")
    BtnStroke.Name = "BtnStroke"
    BtnStroke.Parent = Main
    BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    BtnStroke.Color = Color3.fromRGB(35, 107, 232)
    BtnStroke.LineJoinMode = Enum.LineJoinMode.Round
    BtnStroke.Thickness = 1.5
    BtnStroke.Transparency = 0
    BtnStroke.Enabled = true
    BtnStroke.Archivable = true

    -- Thêm góc bo cho các thành phần UI
    local UICorner = Instance.new("UICorner")
    UICorner.Parent = Page

    -- Các thành phần giao diện khác (TextLabel, Frame, v.v.)
    local Page = Instance.new("ImageLabel")
    Page.Name = "Page"
    Page.Parent = Main
    Page.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Page.BackgroundTransparency = 1.10
    Page.Position = UDim2.new(0.405, 0, 0.075, 0)
    Page.Size = UDim2.new(0, 263, 0, 325)
    Page.Image = "http://www.roblox.com/asset/?id=" .. tostring(0)
end
