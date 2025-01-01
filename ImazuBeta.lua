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
local Input = Tabs.Home:AddInput("Input", {
        Title = "Job Id",
        Default = "",
        Placeholder = "",
        Numeric = false, 
        Finished = false,
        Callback = function(SexGay)
        VtungDzDaTai = SexGay
        end
    })
Tabs.Home:AddButton({
    Title = "Join Server",
    Description = "Wait Join",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,VtungDzDaTai, game.Players.LocalPlayer)
    end
})




local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")


ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
ImageButton.Size = UDim2.new(0.0627121851, 0, 0.107579626, 0)
ImageButton.Image = "rbxassetid://70734752670140"

UICorner.CornerRadius = UDim.new(0, 30)
UICorner.Parent = ImageButton

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(244, 0, 0)), ColorSequenceKeypoint.new(0.32, Color3.fromRGB(146, 255, 251)), ColorSequenceKeypoint.new(0.65, Color3.fromRGB(180, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(96, 255, 231))}
UIGradient.Parent = ImageButton

UIAspectRatioConstraint.Parent = ImageButton
UIAspectRatioConstraint.AspectRatio = 0.988


local function HCEGY_fake_script()
	local script = Instance.new('LocalScript', UIGradient)

	local TweenService = game:GetService("TweenService")
	local tweeninfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
	local tween = TweenService:Create(script.Parent, tweeninfo, {Rotation = 360})
	tween:Play()
end
coroutine.wrap(HCEGY_fake_script)()
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

game.StarterGui:SetCore("SendNotification", {
      Icon = "";
      Title = "Imazu Hub", 
      Text = "Complete !";
})                                                                                              
