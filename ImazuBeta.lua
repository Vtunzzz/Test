local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
--------------------------------------------------------------------------------------------------------------------------------------------
local Window = Fluent:CreateWindow({
    Title ="Imazu Hub ",
    SubTitle = "by vtung",
    TabWidth = 160,
    Size = UDim2.fromOffset(450, 300),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.End -- Used when theres no MinimizeKeybind
})

local Options = Fluent.Options

--------------------------------------------------------------------------------------------------------------------------------------------
    repeat wait() until game.Players
    repeat wait() until game.Players.LocalPlayer
    repeat wait() until game.ReplicatedStorage
    repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
    repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
    repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
    repeat wait() until game:GetService("Players")
    repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Energy")
    
    wait(0.1)
    
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Setting = Window:AddTab({ Title = "Setting", Icon = "settings" }),
    Stats = Window:AddTab({ Title = "Stats", Icon = "plus-circle" }),
    Player = Window:AddTab({ Title = "Player", Icon = "baby" }),
    Teleport = Window:AddTab({ Title = "Teleport", Icon = "palmtree" }),
    Fruit = Window:AddTab({ Title = "Devil Fruit", Icon = "cherry" }),
    Raid = Window:AddTab({ Title = "Dungeon", Icon = "swords" }),
    Race = Window:AddTab({ Title = "Race V4", Icon = "chevrons-right" }),
    Shop = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" }),
	Misc = Window:AddTab({ Title = "Misc", Icon = "list-plus" }),
}

local ToggleGun = Tabs.Setting:AddToggle("ToggleGun", {Title = "Gun", Default = false })
    ToggleBringMob:OnChanged(function(Value)
        BringMobs = Value
    end)
    Options.ToggleBringMob:SetValue(true)
     spawn(function()
        while task.wait() do
            pcall(function()
  function Click()
    if not _G.FastAttack then
        local Module = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
        local CombatFramework = debug.getupvalues(Module)[2]
        local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
        
        -- Dừng hiệu ứng lắc camera nếu có
        CamShake:Stop()

        -- Giả lập bắn súng và kích hoạt hitbox
        if CombatFramework.activeController and CombatFramework.activeController.weapon then
            local weapon = CombatFramework.activeController.weapon
            if weapon:IsA("Tool") and weapon.Name == "Gun" then
                -- Giả lập hành động bắn súng
                game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))

                -- Thêm code tùy chỉnh để điều chỉnh các tham số súng nếu cần
                weapon.FireRate = 0  -- Giảm thời gian giữa các lần bắn
                weapon.Recoil = 0    -- Giảm độ giật nếu có
                
                -- Tạo hitbox
                local character = game.Players.LocalPlayer.Character
                local gunMuzzle = weapon.Handle -- Giả sử phần đầu nòng súng có tên là "Handle"
                if character and gunMuzzle then
                    -- Tạo một phần hitbox tại đầu nòng súng
                    local hitbox = Instance.new("Part")
                    hitbox.Size = Vector3.new(1, 1, 1)  -- Kích thước hitbox (có thể điều chỉnh)
                    hitbox.Shape = Enum.PartType.Ball  -- Hoặc có thể là Box, tùy theo kiểu hitbox bạn muốn
                    hitbox.Position = gunMuzzle.Position
                    hitbox.Anchored = true
                    hitbox.CanCollide = false
                    hitbox.Parent = game.Workspace
                    
                    -- Xác định khoảng cách của hitbox
                    local direction = (gunMuzzle.CFrame.LookVector) * 50  -- Bắn đi 50 studs từ đầu nòng súng
                    hitbox.CFrame = CFrame.new(gunMuzzle.Position, gunMuzzle.Position + direction)
                    
                    -- Kiểm tra các đối tượng bị ảnh hưởng (trúng đạn)
                    local ray = Ray.new(gunMuzzle.Position, direction)
                    local hitPart, hitPosition = game.Workspace:FindPartOnRay(ray, character)

                    -- Nếu có đối tượng bị trúng đạn
                    if hitPart then
                        print("Trúng đạn: " .. hitPart.Name)
                        -- Thêm code xử lý trúng đạn ở đây (ví dụ: gây sát thương)
                    end
                    
                    -- Xóa hitbox sau khi bắn xong
                    game.Debris:AddItem(hitbox, 0.1)  -- Xóa hitbox sau 0.1 giây
                end
            end
        end
    end
end


local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Tạo ImageButton và điều chỉnh kích thước lớn hơn
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
ImageButton.Size = UDim2.new(0.2, 0, 0.2, 0)  -- Tăng kích thước để ImageButton lớn hơn
ImageButton.Image = "rbxassetid://105698709124312"

-- Thêm UICorner để bo góc
UICorner.CornerRadius = UDim.new(0, 20)  -- Tăng bán kính góc bo tròn (làm bo tròn hơn)
UICorner.Parent = ImageButton

-- Áp dụng hiệu ứng gradient cho ImageButton
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(244, 0, 0)),
    ColorSequenceKeypoint.new(0.32, Color3.fromRGB(146, 255, 251)),
    ColorSequenceKeypoint.new(0.65, Color3.fromRGB(180, 255, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(96, 255, 231))
}
UIGradient.Parent = ImageButton

-- Đảm bảo tỷ lệ hình vuông cho ImageButton
UIAspectRatioConstraint.Parent = ImageButton
UIAspectRatioConstraint.AspectRatio = 1  -- Giữ tỷ lệ 1:1, đảm bảo hình vuông

-- Tính năng kéo thả
local function YTZCAJC_fake_script()
    local script = Instance.new('LocalScript', ImageButton)

    local UIS = game:GetService('UserInputService')
    local frame = script.Parent
    local dragToggle = nil
    local dragSpeed = 0.25
    local dragStart = nil
    local startPos = nil

    local function updateInput(input)
        local delta = input.Position - dragStart
        local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
    end

    frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
            dragToggle = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if dragToggle then
                updateInput(input)
            end
        end
    end)

    script.Parent.MouseButton1Click:Connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.End,false,game)
    end)
end
coroutine.wrap(YTZCAJC_fake_script)()  
    