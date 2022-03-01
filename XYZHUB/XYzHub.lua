local StarHub = {}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")
local pfp
local user
local tag
local userinfo = {}

_G.StarHub = "Star"
_G.Version = "Paid"

if game.CoreGui:FindFirstChild(_G.StarHub .."," .. _G.Version) then
	game.CoreGui:FindFirstChild(_G.StarHub .."," .. _G.Version):Destroy()
end

pcall(function()
	userinfo = HttpService:JSONDecode(readfile("Star.txt"));
end)

pfp = userinfo["pfp"] or "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"
user =  userinfo["user"] or game.Players.LocalPlayer.Name
tag = userinfo["tag"] or tostring(math.random(1,10))

local function SaveInfo()
	userinfo["pfp"] = pfp
	userinfo["user"] = user
	userinfo["tag"] = tag
	writefile("StarHub.txt", HttpService:JSONEncode(userinfo));
end

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(StartPosition.X.Scale,StartPosition.X.Offset + Delta.X,StartPosition.Y.Scale,StartPosition.Y.Offset + Delta.Y)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end)
end

local StarHubPaid = Instance.new("ScreenGui")
StarHubPaid.Name = _G.StarHub .."," .. _G.Version
StarHubPaid.Parent = game.CoreGui
StarHubPaid.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.RightControl then
		wait()
		StarHubPaid.Enabled = not StarHubPaid.Enabled
	end
end)

function StarHub:Window(text)
	local currentservertoggled = ""
	local minimized = false
	local fs = false
	local settingsopened = false
	local MainFrame = Instance.new("Frame")
	local TopFrame = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local CloseBtn = Instance.new("TextButton")
	local CloseIcon = Instance.new("ImageLabel")
	local MinimizeBtn = Instance.new("TextButton")
	local MinimizeIcon = Instance.new("ImageLabel")
	local ServersHolder = Instance.new("Folder")
	local Userpad = Instance.new("Frame")
	local UserIcon = Instance.new("Frame")
	local UserIconCorner = Instance.new("UICorner")
	local Corner_1 = Instance.new("UICorner")
	local UserImage = Instance.new("ImageLabel")
	local UserCircleImage = Instance.new("ImageLabel")
	local UserName = Instance.new("TextLabel")
	local UserTag = Instance.new("TextLabel")
	local ServersHoldFrame = Instance.new("Frame")
	local ServersHold = Instance.new("ScrollingFrame")
	local ServersHoldLayout = Instance.new("UIListLayout")
	local ServersHoldPadding = Instance.new("UIPadding")
	local TopFrameHolder = Instance.new("Frame")

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = StarHubPaid
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
	MainFrame.BorderSizePixel = 0
	MainFrame.ClipsDescendants = true
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 611, 0, 0)

	MainFrame:TweenSize(UDim2.new(0, 611, 0, 396), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.2, true)

	Corner_1.CornerRadius = UDim.new(0, 7)
	Corner_1.Name = "UserIconCorner"
	Corner_1.Parent = MainFrame

	TopFrame.Name = "TopFrame"
	TopFrame.Parent = MainFrame
	TopFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
	TopFrame.BackgroundTransparency = 1.000
	TopFrame.BorderSizePixel = 0
	TopFrame.Position = UDim2.new(-0.000658480625, 0, 0, 0)
	TopFrame.Size = UDim2.new(0, 681, 0, 22)

	TopFrameHolder.Name = "TopFrameHolder"
	TopFrameHolder.Parent = TopFrame
	TopFrameHolder.BackgroundColor3 = Color3.fromRGB(20,20,20)
	TopFrameHolder.BackgroundTransparency = 1.000
	TopFrameHolder.BorderSizePixel = 0
	TopFrameHolder.Position = UDim2.new(-0.000658480625, 0, 0, 0)
	TopFrameHolder.Size = UDim2.new(0, 20, 0, 22)


	Title.Name = "Title"
	Title.Parent = TopFrame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0102790017, 0, 0, 0)
	Title.Size = UDim2.new(0, 192, 0, 23)
	Title.Font = Enum.Font.GothamBold
	Title.Text = text
	Title.TextColor3 = _G.Color
	Title.TextSize = 13.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	CloseBtn.Name = "CloseBtn"
	CloseBtn.Parent = TopFrame
	CloseBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
	CloseBtn.BackgroundTransparency = 0
	CloseBtn.Position = UDim2.new(0.85, 0, -0.0169996787, 0)
	CloseBtn.Size = UDim2.new(0, 28, 0, 22)
	CloseBtn.Font = Enum.Font.Gotham
	CloseBtn.Text = ""
	CloseBtn.TextColor3 = _G.Color
	CloseBtn.TextSize = 14.000
	CloseBtn.BorderSizePixel = 0
	CloseBtn.AutoButtonColor = false

	CloseIcon.Name = "CloseIcon"
	CloseIcon.Parent = CloseBtn
	CloseIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseIcon.BackgroundTransparency = 1.000
	CloseIcon.Position = UDim2.new(0.2, 0, 0.128935531, 0)
	CloseIcon.Size = UDim2.new(0, 17, 0, 17)
	CloseIcon.Image = "http://www.roblox.com/asset/?id=6035047409"
	CloseIcon.ImageColor3 = Color3.fromRGB(220, 221, 222)

	MinimizeBtn.Name = "MinimizeButton"
	MinimizeBtn.Parent = TopFrame
	MinimizeBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
	MinimizeBtn.BackgroundTransparency = 0
	MinimizeBtn.Position = UDim2.new(0.8, 0, -0.0169996787, 0)
	MinimizeBtn.Size = UDim2.new(0, 28, 0, 22)
	MinimizeBtn.Font = Enum.Font.Gotham
	MinimizeBtn.Text = ""
	MinimizeBtn.TextColor3 = _G.Color
	MinimizeBtn.TextSize = 14.000
	MinimizeBtn.BorderSizePixel = 0
	MinimizeBtn.AutoButtonColor = false

	MinimizeIcon.Name = "MinimizeLabel"
	MinimizeIcon.Parent = MinimizeBtn
	MinimizeIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeIcon.BackgroundTransparency = 1.000
	MinimizeIcon.Position = UDim2.new(0.2, 0, 0.128935531, 0)
	MinimizeIcon.Size = UDim2.new(0, 17, 0, 17)
	MinimizeIcon.Image = "http://www.roblox.com/asset/?id=6035067836"
	MinimizeIcon.ImageColor3 = Color3.fromRGB(220, 221, 222)

	ServersHolder.Name = "ServersHolder"
	ServersHolder.Parent = TopFrameHolder

	Userpad.Name = "Userpad"
	Userpad.Parent = TopFrameHolder
	Userpad.BackgroundColor3 = Color3.fromRGB(20,20,20)
	Userpad.BorderSizePixel = 0
	Userpad.Position = UDim2.new(0.106243297, 0, 15.9807148, 0)
	Userpad.Size = UDim2.new(0, 179, 0, 43)

	UserIcon.Name = "UserIcon"
	UserIcon.Parent = Userpad
	UserIcon.BackgroundColor3 = Color3.fromRGB(20,20,20)
	UserIcon.BorderSizePixel = 0
	UserIcon.Position = UDim2.new(0.0340000018, 0, 0.123999998, 0)
	UserIcon.Size = UDim2.new(0, 32, 0, 32)

	UserIconCorner.CornerRadius = UDim.new(1, 8)
	UserIconCorner.Name = "UserIconCorner"
	UserIconCorner.Parent = UserIcon

	UserImage.Name = "UserImage"
	UserImage.Parent = UserIcon
	UserImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserImage.BackgroundTransparency = 1.000
	UserImage.Size = UDim2.new(0, 32, 0, 32)
	UserImage.Image = pfp
	UserImage.ImageTransparency = 1

	UserCircleImage.Name = "UserImage"
	UserCircleImage.Parent = UserImage
	UserCircleImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserCircleImage.BackgroundTransparency = 1.000
	UserCircleImage.Size = UDim2.new(0, 32, 0, 32)
	UserCircleImage.Image = "rbxassetid://4031889928"
	UserCircleImage.ImageColor3 = Color3.fromRGB(20,20,20)

	UserName.Name = "UserName"
	UserName.Parent = Userpad
	UserName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserName.BackgroundTransparency = 1.000
	UserName.BorderSizePixel = 0
	UserName.Position = UDim2.new(0.230000004, 0, 0.115999997, 0)
	UserName.Size = UDim2.new(0, 98, 0, 17)
	UserName.Font = Enum.Font.GothamSemibold
	UserName.TextSize = 13.000
	UserName.TextXAlignment = Enum.TextXAlignment.Left
	UserName.ClipsDescendants = true
	UserName.TextTransparency = 1

	UserTag.Name = "UserTag"
	UserTag.Parent = Userpad
	UserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserTag.BackgroundTransparency = 1.000
	UserTag.BorderSizePixel = 0
	UserTag.Position = UDim2.new(0.230000004, 0, 0.455000013, 0)
	UserTag.Size = UDim2.new(0, 95, 0, 17)
	UserTag.Font = Enum.Font.Gotham
	UserTag.TextColor3 = _G.Color
	UserTag.TextSize = 13.000
	UserTag.TextXAlignment = Enum.TextXAlignment.Left
	UserTag.TextTransparency = 1

	UserName.Text = user
	UserTag.Text = "#" .. tag

	ServersHoldFrame.Name = "ServersHoldFrame"
	ServersHoldFrame.Parent = MainFrame
	ServersHoldFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ServersHoldFrame.BackgroundTransparency = 1.000
	ServersHoldFrame.BorderColor3 = Color3.fromRGB(20,20,20)
	ServersHoldFrame.Size = UDim2.new(0, 71, 0, 396)

	ServersHold.Name = "ServersHold"
	ServersHold.Parent = ServersHoldFrame
	ServersHold.Active = true
	ServersHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ServersHold.BackgroundTransparency = 1.000
	ServersHold.BorderSizePixel = 0
	ServersHold.Position = UDim2.new(-0.000359333731, 0, 0.0580808073, 0)
	ServersHold.Size = UDim2.new(0, 71, 0, 373)
	ServersHold.ScrollBarThickness = 1
	ServersHold.ScrollBarImageTransparency = 1
	ServersHold.CanvasSize = UDim2.new(0, 0, 0, 0)

	ServersHoldLayout.Name = "ServersHoldLayout"
	ServersHoldLayout.Parent = ServersHold
	ServersHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ServersHoldLayout.Padding = UDim.new(0, 7)

	ServersHoldPadding.Name = "ServersHoldPadding"
	ServersHoldPadding.Parent = ServersHold

	CloseBtn.MouseButton1Click:Connect(
		function()
			MainFrame:TweenSize(UDim2.new(0, 611, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .5, true)
		end
	)

	CloseBtn.MouseEnter:Connect(
		function()
			CloseBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
		end
	)

	CloseBtn.MouseLeave:Connect(
		function()
			CloseBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
		end
	)

	MinimizeBtn.MouseEnter:Connect(
		function()
			MinimizeBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
		end
	)

	MinimizeBtn.MouseLeave:Connect(
		function()
			MinimizeBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
		end
	)

	MinimizeBtn.MouseButton1Click:Connect(
		function()
			if minimized == false then
				MainFrame:TweenSize(
					UDim2.new(0, 611, 0, 22),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Quart,
					.3,
					true
				)
			else
				MainFrame:TweenSize(
					UDim2.new(0, 611, 0, 396),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Quart,
					.3,
					true
				)
			end
			minimized = not minimized
		end
	)

	local SettingsOpenBtn = Instance.new("TextButton")
	local SettingsOpenBtnIco = Instance.new("ImageLabel")

	SettingsOpenBtn.Name = "SettingsOpenBtn"
	SettingsOpenBtn.Parent = Userpad
	SettingsOpenBtn.BackgroundColor3 = Color3.fromRGB(53, 56, 62)
	SettingsOpenBtn.BackgroundTransparency = 1.000
	SettingsOpenBtn.Position = UDim2.new(0.03, 0, 0.2, 0)
	SettingsOpenBtn.Size = UDim2.new(0, 0, 0, 0)
	SettingsOpenBtn.Font = Enum.Font.SourceSans
	SettingsOpenBtn.Text = ""
	SettingsOpenBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	SettingsOpenBtn.TextSize = 14.000


	SettingsOpenBtnIco.Name = "SettingsOpenBtnIco"
	SettingsOpenBtnIco.Parent = SettingsOpenBtn
	SettingsOpenBtnIco.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
	SettingsOpenBtnIco.BackgroundTransparency = 1.000
	SettingsOpenBtnIco.Size = UDim2.new(0, 0, 0, 0)
	SettingsOpenBtnIco.ImageTransparency = 1
	SettingsOpenBtnIco.Image = "http://www.roblox.com/asset/?id=8968329498"
	SettingsOpenBtnIco.ImageColor3 = Color3.fromRGB(220, 220, 220)
	local SettingsFrame = Instance.new("Frame")
	local Settings = Instance.new("Frame")
	local SettingsHolder = Instance.new("Frame")
	local CloseSettingsBtn = Instance.new("TextButton")
	local CloseSettingsBtnCorner = Instance.new("UICorner")
	local CloseSettingsBtnCircle = Instance.new("Frame")
	local CloseSettingsBtnCircleCorner = Instance.new("UICorner")
	local CloseSettingsBtnIcon = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local UserPanel = Instance.new("Frame")
	local UserSettingsPad = Instance.new("Frame")
	local UserSettingsPadCorner = Instance.new("UICorner")
	local UsernameText = Instance.new("TextLabel")
	local UserSettingsPadUserTag = Instance.new("Frame")
	local UserSettingsPadUser = Instance.new("TextLabel")
	local UserSettingsPadUserTagLayout = Instance.new("UIListLayout")
	local UserSettingsPadTag = Instance.new("TextLabel")
	local EditBtn = Instance.new("TextButton")
	local EditBtnCorner = Instance.new("UICorner")
	local UserPanelUserIcon = Instance.new("TextButton")
	local UserPanelUserImage = Instance.new("ImageLabel")
	local UserPanelUserCircle = Instance.new("ImageLabel")
	local BlackFrame = Instance.new("Frame")
	local BlackFrameCorner = Instance.new("UICorner")
	local ChangeAvatarText = Instance.new("TextLabel")
	local SearchIcoFrame = Instance.new("Frame")
	local SearchIcoFrameCorner = Instance.new("UICorner")
	local SearchIco = Instance.new("ImageLabel")
	local UserPanelUserTag = Instance.new("Frame")
	local UserPanelUser = Instance.new("TextLabel")
	local UserPanelUserTagLayout = Instance.new("UIListLayout")
	local UserPanelTag = Instance.new("TextLabel")
	local UserPanelCorner = Instance.new("UICorner")
	local LeftFrame = Instance.new("Frame")
	local MyAccountBtn = Instance.new("TextButton")
	local MyAccountBtnCorner = Instance.new("UICorner")
	local MyAccountBtnTitle = Instance.new("TextLabel")
	local SettingsTitle = Instance.new("TextLabel")
	local DiscordInfo = Instance.new("TextLabel")
	local CurrentSettingOpen = Instance.new("TextLabel")

	SettingsFrame.Name = "SettingsFrame"
	SettingsFrame.Parent = MainFrame
	SettingsFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
	SettingsFrame.BackgroundTransparency = 1.000
	SettingsFrame.Size = UDim2.new(0, 681, 0, 396)
	SettingsFrame.Visible = false

	Settings.Name = "Settings"
	Settings.Parent = SettingsFrame
	Settings.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	Settings.BorderSizePixel = 0
	Settings.Position = UDim2.new(0, 0, 0.0530303046, 0)
	Settings.Size = UDim2.new(0, 681, 0, 375)

	SettingsHolder.Name = "SettingsHolder"
	SettingsHolder.Parent = Settings
	SettingsHolder.AnchorPoint = Vector2.new(0.5, 0.5)
	SettingsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingsHolder.BackgroundTransparency = 1.000
	SettingsHolder.ClipsDescendants = true
	SettingsHolder.Position = UDim2.new(0.49926579, 0, 0.498666674, 0)
	SettingsHolder.Size = UDim2.new(0, 0, 0, 0)

	CloseSettingsBtn.Name = "CloseSettingsBtn"
	CloseSettingsBtn.Parent = SettingsHolder
	CloseSettingsBtn.AnchorPoint = Vector2.new(0.5, 0.5)
	CloseSettingsBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
	CloseSettingsBtn.Position = UDim2.new(0.952967286, 0, 0.0853333324, 0)
	CloseSettingsBtn.Selectable = false
	CloseSettingsBtn.Size = UDim2.new(0, 30, 0, 30)
	CloseSettingsBtn.AutoButtonColor = false
	CloseSettingsBtn.Font = Enum.Font.SourceSans
	CloseSettingsBtn.Text = ""
	CloseSettingsBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	CloseSettingsBtn.TextSize = 14.000

	CloseSettingsBtnCorner.CornerRadius = UDim.new(1, 0)
	CloseSettingsBtnCorner.Name = "CloseSettingsBtnCorner"
	CloseSettingsBtnCorner.Parent = CloseSettingsBtn

	CloseSettingsBtnCircle.Name = "CloseSettingsBtnCircle"
	CloseSettingsBtnCircle.Parent = CloseSettingsBtn
	CloseSettingsBtnCircle.BackgroundColor3 = _G.Color
	CloseSettingsBtnCircle.Position = UDim2.new(0.0879999995, 0, 0.118000001, 0)
	CloseSettingsBtnCircle.Size = UDim2.new(0, 24, 0, 24)

	CloseSettingsBtnCircleCorner.CornerRadius = UDim.new(1, 0)
	CloseSettingsBtnCircleCorner.Name = "CloseSettingsBtnCircleCorner"
	CloseSettingsBtnCircleCorner.Parent = CloseSettingsBtnCircle

	CloseSettingsBtnIcon.Name = "CloseSettingsBtnIcon"
	CloseSettingsBtnIcon.Parent = CloseSettingsBtnCircle
	CloseSettingsBtnIcon.BackgroundColor3 = _G.Color
	CloseSettingsBtnIcon.BackgroundTransparency = 1.000
	CloseSettingsBtnIcon.Position = UDim2.new(0, 2, 0, 2)
	CloseSettingsBtnIcon.Size = UDim2.new(0, 19, 0, 19)
	CloseSettingsBtnIcon.Image = "http://www.roblox.com/asset/?id=6035047409"
	CloseSettingsBtnIcon.ImageColor3 = Color3.fromRGB(222, 222, 222)

	CloseSettingsBtn.MouseButton1Click:Connect(function()
		settingsopened = false
		TopFrameHolder.Visible = true
		ServersHoldFrame.Visible = true
		SettingsHolder:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
		TweenService:Create(
			Settings,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 1}
		):Play()
		for i,v in next, SettingsHolder:GetChildren() do
			TweenService:Create(
				v,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
		end
		wait(.3)
		SettingsFrame.Visible = false
	end)

	CloseSettingsBtn.MouseEnter:Connect(function()
		CloseSettingsBtnCircle.BackgroundColor3 = _G.Color
	end)

	CloseSettingsBtn.MouseLeave:Connect(function()
		CloseSettingsBtnCircle.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	end)

	UserInputService.InputBegan:Connect(
		function(io, p)
			if io.KeyCode == Enum.KeyCode.RightControl then
				if settingsopened == true then
					settingsopened = false
					TopFrameHolder.Visible = true
					ServersHoldFrame.Visible = true
					SettingsHolder:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					TweenService:Create(
						Settings,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					for i,v in next, SettingsHolder:GetChildren() do
						TweenService:Create(
							v,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundTransparency = 1}
						):Play()
					end
					wait(.3)
					SettingsFrame.Visible = false
				end
			end
		end
	)

	TextLabel.Parent = CloseSettingsBtn
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(-0.0666666701, 0, 1.06666672, 0)
	TextLabel.Size = UDim2.new(0, 34, 0, 22)
	TextLabel.Font = Enum.Font.GothamSemibold
	TextLabel.Text = "rightctrl"
	TextLabel.TextColor3 = Color3.fromRGB(113, 117, 123)
	TextLabel.TextSize = 11.000

	UserPanel.Name = "UserPanel"
	UserPanel.Parent = SettingsHolder
	UserPanel.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
	UserPanel.Position = UDim2.new(0.365638763, 0, 0.130666673, 0)
	UserPanel.Size = UDim2.new(0, 362, 0, 164)

	UserSettingsPad.Name = "UserSettingsPad"
	UserSettingsPad.Parent = UserPanel
	UserSettingsPad.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
	UserSettingsPad.Position = UDim2.new(0.0331491716, 0, 0.568140388, 0)
	UserSettingsPad.Size = UDim2.new(0, 337, 0, 56)

	UserSettingsPadCorner.Name = "UserSettingsPadCorner"
	UserSettingsPadCorner.Parent = UserSettingsPad

	UsernameText.Name = "UsernameText"
	UsernameText.Parent = UserSettingsPad
	UsernameText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UsernameText.BackgroundTransparency = 1.000
	UsernameText.Position = UDim2.new(0.0419999994, 0, 0.154714286, 0)
	UsernameText.Size = UDim2.new(0, 65, 0, 19)
	UsernameText.Font = Enum.Font.GothamBold
	UsernameText.Text = "USERNAME"
	UsernameText.TextColor3 = Color3.fromRGB(126, 130, 136)
	UsernameText.TextSize = 11.000
	UsernameText.TextXAlignment = Enum.TextXAlignment.Left

	UserSettingsPadUserTag.Name = "UserSettingsPadUserTag"
	UserSettingsPadUserTag.Parent = UserSettingsPad
	UserSettingsPadUserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadUserTag.BackgroundTransparency = 1.000
	UserSettingsPadUserTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
	UserSettingsPadUserTag.Size = UDim2.new(0, 65, 0, 19)

	UserSettingsPadUser.Name = "UserSettingsPadUser"
	UserSettingsPadUser.Parent = UserSettingsPadUserTag
	UserSettingsPadUser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadUser.BackgroundTransparency = 1.000
	UserSettingsPadUser.Font = Enum.Font.Gotham
	UserSettingsPadUser.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadUser.TextSize = 13.000
	UserSettingsPadUser.TextXAlignment = Enum.TextXAlignment.Left
	UserSettingsPadUser.Text = user
	UserSettingsPadUser.Size = UDim2.new(0, UserSettingsPadUser.TextBounds.X + 2, 0, 19)

	UserSettingsPadUserTagLayout.Name = "UserSettingsPadUserTagLayout"
	UserSettingsPadUserTagLayout.Parent = UserSettingsPadUserTag
	UserSettingsPadUserTagLayout.FillDirection = Enum.FillDirection.Horizontal
	UserSettingsPadUserTagLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UserSettingsPadTag.Name = "UserSettingsPadTag"
	UserSettingsPadTag.Parent = UserSettingsPadUserTag
	UserSettingsPadTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingsPadTag.BackgroundTransparency = 1.000
	UserSettingsPadTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
	UserSettingsPadTag.Size = UDim2.new(0, 65, 0, 19)
	UserSettingsPadTag.Font = Enum.Font.Gotham
	UserSettingsPadTag.Text = "#" .. tag
	UserSettingsPadTag.TextColor3 = Color3.fromRGB(184, 186, 189)
	UserSettingsPadTag.TextSize = 13.000
	UserSettingsPadTag.TextXAlignment = Enum.TextXAlignment.Left

	EditBtn.Name = "EditBtn"
	EditBtn.Parent = UserSettingsPad
	EditBtn.BackgroundColor3 = Color3.fromRGB(116, 127, 141)
	EditBtn.Position = UDim2.new(0.797671914, 0, 0.232142866, 0)
	EditBtn.Size = UDim2.new(0, 55, 0, 30)
	EditBtn.Font = Enum.Font.Gotham
	EditBtn.Text = "Edit"
	EditBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	EditBtn.TextSize = 14.000
	EditBtn.AutoButtonColor = false

	EditBtn.MouseEnter:Connect(function()
		TweenService:Create(
			EditBtn,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundColor3 = Color3.fromRGB(104,114,127)}
		):Play()
	end)

	EditBtn.MouseLeave:Connect(function()
		TweenService:Create(
			EditBtn,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundColor3 = Color3.fromRGB(116, 127, 141)}
		):Play()
	end)

	EditBtnCorner.CornerRadius = UDim.new(0, 3)
	EditBtnCorner.Name = "EditBtnCorner"
	EditBtnCorner.Parent = EditBtn

	UserPanelUserIcon.Name = "UserPanelUserIcon"
	UserPanelUserIcon.Parent = UserPanel
	UserPanelUserIcon.BackgroundColor3 = Color3.fromRGB(31, 33, 36)
	UserPanelUserIcon.BorderSizePixel = 0
	UserPanelUserIcon.Position = UDim2.new(0.0340000018, 0, 0.074000001, 0)
	UserPanelUserIcon.Size = UDim2.new(0, 71, 0, 71)
	UserPanelUserIcon.AutoButtonColor = false
	UserPanelUserIcon.Text = ""

	UserPanelUserImage.Name = "UserPanelUserImage"
	UserPanelUserImage.Parent = UserPanelUserIcon
	UserPanelUserImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUserImage.BackgroundTransparency = 1.000
	UserPanelUserImage.Size = UDim2.new(0, 71, 0, 71)
	UserPanelUserImage.Image = pfp

	UserPanelUserCircle.Name = "UserPanelUserCircle"
	UserPanelUserCircle.Parent = UserPanelUserImage
	UserPanelUserCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUserCircle.BackgroundTransparency = 1.000
	UserPanelUserCircle.Size = UDim2.new(0, 71, 0, 71)
	UserPanelUserCircle.Image = "rbxassetid://4031889928"
	UserPanelUserCircle.ImageColor3 = Color3.fromRGB(47, 49, 54)

	BlackFrame.Name = "BlackFrame"
	BlackFrame.Parent = UserPanelUserIcon
	BlackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	BlackFrame.BackgroundTransparency = 0.400
	BlackFrame.BorderSizePixel = 0
	BlackFrame.Size = UDim2.new(0, 71, 0, 71)
	BlackFrame.Visible = false

	BlackFrameCorner.CornerRadius = UDim.new(1, 8)
	BlackFrameCorner.Name = "BlackFrameCorner"
	BlackFrameCorner.Parent = BlackFrame

	ChangeAvatarText.Name = "ChangeAvatarText"
	ChangeAvatarText.Parent = BlackFrame
	ChangeAvatarText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ChangeAvatarText.BackgroundTransparency = 1.000
	ChangeAvatarText.Size = UDim2.new(0, 71, 0, 71)
	ChangeAvatarText.Font = Enum.Font.GothamBold
	ChangeAvatarText.Text = "CHAGNE    AVATAR"
	ChangeAvatarText.TextColor3 = Color3.fromRGB(255, 255, 255)
	ChangeAvatarText.TextSize = 11.000
	ChangeAvatarText.TextWrapped = true

	SearchIcoFrame.Name = "SearchIcoFrame"
	SearchIcoFrame.Parent = UserPanelUserIcon
	SearchIcoFrame.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
	SearchIcoFrame.Position = UDim2.new(0.657999992, 0, 0, 0)
	SearchIcoFrame.Size = UDim2.new(0, 20, 0, 20)

	SearchIcoFrameCorner.CornerRadius = UDim.new(1, 8)
	SearchIcoFrameCorner.Name = "SearchIcoFrameCorner"
	SearchIcoFrameCorner.Parent = SearchIcoFrame

	SearchIco.Name = "SearchIco"
	SearchIco.Parent = SearchIcoFrame
	SearchIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchIco.BackgroundTransparency = 1.000
	SearchIco.Position = UDim2.new(0.150000006, 0, 0.100000001, 0)
	SearchIco.Size = UDim2.new(0, 15, 0, 15)
	SearchIco.Image = "http://www.roblox.com/asset/?id=8968329498"
	SearchIco.ImageColor3 = Color3.fromRGB(114, 118, 125)

	UserPanelUserIcon.MouseEnter:Connect(function()
		BlackFrame.Visible = true
	end)

	UserPanelUserIcon.MouseLeave:Connect(function()
		BlackFrame.Visible = false
	end)

	UserPanelUserIcon.MouseButton1Click:Connect(function()
		local NotificationHolder = Instance.new("TextButton")
		NotificationHolder.Name = "NotificationHolder"
		NotificationHolder.Parent = SettingsHolder
		NotificationHolder.BackgroundColor3 = Color3.fromRGB(22,22,22)
		NotificationHolder.Position = UDim2.new(-0.00881057233, 0, -0.00266666664, 0)
		NotificationHolder.Size = UDim2.new(0, 687, 0, 375)
		NotificationHolder.AutoButtonColor = false
		NotificationHolder.Font = Enum.Font.SourceSans
		NotificationHolder.Text = ""
		NotificationHolder.TextColor3 = _G.Color
		NotificationHolder.TextSize = 14.000
		NotificationHolder.BackgroundTransparency = 1
		NotificationHolder.Visible = true
		TweenService:Create(
			NotificationHolder,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.2}
		):Play()



		local AvatarChange = Instance.new("Frame")
		local UserChangeCorner = Instance.new("UICorner")
		local UnderBar = Instance.new("Frame")
		local UnderBarCorner = Instance.new("UICorner")
		local UnderBarFrame = Instance.new("Frame")
		local Text1 = Instance.new("TextLabel")
		local Text2 = Instance.new("TextLabel")
		local TextBoxFrame = Instance.new("Frame")
		local TextBoxFrameCorner = Instance.new("UICorner")
		local TextBoxFrame1 = Instance.new("Frame")
		local TextBoxFrame1Corner = Instance.new("UICorner")
		local AvatarTextbox = Instance.new("TextBox")
		local ChangeBtn = Instance.new("TextButton")
		local ChangeCorner = Instance.new("UICorner")
		local CloseBtn2 = Instance.new("TextButton")
		local Close2Icon = Instance.new("ImageLabel")
		local CloseBtn1 = Instance.new("TextButton")
		local CloseBtn1Corner = Instance.new("UICorner")
		local ResetBtn = Instance.new("TextButton")
		local ResetCorner = Instance.new("UICorner")


		AvatarChange.Name = "AvatarChange"
		AvatarChange.Parent = NotificationHolder
		AvatarChange.AnchorPoint = Vector2.new(0.5, 0.5)
		AvatarChange.BackgroundColor3 = Color3.fromRGB(20,20,20)
		AvatarChange.ClipsDescendants = true
		AvatarChange.Position = UDim2.new(0.513071597, 0, 0.4746176, 0)
		AvatarChange.Size = UDim2.new(0, 0, 0, 0)
		AvatarChange.BackgroundTransparency = 1

		AvatarChange:TweenSize(UDim2.new(0, 346, 0, 198), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
		TweenService:Create(
			AvatarChange,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()


		UserChangeCorner.CornerRadius = UDim.new(0, 5)
		UserChangeCorner.Name = "UserChangeCorner"
		UserChangeCorner.Parent = AvatarChange

		UnderBar.Name = "UnderBar"
		UnderBar.Parent = AvatarChange
		UnderBar.BackgroundColor3 = Color3.fromRGB(25,25,25)
		UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
		UnderBar.Size = UDim2.new(0, 346, 0, 13)

		UnderBarCorner.CornerRadius = UDim.new(0, 5)
		UnderBarCorner.Name = "UnderBarCorner"
		UnderBarCorner.Parent = UnderBar

		UnderBarFrame.Name = "UnderBarFrame"
		UnderBarFrame.Parent = UnderBar
		UnderBarFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
		UnderBarFrame.BorderSizePixel = 0
		UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -2.53846145, 0)
		UnderBarFrame.Size = UDim2.new(0, 346, 0, 39)

		Text1.Name = "Text1"
		Text1.Parent = AvatarChange
		Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text1.BackgroundTransparency = 1.000
		Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
		Text1.Size = UDim2.new(0, 346, 0, 68)
		Text1.Font = Enum.Font.GothamSemibold
		Text1.Text = "Change your avatar"
		Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text1.TextSize = 20.000

		Text2.Name = "Text2"
		Text2.Parent = AvatarChange
		Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text2.BackgroundTransparency = 1.000
		Text2.Position = UDim2.new(-0.000594122568, 0, 0.141587839, 0)
		Text2.Size = UDim2.new(0, 346, 0, 63)
		Text2.Font = Enum.Font.Gotham
		Text2.Text = "Enter your new profile in a Roblox decal link."
		Text2.TextColor3 = Color3.fromRGB(171, 172, 176)
		Text2.TextSize = 14.000

		TextBoxFrame.Name = "TextBoxFrame"
		TextBoxFrame.Parent = AvatarChange
		TextBoxFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
		TextBoxFrame.Position = UDim2.new(0.49710983, 0, 0.560606062, 0)
		TextBoxFrame.Size = UDim2.new(0, 319, 0, 38)

		TextBoxFrameCorner.CornerRadius = UDim.new(0, 3)
		TextBoxFrameCorner.Name = "TextBoxFrameCorner"
		TextBoxFrameCorner.Parent = TextBoxFrame

		TextBoxFrame1.Name = "TextBoxFrame1"
		TextBoxFrame1.Parent = TextBoxFrame
		TextBoxFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame1.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
		TextBoxFrame1.ClipsDescendants = true
		TextBoxFrame1.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextBoxFrame1.Size = UDim2.new(0, 317, 0, 36)

		TextBoxFrame1Corner.CornerRadius = UDim.new(0, 3)
		TextBoxFrame1Corner.Name = "TextBoxFrame1Corner"
		TextBoxFrame1Corner.Parent = TextBoxFrame1

		AvatarTextbox.Name = "AvatarTextbox"
		AvatarTextbox.Parent = TextBoxFrame1
		AvatarTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		AvatarTextbox.BackgroundTransparency = 1.000
		AvatarTextbox.Position = UDim2.new(0.0378548913, 0, 0, 0)
		AvatarTextbox.Size = UDim2.new(0, 293, 0, 37)
		AvatarTextbox.Font = Enum.Font.Gotham
		AvatarTextbox.Text = ""
		AvatarTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
		AvatarTextbox.TextSize = 14.000
		AvatarTextbox.TextXAlignment = Enum.TextXAlignment.Left

		ChangeBtn.Name = "ChangeBtn"
		ChangeBtn.Parent = AvatarChange
		ChangeBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		ChangeBtn.Position = UDim2.new(0.749670506, 0, 0.823232353, 0)
		ChangeBtn.Size = UDim2.new(0, 76, 0, 27)
		ChangeBtn.Font = Enum.Font.Gotham
		ChangeBtn.Text = "Change"
		ChangeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ChangeBtn.TextSize = 13.000
		ChangeBtn.AutoButtonColor = false

		ChangeBtn.MouseEnter:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(103,123,196)}
			):Play()
		end)

		ChangeBtn.MouseLeave:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		ChangeBtn.MouseButton1Click:Connect(function()
			pfp = tostring(AvatarTextbox.Text)
			UserImage.Image = pfp
			UserPanelUserImage.Image = pfp
			SaveInfo()

			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)



		ChangeCorner.CornerRadius = UDim.new(0, 4)
		ChangeCorner.Name = "ChangeCorner"
		ChangeCorner.Parent = ChangeBtn

		CloseBtn2.Name = "CloseBtn2"
		CloseBtn2.Parent = AvatarChange
		CloseBtn2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.BackgroundTransparency = 1.000
		CloseBtn2.Position = UDim2.new(0.898000002, 0, 0, 0)
		CloseBtn2.Size = UDim2.new(0, 26, 0, 26)
		CloseBtn2.Font = Enum.Font.Gotham
		CloseBtn2.Text = ""
		CloseBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.TextSize = 14.000

		Close2Icon.Name = "Close2Icon"
		Close2Icon.Parent = CloseBtn2
		Close2Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Close2Icon.BackgroundTransparency = 1.000
		Close2Icon.Position = UDim2.new(-0.0384615399, 0, 0.312910825, 0)
		Close2Icon.Size = UDim2.new(0, 25, 0, 25)
		Close2Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
		Close2Icon.ImageColor3 = Color3.fromRGB(119, 122, 127)

		CloseBtn1.Name = "CloseBtn1"
		CloseBtn1.Parent = AvatarChange
		CloseBtn1.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		CloseBtn1.BackgroundTransparency = 1.000
		CloseBtn1.Position = UDim2.new(0.495000005, 0, 0.823000014, 0)
		CloseBtn1.Size = UDim2.new(0, 76, 0, 27)
		CloseBtn1.Font = Enum.Font.Gotham
		CloseBtn1.Text = "Close"
		CloseBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn1.TextSize = 13.000

		CloseBtn1Corner.CornerRadius = UDim.new(0, 4)
		CloseBtn1Corner.Name = "CloseBtn1Corner"
		CloseBtn1Corner.Parent = CloseBtn1

		ResetBtn.Name = "ResetBtn"
		ResetBtn.Parent = AvatarChange
		ResetBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		ResetBtn.BackgroundTransparency = 1.000
		ResetBtn.Position = UDim2.new(0.260895967, 0, 0.823000014, 0)
		ResetBtn.Size = UDim2.new(0, 76, 0, 27)
		ResetBtn.Font = Enum.Font.Gotham
		ResetBtn.Text = "Reset"
		ResetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ResetBtn.TextSize = 13.000

		ResetBtn.MouseButton1Click:Connect(function()
			pfp = "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"
			UserImage.Image = pfp
			UserPanelUserImage.Image = pfp
			SaveInfo()

			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		ResetCorner.CornerRadius = UDim.new(0, 4)
		ResetCorner.Name = "ResetCorner"
		ResetCorner.Parent = ResetBtn

		CloseBtn1.MouseButton1Click:Connect(function()
			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		CloseBtn2.MouseButton1Click:Connect(function()
			AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				AvatarChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		CloseBtn2.MouseEnter:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(210,210,210)}
			):Play()
		end)

		CloseBtn2.MouseLeave:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(119, 122, 127)}
			):Play()
		end)


		AvatarTextbox.Focused:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		AvatarTextbox.FocusLost:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
			):Play()
		end)


	end)

	UserPanelUserTag.Name = "UserPanelUserTag"
	UserPanelUserTag.Parent = UserPanel
	UserPanelUserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUserTag.BackgroundTransparency = 1.000
	UserPanelUserTag.Position = UDim2.new(0.271143615, 0, 0.231804818, 0)
	UserPanelUserTag.Size = UDim2.new(0, 113, 0, 19)

	UserPanelUser.Name = "UserPanelUser"
	UserPanelUser.Parent = UserPanelUserTag
	UserPanelUser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUser.BackgroundTransparency = 1.000
	UserPanelUser.Font = Enum.Font.GothamSemibold
	UserPanelUser.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelUser.TextSize = 17.000
	UserPanelUser.TextXAlignment = Enum.TextXAlignment.Left
	UserPanelUser.Text = user
	UserPanelUser.Size = UDim2.new(0, UserPanelUser.TextBounds.X + 2, 0, 19)


	UserPanelUserTagLayout.Name = "UserPanelUserTagLayout"
	UserPanelUserTagLayout.Parent = UserPanelUserTag
	UserPanelUserTagLayout.FillDirection = Enum.FillDirection.Horizontal
	UserPanelUserTagLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UserPanelTag.Name = "UserPanelTag"
	UserPanelTag.Parent = UserPanelUserTag
	UserPanelTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserPanelTag.BackgroundTransparency = 1.000
	UserPanelTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
	UserPanelTag.Size = UDim2.new(0, 65, 0, 19)
	UserPanelTag.Font = Enum.Font.Gotham
	UserPanelTag.Text = "#" .. tag
	UserPanelTag.TextColor3 = Color3.fromRGB(184, 186, 189)
	UserPanelTag.TextSize = 17.000
	UserPanelTag.TextXAlignment = Enum.TextXAlignment.Left

	UserPanelCorner.Name = "UserPanelCorner"
	UserPanelCorner.Parent = UserPanel

	LeftFrame.Name = "LeftFrame"
	LeftFrame.Parent = SettingsHolder
	LeftFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
	LeftFrame.BorderSizePixel = 0
	LeftFrame.Position = UDim2.new(0, 0, -0.000303059904, 0)
	LeftFrame.Size = UDim2.new(0, 233, 0, 375)

	MyAccountBtn.Name = "MyAccountBtn"
	MyAccountBtn.Parent = LeftFrame
	MyAccountBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
	MyAccountBtn.BorderSizePixel = 0
	MyAccountBtn.Position = UDim2.new(0.271232396, 0, 0.101614028, 0)
	MyAccountBtn.Size = UDim2.new(0, 160, 0, 30)
	MyAccountBtn.AutoButtonColor = false
	MyAccountBtn.Font = Enum.Font.SourceSans
	MyAccountBtn.Text = ""
	MyAccountBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	MyAccountBtn.TextSize = 14.000

	MyAccountBtnCorner.CornerRadius = UDim.new(0, 6)
	MyAccountBtnCorner.Name = "MyAccountBtnCorner"
	MyAccountBtnCorner.Parent = MyAccountBtn

	MyAccountBtnTitle.Name = "MyAccountBtnTitle"
	MyAccountBtnTitle.Parent = MyAccountBtn
	MyAccountBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MyAccountBtnTitle.BackgroundTransparency = 1.000
	MyAccountBtnTitle.BorderSizePixel = 0
	MyAccountBtnTitle.Position = UDim2.new(0.0759999976, 0, -0.166999996, 0)
	MyAccountBtnTitle.Size = UDim2.new(0, 95, 0, 39)
	MyAccountBtnTitle.Font = Enum.Font.GothamSemibold
	MyAccountBtnTitle.Text = "My Account"
	MyAccountBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	MyAccountBtnTitle.TextSize = 14.000
	MyAccountBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

	SettingsTitle.Name = "SettingsTitle"
	SettingsTitle.Parent = LeftFrame
	SettingsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingsTitle.BackgroundTransparency = 1.000
	SettingsTitle.Position = UDim2.new(0.308999985, 0, 0.0450000018, 0)
	SettingsTitle.Size = UDim2.new(0, 65, 0, 19)
	SettingsTitle.Font = Enum.Font.GothamBlack
	SettingsTitle.Text = "SETTINGS"
	SettingsTitle.TextColor3 = Color3.fromRGB(255, 146, 152)
	SettingsTitle.TextSize = 11.000
	SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left

	DiscordInfo.Name = "DiscordInfo"
	DiscordInfo.Parent = LeftFrame
	DiscordInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DiscordInfo.BackgroundTransparency = 1.000
	DiscordInfo.Position = UDim2.new(0.304721028, 0, 0.821333349, 0)
	DiscordInfo.Size = UDim2.new(0, 133, 0, 44)
	DiscordInfo.Font = Enum.Font.Gotham
	DiscordInfo.Text = "Stable 1.0.0 (00001)  Host 0.0.0.1                Roblox Lua Engine    "
	DiscordInfo.TextColor3 = Color3.fromRGB(255, 108, 116)
	DiscordInfo.TextSize = 13.000
	DiscordInfo.TextWrapped = true
	DiscordInfo.TextXAlignment = Enum.TextXAlignment.Left
	DiscordInfo.TextYAlignment = Enum.TextYAlignment.Top

	CurrentSettingOpen.Name = "CurrentSettingOpen"
	CurrentSettingOpen.Parent = LeftFrame
	CurrentSettingOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CurrentSettingOpen.BackgroundTransparency = 1.000
	CurrentSettingOpen.Position = UDim2.new(1.07294846, 0, 0.0450000018, 0)
	CurrentSettingOpen.Size = UDim2.new(0, 65, 0, 19)
	CurrentSettingOpen.Font = Enum.Font.GothamBlack
	CurrentSettingOpen.Text = "MY ACCOUNT"
	CurrentSettingOpen.TextColor3 = Color3.fromRGB(255, 255, 255)
	CurrentSettingOpen.TextSize = 14.000
	CurrentSettingOpen.TextXAlignment = Enum.TextXAlignment.Left


	SettingsOpenBtn.MouseButton1Click:Connect(function ()
		settingsopened = true
		TopFrameHolder.Visible = false
		ServersHoldFrame.Visible = false
		SettingsFrame.Visible = true
		SettingsHolder:TweenSize(UDim2.new(0, 681, 0, 375), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
		Settings.BackgroundTransparency = 1
		TweenService:Create(
			Settings,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()
		for i,v in next, SettingsHolder:GetChildren() do
			v.BackgroundTransparency = 1
			TweenService:Create(
				v,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 0}
			):Play()
		end
	end)

	EditBtn.MouseButton1Click:Connect(function()
		local NotificationHolder = Instance.new("TextButton")
		NotificationHolder.Name = "NotificationHolder"
		NotificationHolder.Parent = SettingsHolder
		NotificationHolder.BackgroundColor3 = Color3.fromRGB(10,10,10)
		NotificationHolder.Position = UDim2.new(-0.00881057233, 0, -0.00266666664, 0)
		NotificationHolder.Size = UDim2.new(0, 687, 0, 375)
		NotificationHolder.AutoButtonColor = false
		NotificationHolder.Font = Enum.Font.SourceSans
		NotificationHolder.Text = ""
		NotificationHolder.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolder.TextSize = 14.000
		NotificationHolder.BackgroundTransparency = 1
		NotificationHolder.Visible = true
		TweenService:Create(
			NotificationHolder,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.2}
		):Play()

		local UserChange = Instance.new("Frame")
		local UserChangeCorner = Instance.new("UICorner")
		local UnderBar = Instance.new("Frame")
		local UnderBarCorner = Instance.new("UICorner")
		local UnderBarFrame = Instance.new("Frame")
		local Text1 = Instance.new("TextLabel")
		local Text2 = Instance.new("TextLabel")
		local TextBoxFrame = Instance.new("Frame")
		local TextBoxFrameCorner = Instance.new("UICorner")
		local TextBoxFrame1 = Instance.new("Frame")
		local TextBoxFrame1Corner = Instance.new("UICorner")
		local UsernameTextbox = Instance.new("TextBox")
		local Seperator = Instance.new("Frame")
		local HashtagLabel = Instance.new("TextLabel")
		local TagTextbox = Instance.new("TextBox")
		local ChangeBtn = Instance.new("TextButton")
		local ChangeCorner = Instance.new("UICorner")
		local CloseBtn2 = Instance.new("TextButton")
		local Close2Icon = Instance.new("ImageLabel")
		local CloseBtn1 = Instance.new("TextButton")
		local CloseBtn1Corner = Instance.new("UICorner")

		UserChange.Name = "UserChange"
		UserChange.Parent = NotificationHolder
		UserChange.AnchorPoint = Vector2.new(0.5, 0.5)
		UserChange.BackgroundColor3 = Color3.fromRGB(25,25,25)
		UserChange.ClipsDescendants = true
		UserChange.Position = UDim2.new(0.513071597, 0, 0.4746176, 0)
		UserChange.Size = UDim2.new(0, 0, 0, 0)
		UserChange.BackgroundTransparency = 1

		UserChange:TweenSize(UDim2.new(0, 346, 0, 198), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
		TweenService:Create(
			UserChange,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()

		UserChangeCorner.CornerRadius = UDim.new(0, 5)
		UserChangeCorner.Name = "UserChangeCorner"
		UserChangeCorner.Parent = UserChange

		UnderBar.Name = "UnderBar"
		UnderBar.Parent = UserChange
		UnderBar.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
		UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
		UnderBar.Size = UDim2.new(0, 346, 0, 13)

		UnderBarCorner.CornerRadius = UDim.new(0, 5)
		UnderBarCorner.Name = "UnderBarCorner"
		UnderBarCorner.Parent = UnderBar

		UnderBarFrame.Name = "UnderBarFrame"
		UnderBarFrame.Parent = UnderBar
		UnderBarFrame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
		UnderBarFrame.BorderSizePixel = 0
		UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -2.53846145, 0)
		UnderBarFrame.Size = UDim2.new(0, 346, 0, 39)

		Text1.Name = "Text1"
		Text1.Parent = UserChange
		Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text1.BackgroundTransparency = 1.000
		Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
		Text1.Size = UDim2.new(0, 346, 0, 68)
		Text1.Font = Enum.Font.GothamSemibold
		Text1.Text = "Change your username"
		Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text1.TextSize = 20.000

		Text2.Name = "Text2"
		Text2.Parent = UserChange
		Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text2.BackgroundTransparency = 1.000
		Text2.Position = UDim2.new(-0.000594122568, 0, 0.141587839, 0)
		Text2.Size = UDim2.new(0, 346, 0, 63)
		Text2.Font = Enum.Font.Gotham
		Text2.Text = "Enter your new username."
		Text2.TextColor3 = Color3.fromRGB(171, 172, 176)
		Text2.TextSize = 14.000

		TextBoxFrame.Name = "TextBoxFrame"
		TextBoxFrame.Parent = UserChange
		TextBoxFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
		TextBoxFrame.Position = UDim2.new(0.49710983, 0, 0.560606062, 0)
		TextBoxFrame.Size = UDim2.new(0, 319, 0, 38)

		TextBoxFrameCorner.CornerRadius = UDim.new(0, 3)
		TextBoxFrameCorner.Name = "TextBoxFrameCorner"
		TextBoxFrameCorner.Parent = TextBoxFrame

		TextBoxFrame1.Name = "TextBoxFrame1"
		TextBoxFrame1.Parent = TextBoxFrame
		TextBoxFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBoxFrame1.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
		TextBoxFrame1.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextBoxFrame1.Size = UDim2.new(0, 317, 0, 36)

		TextBoxFrame1Corner.CornerRadius = UDim.new(0, 3)
		TextBoxFrame1Corner.Name = "TextBoxFrame1Corner"
		TextBoxFrame1Corner.Parent = TextBoxFrame1

		UsernameTextbox.Name = "UsernameTextbox"
		UsernameTextbox.Parent = TextBoxFrame1
		UsernameTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		UsernameTextbox.BackgroundTransparency = 1.000
		UsernameTextbox.Position = UDim2.new(0.0378548913, 0, 0, 0)
		UsernameTextbox.Size = UDim2.new(0, 221, 0, 37)
		UsernameTextbox.Font = Enum.Font.Gotham
		UsernameTextbox.Text = user
		UsernameTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
		UsernameTextbox.TextSize = 14.000
		UsernameTextbox.TextXAlignment = Enum.TextXAlignment.Left

		Seperator.Name = "Seperator"
		Seperator.Parent = TextBoxFrame1
		Seperator.AnchorPoint = Vector2.new(0.5, 0.5)
		Seperator.BackgroundColor3 = Color3.fromRGB(25,25,25)
		Seperator.BorderSizePixel = 0
		Seperator.Position = UDim2.new(0.753000021, 0, 0.500999987, 0)
		Seperator.Size = UDim2.new(0, 1, 0, 25)

		HashtagLabel.Name = "HashtagLabel"
		HashtagLabel.Parent = TextBoxFrame1
		HashtagLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		HashtagLabel.BackgroundTransparency = 1.000
		HashtagLabel.Position = UDim2.new(0.765877604, 0, -0.0546001866, 0)
		HashtagLabel.Size = UDim2.new(0, 23, 0, 37)
		HashtagLabel.Font = Enum.Font.Gotham
		HashtagLabel.Text = " "
		HashtagLabel.TextColor3 = Color3.fromRGB(79, 82, 88)
		HashtagLabel.TextSize = 16.000

		TagTextbox.Name = "TagTextbox"
		TagTextbox.Parent = TextBoxFrame1
		TagTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TagTextbox.BackgroundTransparency = 1.000
		TagTextbox.Position = UDim2.new(0.824999988, 0, -0.0280000009, 0)
		TagTextbox.Size = UDim2.new(0, 59, 0, 38)
		TagTextbox.Font = Enum.Font.Gotham
		TagTextbox.PlaceholderColor3 = Color3.fromRGB(210, 211, 212)
		TagTextbox.Text = tag
		TagTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
		TagTextbox.TextSize = 14.000
		TagTextbox.TextXAlignment = Enum.TextXAlignment.Left

		ChangeBtn.Name = "ChangeBtn"
		ChangeBtn.Parent = UserChange
		ChangeBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		ChangeBtn.Position = UDim2.new(0.749670506, 0, 0.823232353, 0)
		ChangeBtn.Size = UDim2.new(0, 76, 0, 27)
		ChangeBtn.Font = Enum.Font.Gotham
		ChangeBtn.Text = "Change"
		ChangeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ChangeBtn.TextSize = 13.000
		ChangeBtn.AutoButtonColor = false

		ChangeBtn.MouseEnter:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(103,123,196)}
			):Play()
		end)

		ChangeBtn.MouseLeave:Connect(function()
			TweenService:Create(
				ChangeBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		ChangeBtn.MouseButton1Click:Connect(function()
			user = UsernameTextbox.Text
			tag = TagTextbox.Text
			UserSettingsPadUser.Text = user
			UserSettingsPadUser.Size = UDim2.new(0, UserSettingsPadUser.TextBounds.X + 2, 0, 19)
			UserSettingsPadTag.Text = "#" .. tag
			UserPanelTag.Text = "#" .. tag
			UserPanelUser.Text = user
			UserPanelUser.Size = UDim2.new(0, UserPanelUser.TextBounds.X + 2, 0, 19)
			UserName.Text = user
			UserTag.Text = "#" .. tag
			SaveInfo()

			UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				UserChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		ChangeCorner.CornerRadius = UDim.new(0, 4)
		ChangeCorner.Name = "ChangeCorner"
		ChangeCorner.Parent = ChangeBtn

		CloseBtn2.Name = "CloseBtn2"
		CloseBtn2.Parent = UserChange
		CloseBtn2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.BackgroundTransparency = 1.000
		CloseBtn2.Position = UDim2.new(0.898000002, 0, 0, 0)
		CloseBtn2.Size = UDim2.new(0, 26, 0, 26)
		CloseBtn2.Font = Enum.Font.Gotham
		CloseBtn2.Text = ""
		CloseBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn2.TextSize = 14.000

		Close2Icon.Name = "Close2Icon"
		Close2Icon.Parent = CloseBtn2
		Close2Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Close2Icon.BackgroundTransparency = 1.000
		Close2Icon.Position = UDim2.new(-0.0384615399, 0, 0.312910825, 0)
		Close2Icon.Size = UDim2.new(0, 25, 0, 25)
		Close2Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
		Close2Icon.ImageColor3 = Color3.fromRGB(119, 122, 127)

		CloseBtn1.Name = "CloseBtn1"
		CloseBtn1.Parent = UserChange
		CloseBtn1.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
		CloseBtn1.BackgroundTransparency = 1.000
		CloseBtn1.Position = UDim2.new(0.495000005, 0, 0.823000014, 0)
		CloseBtn1.Size = UDim2.new(0, 76, 0, 27)
		CloseBtn1.Font = Enum.Font.Gotham
		CloseBtn1.Text = "Close"
		CloseBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn1.TextSize = 13.000

		CloseBtn1Corner.CornerRadius = UDim.new(0, 4)
		CloseBtn1Corner.Name = "CloseBtn1Corner"
		CloseBtn1Corner.Parent = CloseBtn1

		CloseBtn1.MouseButton1Click:Connect(function()
			UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				UserChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		CloseBtn2.MouseButton1Click:Connect(function()
			UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				UserChange,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationHolder,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationHolder:Destroy()
		end)

		CloseBtn2.MouseEnter:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(210,210,210)}
			):Play()
		end)

		CloseBtn2.MouseLeave:Connect(function()
			TweenService:Create(
				Close2Icon,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(119, 122, 127)}
			):Play()
		end)

		TagTextbox.Changed:Connect(function()
			TagTextbox.Text = TagTextbox.Text:sub(1,4)
		end)

		TagTextbox:GetPropertyChangedSignal("Text"):Connect(function()
			TagTextbox.Text = TagTextbox.Text:gsub('%D+', '');
		end)

		UsernameTextbox.Changed:Connect(function()
			UsernameTextbox.Text = UsernameTextbox.Text:sub(1,13)
		end)

		TagTextbox.Focused:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		TagTextbox.FocusLost:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
			):Play()
		end)

		UsernameTextbox.Focused:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		UsernameTextbox.FocusLost:Connect(function()
			TweenService:Create(
				TextBoxFrame,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
			):Play()
		end)

	end)

	function StarHub:Notification(titletext, desctext, btntext)
		local NotificationHolderMain = Instance.new("TextButton")
		local Notification = Instance.new("Frame")
		local NotificationCorner = Instance.new("UICorner")
		local UnderBar = Instance.new("Frame")
		local UnderBarCorner = Instance.new("UICorner")
		local UnderBarFrame = Instance.new("Frame")
		local Text1 = Instance.new("TextLabel")
		local Text2 = Instance.new("TextLabel")
		local AlrightBtn = Instance.new("TextButton")
		local AlrightCorner = Instance.new("UICorner")

		NotificationHolderMain.Name = "NotificationHolderMain"
		NotificationHolderMain.Parent = MainFrame
		NotificationHolderMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolderMain.BackgroundTransparency = 1
		NotificationHolderMain.BorderSizePixel = 0
		NotificationHolderMain.Position = UDim2.new(0, 0, 0.0560000017, 0)
		NotificationHolderMain.Size = UDim2.new(0, 681, 0, 374)
		NotificationHolderMain.AutoButtonColor = false
		NotificationHolderMain.Font = Enum.Font.SourceSans
		NotificationHolderMain.Text = ""
		NotificationHolderMain.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHolderMain.TextSize = 14.000
		TweenService:Create(
			NotificationHolderMain,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.2}
		):Play()


		Notification.Name = "Notification"
		Notification.Parent = NotificationHolderMain
		Notification.AnchorPoint = Vector2.new(0.5, 0.5)
		Notification.BackgroundColor3 = Color3.fromRGB(10,10,10)
		Notification.ClipsDescendants = true
		Notification.Position = UDim2.new(0.524819076, 0, 0.469270051, 0)
		Notification.Size = UDim2.new(0, 0, 0, 0)
		Notification.BackgroundTransparency = 1

		Notification:TweenSize(UDim2.new(0, 346, 0, 176), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)

		TweenService:Create(
			Notification,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()

		NotificationCorner.CornerRadius = UDim.new(0, 5)
		NotificationCorner.Name = "NotificationCorner"
		NotificationCorner.Parent = Notification

		UnderBar.Name = "UnderBar"
		UnderBar.Parent = Notification
		UnderBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
		UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
		UnderBar.Size = UDim2.new(0, 346, 0, 10)

		UnderBarCorner.CornerRadius = UDim.new(0, 5)
		UnderBarCorner.Name = "UnderBarCorner"
		UnderBarCorner.Parent = UnderBar

		UnderBarFrame.Name = "UnderBarFrame"
		UnderBarFrame.Parent = UnderBar
		UnderBarFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
		UnderBarFrame.BorderSizePixel = 0
		UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -3.76068449, 0)
		UnderBarFrame.Size = UDim2.new(0, 346, 0, 40)

		Text1.Name = "Text1"
		Text1.Parent = Notification
		Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text1.BackgroundTransparency = 1.000
		Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
		Text1.Size = UDim2.new(0, 346, 0, 68)
		Text1.Font = Enum.Font.GothamSemibold
		Text1.Text = titletext
		Text1.TextColor3 = _G.Color
		Text1.TextSize = 20.000

		Text2.Name = "Text2"
		Text2.Parent = Notification
		Text2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Text2.BackgroundTransparency = 1.000
		Text2.Position = UDim2.new(0.106342293, 0, 0.317724228, 0)
		Text2.Size = UDim2.new(0, 272, 0, 63)
		Text2.Font = Enum.Font.Gotham
		Text2.Text = desctext
		Text2.TextColor3 = _G.Color
		Text2.TextSize = 14.000
		Text2.TextWrapped = true

		AlrightBtn.Name = "AlrightBtn"
		AlrightBtn.Parent = Notification
		AlrightBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		AlrightBtn.Position = UDim2.new(0.0332369953, 0, 0.789141417, 0)
		AlrightBtn.Size = UDim2.new(0, 322, 0, 27)
		AlrightBtn.Font = Enum.Font.Gotham
		AlrightBtn.Text = btntext
		AlrightBtn.TextColor3 = _G.Color
		AlrightBtn.TextSize = 13.000
		AlrightBtn.AutoButtonColor = false

		AlrightCorner.CornerRadius = UDim.new(0, 4)
		AlrightCorner.Name = "AlrightCorner"
		AlrightCorner.Parent = AlrightBtn

		AlrightBtn.MouseButton1Click:Connect(function()
			TweenService:Create(
				NotificationHolderMain,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			Notification:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				Notification,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait()
			NotificationHolderMain:Destroy()
		end)

		AlrightBtn.MouseEnter:Connect(function()
			TweenService:Create(
				AlrightBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(0, 0, 0)}
			):Play()
		end)

		AlrightBtn.MouseLeave:Connect(function()
			TweenService:Create(
				AlrightBtn,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
			):Play()
		end)
	end

	MakeDraggable(TopFrame, MainFrame)
	ServersHoldPadding.PaddingLeft = UDim.new(0, 14)
	local ServerHold = {}
	function ServerHold:Server(text, LoadImage)
		local fc = false
		local currentchanneltoggled = ""
		local Server = Instance.new("TextButton")
		local ServerBtnCorner = Instance.new("UICorner")
		local ServerIco = Instance.new("ImageLabel")
		local ServerWhiteFrame = Instance.new("Frame")
		local ServerWhiteFrameCorner = Instance.new("UICorner")
		local ImageMain = Instance.new("ImageLabel")


		ImageMain.Name = "ImageMain"
		ImageMain.Parent = Server
		ImageMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageMain.BackgroundTransparency = 1.000
		ImageMain.Position = UDim2.new(0, 0, 0.2, 0)
		ImageMain.Size = UDim2.new(0, 17, 0, 17)
		ImageMain.Image = "http://www.roblox.com/asset/?id="..LoadImage..""
		ImageMain.ImageColor3 = Color3.fromRGB(255, 255, 255)

		Server.Name = text .. "Server"
		Server.Parent = ServersHold
		Server.BackgroundColor3 = Color3.fromRGB(20,20,20)
		Server.Position = UDim2.new(1, 0, 0, 0)
		Server.Size = UDim2.new(0, 47, 0, 47)
		Server.AutoButtonColor = false
		Server.Font = Enum.Font.Gotham
		Server.Text = ""
		Server.BackgroundTransparency = 1
		Server.TextTransparency = 1
		Server.TextColor3 = Color3.fromRGB(255, 255, 255)
		Server.TextSize = 18.000

		ServerBtnCorner.CornerRadius = UDim.new(1, 0)
		ServerBtnCorner.Name = "ServerCorner"
		ServerBtnCorner.Parent = Server

		ServerIco.Name = "ServerIco"
		ServerIco.Parent = Server
		ServerIco.AnchorPoint = Vector2.new(0.5, 0.5)
		ServerIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerIco.BackgroundTransparency = 1.000
		ServerIco.Position = UDim2.new(0.489361703, 0, 0.489361703, 0)
		ServerIco.Size = UDim2.new(0, 0, 0, 0)
		ServerIco.ImageTransparency = 1
		ServerIco.Image = ""

		ServerWhiteFrame.Name = "ServerWhiteFrame"
		ServerWhiteFrame.Parent = Server
		ServerWhiteFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		ServerWhiteFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerWhiteFrame.BackgroundTransparency = 1
		ServerWhiteFrame.Position = UDim2.new(-0.347378343, 0, 0.502659559, 0)
		ServerWhiteFrame.Size = UDim2.new(0, 11, 0, 10)

		ServerWhiteFrameCorner.CornerRadius = UDim.new(1, 0)
		ServerWhiteFrameCorner.Name = "ServerWhiteFrameCorner"
		ServerWhiteFrameCorner.Parent = ServerWhiteFrame
		ServersHold.CanvasSize = UDim2.new(0, 0, 0, ServersHoldLayout.AbsoluteContentSize.Y)

		local ServerFrame = Instance.new("Frame")
		local ServerFrame1 = Instance.new("Frame")
		local ServerFrame2 = Instance.new("Frame")
		local ServerTitleFrame = Instance.new("Frame")
		local ServerTitle = Instance.new("TextLabel")
		local ServerTitle2 = Instance.new("TextLabel")
		local GlowFrame = Instance.new("Frame")
		local Glow = Instance.new("ImageLabel")
		local ServerContentFrame = Instance.new("Frame")
		local ServerCorner = Instance.new("UICorner")
		local ChannelCorner = Instance.new("UICorner")
		local ChannelTitleFrame = Instance.new("Frame")
		local Hashtag = Instance.new("TextLabel")
		local ChannelTitle = Instance.new("TextLabel")
		local ChannelContentFrame = Instance.new("Frame")
		local GlowChannel = Instance.new("ImageLabel")
		local ServerChannelHolder = Instance.new("ScrollingFrame")
		local ServerChannelHolderLayout = Instance.new("UIListLayout")
		local ServerChannelHolderPadding = Instance.new("UIPadding")


		Server.Name = text .. "Server"
		Server.Parent = ServersHold
		Server.BackgroundColor3 = Color3.fromRGB(20,20,20)
		Server.Position = UDim2.new(1, 0, 0, 0)
		Server.Size = UDim2.new(0, 47, 0, 47)
		Server.AutoButtonColor = false
		Server.Font = Enum.Font.Gotham
		Server.Text = ""
		Server.BackgroundTransparency = 1
		Server.TextTransparency = 1
		Server.TextColor3 = Color3.fromRGB(255, 255, 255)
		Server.TextSize = 18.000

		ServerBtnCorner.CornerRadius = UDim.new(1, 0)
		ServerBtnCorner.Name = "ServerCorner"
		ServerBtnCorner.Parent = Server

		ServerIco.Name = "ServerIco"
		ServerIco.Parent = Server
		ServerIco.AnchorPoint = Vector2.new(0.5, 0.5)
		ServerIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerIco.BackgroundTransparency = 1.000
		ServerIco.Position = UDim2.new(0.489361703, 0, 0.489361703, 0)
		ServerIco.Size = UDim2.new(0, 0, 0, 0)
		ServerIco.ImageTransparency = 1
		ServerIco.Image = ""

		ServerWhiteFrame.Name = "ServerWhiteFrame"
		ServerWhiteFrame.Parent = Server
		ServerWhiteFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		ServerWhiteFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerWhiteFrame.BackgroundTransparency = 1
		ServerWhiteFrame.Position = UDim2.new(-0.347378343, 0, 0.502659559, 0)
		ServerWhiteFrame.Size = UDim2.new(0, 11, 0, 10)

		ServerWhiteFrameCorner.CornerRadius = UDim.new(1, 0)
		ServerWhiteFrameCorner.Name = "ServerWhiteFrameCorner"
		ServerWhiteFrameCorner.Parent = ServerWhiteFrame
		ServersHold.CanvasSize = UDim2.new(0, 0, 0, ServersHoldLayout.AbsoluteContentSize.Y)

		local ServerFrame = Instance.new("Frame")
		local ServerFrame1 = Instance.new("Frame")
		local ServerFrame2 = Instance.new("Frame")
		local ServerTitleFrame = Instance.new("Frame")
		local ServerTitle = Instance.new("TextLabel")
		local GlowFrame = Instance.new("Frame")
		local Glow = Instance.new("ImageLabel")
		local ServerContentFrame = Instance.new("Frame")
		local ServerCorner = Instance.new("UICorner")
		local ChannelCorner = Instance.new("UICorner")
		local ChannelTitleFrame = Instance.new("Frame")
		local Hashtag = Instance.new("TextLabel")
		local ChannelTitle = Instance.new("TextLabel")
		local ChannelContentFrame = Instance.new("Frame")
		local GlowChannel = Instance.new("ImageLabel")
		local ServerChannelHolder = Instance.new("ScrollingFrame")
		local ServerChannelHolderLayout = Instance.new("UIListLayout")
		local ServerChannelHolderPadding = Instance.new("UIPadding")


		ServerFrame.Name = "ServerFrame"
		ServerFrame.Parent = ServersHolder
		ServerFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerFrame.BorderSizePixel = 0
		ServerFrame.ClipsDescendants = true
		ServerFrame.Position = UDim2.new(0.105726875, 0, 1.01262593, 0)
		ServerFrame.Size = UDim2.new(0, 609, 0, 373)
		ServerFrame.Visible = false

		ServerFrame1.Name = "ServerFrame1"
		ServerFrame1.Parent = ServerFrame
		ServerFrame1.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerFrame1.BorderSizePixel = 0
		ServerFrame1.Position = UDim2.new(0, 0, 0.972290039, 0)
		ServerFrame1.Size = UDim2.new(0, 12, 0, 10)

		ServerFrame2.Name = "ServerFrame2"
		ServerFrame2.Parent = ServerFrame
		ServerFrame2.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerFrame2.BorderSizePixel = 0
		ServerFrame2.Position = UDim2.new(0.980295539, 0, 0.972290039, 0)
		ServerFrame2.Size = UDim2.new(0, 12, 0, 9)

		ServerTitleFrame.Name = "ServerTitleFrame"
		ServerTitleFrame.Parent = ServerFrame
		ServerTitleFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerTitleFrame.BackgroundTransparency = 1.000
		ServerTitleFrame.BorderSizePixel = 0
		ServerTitleFrame.Position = UDim2.new(-0.0010054264, 0, -0.000900391256, 0)
		ServerTitleFrame.Size = UDim2.new(0, 180, 0, 40)

		ServerTitle.Name = "ServerTitle"
		ServerTitle.Parent = ServerTitleFrame
		ServerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerTitle.BackgroundTransparency = 1.000
		ServerTitle.BorderSizePixel = 0
		ServerTitle.Position = UDim2.new(0.23, 0, 0, 0)
		ServerTitle.Size = UDim2.new(0, 97, 0, 39)
		ServerTitle.Font = Enum.Font.GothamSemibold
		ServerTitle.Text = text
		ServerTitle.TextColor3 = _G.Color
		ServerTitle.TextSize = 15.000
		ServerTitle.TextXAlignment = Enum.TextXAlignment.Left

		GlowFrame.Name = "GlowFrame"
		GlowFrame.Parent = ServerFrame
		GlowFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
		GlowFrame.BackgroundTransparency = 1.000
		GlowFrame.BorderSizePixel = 0
		GlowFrame.Position = UDim2.new(-0.0010054264, 0, -0.000900391256, 0)
		GlowFrame.Size = UDim2.new(0, 609, 0, 40)

		Glow.Name = "Glow"
		Glow.Parent = GlowFrame
		Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Glow.BackgroundTransparency = 1.000
		Glow.BorderSizePixel = 0
		Glow.Position = UDim2.new(0, -15, 0, -15)
		Glow.Size = UDim2.new(1, 30, 1, 30)
		Glow.ZIndex = 0
		Glow.Image = "rbxassetid://4996891970"
		Glow.ImageColor3 = Color3.fromRGB(15, 15, 15)
		Glow.ScaleType = Enum.ScaleType.Slice
		Glow.SliceCenter = Rect.new(20, 20, 280, 280)

		ServerContentFrame.Name = "ServerContentFrame"
		ServerContentFrame.Parent = ServerFrame
		ServerContentFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ServerContentFrame.BackgroundTransparency = 1.000
		ServerContentFrame.BorderSizePixel = 0
		ServerContentFrame.Position = UDim2.new(-0.0010054264, 0, 0.106338218, 0)
		ServerContentFrame.Size = UDim2.new(0, 180, 0, 333)

		ServerCorner.CornerRadius = UDim.new(0, 4)
		ServerCorner.Name = "ServerCorner"
		ServerCorner.Parent = ServerFrame

		ChannelTitleFrame.Name = "ChannelTitleFrame"
		ChannelTitleFrame.Parent = ServerFrame
		ChannelTitleFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
		ChannelTitleFrame.BorderSizePixel = 0
		ChannelTitleFrame.Position = UDim2.new(0.294561088, 0, -0.000900391256, 0)
		ChannelTitleFrame.Size = UDim2.new(0, 429, 0, 40)

		Hashtag.Name = "Hashtag"
		Hashtag.Parent = ChannelTitleFrame
		Hashtag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Hashtag.BackgroundTransparency = 1.000
		Hashtag.BorderSizePixel = 0
		Hashtag.Position = UDim2.new(0.0279720277, 0, 0, 0)
		Hashtag.Size = UDim2.new(0, 19, 0, 39)
		Hashtag.Font = Enum.Font.Gotham
		Hashtag.Text = " "
		Hashtag.TextColor3 = Color3.fromRGB(111, 111, 111)
		Hashtag.TextSize = 25.000

		ChannelTitle.Name = "ChannelTitle"
		ChannelTitle.Parent = ChannelTitleFrame
		ChannelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ChannelTitle.BackgroundTransparency = 1.000
		ChannelTitle.BorderSizePixel = 0
		ChannelTitle.Position = UDim2.new(0.0862470865, 0, 0, 0)
		ChannelTitle.Size = UDim2.new(0, 95, 0, 39)
		ChannelTitle.Font = Enum.Font.GothamSemibold
		ChannelTitle.Text = ""
		ChannelTitle.TextColor3 = _G.Color
		ChannelTitle.TextSize = 15.000
		ChannelTitle.TextXAlignment = Enum.TextXAlignment.Left

		ChannelContentFrame.Name = "ChannelContentFrame"
		ChannelContentFrame.Parent = ServerFrame
		ChannelContentFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
		ChannelContentFrame.BorderSizePixel = 0
		ChannelContentFrame.ClipsDescendants = true
		ChannelContentFrame.Position = UDim2.new(0.294561088, 0, 0.106338218, 0)
		ChannelContentFrame.Size = UDim2.new(0, 429, 0, 333)

		GlowChannel.Name = "GlowChannel"
		GlowChannel.Parent = ChannelContentFrame
		GlowChannel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		GlowChannel.BackgroundTransparency = 1.000
		GlowChannel.BorderSizePixel = 0
		GlowChannel.Position = UDim2.new(0, -33, 0, -91)
		GlowChannel.Size = UDim2.new(1.06396091, 30, 0.228228226, 30)
		GlowChannel.ZIndex = 0
		GlowChannel.Image = "rbxassetid://4996891970"
		GlowChannel.ImageColor3 = Color3.fromRGB(15, 15, 15)
		GlowChannel.ScaleType = Enum.ScaleType.Slice
		GlowChannel.SliceCenter = Rect.new(20, 20, 280, 280)

		ServerChannelHolder.Name = "ServerChannelHolder"
		ServerChannelHolder.Parent = ServerContentFrame
		ServerChannelHolder.Active = true
		ServerChannelHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ServerChannelHolder.BackgroundTransparency = 1.000
		ServerChannelHolder.BorderSizePixel = 0
		ServerChannelHolder.Position = UDim2.new(0.00535549596, 0, 0.0241984241, 0)
		ServerChannelHolder.Selectable = false
		ServerChannelHolder.Size = UDim2.new(0, 179, 0, 278)
		ServerChannelHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
		ServerChannelHolder.ScrollBarThickness = 4
		ServerChannelHolder.ScrollBarImageColor3 = Color3.fromRGB(18, 19, 21)
		ServerChannelHolder.ScrollBarImageTransparency = 1

		ServerChannelHolderLayout.Name = "ServerChannelHolderLayout"
		ServerChannelHolderLayout.Parent = ServerChannelHolder
		ServerChannelHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ServerChannelHolderLayout.Padding = UDim.new(0, 4)

		ServerChannelHolderPadding.Name = "ServerChannelHolderPadding"
		ServerChannelHolderPadding.Parent = ServerChannelHolder
		ServerChannelHolderPadding.PaddingLeft = UDim.new(0, 9)

		ServerChannelHolder.MouseEnter:Connect(function()
			ServerChannelHolder.ScrollBarImageTransparency = 0
		end)

		ServerChannelHolder.MouseLeave:Connect(function()
			ServerChannelHolder.ScrollBarImageTransparency = 1
		end)

		Server.MouseEnter:Connect(
			function()
				if currentservertoggled ~= Server.Name then
					TweenService:Create(
						Server,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
					):Play()
					TweenService:Create(
						ServerBtnCorner,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{CornerRadius = UDim.new(0, 15)}
					):Play()
					ServerWhiteFrame:TweenSize(
						UDim2.new(0, 11, 0, 27),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						.3,
						true
					)
				end
			end
		)

		Server.MouseLeave:Connect(
			function()
				if currentservertoggled ~= Server.Name then
					TweenService:Create(
						Server,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(25,25,25)}
					):Play()
					TweenService:Create(
						ServerBtnCorner,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{CornerRadius = UDim.new(1, 0)}
					):Play()
					ServerWhiteFrame:TweenSize(
						UDim2.new(0, 11, 0, 10),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						.3,
						true
					)
				end
			end
		)

		Server.MouseButton1Click:Connect(
			function()
				currentservertoggled = Server.Name
				for i, v in next, ServersHolder:GetChildren() do
					if v.Name == "ServerFrame" then
						v.Visible = false
					end
					ServerFrame.Visible = true
				end
				for i, v in next, ServersHold:GetChildren() do
					if v.ClassName == "TextButton" then
						TweenService:Create(
							v,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(25,25,25)}
						):Play()
						TweenService:Create(
							Server,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(25,25,25)}
						):Play()
						TweenService:Create(
							v.ServerCorner,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{CornerRadius = UDim.new(1, 0)}
						):Play()
						TweenService:Create(
							ServerBtnCorner,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{CornerRadius = UDim.new(0, 15)}
						):Play()
						v.ServerWhiteFrame:TweenSize(
							UDim2.new(0, 11, 0, 10),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							.3,
							true
						)
						ServerWhiteFrame:TweenSize(
							UDim2.new(0, 11, 0, 46),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							.3,
							true
						)
					end
				end
			end
		)

		if fs == false then
			TweenService:Create(
				Server,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(25,25,25)}
			):Play()
			TweenService:Create(
				ServerBtnCorner,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{CornerRadius = UDim.new(0, 15)}
			):Play()
			ServerWhiteFrame:TweenSize(
				UDim2.new(0, 11, 0, 46),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				.3,
				true
			)
			ServerFrame.Visible = true
			Server.Name = text .. "Server"
			currentservertoggled = Server.Name
			fs = true
		end
		local ChannelHold = {}
		function ChannelHold:Channel(text)
			local ChannelBtn = Instance.new("TextButton")
			local ChannelBtnCorner = Instance.new("UICorner")
			local ChannelBtnHashtag = Instance.new("TextLabel")
			local ChannelBtnTitle = Instance.new("TextLabel")

			ChannelBtn.Name = text .. "ChannelBtn"
			ChannelBtn.Parent = ServerChannelHolder
			ChannelBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
			ChannelBtn.BorderSizePixel = 0
			ChannelBtn.Position = UDim2.new(0.24118948, 0, 0.578947365, 0)
			ChannelBtn.Size = UDim2.new(0, 160, 0, 30)
			ChannelBtn.AutoButtonColor = false
			ChannelBtn.Font = Enum.Font.SourceSans
			ChannelBtn.Text = ""
			ChannelBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			ChannelBtn.TextSize = 14.000

			ChannelBtnCorner.CornerRadius = UDim.new(0, 8)
			ChannelBtnCorner.Name = "ChannelBtnCorner"
			ChannelBtnCorner.Parent = ChannelBtn

			ChannelBtnHashtag.Name = "ChannelBtnHashtag"
			ChannelBtnHashtag.Parent = ChannelBtn
			ChannelBtnHashtag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ChannelBtnHashtag.BackgroundTransparency = 1.000
			ChannelBtnHashtag.BorderSizePixel = 0
			ChannelBtnHashtag.Position = UDim2.new(0.08, 0, 0, 0)
			ChannelBtnHashtag.Size = UDim2.new(0, 24, 0, 30)
			ChannelBtnHashtag.Font = Enum.Font.Gotham
			ChannelBtnHashtag.Text = ""
			ChannelBtnHashtag.TextColor3 = Color3.fromRGB(114, 118, 125)
			ChannelBtnHashtag.TextSize = 21.000

			ChannelBtnTitle.Name = "ChannelBtnTitle"
			ChannelBtnTitle.Parent = ChannelBtn
			ChannelBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ChannelBtnTitle.BackgroundTransparency = 1.000
			ChannelBtnTitle.BorderSizePixel = 0
			ChannelBtnTitle.Position = UDim2.new(0.05, 0, -0.166666672, 0)
			ChannelBtnTitle.Size = UDim2.new(0, 95, 0, 39)
			ChannelBtnTitle.Font = Enum.Font.Gotham
			ChannelBtnTitle.Text = text
			ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
			ChannelBtnTitle.TextSize = 14.000
			ChannelBtnTitle.TextXAlignment = Enum.TextXAlignment.Left
			ServerChannelHolder.CanvasSize = UDim2.new(0, 0, 0, ServerChannelHolderLayout.AbsoluteContentSize.Y)

			local ChannelHolder = Instance.new("ScrollingFrame")
			local ChannelHolderLayout = Instance.new("UIListLayout")

			ChannelHolder.Name = "ChannelHolder"
			ChannelHolder.Parent = ChannelContentFrame
			ChannelHolder.Active = true
			ChannelHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ChannelHolder.BackgroundTransparency = 1.000
			ChannelHolder.BorderSizePixel = 0
			ChannelHolder.Position = UDim2.new(0.0360843192, 0, 0.0241984241, 0)
			ChannelHolder.Size = UDim2.new(0, 412, 0, 314)
			ChannelHolder.ScrollBarThickness = 6
			ChannelHolder.CanvasSize = UDim2.new(0,0,0,0)
			ChannelHolder.ScrollBarImageTransparency = 0
			ChannelHolder.ScrollBarImageColor3 = Color3.fromRGB(18, 19, 21)
			ChannelHolder.Visible = false
			ChannelHolder.ClipsDescendants = false

			ChannelHolderLayout.Name = "ChannelHolderLayout"
			ChannelHolderLayout.Parent = ChannelHolder
			ChannelHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ChannelHolderLayout.Padding = UDim.new(0, 8)

			ChannelBtn.MouseEnter:Connect(function()
				if currentchanneltoggled ~= ChannelBtn.Name then
					ChannelBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
					ChannelBtnTitle.TextColor3 = Color3.fromRGB(220,221,222)
				end
			end)

			ChannelBtn.MouseLeave:Connect(function()
				if currentchanneltoggled ~= ChannelBtn.Name then
					ChannelBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
					ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
				end
			end)

			ChannelBtn.MouseButton1Click:Connect(function()
				for i, v in next, ChannelContentFrame:GetChildren() do
					if v.Name == "ChannelHolder" then
						v.Visible = false
					end
					ChannelHolder.Visible = true
				end
				for i, v in next, ServerChannelHolder:GetChildren() do
					if v.ClassName == "TextButton" then
						v.BackgroundColor3 = Color3.fromRGB(25,25,25)
						v.ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
					end
					ServerFrame.Visible = true
				end
				ChannelTitle.Text = text
				ChannelBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
				ChannelBtnTitle.TextColor3 = Color3.fromRGB(255,255,255)
				currentchanneltoggled = ChannelBtn.Name
			end)

			if fc == false then
				fc = true
				ChannelTitle.Text = text
				ChannelBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
				ChannelBtnTitle.TextColor3 = Color3.fromRGB(255,255,255)
				currentchanneltoggled = ChannelBtn.Name
				ChannelHolder.Visible = true
			end
			local ChannelContent = {}
			function ChannelContent:Button(text,callback)
				local Button = Instance.new("TextButton")
				local ButtonCorner = Instance.new("UICorner")

				Button.Name = "Button"
				Button.Parent = ChannelHolder
				Button.BackgroundColor3 = Color3.fromRGB(20,20,20)
				Button.Size = UDim2.new(0, 401, 0, 30)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.Gotham
				Button.TextColor3 = _G.Color
				Button.TextSize = 14.000
				Button.Text = text

				ButtonCorner.CornerRadius = UDim.new(0, 4)
				ButtonCorner.Name = "ButtonCorner"
				ButtonCorner.Parent = Button

				Button.MouseEnter:Connect(function()
					TweenService:Create(
						Button,
						TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(15,15,15)}
					):Play()
				end)

				Button.MouseButton1Click:Connect(function()
					pcall(callback)
					Button.TextSize = 0
					TweenService:Create(
						Button,
						TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{TextSize = 14}
					):Play()
				end)

				Button.MouseLeave:Connect(function()
					TweenService:Create(
						Button,
						TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(20,20,20)}
					):Play()
				end)
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end
			function ChannelContent:Toggle(text,default,callback)
				local toggled = false
				local Toggle = Instance.new("TextButton")
				local ToggleTitle = Instance.new("TextLabel")
				local ToggleFrame = Instance.new("Frame")
				local ToggleFrameCorner = Instance.new("UICorner")
				local ToggleFrameCircle = Instance.new("Frame")
				local ToggleFrameCircleCorner = Instance.new("UICorner")
				local Icon = Instance.new("ImageLabel")

				Toggle.Name = "Toggle"
				Toggle.Parent = ChannelHolder
				Toggle.BackgroundColor3 = Color3.fromRGB(25,25,25)
				Toggle.BorderSizePixel = 0
				Toggle.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
				Toggle.Size = UDim2.new(0, 401, 0, 30)
				Toggle.AutoButtonColor = false
				Toggle.Font = Enum.Font.Gotham
				Toggle.Text = ""
				Toggle.TextColor3 = _G.Color
				Toggle.TextSize = 14.000

				ToggleTitle.Name = "ToggleTitle"
				ToggleTitle.Parent = Toggle
				ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleTitle.BackgroundTransparency = 1.000
				ToggleTitle.Position = UDim2.new(0, 5, 0, 0)
				ToggleTitle.Size = UDim2.new(0, 200, 0, 30)
				ToggleTitle.Font = Enum.Font.Gotham
				ToggleTitle.Text = text
				ToggleTitle.TextColor3 = _G.Color
				ToggleTitle.TextSize = 14.000
				ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

				ToggleFrame.Name = "ToggleFrame"
				ToggleFrame.Parent = Toggle
				ToggleFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
				ToggleFrame.Position = UDim2.new(0.900481343, -5, 0.13300018, 0)
				ToggleFrame.Size = UDim2.new(0, 40, 0, 21)

				ToggleFrameCorner.CornerRadius = UDim.new(0, 4)
				ToggleFrameCorner.Name = "ToggleFrameCorner"
				ToggleFrameCorner.Parent = ToggleFrame

				ToggleFrameCircle.Name = "ToggleFrameCircle"
				ToggleFrameCircle.Parent = ToggleFrame
				ToggleFrameCircle.BackgroundColor3 = Color3.fromRGB(50,50,50)
				ToggleFrameCircle.Position = UDim2.new(0.234999999, -5, 0.133000001, 0)
				ToggleFrameCircle.Size = UDim2.new(0, 15, 0, 15)

				ToggleFrameCircleCorner.CornerRadius = UDim.new(0, 4)
				ToggleFrameCircleCorner.Name = "ToggleFrameCircleCorner"
				ToggleFrameCircleCorner.Parent = ToggleFrameCircle

				Icon.Name = "Icon"
				Icon.Parent = ToggleFrameCircle
				Icon.AnchorPoint = Vector2.new(0.5, 0.5)
				Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon.BackgroundTransparency = 1.000
				Icon.BorderColor3 = Color3.fromRGB(255,255,255)
				Icon.Position = UDim2.new(0, 7, 0, 7)
				Icon.Size = UDim2.new(0, 13, 0, 13)
				Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
				Icon.ImageColor3 = _G.Color

				Toggle.MouseButton1Click:Connect(function()
					if toggled == false then
						TweenService:Create(Icon,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageColor3 = _G.Color}):Play()
						TweenService:Create(ToggleFrame,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = _G.Color}):Play()
						ToggleFrameCircle:TweenPosition(UDim2.new(0.655, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
						TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
						Icon.Image = "http://www.roblox.com/asset/?id=6023426926"
						wait(.1)
						TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
					else
						TweenService:Create(Icon,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageColor3 = _G.Color}):Play()
						TweenService:Create(ToggleFrame,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(10,10,10)}):Play()
						ToggleFrameCircle:TweenPosition(UDim2.new(0.234999999, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
						TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
						Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
						wait(.01)
						TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
					end
					toggled = not toggled
					pcall(callback, toggled)
				end)
				if default == true then
					toggled = false
					TweenService:Create(Icon,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
					TweenService:Create(ToggleFrame,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = _G.Color}):Play()
					ToggleFrameCircle:TweenPosition(UDim2.new(0.655, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
					Icon.Image = "http://www.roblox.com/asset/?id=6023426926"
					wait(.1)
					TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
					toggled = not toggled
					pcall(callback, toggled)
				else
					wait(.1)
				end
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end

			function ChannelContent:Slider(text, min, max, start, callback)
				local SliderFunc = {}
				local dragging = false
				local Slider = Instance.new("TextButton")
				local SliderTitle = Instance.new("TextLabel")
				local SliderFrame = Instance.new("Frame")
				local SliderFrameCorner = Instance.new("UICorner")
				local CurrentValueFrame = Instance.new("Frame")
				local CurrentValueFrameCorner = Instance.new("UICorner")
				local Zip = Instance.new("Frame")
				local ZipCorner = Instance.new("UICorner")
				local ValueBubble = Instance.new("Frame")
				local ValueBubbleCorner = Instance.new("UICorner")
				local SquareBubble = Instance.new("Frame")
				local GlowBubble = Instance.new("ImageLabel")
				local ValueLabel = Instance.new("TextLabel")


				Slider.Name = "Slider"
				Slider.Parent = ChannelHolder
				Slider.BackgroundColor3 = Color3.fromRGB(25,25,25)
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0, 0, 0.216560602, 0)
				Slider.Size = UDim2.new(0, 401, 0, 38)
				Slider.AutoButtonColor = false
				Slider.Font = Enum.Font.Gotham
				Slider.Text = ""
				Slider.TextColor3 = _G.Color
				Slider.TextSize = 14.000

				SliderTitle.Name = "SliderTitle"
				SliderTitle.Parent = Slider
				SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderTitle.BackgroundTransparency = 1.000
				SliderTitle.Position = UDim2.new(0, 5, 0, -4)
				SliderTitle.Size = UDim2.new(0, 200, 0, 27)
				SliderTitle.Font = Enum.Font.Gotham
				SliderTitle.Text = text
				SliderTitle.TextColor3 = _G.Color
				SliderTitle.TextSize = 14.000
				SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

				SliderFrame.Name = "SliderFrame"
				SliderFrame.Parent = Slider
				SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				SliderFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
				SliderFrame.Position = UDim2.new(0.497999996, 0, 0.757000029, 0)
				SliderFrame.Size = UDim2.new(0, 385, 0, 8)

				SliderFrameCorner.Name = "SliderFrameCorner"
				SliderFrameCorner.Parent = SliderFrame

				CurrentValueFrame.Name = "CurrentValueFrame"
				CurrentValueFrame.Parent = SliderFrame
				CurrentValueFrame.BackgroundColor3 = _G.Color
				CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 8)

				CurrentValueFrameCorner.Name = "CurrentValueFrameCorner"
				CurrentValueFrameCorner.Parent = CurrentValueFrame

				Zip.Name = "Zip"
				Zip.Parent = SliderFrame
				Zip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Zip.Position = UDim2.new((start or 0)/max, -6,-0.644999981, 0)
				Zip.Size = UDim2.new(0, 10, 0, 18)
				ZipCorner.CornerRadius = UDim.new(0, 3)
				ZipCorner.Name = "ZipCorner"
				ZipCorner.Parent = Zip

				ValueBubble.Name = "ValueBubble"
				ValueBubble.Parent = Zip
				ValueBubble.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
				ValueBubble.Position = UDim2.new(0.5, 0, -1.00800002, 0)
				ValueBubble.Size = UDim2.new(0, 36, 0, 21)
				ValueBubble.Visible = false


				Zip.MouseEnter:Connect(function()
					if dragging == false then
						ValueBubble.Visible = true
					end
				end)

				Zip.MouseLeave:Connect(function()
					if dragging == false then
						ValueBubble.Visible = false
					end
				end)


				ValueBubbleCorner.CornerRadius = UDim.new(0, 3)
				ValueBubbleCorner.Name = "ValueBubbleCorner"
				ValueBubbleCorner.Parent = ValueBubble

				SquareBubble.Name = "SquareBubble"
				SquareBubble.Parent = ValueBubble
				SquareBubble.AnchorPoint = Vector2.new(0.5, 0.5)
				SquareBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
				SquareBubble.BorderSizePixel = 0
				SquareBubble.Position = UDim2.new(0.493000001, 0, 0.637999971, 0)
				SquareBubble.Rotation = 45.000
				SquareBubble.Size = UDim2.new(0, 19, 0, 19)

				GlowBubble.Name = "GlowBubble"
				GlowBubble.Parent = ValueBubble
				GlowBubble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				GlowBubble.BackgroundTransparency = 1.000
				GlowBubble.BorderSizePixel = 0
				GlowBubble.Position = UDim2.new(0, -15, 0, -15)
				GlowBubble.Size = UDim2.new(1, 30, 1, 30)
				GlowBubble.ZIndex = 0
				GlowBubble.Image = "rbxassetid://4996891970"
				GlowBubble.ImageColor3 = Color3.fromRGB(15, 15, 15)
				GlowBubble.ScaleType = Enum.ScaleType.Slice
				GlowBubble.SliceCenter = Rect.new(20, 20, 280, 280)

				ValueLabel.Name = "ValueLabel"
				ValueLabel.Parent = ValueBubble
				ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ValueLabel.BackgroundTransparency = 1.000
				ValueLabel.Size = UDim2.new(0, 36, 0, 21)
				ValueLabel.Font = Enum.Font.Gotham
				ValueLabel.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
				ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				ValueLabel.TextSize = 10.000
				local function move(input)
					local pos =
						UDim2.new(
							math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
							-6,
							-0.644999981,
							0
						)
					local pos1 =
						UDim2.new(
							math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
							0,
							0,
							8
						)
					CurrentValueFrame.Size = pos1
					Zip.Position = pos
					local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
					ValueLabel.Text = tostring(value)
					pcall(callback, value)
				end
				Zip.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							ValueBubble.Visible = true
						end
					end
				)
				Zip.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
							ValueBubble.Visible = false
						end
					end
				)
				game:GetService("UserInputService").InputChanged:Connect(
				function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end
				)

				function SliderFunc:Change(tochange)
					CurrentValueFrame.Size = UDim2.new((tochange or 0) / max, 0, 0, 8)
					Zip.Position = UDim2.new((tochange or 0)/max, -6,-0.644999981, 0)
					ValueLabel.Text = tostring(tochange and math.floor((tochange / max) * (max - min) + min) or 0)
					pcall(callback, tochange)
				end

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
				return SliderFunc
			end
			function ChannelContent:Line()
				local Seperator1 = Instance.new("Frame")
				local Seperator2 = Instance.new("Frame")

				Seperator1.Name = "Seperator1"
				Seperator1.Parent = ChannelHolder
				Seperator1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Seperator1.BackgroundTransparency = 1.000
				Seperator1.Position = UDim2.new(0, 0, 0.350318581, 0)
				Seperator1.Size = UDim2.new(0, 100, 0, 8)

				Seperator2.Name = "Seperator2"
				Seperator2.Parent = Seperator1
				Seperator2.BackgroundColor3 = Color3.fromRGB(66, 69, 74)
				Seperator2.BorderSizePixel = 0
				Seperator2.Position = UDim2.new(0, 0, 0, 4)
				Seperator2.Size = UDim2.new(0, 401, 0, 1)
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end
			function ChannelContent:Dropdown(text, list, callback)
				local DropFunc = {}
				local itemcount = 0
				local framesize = 0
				local DropTog = false
				local Dropdown = Instance.new("Frame")
				local DropdownTitle = Instance.new("TextLabel")
				local DropdownFrameOutline = Instance.new("Frame")
				local DropdownFrameOutlineCorner = Instance.new("UICorner")
				local DropdownFrame = Instance.new("Frame")
				local DropdownFrameCorner = Instance.new("UICorner")
				local CurrentSelectedText = Instance.new("TextLabel")
				local ArrowImg = Instance.new("ImageLabel")
				local DropdownFrameBtn = Instance.new("TextButton")

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = ChannelHolder
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
				Dropdown.Size = UDim2.new(0, 403, 0, 73)

				DropdownTitle.Name = "DropdownTitle"
				DropdownTitle.Parent = Dropdown
				DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownTitle.BackgroundTransparency = 1.000
				DropdownTitle.Position = UDim2.new(0, 5, 0, 0)
				DropdownTitle.Size = UDim2.new(0, 200, 0, 29)
				DropdownTitle.Font = Enum.Font.Gotham
				DropdownTitle.Text = text
				DropdownTitle.TextColor3 = _G.Color
				DropdownTitle.TextSize = 14.000
				DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

				DropdownFrameOutline.Name = "DropdownFrameOutline"
				DropdownFrameOutline.Parent = DropdownTitle
				DropdownFrameOutline.AnchorPoint = Vector2.new(0.5, 0.5)
				DropdownFrameOutline.BackgroundColor3 = Color3.fromRGB(15,15,15)
				DropdownFrameOutline.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
				DropdownFrameOutline.Size = UDim2.new(0, 396, 0, 36)

				DropdownFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
				DropdownFrameOutlineCorner.Name = "DropdownFrameOutlineCorner"
				DropdownFrameOutlineCorner.Parent = DropdownFrameOutline

				DropdownFrame.Name = "DropdownFrame"
				DropdownFrame.Parent = DropdownTitle
				DropdownFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
				DropdownFrame.ClipsDescendants = true
				DropdownFrame.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
				DropdownFrame.Selectable = true
				DropdownFrame.Size = UDim2.new(0, 392, 0, 32)

				DropdownFrameCorner.CornerRadius = UDim.new(0, 4)
				DropdownFrameCorner.Name = "DropdownFrameCorner"
				DropdownFrameCorner.Parent = DropdownFrame

				CurrentSelectedText.Name = "CurrentSelectedText"
				CurrentSelectedText.Parent = DropdownFrame
				CurrentSelectedText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				CurrentSelectedText.BackgroundTransparency = 1.000
				CurrentSelectedText.Position = UDim2.new(0.0178571437, 0, 0, 0)
				CurrentSelectedText.Size = UDim2.new(0, 193, 0, 32)
				CurrentSelectedText.Font = Enum.Font.Gotham
				CurrentSelectedText.Text = "..."
				CurrentSelectedText.TextColor3 = _G.Color
				CurrentSelectedText.TextSize = 14.000
				CurrentSelectedText.TextXAlignment = Enum.TextXAlignment.Left

				ArrowImg.Name = "ArrowImg"
				ArrowImg.Parent = CurrentSelectedText
				ArrowImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ArrowImg.BackgroundTransparency = 1.000
				ArrowImg.Position = UDim2.new(1.84974098, 0, 0.167428851, 0)
				ArrowImg.Size = UDim2.new(0, 22, 0, 22)
				ArrowImg.Image = "http://www.roblox.com/asset/?id=6034818372"
				ArrowImg.ImageColor3 = _G.Color

				DropdownFrameBtn.Name = "DropdownFrameBtn"
				DropdownFrameBtn.Parent = DropdownFrame
				DropdownFrameBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownFrameBtn.BackgroundTransparency = 1.000
				DropdownFrameBtn.Size = UDim2.new(0, 392, 0, 32)
				DropdownFrameBtn.Font = Enum.Font.SourceSans
				DropdownFrameBtn.Text = ""
				DropdownFrameBtn.TextColor3 = _G.Color
				DropdownFrameBtn.TextSize = 14.000

				local DropdownFrameMainOutline = Instance.new("Frame")
				local DropdownFrameMainOutlineCorner = Instance.new("UICorner")
				local DropdownFrameMain = Instance.new("Frame")
				local DropdownFrameMainCorner = Instance.new("UICorner")
				local DropItemHolderLabel = Instance.new("TextLabel")
				local DropItemHolder = Instance.new("ScrollingFrame")
				local DropItemHolderLayout = Instance.new("UIListLayout")

				DropdownFrameMainOutline.Name = "DropdownFrameMainOutline"
				DropdownFrameMainOutline.Parent = DropdownTitle
				DropdownFrameMainOutline.BackgroundColor3 = Color3.fromRGB(15,15,15)
				DropdownFrameMainOutline.Position = UDim2.new(-0.00155700743, 0, 2.16983342, 0)
				DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 81)
				DropdownFrameMainOutline.Visible = false

				DropdownFrameMainOutlineCorner.CornerRadius = UDim.new(0, 3)
				DropdownFrameMainOutlineCorner.Name = "DropdownFrameMainOutlineCorner"
				DropdownFrameMainOutlineCorner.Parent = DropdownFrameMainOutline

				DropdownFrameMain.Name = "DropdownFrameMain"
				DropdownFrameMain.Parent = DropdownTitle
				DropdownFrameMain.BackgroundColor3 = Color3.fromRGB(25,25,25)
				DropdownFrameMain.ClipsDescendants = true
				DropdownFrameMain.Position = UDim2.new(0.00999999978, 0, 2.2568965, 0)
				DropdownFrameMain.Selectable = true
				DropdownFrameMain.Size = UDim2.new(0, 392, 0, 77)
				DropdownFrameMain.Visible = false

				DropdownFrameMainCorner.CornerRadius = UDim.new(0, 4)
				DropdownFrameMainCorner.Name = "DropdownFrameMainCorner"
				DropdownFrameMainCorner.Parent = DropdownFrameMain

				DropItemHolderLabel.Name = "ItemHolderLabel"
				DropItemHolderLabel.Parent = DropdownFrameMain
				DropItemHolderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropItemHolderLabel.BackgroundTransparency = 1.000
				DropItemHolderLabel.Position = UDim2.new(0.0178571437, 0, 0, 0)
				DropItemHolderLabel.Size = UDim2.new(0, 193, 0, 13)
				DropItemHolderLabel.Font = Enum.Font.Gotham
				DropItemHolderLabel.Text = ""
				DropItemHolderLabel.TextColor3 = _G.Color
				DropItemHolderLabel.TextSize = 14.000
				DropItemHolderLabel.TextXAlignment = Enum.TextXAlignment.Left

				DropItemHolder.Name = "ItemHolder"
				DropItemHolder.Parent = DropItemHolderLabel
				DropItemHolder.Active = true
				DropItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropItemHolder.BackgroundTransparency = 1.000
				DropItemHolder.Position = UDim2.new(0, 0, 0.215384638, 0)
				DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
				DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
				DropItemHolder.ScrollBarThickness = 6
				DropItemHolder.BorderSizePixel = 0
				DropItemHolder.ScrollBarImageColor3 = _G.Color

				DropItemHolderLayout.Name = "ItemHolderLayout"
				DropItemHolderLayout.Parent = DropItemHolder
				DropItemHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
				DropItemHolderLayout.Padding = UDim.new(0, 0)

				DropdownFrameBtn.MouseButton1Click:Connect(function()
					if DropTog == false then
						DropdownFrameMain.Visible = true
						DropdownFrameMainOutline.Visible = true
						Dropdown.Size = UDim2.new(0, 403, 0, 73 + DropdownFrameMainOutline.AbsoluteSize.Y)
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)

					else
						Dropdown.Size = UDim2.new(0, 403, 0, 73)
						DropdownFrameMain.Visible = false
						DropdownFrameMainOutline.Visible = false
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
					end
					DropTog = not DropTog
				end)


				for i,v in next, list do
					itemcount = itemcount + 1

					if itemcount == 1 then
						framesize = 29
					elseif itemcount == 2 then
						framesize = 58
					elseif itemcount >= 3 then
						framesize = 87
					end

					local Item = Instance.new("TextButton")
					local ItemCorner = Instance.new("UICorner")
					local ItemText = Instance.new("TextLabel")

					Item.Name = "Item"
					Item.Parent = DropItemHolder
					Item.BackgroundColor3 = Color3.fromRGB(10,10,10)
					Item.Size = UDim2.new(0, 379, 0, 29)
					Item.AutoButtonColor = false
					Item.Font = Enum.Font.SourceSans
					Item.Text = ""
					Item.TextColor3 = Color3.fromRGB(0, 0, 0)
					Item.TextSize = 14.000
					Item.BackgroundTransparency = 1

					ItemCorner.CornerRadius = UDim.new(0, 4)
					ItemCorner.Name = "ItemCorner"
					ItemCorner.Parent = Item

					ItemText.Name = "ItemText"
					ItemText.Parent = Item
					ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					ItemText.BackgroundTransparency = 1.000
					ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
					ItemText.Size = UDim2.new(0, 192, 0, 29)
					ItemText.Font = Enum.Font.Gotham
					ItemText.TextColor3 = _G.Color
					ItemText.TextSize = 14.000
					ItemText.TextXAlignment = Enum.TextXAlignment.Left
					ItemText.Text = v

					Item.MouseEnter:Connect(function()
						ItemText.TextColor3 = _G.Color
						Item.BackgroundTransparency = 0
					end)

					Item.MouseLeave:Connect(function()
						ItemText.TextColor3 = _G.Color
						Item.BackgroundTransparency = 1
					end)

					Item.MouseButton1Click:Connect(function()
						CurrentSelectedText.Text = v
						pcall(callback, v)
						Dropdown.Size = UDim2.new(0, 403, 0, 73)
						DropdownFrameMain.Visible = false
						DropdownFrameMainOutline.Visible = false
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
						DropTog = not DropTog
					end)

					DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)

					DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
				end

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)

				function DropFunc:Clear()
					for i,v in next, DropItemHolder:GetChildren() do
						if v.Name == "Item" then
							v:Destroy()
						end
					end

					CurrentSelectedText.Text = "..."

					itemcount = 0
					framesize = 0
					DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, 0)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 0)
					Dropdown.Size = UDim2.new(0, 403, 0, 73)
					DropdownFrameMain.Visible = false
					DropdownFrameMainOutline.Visible = false
					ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
				end

				function DropFunc:Add(textadd)
					itemcount = itemcount + 1

					if itemcount == 1 then
						framesize = 29
					elseif itemcount == 2 then
						framesize = 58
					elseif itemcount >= 3 then
						framesize = 87
					end

					local Item = Instance.new("TextButton")
					local ItemCorner = Instance.new("UICorner")
					local ItemText = Instance.new("TextLabel")

					Item.Name = "Item"
					Item.Parent = DropItemHolder
					Item.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					Item.Size = UDim2.new(0, 379, 0, 29)
					Item.AutoButtonColor = false
					Item.Font = Enum.Font.SourceSans
					Item.Text = ""
					Item.TextColor3 = Color3.fromRGB(0, 0, 0)
					Item.TextSize = 14.000
					Item.BackgroundTransparency = 1

					ItemCorner.CornerRadius = UDim.new(0, 4)
					ItemCorner.Name = "ItemCorner"
					ItemCorner.Parent = Item

					ItemText.Name = "ItemText"
					ItemText.Parent = Item
					ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
					ItemText.BackgroundTransparency = 1.000
					ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
					ItemText.Size = UDim2.new(0, 192, 0, 29)
					ItemText.Font = Enum.Font.Gotham
					ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
					ItemText.TextSize = 14.000
					ItemText.TextXAlignment = Enum.TextXAlignment.Left
					ItemText.Text = textadd

					Item.MouseEnter:Connect(function()
						ItemText.TextColor3 = _G.Color
						Item.BackgroundTransparency = 0
					end)

					Item.MouseLeave:Connect(function()
						ItemText.TextColor3 = _G.Color
						Item.BackgroundTransparency = 1
					end)

					Item.MouseButton1Click:Connect(function()
						CurrentSelectedText.Text = textadd
						pcall(callback, textadd)
						Dropdown.Size = UDim2.new(0, 403, 0, 73)
						DropdownFrameMain.Visible = false
						DropdownFrameMainOutline.Visible = false
						ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
						DropTog = not DropTog
					end)

					DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)

					DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
					DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
					DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
				end
				return DropFunc
			end
			function ChannelContent:Colorpicker(text, preset, callback)
				local OldToggleColor = Color3.fromRGB(0, 0, 0)
				local OldColor = _G.Color
				local OldColorSelectionPosition = nil
				local OldHueSelectionPosition = nil
				local ColorH, ColorS, ColorV = 1, 1, 1
				local RainbowColorPicker = false
				local ColorPickerInput = nil
				local ColorInput = nil
				local HueInput = nil

				local Colorpicker = Instance.new("Frame")
				local ColorpickerTitle = Instance.new("TextLabel")
				local ColorpickerFrameOutline = Instance.new("Frame")
				local ColorpickerFrameOutlineCorner = Instance.new("UICorner")
				local ColorpickerFrame = Instance.new("Frame")
				local ColorpickerFrameCorner = Instance.new("UICorner")
				local Color = Instance.new("ImageLabel")
				local ColorCorner = Instance.new("UICorner")
				local ColorSelection = Instance.new("ImageLabel")
				local Hue = Instance.new("ImageLabel")
				local HueCorner = Instance.new("UICorner")
				local HueGradient = Instance.new("UIGradient")
				local HueSelection = Instance.new("ImageLabel")
				local PresetClr = Instance.new("Frame")
				local PresetClrCorner = Instance.new("UICorner")

				Colorpicker.Name = "Colorpicker"
				Colorpicker.Parent = ChannelHolder
				Colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Colorpicker.BackgroundTransparency = 1.000
				Colorpicker.Position = UDim2.new(0.0895741582, 0, 0.474232763, 0)
				Colorpicker.Size = UDim2.new(0, 403, 0, 175)

				ColorpickerTitle.Name = "ColorpickerTitle"
				ColorpickerTitle.Parent = Colorpicker
				ColorpickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerTitle.BackgroundTransparency = 1.000
				ColorpickerTitle.Position = UDim2.new(0, 5, 0, 0)
				ColorpickerTitle.Size = UDim2.new(0, 200, 0, 29)
				ColorpickerTitle.Font = Enum.Font.Gotham
				ColorpickerTitle.Text = "Colorpicker"
				ColorpickerTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
				ColorpickerTitle.TextSize = 14.000
				ColorpickerTitle.TextXAlignment = Enum.TextXAlignment.Left

				ColorpickerFrameOutline.Name = "ColorpickerFrameOutline"
				ColorpickerFrameOutline.Parent = ColorpickerTitle
				ColorpickerFrameOutline.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
				ColorpickerFrameOutline.Position = UDim2.new(-0.00100000005, 0, 0.991999984, 0)
				ColorpickerFrameOutline.Size = UDim2.new(0, 238, 0, 139)

				ColorpickerFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
				ColorpickerFrameOutlineCorner.Name = "ColorpickerFrameOutlineCorner"

				ColorpickerFrameOutlineCorner.Parent = ColorpickerFrameOutline

				ColorpickerFrame.Name = "ColorpickerFrame"
				ColorpickerFrame.Parent = ColorpickerTitle
				ColorpickerFrame.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
				ColorpickerFrame.ClipsDescendants = true
				ColorpickerFrame.Position = UDim2.new(0.00999999978, 0, 1.06638515, 0)
				ColorpickerFrame.Selectable = true
				ColorpickerFrame.Size = UDim2.new(0, 234, 0, 135)

				ColorpickerFrameCorner.CornerRadius = UDim.new(0, 3)
				ColorpickerFrameCorner.Name = "ColorpickerFrameCorner"
				ColorpickerFrameCorner.Parent = ColorpickerFrame

				Color.Name = "Color"
				Color.Parent = ColorpickerFrame
				Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
				Color.Position = UDim2.new(0, 10, 0, 10)
				Color.Size = UDim2.new(0, 154, 0, 118)
				Color.ZIndex = 10
				Color.Image = "rbxassetid://4155801252"

				ColorCorner.CornerRadius = UDim.new(0, 3)
				ColorCorner.Name = "ColorCorner"
				ColorCorner.Parent = Color

				ColorSelection.Name = "ColorSelection"
				ColorSelection.Parent = Color
				ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorSelection.BackgroundTransparency = 1.000
				ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
				ColorSelection.Size = UDim2.new(0, 18, 0, 18)
				ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
				ColorSelection.ScaleType = Enum.ScaleType.Fit

				Hue.Name = "Hue"
				Hue.Parent = ColorpickerFrame
				Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Hue.Position = UDim2.new(0, 171, 0, 10)
				Hue.Size = UDim2.new(0, 18, 0, 118)

				HueCorner.CornerRadius = UDim.new(0, 3)
				HueCorner.Name = "HueCorner"
				HueCorner.Parent = Hue

				HueGradient.Color = ColorSequence.new {
					ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
					ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
					ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
					ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
					ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
					ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
					ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
				}
				HueGradient.Rotation = 270
				HueGradient.Name = "HueGradient"
				HueGradient.Parent = Hue

				HueSelection.Name = "HueSelection"
				HueSelection.Parent = Hue
				HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HueSelection.BackgroundTransparency = 1.000
				HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
				HueSelection.Size = UDim2.new(0, 18, 0, 18)
				HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"

				PresetClr.Name = "PresetClr"
				PresetClr.Parent = ColorpickerFrame
				PresetClr.BackgroundColor3 = preset
				PresetClr.Position = UDim2.new(0.846153855, 0, 0.0740740746, 0)
				PresetClr.Size = UDim2.new(0, 25, 0, 25)

				PresetClrCorner.CornerRadius = UDim.new(0, 3)
				PresetClrCorner.Name = "PresetClrCorner"
				PresetClrCorner.Parent = PresetClr

				local function UpdateColorPicker(nope)
					PresetClr.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

					pcall(callback, PresetClr.BackgroundColor3)
				end

				ColorH =
					1 -
					(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
						Hue.AbsoluteSize.Y)
				ColorS =
					(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
						Color.AbsoluteSize.X)
				ColorV =
					1 -
					(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
						Color.AbsoluteSize.Y)

				PresetClr.BackgroundColor3 = preset
				Color.BackgroundColor3 = preset
				pcall(callback, PresetClr.BackgroundColor3)

				Color.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then

							if ColorInput then
								ColorInput:Disconnect()
							end

							ColorInput =
								RunService.RenderStepped:Connect(
									function()
									local ColorX =
										(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
											Color.AbsoluteSize.X)
									local ColorY =
										(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
											Color.AbsoluteSize.Y)

									ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
									ColorS = ColorX
									ColorV = 1 - ColorY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)

				Color.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if ColorInput then
								ColorInput:Disconnect()
							end
						end
					end
				)

				Hue.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then


							if HueInput then
								HueInput:Disconnect()
							end

							HueInput =
								RunService.RenderStepped:Connect(
									function()
									local HueY =
										(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
											Hue.AbsoluteSize.Y)

									HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
									ColorH = 1 - HueY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)

				Hue.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if HueInput then
								HueInput:Disconnect()
							end
						end
					end
				)

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end

			function ChannelContent:Texbox(text, placetext, disapper, callback)
				local Textbox = Instance.new("Frame")
				local TextboxTitle = Instance.new("TextLabel")
				local TextboxFrameOutline = Instance.new("Frame")
				local TextboxFrameOutlineCorner = Instance.new("UICorner")
				local TextboxFrame = Instance.new("Frame")
				local TextboxFrameCorner = Instance.new("UICorner")
				local TextBox = Instance.new("TextBox")

				Textbox.Name = "Textbox"
				Textbox.Parent = ChannelHolder
				Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Textbox.BackgroundTransparency = 1.000
				Textbox.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
				Textbox.Size = UDim2.new(0, 403, 0, 73)

				TextboxTitle.Name = "TextboxTitle"
				TextboxTitle.Parent = Textbox
				TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextboxTitle.BackgroundTransparency = 1.000
				TextboxTitle.Position = UDim2.new(0, 5, 0, 0)
				TextboxTitle.Size = UDim2.new(0, 200, 0, 29)
				TextboxTitle.Font = Enum.Font.Gotham
				TextboxTitle.Text = text
				TextboxTitle.TextColor3 = _G.Color
				TextboxTitle.TextSize = 14.000
				TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

				TextboxFrameOutline.Name = "TextboxFrameOutline"
				TextboxFrameOutline.Parent = TextboxTitle
				TextboxFrameOutline.AnchorPoint = Vector2.new(0.5, 0.5)
				TextboxFrameOutline.BackgroundColor3 = _G.Color
				TextboxFrameOutline.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
				TextboxFrameOutline.Size = UDim2.new(0, 396, 0, 36)

				TextboxFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
				TextboxFrameOutlineCorner.Name = "TextboxFrameOutlineCorner"
				TextboxFrameOutlineCorner.Parent = TextboxFrameOutline

				TextboxFrame.Name = "TextboxFrame"
				TextboxFrame.Parent = TextboxTitle
				TextboxFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
				TextboxFrame.ClipsDescendants = true
				TextboxFrame.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
				TextboxFrame.Selectable = true
				TextboxFrame.Size = UDim2.new(0, 392, 0, 32)

				TextboxFrameCorner.CornerRadius = UDim.new(0, 4)
				TextboxFrameCorner.Name = "TextboxFrameCorner"
				TextboxFrameCorner.Parent = TextboxFrame

				TextBox.Parent = TextboxFrame
				TextBox.BackgroundColor3 = _G.Color
				TextBox.BackgroundTransparency = 1.000
				TextBox.Position = UDim2.new(0.0178571437, 0, 0, 0)
				TextBox.Size = UDim2.new(0, 377, 0, 32)
				TextBox.Font = Enum.Font.Gotham
				TextBox.PlaceholderColor3 = _G.Color
				TextBox.PlaceholderText = placetext
				TextBox.Text = ""
				TextBox.TextColor3 = _G.Color
				TextBox.TextSize = 14.000
				TextBox.TextXAlignment = Enum.TextXAlignment.Left

				TextBox.Focused:Connect(function()
					TweenService:Create(
						TextboxFrameOutline,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = _G.Color}
					):Play()
				end)

				TextBox.FocusLost:Connect(function(ep)
					TweenService:Create(
						TextboxFrameOutline,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(15,15,15)}
					):Play()
					if ep then
						if #TextBox.Text > 0 then
							pcall(callback, TextBox.Text)
							if disapper then
								TextBox.Text = ""
							end
						end
					end
				end)

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end

			function ChannelContent:Label(text)
				local Label = Instance.new("TextButton")
				local LabelTitle = Instance.new("TextLabel")
				local labelfunc = {}

				Label.Name = "Label"
				Label.Parent = ChannelHolder
				Label.BackgroundColor3 = Color3.fromRGB(25,25,25)
				Label.BorderSizePixel = 0
				Label.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
				Label.Size = UDim2.new(0, 401, 0, 30)
				Label.AutoButtonColor = false
				Label.Font = Enum.Font.Gotham
				Label.Text = ""
				Label.TextColor3 = _G.Color
				Label.TextSize = 14.000

				LabelTitle.Name = "LabelTitle"
				LabelTitle.Parent = Label
				LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelTitle.BackgroundTransparency = 1.000
				LabelTitle.Position = UDim2.new(0, 5, 0, 0)
				LabelTitle.Size = UDim2.new(0, 200, 0, 30)
				LabelTitle.Font = Enum.Font.Gotham
				LabelTitle.Text = text
				LabelTitle.TextColor3 = _G.Color
				LabelTitle.TextSize = 14.000
				LabelTitle.TextXAlignment = Enum.TextXAlignment.Left

				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
				function labelfunc:Refresh(tochange)
					Label.Text = tochange
				end

				return labelfunc
			end

			function ChannelContent:Bind(text, presetbind, callback)
				local Key = presetbind.Name
				local Keybind = Instance.new("TextButton")
				local KeybindTitle = Instance.new("TextLabel")
				local KeybindText = Instance.new("TextLabel")

				Keybind.Name = "Keybind"
				Keybind.Parent = ChannelHolder
				Keybind.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
				Keybind.BorderSizePixel = 0
				Keybind.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
				Keybind.Size = UDim2.new(0, 401, 0, 30)
				Keybind.AutoButtonColor = false
				Keybind.Font = Enum.Font.Gotham
				Keybind.Text = ""
				Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
				Keybind.TextSize = 14.000

				KeybindTitle.Name = "KeybindTitle"
				KeybindTitle.Parent = Keybind
				KeybindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				KeybindTitle.BackgroundTransparency = 1.000
				KeybindTitle.Position = UDim2.new(0, 5, 0, 0)
				KeybindTitle.Size = UDim2.new(0, 200, 0, 30)
				KeybindTitle.Font = Enum.Font.Gotham
				KeybindTitle.Text = text
				KeybindTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
				KeybindTitle.TextSize = 14.000
				KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left

				KeybindText.Name = "KeybindText"
				KeybindText.Parent = Keybind
				KeybindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				KeybindText.BackgroundTransparency = 1.000
				KeybindText.Position = UDim2.new(0, 316, 0, 0)
				KeybindText.Size = UDim2.new(0, 85, 0, 30)
				KeybindText.Font = Enum.Font.Gotham
				KeybindText.Text = presetbind.Name
				KeybindText.TextColor3 = Color3.fromRGB(127, 131, 137)
				KeybindText.TextSize = 14.000
				KeybindText.TextXAlignment = Enum.TextXAlignment.Right

				Keybind.MouseButton1Click:Connect(function()
					KeybindText.Text = "..."
					local inputwait = game:GetService("UserInputService").InputBegan:wait()
					if inputwait.KeyCode.Name ~= "Unknown" then
						KeybindText.Text = inputwait.KeyCode.Name
						Key = inputwait.KeyCode.Name
					end
				end)

				game:GetService("UserInputService").InputBegan:connect(function(current, pressed)
					if not pressed then
						if current.KeyCode.Name == Key then
							pcall(callback)
						end
					end
				end)
				ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
			end

			return ChannelContent
		end

		return ChannelHold
	end
	return ServerHold
end
Wapon = {}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
	if v:IsA("Tool") then
	   table.insert(Wapon ,v.Name)
	end
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
	if v:IsA("Tool") then
	   table.insert(Wapon, v.Name)
	end
end

local Boss = {}
for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
    if string.find(v.Name, "Boss") then
        if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
		elseif v.Name == "rip_indra [Lv. 1500] [Boss]" then
        else
            table.insert(Boss, v.Name)
        end
    end
end

for i,v in pairs(game.workspace.Enemies:GetChildren()) do
    if string.find(v.Name, "Boss") then
		if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
		elseif v.Name == "rip_indra [Lv. 1500] [Boss]" then
		else
			table.insert(Boss, v.Name)
		end
	end
end

spawn(function()
    pcall(function()
        while wait() do
			if _G.LightMode then
				if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PointLight") then
					local a = Instance.new("PointLight")
					a.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
					a.Range = 16
					a.Color = Color3.fromRGB(255, 167, 31)
				end
			end
        end
    end)
end)

function BeautifulMode()
	_G.LightMode = true
	if game:GetService("Lighting"):FindFirstChild("BloomEffect") then
		game:GetService("Lighting"):FindFirstChild("BloomEffect"):Destroy()
	end
	if game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect") then
		game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect"):Destroy()
	end
	if game:GetService("Lighting"):FindFirstChild("DepthOfFieldEffect") then
		game:GetService("Lighting"):FindFirstChild("DepthOfFieldEffect"):Destroy()
	end
	if game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect") then
		game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect"):Destroy()
	end
	if game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect2") then
		game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect2"):Destroy()
	end
	if game:GetService("Lighting"):FindFirstChild("SunRaysEffect") then
		game:GetService("Lighting"):FindFirstChild("SunRaysEffect"):Destroy()
	end
	local a = game.Lighting
	a.Ambient = Color3.fromRGB(31, 31, 31)
	a.Brightness = 0.7
	a.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
	a.ColorShift_Top = Color3.fromRGB(255, 102, 31)
	a.EnvironmentDiffuseScale = 0.205
	a.EnvironmentSpecularScale = 0.522
	a.GlobalShadows = true
	a.OutdoorAmbient = Color3.fromRGB(67, 67, 67)
	a.ShadowSoftness = 0.5
	a.GeographicLatitude = -15.525
	a.ExposureCompensation = 0.75
	local b = Instance.new("BloomEffect", a)
	b.Name = "BloomEffect"
	b.Enabled = true
	b.Intensity = 0.04
	b.Size = 1900
	b.Threshold = 0.915
	local c = Instance.new("ColorCorrectionEffect", a)
	c.Name = "ColorCorrectionEffect"
	c.Brightness = 0.176
	c.Contrast = 0.39
	c.Enabled = true
	c.Saturation = 0.2
	c.TintColor = Color3.fromRGB(255, 227, 128)
	local d = Instance.new("DepthOfFieldEffect", a)
	d.Name = "DepthOfFieldEffect"
	d.Enabled = true
	d.FarIntensity = 0.077
	d.FocusDistance = 21.54
	d.InFocusRadius = 20.77
	d.NearIntensity = 0.277
	local e = Instance.new("ColorCorrectionEffect", a)
	e.Name = "ColorCorrectionEffect"
	e.Brightness = 0.3
	e.Contrast = -0.07
	e.Saturation = 0
	e.Enabled = true
	e.TintColor = Color3.fromRGB(255, 247, 239)
	local e2 = Instance.new("ColorCorrectionEffect", a)
	e2.Name = "ColorCorrectionEffect2"
	e2.Brightness = 0.1
	e2.Contrast = 0.45
	e2.Saturation = -0.1
	e2.Enabled = true
	e2.TintColor = Color3.fromRGB(167, 167, 167)
	local s = Instance.new("SunRaysEffect", a)
	s.Name = "SunRaysEffect"
	s.Enabled = true
	s.Intensity = 0.01
	s.Spread = 0.146
end

PlayerName = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(PlayerName ,v.Name)
end

-------

repeat wait() until game:IsLoaded()
local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function() VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end)
require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker).CameraShakeInstance.CameraShakeState = {FadingIn = 3, FadingOut = 2, Sustained = 0, Inactive = 1}

-- Checking...
local Firstsea = false
local Secondsea = false
local Thirdsea = false

if game.PlaceId == 2753915549 then
    Firstsea = true
    subTitle = "First Sea"
elseif game.PlaceId == 4442272183 then
    Secondsea = true
    subTitle = "Second Sea"
elseif game.PlaceId == 7449423635 then
    Thirdsea = true
    subTitle = "Third Sea"
end

function WebHook(url)
    local Exploiter =
        is_sirhurt_closure and "Sirhurt"
        or pebc_execute    and "ProtoSmasher"
        or syn             and "Synapse X"
        or secure_load     and "Sentinel"
        or KRNL_LOADED     and "Krnl"
        or SONA_LOADED     and "Sona"
        or "Scripts Not Support Exploit!"
    local Message = {
        ["embeds"] = {
            {
                ["author"] = {
                    ["name"] = game.Players.LocalPlayer.Name,
                    ["icon_url"] = "https://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&username="..game.Players.LocalPlayer.Name
                },
                ["description"] = "**Game:** BloxFruits | "..subTitle.." | **Script:** XYz Hub",
                ["color"] = tonumber(0xFFFAFA),
                ["fields"] = {
                    {
                        ["name"] = "Username:",
                        ["value"] = game.Players.LocalPlayer.Name,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "User ID:",
                        ["value"] = game.Players.LocalPlayer.UserId,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "HWID:",
                        ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Exploit:",
                        ["value"] = Exploiter,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Level:",
                        ["value"] = game.Players.LocalPlayer.Data.Level.Value,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Beli:",
                        ["value"] = game.Players.LocalPlayer.Data.Beli.Value,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Fragments:",
                        ["value"] = game.Players.LocalPlayer.Data.Fragments.Value,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Bounty/Honor:",
                        ["value"] = game:GetService("Players")["LocalPlayer"].leaderstats["Bounty/Honor"].Value,
                        ["inline"] = true
                    },
                }
            }
        }
    }
    request =
        http_request
        or request
        or HttpPost
        or syn.request
    local EmbedMessage = {Url = url, Body = game:GetService("HttpService"):JSONEncode(Message), Method = "POST", Headers = {["content-type"] = "application/json"}}
    request(EmbedMessage)
end

_G.NoJoinDiscord = false
local NewFile = "NoJoinDiscord.txt";
function LoadData()
    print("Loading Data...")
    local HS = game:GetService("HttpService");
    if (readfile and isfile and isfile(NewFile)) then
        _G.NoJoinDiscord = HS:JSONDecode(readfile(NewFile));
    end
end



-- Checking Team
if _G.SetTeam == nil then _G.SetTeam = "Pirates" end
if _G.SetTeam == "Pirates" or _G.SetTeam == "Marines" then
    local Button = game.Players.LocalPlayer.PlayerGui.Main.ChooseTeam.Container[_G.SetTeam].Frame.ViewportFrame.TextButton
    for i,v in pairs(getconnections(Button.MouseButton1Click)) do
        v.Function()
    end
    local args = {[1] = "Buso"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    repeat wait(1) until game.Players.LocalPlayer.Character
end

_G.Color = Color3.fromRGB(255, 51, 51) ---Color

local Star = StarHub:Window("XYZ HUB PAID SCRIPT")

local StarServer = Star:Server("XYZHUB-PAID",5012544693) --ใส่idรูปได้

local AutoFarm = StarServer:Channel("Auto Farm")

Time = AutoFarm:Label("Server Time")

function UpdateTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2))%24
    local Minute = math.floor(GameTime/(60^1))%60
    local Second = math.floor(GameTime/(60^0))%60
    Time:Refresh("Hour : "..Hour.." Minute : "..Minute.." Second : "..Second)
end

spawn(function()
    while true do
        UpdateTime()
        wait()
    end
end)

Client = AutoFarm:Label("Client")

function UpdateClient()
    local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local Fps = workspace:GetRealPhysicsFPS()
    Client:Refresh("Fps : "..Fps.." Ping : "..Ping)
end

spawn(function()
    while true do wait(.1)
        UpdateClient()
    end
end)

local FruitList = {
    "Bomb-Bomb",
    "Spike-Spike",
    "Chop-Chop",
    "Spring-Spring",
    "Kilo-Kilo",
    "Smoke-Smoke",
    "Spin-Spin",
    "Flame-Flame",
    "Bird-Bird: Falcon",
    "Ice-Ice",
    "Sand-Sand",
    "Dark-Dark",
    "Revine-Revine",
    "Diamond-Diamond",
    "Light-Light",
    "Love-Love",
    "Rubber-Rubber",
    "Barrier-Barrier",
    "Magma-Magma",
    "Door-Door",
    "Quake-Quake",
    "Human-Human: Buddha",
    "String-String",
    "Bird-Bird: Phoenix",
    "Rumble-Rumble",
    "Paw-Paw",
    "Gravity-Gravity",
    "Dough-Dough",
    "Shadow-Shadow",
    "Venom-Venom",
    "Control-Control",
    "Soul-Soul",
    "Dragon-Dragon"
}

local LogiaFruit = {
    "Smoke-Smoke",
    "Flame-Flame",
    "Ice-Ice",
    "Sand-Sand",
    "Dark-Dark",
    "Light-Light",
    "Magma-Magma",
    "Rumble-Rumble"
}

local Part = nil;
local Force = nil;
local TweenType = true
if GodModeIsDone or GodModeIsDone == nil then GodModeIsDone = false end
if TotalCounter or TotalCounter == nil then TotalCounter = true end
game:GetService("RunService").Stepped:Connect(function ()
    if Float
    or _G.AutoFarm
    or _G.MobAura
    or _G.ChooseMob
    or _G.BoneFarm
    or _G.AutoElite
    or _G.AutoRainbow
    or AutoElectric
    or _G.BossFarm
    or _G.AllBoss
    or KillPlr
    or KillPlr2
    or _G.BringFruit
    or NoClip
    or NextIsland
    or AutoJoinRaid
    or _G.CandyFarm
    or KillAura
    or AutoSea
    or GunMastery
    or FruitMastery
    or _G.Observation
    or _G.Tushita
    or _G.BuddySword
    or _G.PirateRaid
    or _G.ChestFarm
    then
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
        if TweenType then
            if not Part then
                Part = Instance.new("Part", game.Workspace)
                Part.Name = "TweenWalk"
                Part.Anchored = true
                Part.CanCollide = true
                Part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -4.3, 0)
                Part.Size = Vector3.new(25, 1.3, 25)
                if _G.HidePart then
                    Part.Transparency = 1
                else
                    Part.Transparency = 0
                end
                Part.Material = "Neon"
                Part.BrickColor = BrickColor.new"Deep orange"
                while game.Workspace:FindFirstChild("TweenWalk") do
                    if _G.HidePart then game.Workspace:FindFirstChild("TweenWalk").Transparency = 1 else game.Workspace:FindFirstChild("TweenWalk").Transparency = 0 end
                    game.Workspace:FindFirstChild("TweenWalk").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -4.3, 0)
                    game:GetService("RunService").Heartbeat:wait()
                end
            end
        elseif TweenType == false then
            if not Force then
                Force = Instance.new("BodyForce", game.Players.LocalPlayer.Character.HumanoidRootPart)
                Force.Force = Vector3.new(0, 96.2, 0) * game.Players.LocalPlayer.Character.HumanoidRootPart:GetMass()
                -- Force.Force = Vector3.new(0, game.Players.LocalPlayer.Character.HumanoidRootPart:GetMass() * 196.2, 0)
            end
        end
    else
        if TweenType then
            if Part then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v:IsA("Part") and v.Name == "TweenWalk" then
                        v:Destroy()
                    end
                end
                Part = nil
            end
        else
            if Force then
                game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyForce"):Destroy()
                Force = nil
            end
        end
    end
end)

function Tween(Pos, Speed)
    if not _G.AutoFarm
    or not _G.MobAura
    or not _G.ChooseMob
    or not _G.BoneFarm
    or not _G.AutoElite
    or not _G.AutoRainbow
    or not AutoElectric
    or not _G.BossFarm
    or not _G.AllBoss
    or not KillPlr
    or not KillPlr2
    or not _G.BringFruit
    or not NoClip
    or not NextIsland
    or not AutoJoinRaid
    or not Float
    or not _G.CandyFarm
    or not KillAura
    or not AutoSea
    or not GunMastery
    or not FruitMastery
    or not _G.Observation
    or not _G.Tushita
    or not _G.BuddySword
    or not _G.PirateRaid
    or not _G.ChestFarm
    then
        Float = true
    end
    local TS = game:GetService("TweenService")
    local Info = TweenInfo.new((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Pos).magnitude / Speed, Enum.EasingStyle.Linear)
    local Tween, Err = pcall(function ()
        Tween = TS:Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, Info, {CFrame = CFrame.new(Pos)})
        Tween:Play()
        if not Tween then return Err end
        if Float then Float = false end
    end)
end

function TweenTo(Pos, Speed)
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Pos).magnitude <= 250 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Pos)
    else
        if not _G.AutoFarm
        or not _G.MobAura
        or not _G.ChooseMob
        or not _G.BoneFarm
        or not _G.AutoElite
        or not _G.AutoRainbow
        or not AutoElectric
        or not _G.BossFarm
        or not _G.AllBoss
        or not KillPlr
        or not KillPlr2
        or not _G.BringFruit
        or not NoClip
        or not NextIsland
        or not AutoJoinRaid
        or not Float
        or not _G.CandyFarm
        or not KillAura
        or not AutoSea
        or not GunMastery
        or not FruitMastery
        or not _G.Observation
        or not _G.Tushita
        or not _G.BuddySword
        or not _G.PirateRaid
        or not _G.ChestFarm
        then
            Float = true
        end
        local TS = game:GetService("TweenService")
        local Info = TweenInfo.new((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Pos).magnitude / Speed, Enum.EasingStyle.Linear)
        local Tween, Err = pcall(function ()
            Tween = TS:Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, Info, {CFrame = CFrame.new(Pos)})
            Tween:Play()
            repeat wait() until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Pos).magnitude <= 250 or Pos == game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position or TweenStopped
            Tween:Pause()
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Pos).magnitude <= 400 then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Pos) end
            if not Tween then return Err end
            if Float then Float = false end
        end)
    end
end

function StopTween()
    if not TweenStopped then
        TweenStopped = true
        wait(1)
        TweenStopped = false
    end
end

local Gun;
local ListMelee = {
    "Combat",
    "Black Leg",
    "Electro",
    "Fishman Karate",
    "Dragon Claw",
    "Superhuman",
    "DeathStep",
    "SharkmanKarate",
    "Electric Claw",
    "Dragon Talon"
}

spawn(function ()
    while game:GetService("RunService").RenderStepped:Wait() do
        pcall(function ()
            -- game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
            -- for i, v in pairs(game:GetService("ReplicatedStorage").Effect.Container:GetChildren()) do
            --     if v.Name == "Shared" and v:IsA("Folder") then
            --     else
            --         v:Destroy()
            --     end
            -- end
            for i, v in pairs(game:GetService("Workspace").Characters[tostring(game.Players.LocalPlayer)].HumanoidRootPart:GetChildren()) do
                if v.Name == "CrewBBG" then
                    Pirates = true
                    Marines = false
                elseif v.Name == "MarineBBG" then
                    Pirates = false
                    Marines = true
                end
            end
            for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                if v:FindFirstChild("Humanoid") ~= nil  and v:FindFirstChild("HumanoidRootPart") ~= nil and v:IsA("Model") then
                    v.Parent = game:GetService("Workspace").Enemies
                end
            end
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("RemoteFunctionShoot") then
                    Gun = v.Name
                end
            end
            if _G.EspFruit then
                ESP("Fruit")
            end
            if _G.EspChest then
                ESP("Chest")
            end
            if _G.EspPlayer then
                ESP("Players")
            end
            if _G.AutoStore then
                repeat wait(1)
                    local args = {[1] = "getInventoryFruits"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    AllFruit = FruitList
                    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))) do
                        for i2, v2 in pairs(v) do
                            FruitCheck = v2
                            for i3, v3 in pairs(AllFruit) do
                                if v3 == v2 then
                                    table.remove(AllFruit, i3)
                                end
                            end
                        end
                    end
                    for i, v in pairs(AllFruit) do
                        local args = {[1] = "StoreFruit", [2] = v}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                until not _G.AutoStore
            end
            if _G.AutoSword then
                local args = {[1] = "LegendarySwordDealer", [2] = "1"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                local args = {[1] = "LegendarySwordDealer", [2] = "2"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                local args = {[1] = "LegendarySwordDealer", [2] = "3"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if _G.HOP and Secondsea then
                    wait(10)
                    Teleport()
                elseif _G.LowHop and Secondsea then
                    wait(10)
                    LowServerHop()
                end
            end
            if _G.HakiColor then
                local args = {[1] = "ColorsDealer", [2] = "2"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if _G.HOP and not Firstsea then
                    wait(10)
                    Teleport()
                elseif _G.LowHop and not Firstsea then
                    wait(10)
                    LowServerHop()
                end
            end
            if _G.AutoKen and not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                game:GetService('VirtualUser'):CaptureController()
                game:GetService('VirtualUser'):SetKeyDown('0x65')
                wait(1)
                game:GetService('VirtualUser'):SetKeyUp('0x65')
            end
            if AutoAwaken then
                local args = {[1] = "Awakener", [2] = "Check"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                local args = {[1] = "Awakener", [2] = "Awaken"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if KillAura then
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude <= 500
                    and game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true
                    then
                        if KillAura then StartMagnet = true else StartMagnet = false end
                        if KillAura then StartClick = true else StartClick = false end
                        if KillAura and not StopNextIsland then StopNextIsland = true end
                        repeat game:GetService("RunService").Heartbeat:Wait()
                            if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                repeat wait() until game.Players.LocalPlayer.Character break;
                            else
                                if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                if _G.Weapon == "" or _G.Weapon == nil then
                                    for i, v in pairs(ListMelee) do
                                        if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                            _G.Weapon = v
                                        end
                                    end
                                end
                                Equip(_G.Weapon)
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    local args = {[1] = "Buso"}
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                    v.Humanoid.WalkSpeed = 1
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v.HumanoidRootPart.Transparency = 1
                                    KillAuraPos = v.HumanoidRootPart.CFrame
                                end
                                if GodModeIsDone then
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0)
                                else
                                    TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 25, 0), 300)
                                end
                                require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                            end
                        until v.Humanoid.Health <= 0 or KillAura == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false
                        if StartMagnet then StartMagnet = false end
                        if StartClick then StartClick = false end
                        if StopNextIsland then StopNextIsland = false end
                    end
                end
                -- pcall(function()
                --     for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                --         if v:FindFirstChild("Humanoid") and v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("LowerTorso") and v:FindFirstChild("UpperTorso") and v:FindFirstChild("Head") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 then
                --             if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                --             if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                --             v:FindFirstChild("LowerTorso"):Destroy()
                --             v:FindFirstChild("UpperTorso"):Destroy()
                --             v:FindFirstChild("Head"):Destroy()
                --             v:breakJoints()
                --             v.Humanoid.Health = 0
                --             v.Humanoid.Health = v.Humanoid.MaxHealth
                --             v.Humanoid.Health = 0
                --             if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                --             if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                --             wait(0.1)
                --         end
                --     end
                -- end)
            end
            if _G.AutoEmma then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
                    repeat wait(.1)
                        fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector, 0.1)
                    until game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoEmma
                end
            end
            if NextIsland then
                local Locations = game:GetService("Workspace")["_WorldOrigin"].Locations
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false then
                    StopTween()
                elseif Locations:FindFirstChild("Island 5")
                or Locations:FindFirstChild("Island 4")
                or Locations:FindFirstChild("Island 3")
                or Locations:FindFirstChild("Island 2")
                or Locations:FindFirstChild("Island 1")
                then
                    if StopNextIsland then
                        repeat wait() until not StopNextIsland or NextIsland == false
                    elseif Locations:FindFirstChild("Island 5") then
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Locations:FindFirstChild("Island 5").Position) * CFrame.new(0, _G.RaidHeight, 0)
                        else
                            TweenTo(Locations:FindFirstChild("Island 5").Position + Vector3.new(0, _G.RaidHeight, 0), 300)
                        end
                    elseif Locations:FindFirstChild("Island 4") then
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Locations:FindFirstChild("Island 4").Position) * CFrame.new(0, _G.RaidHeight, 0)
                        else
                            TweenTo(Locations:FindFirstChild("Island 4").Position + Vector3.new(0, _G.RaidHeight, 0), 300)
                        end
                    elseif Locations:FindFirstChild("Island 3") then
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Locations:FindFirstChild("Island 3").Position) * CFrame.new(0, _G.RaidHeight, 0)
                        else
                            TweenTo(Locations:FindFirstChild("Island 3").Position + Vector3.new(0, _G.RaidHeight, 0), 300)
                        end
                    elseif Locations:FindFirstChild("Island 2") then
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Locations:FindFirstChild("Island 2").Position) * CFrame.new(0, _G.RaidHeight, 0)
                        else
                            TweenTo(Locations:FindFirstChild("Island 2").Position + Vector3.new(0, _G.RaidHeight, 0), 300)
                        end
                    elseif Locations:FindFirstChild("Island 1") then
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Locations:FindFirstChild("Island 1").Position) * CFrame.new(0, _G.RaidHeight, 0)
                        else
                            TweenTo(Locations:FindFirstChild("Island 1").Position + Vector3.new(0, _G.RaidHeight, 0), 300)
                        end
                    end
                end
            end
            if AutoJoinRaid then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name, "Microchip") then
                        if Thirdsea and not JoinedRaid then
                            RaidPortal = Vector3.new(-5033.16, 314.953, -2949.96)
                            if GodModeIsDone then
                                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(RaidPortal)
                            else
                                repeat wait()
                                    TweenTo(RaidPortal, 300)
                                until (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - RaidPortal).magnitude <= 5
                            end
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector , 0.1)
                            HasChip = false
                            JoinedRaid = true
                            repeat wait(3) until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true
                            repeat wait(3) until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false
                            JoinedRaid = false
                        elseif Secondsea and not JoinedRaid then
                            RaidPortal = Vector3.new(-6457.14, 252.737, -4451.57)
                            if GodModeIsDone then
                                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(RaidPortal)
                            else
                                repeat wait()
                                    TweenTo(RaidPortal, 300)
                                until (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - RaidPortal).magnitude <= 5
                            end
                            fireclickdetector(game:GetService("Workspace").Map["CircleIsland"].RaidSummon2.Button.Main.ClickDetector, 0.1)
                            HasChip = false
                            JoinedRaid = true
                            repeat wait(3) until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true
                            repeat wait(3) until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false
                            JoinedRaid = false
                        end
                    end
                end
            end
            if _G.AutoBuso and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end)
    end
end)

-- Function
-- spawn(function()
--     local Camera = require(game.ReplicatedStorage.Util.CameraShaker)
--     local LocalCombatMod = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
--     game:GetService('RunService').Heartbeat:Connect(function()
--         if _G.FastAttack then
--             pcall(function()
--                 Camera:Stop()
--                 LocalCombatMod.activeController.attacking = false
--                 LocalCombatMod.activeController.timeToNextAttack = 0.2
--                 LocalCombatMod.activeController.active = false
--                 LocalCombatMod.activeController.increment = 3
--                 LocalCombatMod.activeController.humanoid.AutoRotate = true
--                 LocalCombatMod.activeController.blocking = false
--                 LocalCombatMod.activeController.equipped = false
--                 LocalCombatMod.activeController.timeToNextBlock = 0.2
--                 LocalCombatMod.activeController.focusStart = 0
--             end)
--         end
--     end)
-- end)

function levelCheck() -- Check Level
    local MyLevel = game.Players.localPlayer.Data.Level.Value
    if Firstsea then
        if MyLevel == 1 or MyLevel <= 9 then
            nameMob = "Bandit [Lv. 5]"
            nameQuest = "BanditQuest1"
            levelQuest = 1
            nameMon = "Bandits"
            waitPos = Vector3.new(1181.81, 16.6435, 1621.8)
            posQuest = Vector3.new(1060.21, 16.4858, 1547.41)
        elseif MyLevel == 10 or MyLevel <= 14 then
            nameMob = "Monkey [Lv. 14]"
            nameQuest = "JungleQuest"
            levelQuest = 1
            nameMon = "Monkey"
            waitPos = Vector3.new(-1686.15, 22.8522, -35.0998)
            posQuest = Vector3.new(-1601.98, 36.8521, 153.451)
        elseif MyLevel == 15 or MyLevel <= 29 then
            nameMob = "Gorilla [Lv. 20]"
            nameQuest = "JungleQuest"
            levelQuest = 2
            nameMon = "Gorilla"
            waitPos = Vector3.new(-1247.06, 6.27936, -502.53)
            posQuest = Vector3.new(-1601.98, 36.8521, 153.451)
        elseif MyLevel == 30 or MyLevel <= 39 then
            nameMob = "Pirate [Lv. 35]"
            nameQuest = "BuggyQuest1"
            levelQuest = 1
            nameMon = "Pirate"
            waitPos = Vector3.new(-1221.9, 4.75205, 3921.43)
            posQuest = Vector3.new(-1140.17, 4.75205, 3828.02)
        elseif MyLevel == 40 or MyLevel <= 59 then
            nameMob = "Brute [Lv. 45]"
            nameQuest = "BuggyQuest1"
            levelQuest = 2
            nameMon = "Brute"
            waitPos = Vector3.new(-1249.4, 15.0019, 4255.29)
            posQuest = Vector3.new(-1140.17, 4.75205, 3828.02)
        elseif MyLevel == 60 or MyLevel <= 74 then
            nameMob = "Desert Bandit [Lv. 60]"
            nameQuest = "DesertQuest"
            levelQuest = 1
            nameMon = "Desert Bandit"
            waitPos = Vector3.new(932.314, 6.45041, 4481.22)
            posQuest = Vector3.new(896.676, 6.43846, 4389.51)
        elseif MyLevel == 75 or MyLevel <= 89 then
            nameMob = "Desert Officer [Lv. 70]"
            nameQuest = "DesertQuest"
            levelQuest = 2
            nameMon = "Desert Officer"
            waitPos = Vector3.new(1593.28, 3.49216, 4368.19)
            posQuest = Vector3.new(896.676, 6.43846, 4389.51)
        elseif MyLevel == 90 or MyLevel <= 99 then
            nameMob = "Snow Bandit [Lv. 90]"
            nameQuest = "SnowQuest"
            levelQuest = 1
            nameMon = "Snow Bandits"
            waitPos = Vector3.new(1305.44, 105.775, -1438.46)
            posQuest = Vector3.new(1386.27, 87.2728, -1299.83)
        elseif MyLevel == 100 or MyLevel <= 119 then
            nameMob = "Snowman [Lv. 100]"
            nameQuest = "SnowQuest"
            levelQuest = 2
            nameMon = "Snowman"
            waitPos = Vector3.new(1169.95, 105.773, -1482.69)
            posQuest = Vector3.new(1386.27, 87.2728, -1299.83)
        elseif MyLevel == 120 or MyLevel <= 149 then
            nameMob = "Chief Petty Officer [Lv. 120]"
            nameQuest = "MarineQuest2"
            levelQuest = 1
            nameMon = "Chief Petty Officer"
            waitPos = Vector3.new(-4972.66, 20.652, 4014.67)
            posQuest = Vector3.new(-5036.07, 28.652, 4324.89)
        elseif MyLevel == 150 or MyLevel <= 174 then
            nameMob = "Sky Bandit [Lv. 150]"
            nameQuest = "SkyQuest"
            levelQuest = 1
            nameMon = "Sky Bandit"
            waitPos = Vector3.new(-5013.48, 278.067, -2845.86)
            posQuest = Vector3.new(-4841.2, 717.67, -2622.72)
        elseif MyLevel == 175 or MyLevel <= 224 then
            nameMob = "Dark Master [Lv. 175]"
            nameQuest = "SkyQuest"
            levelQuest = 2
            nameMon = "Dark Master"
            waitPos = Vector3.new(-5249.65, 388.652, -2260.82)
            posQuest = Vector3.new(-4841.2, 717.67, -2622.72)
        elseif MyLevel == 225 or MyLevel <= 274 then
            nameMob = "Toga Warrior [Lv. 225]"
            nameQuest = "ColosseumQuest"
            levelQuest = 1
            nameMon = "Toga Warrior"
            waitPos = Vector3.new(-1762.07, 7.28907, -2767.59)
            posQuest = Vector3.new(-1576.79, 7.38934, -2984.77)
        elseif MyLevel == 275 or MyLevel <= 299 then
            nameMob = "Gladiator [Lv. 275]"
            nameQuest = "ColosseumQuest"
            levelQuest = 2
            nameMon = "Gladiato"
            waitPos = Vector3.new(-1333.73, 7.44254, -3277.76)
            posQuest = Vector3.new(-1576.79, 7.38934, -2984.77)
        elseif MyLevel == 300 or MyLevel <= 329 then
            nameMob = "Military Soldier [Lv. 300]"
            nameQuest = "MagmaQuest"
            levelQuest = 1
            nameMon = "Military Soldier"
            waitPos = Vector3.new(-5410.98, 8.59068, 8512)
            posQuest = Vector3.new(-5315.57, 12.2369, 8516.53)
        elseif MyLevel == 300 or MyLevel <= 374 then
            nameMob = "Military Spy [Lv. 330]"
            nameQuest = "MagmaQuest"
            levelQuest = 2
            nameMon = "Military Spy"
            waitPos = Vector3.new(-5845.48, 77.2517, 8846.79)
            posQuest = Vector3.new(-5315.57, 12.2369, 8516.53)
        elseif MyLevel == 375 or MyLevel <= 399 then
            nameMob = "Fishman Warrior [Lv. 375]"
            nameQuest = "FishmanQuest"
            levelQuest = 1
            nameMon = "Fishman Warrior"
            waitPos = Vector3.new(60896.5, 18.4828, 1565.23)
            posQuest = Vector3.new(61122.2, 18.4716, 1566.93)
        elseif MyLevel == 400 or MyLevel <= 449 then
            nameMob = "Fishman Commando [Lv. 400]"
            nameQuest = "FishmanQuest"
            levelQuest = 2
            nameMon = "Fishman Commando"
            waitPos = Vector3.new(61898.3, 18.4828, 1512.45)
            posQuest = Vector3.new(61122.2, 18.4716, 1566.93)
        elseif MyLevel == 450 or MyLevel <= 474 then
            nameMob = "God's Guard [Lv. 450]"
            nameQuest = "SkyExp1Quest"
            levelQuest = 1
            nameMon = "God's Guards"
            waitPos = Vector3.new(-4706.74, 845.278, -1885.04)
            posQuest = Vector3.new(-4721.67, 845.277, -1952.91)
        elseif MyLevel == 475 or MyLevel <= 524 then
            nameMob = "Shanda [Lv. 475]"
            nameQuest = "SkyExp1Quest"
            levelQuest = 2
            nameMon = "Shandas"
            waitPos = Vector3.new(-7693.01, 5547.97, -492.654)
            posQuest = Vector3.new(-7901, 5541.15, -384.118)
        elseif MyLevel == 525 or MyLevel <= 549 then
            nameMob = "Royal Squad [Lv. 525]"
            nameQuest = "SkyExp2Quest"
            levelQuest = 1
            nameMon = "Royal Squad"
            waitPos = Vector3.new(-7709.06, 5610.58, -1426.42)
            posQuest = Vector3.new(-7904.17, 5635.96, -1412.22)
        elseif MyLevel == 550 or MyLevel <= 624 then
            nameMob = "Royal Soldier [Lv. 550]"
            nameQuest = "SkyExp2Quest"
            levelQuest = 2
            nameMon = "Royal Soldier"
            waitPos = Vector3.new(-7837.64, 5681.5, -1790.18)
            posQuest = Vector3.new(-7904.17, 5635.96, -1412.22)
        elseif MyLevel == 625 or MyLevel <= 649 then
            nameMob = "Galley Pirate [Lv. 625]"
            nameQuest = "FountainQuest"
            levelQuest = 1
            nameMon = "Galley Pirate"
            waitPos = Vector3.new(5531.84, 38.5386, 3980.33)
            posQuest = Vector3.new(5256.18, 38.5011, 4049.5)
        elseif MyLevel >= 650 then
            nameMob = "Galley Captain [Lv. 650]"
            nameQuest = "FountainQuest"
            levelQuest = 2
            nameMon = "Galley Captain"
            waitPos = Vector3.new(5470.93, 38.5011, 4902.31)
            posQuest = Vector3.new(5256.18, 38.5011, 4049.5)
        end
    elseif Secondsea then
        if MyLevel == 700 or MyLevel <= 724 then
            nameMob = "Raider [Lv. 700]"
            nameQuest = "Area1Quest"
            levelQuest = 1
            nameMon = "Raiders"
            waitPos = Vector3.new(-499.504, 89.9041, 2318.07)
            posQuest = Vector3.new(-426.167, 72.9705, 1836.96)
        elseif MyLevel == 725 or MyLevel <= 774 then
            nameMob = "Mercenary [Lv. 725]"
            nameQuest = "Area1Quest"
            levelQuest = 2
            nameMon = "Mercenary"
            waitPos = Vector3.new(-1068.51, 88.6552, 1629.25)
            posQuest = Vector3.new(-426.167, 72.9705, 1836.96)
        elseif MyLevel == 775 or MyLevel <= 799 then
            nameMob = "Swan Pirate [Lv. 775]"
            nameQuest = "Area2Quest"
            levelQuest = 1
            nameMon = "Swan Pirate"
            waitPos = Vector3.new(977.465, 121.331, 1302.35)
            posQuest = Vector3.new(635.88, 73.0705, 917.753)
        elseif MyLevel == 800 or MyLevel <= 874 then
            nameMob = "Factory Staff [Lv. 800]"
            nameQuest = "Area2Quest"
            levelQuest = 2
            nameMon = "Factory Staff"
            waitPos = Vector3.new(665.115, 145.517, 341.892)
            posQuest = Vector3.new(635.88, 73.0705, 917.753)
        elseif MyLevel == 875 or MyLevel <= 899 then
            nameMob = "Marine Lieutenant [Lv. 875]"
            nameQuest = "MarineQuest3"
            levelQuest = 1
            nameMon = "Marine Lieutenant"
            waitPos = Vector3.new(-2805.13, 72.9661, -3042.02)
            posQuest = Vector3.new(-2442.62, 73.0161, -3219.41)
        elseif MyLevel == 900 or MyLevel <= 949 then
            nameMob = "Marine Captain [Lv. 900]"
            nameQuest = "MarineQuest3"
            levelQuest = 2
            nameMon = "Marine Captain"
            waitPos = Vector3.new(-1948.38, 72.9661, -3357.14)
            posQuest = Vector3.new(-2442.62, 73.0161, -3219.41)
        elseif MyLevel == 950 or MyLevel <= 974 then
            nameMob = "Zombie [Lv. 950]"
            nameQuest = "ZombieQuest"
            levelQuest = 1
            nameMon = "Zombie"
            waitPos = Vector3.new(-5523.73, 93.8743, -717.691)
            posQuest = Vector3.new(-5494.52, 48.4801, -794.279)
        elseif MyLevel == 975 or MyLevel <= 999 then
            nameMob = "Vampire [Lv. 975]"
            nameQuest = "ZombieQuest"
            levelQuest = 2
            nameMon = "Vampire"
            waitPos = Vector3.new(-6001.4, 6.4027, -1250.35)
            posQuest = Vector3.new(-5494.52, 48.4801, -794.279)
        elseif MyLevel == 1000 or MyLevel <= 1049 then
            nameMob = "Snow Trooper [Lv. 1000]"
            nameQuest = "SnowMountainQuest"
            levelQuest = 1
            nameMon = "Snow Trooper"
            waitPos = Vector3.new(542.98, 428.207, -5485.43)
            posQuest = Vector3.new(606.809, 401.412, -5370.44)
        elseif MyLevel == 1050 or MyLevel <= 1099 then
            nameMob = "Winter Warrior [Lv. 1050]"
            nameQuest = "SnowMountainQuest"
            levelQuest = 2
            nameMon = "Winter Warrior"
            waitPos = Vector3.new(1251.21, 455.704, -5208.31)
            posQuest = Vector3.new(606.809, 401.412, -5370.44)
        elseif MyLevel == 1100 or MyLevel <= 1124 then
            nameMob = "Lab Subordinate [Lv. 1100]"
            nameQuest = "IceSideQuest"
            levelQuest = 1
            nameMon = "Lab Subordinate"
            waitPos = Vector3.new(-5797.75, 42.6209, -4580.97)
            posQuest = Vector3.new(-6061.5, 15.9418, -4904.03)
        elseif MyLevel == 1125 or MyLevel <= 1174 then
            nameMob = "Horned Warrior [Lv. 1125]"
            nameQuest = "IceSideQuest"
            levelQuest = 2
            nameMon = "Horned Warrior"
            waitPos = Vector3.new(-6403.82, 25.8365, -5829.71)
            posQuest = Vector3.new(-6061.5, 15.9418, -4904.03)
        elseif MyLevel == 1175 or MyLevel <= 1199 then
            nameMob = "Magma Ninja [Lv. 1175]"
            nameQuest = "FireSideQuest"
            levelQuest = 1
            nameMon = "Magma Ninja"
            waitPos = Vector3.new(-5246.4, 67.0141, -6019.92)
            posQuest = Vector3.new(-5429.32, 15.9418, -5296.55)
        elseif MyLevel == 1200 or MyLevel <= 1249 then
            nameMob = "Lava Pirate [Lv. 1200]"
            nameQuest = "FireSideQuest"
            levelQuest = 2
            nameMon = "Lava Pirate"
            waitPos = Vector3.new(-5330.63, 41.4341, -4738.42)
            posQuest = Vector3.new(-5429.32, 15.9418, -5296.55)
        elseif MyLevel == 1250 or MyLevel <= 1274 then
            nameMob = "Ship Deckhand [Lv. 1250]"
            nameQuest = "ShipQuest1"
            levelQuest = 1
            nameMon = "Ship Deckhand"
            waitPos = Vector3.new(1165.6, 138.253, 33057.1)
            posQuest = Vector3.new(1038.57, 125.057, 32911.3)
        elseif MyLevel == 1275 or MyLevel <= 1299 then
            nameMob = "Ship Engineer [Lv. 1275]"
            nameQuest = "ShipQuest1"
            levelQuest = 2
            nameMon = "Ship Engineer"
            waitPos = Vector3.new(907.269, 43.544, 32780.8)
            posQuest = Vector3.new(1038.57, 125.057, 32911.3)
        elseif MyLevel == 1300 or MyLevel <= 1324 then
            nameMob = "Ship Steward [Lv. 1300]"
            nameQuest = "ShipQuest2"
            levelQuest = 1
            nameMon = "Ship Steward"
            waitPos = Vector3.new(918.404, 129.556, 33445.3)
            posQuest = Vector3.new(970.202, 125.057, 33245.8)
        elseif MyLevel == 1325 or MyLevel <= 1349 then
            nameMob = "Ship Officer [Lv. 1325]"
            nameQuest = "ShipQuest2"
            levelQuest = 2
            nameMon = "Ship Officer"
            waitPos = Vector3.new(737.336, 186.917, 33090.7)
            posQuest = Vector3.new(970.202, 125.057, 33245.8)
        elseif MyLevel == 1350 or MyLevel <= 1374 then
            nameMob = "Arctic Warrior [Lv. 1350]"
            nameQuest = "FrostQuest"
            levelQuest = 1
            nameMon = "Arctic Warrior"
            waitPos = Vector3.new(6087.44, 28.367, -6223.01)
            posQuest = Vector3.new(5669.22, 28.1667, -6483.55)
        elseif MyLevel == 1375 or MyLevel <= 1424 then
            nameMob = "Snow Lurker [Lv. 1375]"
            nameQuest = "FrostQuest"
            levelQuest = 2
            nameMon = "Snow Lurker"
            waitPos = Vector3.new(5517.4, 60.521, -6830.13)
            posQuest = Vector3.new(5669.22, 28.1667, -6483.55)
        elseif MyLevel == 1425 or MyLevel <= 1449 then
            nameMob = "Sea Soldier [Lv. 1425]"
            nameQuest = "ForgottenQuest"
            levelQuest = 1
            nameMon = "Sea Soldier"
            waitPos = Vector3.new(-3366.14, 47.053, -9702.81)
            posQuest = Vector3.new(-3053.65, 236.836, -10145.4)
        elseif MyLevel >= 1450 then
            nameMob = "Water Fighter [Lv. 1450]"
            nameQuest = "ForgottenQuest"
            levelQuest = 2
            nameMon = "Water Fighter"
            waitPos = Vector3.new(-3265.76, 298.664, -10551.1)
            posQuest = Vector3.new(-3053.65, 236.836, -10145.4)
        end
    elseif Thirdsea then
        if MyLevel == 1500 or MyLevel <= 1524 then
            nameMob = "Pirate Millionaire [Lv. 1500]"
            nameQuest = "PiratePortQuest"
            levelQuest = 1
            nameMon = "Pirate Millionaire"
            waitPos = Vector3.new(-576.513, 43.8363, 5524.21)
            posQuest = Vector3.new(-290.075, 42.9035, 5581.59)
        elseif MyLevel == 1525 or MyLevel <= 1574 then
            nameMob = "Pistol Billionaire [Lv. 1525]"
            nameQuest = "PiratePortQuest"
            levelQuest = 2
            nameMon = "Pistol Billionaire"
            waitPos = Vector3.new(-49.9087, 117.962, 6045.62)
            posQuest = Vector3.new(-290.075, 42.9035, 5581.59)
        elseif MyLevel == 1575 or MyLevel <= 1599 then
            nameMob = "Dragon Crew Warrior [Lv. 1575]"
            nameQuest = "AmazonQuest"
            levelQuest = 1
            nameMon = "Dragon Crew Warrior"
            waitPos = Vector3.new(6485.75, 51.5221, -971.287)
            posQuest = Vector3.new(5832.84, 51.6806, -1101.52)
        elseif MyLevel == 1600 or MyLevel <= 1624 then
            nameMob = "Dragon Crew Archer [Lv. 1600]"
            nameQuest = "AmazonQuest"
            levelQuest = 2
            nameMon = "Dragon Crew Archer"
            waitPos = Vector3.new(6719.96, 431.406, 112.606)
            posQuest = Vector3.new(5832.84, 51.6806, -1101.52)
        elseif MyLevel == 1625 or MyLevel <= 1649 then
            nameMob = "Female Islander [Lv. 1625]"
            nameQuest = "AmazonQuest2"
            levelQuest = 1
            nameMon = "Female Islander"
            waitPos = Vector3.new(4672.5, 780.053, 768.617)
            posQuest = Vector3.new(5448.86, 601.516, 751.131)
        elseif MyLevel == 1650 or MyLevel <= 1699 then
            nameMob = "Giant Islander [Lv. 1650]"
            nameQuest = "AmazonQuest2"
            levelQuest = 2
            nameMon = "Giant Islander"
            waitPos = Vector3.new(4870.78, 669.953, 4.28749)
            posQuest = Vector3.new(5448.86, 601.516, 751.131)
        elseif MyLevel == 1700 or MyLevel <= 1724 then
            nameMob = "Marine Commodore [Lv. 1700]"
            nameQuest = "MarineTreeIsland"
            levelQuest = 1
            nameMon = "Marine Commodore"
            waitPos = Vector3.new(2434.95, 123.681, -7371.11)
            posQuest = Vector3.new(2180.54, 27.8157, -6741.55)
        elseif MyLevel == 1725 or MyLevel <= 1774 then
            nameMob = "Marine Rear Admiral [Lv. 1725]"
            nameQuest = "MarineTreeIsland"
            levelQuest = 2
            nameMon = "Marine Rear Admiral"
            waitPos = Vector3.new(3750.9, 173.226, -7058.35)
            posQuest = Vector3.new(2180.54, 27.8157, -6741.55)
        elseif MyLevel == 1775 or MyLevel <= 1799 then
            nameMob = "Fishman Raider [Lv. 1775]"
            nameQuest = "DeepForestIsland3"
            levelQuest = 1
            nameMon = "Fishman Raider"
            waitPos = Vector3.new(-10526.3, 377.805, -8274.93)
            posQuest = Vector3.new(-10581.7, 330.873, -8761.19)
        elseif MyLevel == 1800 or MyLevel <= 1824 then
            nameMob = "Fishman Captain [Lv. 1800]"
            nameQuest = "DeepForestIsland3"
            levelQuest = 2
            nameMon = "Fishman Captain"
            waitPos = Vector3.new(-11104.8, 373.84, -8793.09)
            posQuest = Vector3.new(-10581.7, 330.873, -8761.19)
        elseif MyLevel == 1825 or MyLevel <= 1849 then
            nameMob = "Forest Pirate [Lv. 1825]"
            nameQuest = "DeepForestIsland"
            levelQuest = 1
            nameMon = "Forest Pirate"
            waitPos = Vector3.new(-13268, 428.194, -7781)
            posQuest = Vector3.new(-13234, 331.488, -7625.4)
        elseif MyLevel == 1850 or MyLevel <= 1899 then
            nameMob = "Mythological Pirate [Lv. 1850]"
            nameQuest = "DeepForestIsland"
            levelQuest = 2
            nameMon = "Mythological Pirate"
            waitPos = Vector3.new(-13562.2, 522.039, -6740.32)
            posQuest = Vector3.new(-13234, 331.488, -7625.4)
        elseif MyLevel == 1900 or MyLevel <= 1924 then
            nameMob = "Jungle Pirate [Lv. 1900]"
            nameQuest = "DeepForestIsland2"
            levelQuest = 1
            nameMon = "Jungle Pirate"
            waitPos = Vector3.new(-11986.3, 377.464, -10457)
            posQuest = Vector3.new(-12680.4, 389.971, -9902.02)
        elseif MyLevel == 1925 or MyLevel <= 1974 then
            nameMob = "Musketeer Pirate [Lv. 1925]"
            nameQuest = "DeepForestIsland2"
            levelQuest = 2
            nameMon = "Musketeer Pirate"
            waitPos = Vector3.new(-13243.3, 496.261, -9586.88)
            posQuest = Vector3.new(-12680.4, 389.971, -9902.02)
        elseif MyLevel == 1975 or MyLevel <= 1999 then
            nameMob = "Reborn Skeleton [Lv. 1975]"
            nameQuest = "HauntedQuest1"
            levelQuest = 1
            nameMon = "Reborn Skeleton"
            waitPos = Vector3.new(-8735.74, 143.131, 6031.94)
            posQuest = Vector3.new(-9479.22, 141.215, 5566.09)
        elseif MyLevel == 2000 or MyLevel <= 2024 then
            nameMob = "Living Zombie [Lv. 2000]"
            nameQuest = "HauntedQuest1"
            levelQuest = 2
            nameMon = "Living Zombie"
            waitPos = Vector3.new(-10157.8, 139.652, 5947.01)
            posQuest = Vector3.new(-9479.22, 141.215, 5566.09)
        elseif MyLevel == 2025 or MyLevel <= 2049 then
            nameMob = "Demonic Soul [Lv. 2025]"
            nameQuest = "HauntedQuest2"
            levelQuest = 1
            nameMon = "Demonic Soul"
            waitPos = Vector3.new(-9274.07, 204.696, 6042.18)
            posQuest = Vector3.new(-9516.99, 172.017, 6078.47)
        elseif MyLevel >= 2050 and MyLevel <= 2074 then
            nameMob = "Posessed Mummy [Lv. 2050]"
            nameQuest = "HauntedQuest2"
            levelQuest = 2
            nameMon = "Posessed Mummy"
            waitPos = Vector3.new(-9743.21, 68.6489, 6165.13)
            posQuest = Vector3.new(-9516.99, 172.017, 6078.47)
        elseif MyLevel >= 2075 and MyLevel <= 2099 then
            nameMob = "Peanut Scout [Lv. 2075]"
            nameQuest = "NutsIslandQuest"
            levelQuest = 1
            nameMon = "Peanut Scout"
            waitPos = Vector3.new(-2166.72, 90.5295, -10179.9)
            posQuest = Vector3.new(-2102.57, 38.1038, -10192.5)            
        elseif MyLevel >= 2100 and MyLevel <= 2124 then
            nameMob = "Peanut President [Lv. 2100]"
            nameQuest = "NutsIslandQuest"
            levelQuest = 2
            nameMon = "Peanut President"
            waitPos = Vector3.new(-2379.61, 140.666, -10427.6)
            posQuest = Vector3.new(-2102.57, 38.1038, -10192.5)
        elseif MyLevel >= 2125 and MyLevel <= 2149 then
            nameMob = "Ice Cream Chef [Lv. 2125]"
            nameQuest = "IceCreamIslandQuest"
            levelQuest = 1
            nameMon = "Ice Cream Chef"
            waitPos = Vector3.new(-901.45, 120.715, -10942.8)
            posQuest = Vector3.new(-821.255, 65.8195, -10965.2)
        elseif MyLevel >= 2150 then
            nameMob = "Ice Cream Commander [Lv. 2150]"
            nameQuest = "IceCreamIslandQuest"
            levelQuest = 2
            nameMon = "Ice Cream Commander"
            waitPos = Vector3.new(-653.074, 143.481, -11347.5)
            posQuest = Vector3.new(-821.255, 65.8195, -10965.2)
        end
    end
end

function BossCheck() -- Check Boss
    if _G.SelectedBoss == "The Gorilla King [Lv. 25] [Boss]" then
        needQuest = true
        nameBoss = "The Gorilla King"
        nameBossQuest = "JungleQuest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(-1601.98, 36.8521, 153.451)
    elseif _G.SelectedBoss == "The Saw [Lv. 100] [Boss]" then
        needQuest = false
    elseif _G.SelectedBoss == "Bobby [Lv. 55] [Boss]" then
        needQuest = true
        nameBoss = "Bobby"
        nameBossQuest = "BuggyQuest1"
        levelBossQuest = 3
        posBossQuest = Vector3.new(-1140.17, 4.75205, 3828.02)
    elseif _G.SelectedBoss == "Yeti [Lv. 110] [Boss]" then
        needQuest = true
        nameBoss = "Yeti"
        nameBossQuest = "SnowQuest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(1386.27, 87.2728, -1299.83)
    elseif _G.SelectedBoss == "Mob Leader [Lv. 120] [Boss]" then
        needQuest = false
    elseif _G.SelectedBoss == "Vice Admiral [Lv. 130] [Boss]" then
        needQuest = true
        nameBoss = "Vice Admiral"
        nameBossQuest = "MarineQuest2"
        levelBossQuest = 2
        posBossQuest = Vector3.new(-5036.07, 28.652, 4324.89)
    elseif _G.SelectedBoss == "Warden [Lv. 175] [Boss]" then
        needQuest = true
        nameBoss = "Warden"
        nameBossQuest = "ImpelQuest"
        levelBossQuest = 1
        posBossQuest = Vector3.new(4853.56, 5.65256, 745.174)
    elseif _G.SelectedBoss == "Chief Warden [Lv. 200] [Boss]" then
        needQuest = true
        nameBoss = "Chief Warden"
        nameBossQuest = "ImpelQuest"
        levelBossQuest = 2
        posBossQuest = Vector3.new(4853.56, 5.65256, 745.174)
    elseif _G.SelectedBoss == "Swan [Lv. 225] [Boss]" then
        needQuest = true
        nameBoss = "Swan"
        nameBossQuest = "ImpelQuest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(4853.56, 5.65256, 745.174)
    elseif _G.SelectedBoss == "Saber Expert [Lv. 200] [Boss]" then
        needQuest = false
    elseif _G.SelectedBoss == "Wysper [Lv. 500] [Boss]" then
        needQuest = true
        nameBoss = "Wysper"
        nameBossQuest = "SkyExp1Quest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(-7901, 5541.15, -384.118)
    elseif _G.SelectedBoss == "Magma Admiral [Lv. 350] [Boss]" then
        needQuest = true
        nameBoss = "Magma Admiral"
        nameBossQuest = "MagmaQuest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(-5315.57, 12.2369, 8516.53)
    elseif _G.SelectedBoss == "Ice Admiral [Lv. 700] [Boss]" then
        needQuest = false
    elseif _G.SelectedBoss == "Fishman Lord [Lv. 425] [Boss]" then
        needQuest = true
        nameBoss = "Fishman Lord"
        nameBossQuest = "FishmanQuest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(61122.2, 18.4716, 1566.93)
    elseif _G.SelectedBoss == "Thunder God [Lv. 575] [Boss]" then
        needQuest = true
        nameBoss = "Thunder God"
        nameBossQuest = "SkyExp2Quest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(-7904.17, 5635.96, -1412.22)
    elseif _G.SelectedBoss == "Cyborg [Lv. 675] [Boss]" then
        needQuest = true
        nameBoss = "Cyborg"
        nameBossQuest = "FountainQuest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(5256.18, 38.5011, 4049.5)
    elseif _G.SelectedBoss == "Fajita [Lv. 925] [Boss]" then
        needQuest = true
        nameBoss = "Fajita"
        nameBossQuest = "MarineQuest3"
        levelBossQuest = 3
        posBossQuest = Vector3.new(-2442.62, 73.0161, -3219.41)
    elseif _G.SelectedBoss == "Diamond [Lv. 750] [Boss]" then
        needQuest = true
        nameBoss = "Diamond"
        nameBossQuest = "Area1Quest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(-425.833, 72.9605, 1837.39)
    elseif _G.SelectedBoss == "Jeremy [Lv. 850] [Boss]" then
        needQuest = true
        nameBoss = "Jeremy"
        nameBossQuest = "Area2Quest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(635.774, 73.0605, 917.663)
    elseif _G.SelectedBoss == "Don Swan [Lv. 1000] [Boss]" then
        needQuest = false
    elseif _G.SelectedBoss == "Smoke Admiral [Lv. 1150] [Boss]" then
        needQuest = true
        nameBoss = "Smoke Admiral"
        nameBossQuest = "IceSideQuest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(-6061.5, 15.9418, -4904.03)
    elseif _G.SelectedBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" then
        needQuest = false
    elseif _G.SelectedBoss == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
        needQuest = true
        nameBoss = "Awakened Ice Admiral"
        nameBossQuest = "FrostQuest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(5669.22, 28.1667, -6483.55)
    elseif _G.SelectedBoss == "Tide Keeper [Lv. 1475] [Boss]" then
        needQuest = true
        nameBoss = "Tide Keeper"
        nameBossQuest = "ForgottenQuest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(-3053.65, 236.836, -10145.4)
    elseif _G.SelectedBoss == "rip_indra [Lv. 1500] [Boss]" then
        needQuest = false
    elseif _G.SelectedBoss == "Darkbeard [Lv. 1000] [Raid Boss]" then
        needQuest = false
    elseif _G.SelectedBoss == "Order [Lv. 1250] [Raid Boss]" then
        needQuest = false
    elseif _G.SelectedBoss == "Stone [Lv. 1550] [Boss]" then
        needQuest = true
        nameBoss = "Stone"
        nameBossQuest = "PiratePortQuest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(-290.075, 42.9035, 5581.59)
    elseif _G.SelectedBoss == "Island Empress [Lv. 1675] [Boss]" then
        needQuest = true
        nameBoss = "Island Empress"
        nameBossQuest = "AmazonQuest2"
        levelBossQuest = 3
        posBossQuest = Vector3.new(5446.23, 601.937, 750.788)
    elseif _G.SelectedBoss == "Kilo Admiral [Lv. 1750] [Boss]" then
        needQuest = true
        nameBoss = "Kilo Admiral"
        nameBossQuest = "MarineTreeIsland"
        levelBossQuest = 3
        posBossQuest = Vector3.new(2179.57, 29.0387, -6737.11)
    elseif _G.SelectedBoss == "Captain Elephant [Lv. 1875] [Boss]" then
        needQuest = true
        nameBoss = "Captain Elephant"
        nameBossQuest = "DeepForestIsland"
        levelBossQuest = 3
        posBossQuest = Vector3.new(-13231.7, 332.711, -7628.21)
    elseif _G.SelectedBoss == "Beautiful Pirate [Lv. 1950] [Boss]" then
        needQuest = true
        nameBoss = "Beautiful Pirate"
        nameBossQuest = "DeepForestIsland2"
        levelBossQuest = 3
        posBossQuest = Vector3.new(-12684.2, 391.194, -9901.69)
    elseif _G.SelectedBoss == "Soul Reaper [Lv. 2100] [Raid Boss]" then
        needQuest = false
    elseif _G.SelectedBoss == "Longma [Lv. 2000] [Boss]" then
        needQuest = false
    elseif _G.SelectedBoss == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
        needQuest = false
    elseif _G.SelectedBoss == "Cake Queen [Lv. 2175] [Boss]" then
        needQuest = true
        nameBoss = "Cake Queen"
        nameBossQuest = "IceCreamIslandQuest"
        levelBossQuest = 3
        posBossQuest = Vector3.new(-821.255, 65.8195, -10965.2)
    end
end

function MobCheck() -- Check Mob
    if mobSelect == "Raider [Lv. 700]" then
        nameQuest = "Area1Quest"
        levelQuest = 1
        nameMon = "Raiders"
        waitPos = Vector3.new(-499.504, 89.9041, 2318.07)
        posQuest = Vector3.new(-426.167, 72.9705, 1836.96)
    elseif mobSelect == "Mercenary [Lv. 725]" then
        nameQuest = "Area1Quest"
        levelQuest = 2
        nameMon = "Mercenary"
        waitPos = Vector3.new(-1068.51, 88.6552, 1629.25)
        posQuest = Vector3.new(-426.167, 72.9705, 1836.96)
    elseif mobSelect == "Swan Pirate [Lv. 775]" then
        nameQuest = "Area2Quest"
        levelQuest = 1
        nameMon = "Swan Pirate"
        waitPos = Vector3.new(977.465, 121.331, 1302.35)
        posQuest = Vector3.new(635.88, 73.0705, 917.753)
    elseif mobSelect == "Factory Staff [Lv. 800]" then
        nameQuest = "Area2Quest"
        levelQuest = 2
        nameMon = "Factory Staff"
        waitPos = Vector3.new(665.115, 145.517, 341.892)
        posQuest = Vector3.new(635.88, 73.0705, 917.753)
    elseif mobSelect == "Marine Lieutenant [Lv. 875]" then
        nameQuest = "MarineQuest3"
        levelQuest = 1
        nameMon = "Marine Lieutenant"
        waitPos = Vector3.new(-2805.13, 72.9661, -3042.02)
        posQuest = Vector3.new(-2442.62, 73.0161, -3219.41)
    elseif mobSelect == "Marine Captain [Lv. 900]" then
        nameQuest = "MarineQuest3"
        levelQuest = 2
        nameMon = "Marine Captain"
        waitPos = Vector3.new(-1948.38, 72.9661, -3357.14)
        posQuest = Vector3.new(-2442.62, 73.0161, -3219.41)
    elseif mobSelect == "Zombie [Lv. 950]" then
        nameQuest = "ZombieQuest"
        levelQuest = 1
        nameMon = "Zombie"
        waitPos = Vector3.new(-5523.73, 93.8743, -717.691)
        posQuest = Vector3.new(-5494.52, 48.4801, -794.279)
    elseif mobSelect == "Vampire [Lv. 975]" then
        nameQuest = "ZombieQuest"
        levelQuest = 2
        nameMon = "Vampire"
        waitPos = Vector3.new(-6001.4, 6.4027, -1250.35)
        posQuest = Vector3.new(-5494.52, 48.4801, -794.279)
    elseif mobSelect == "Snow Trooper [Lv. 1000]" then
        nameQuest = "SnowMountainQuest"
        levelQuest = 1
        nameMon = "Snow Trooper"
        waitPos = Vector3.new(542.98, 428.207, -5485.43)
        posQuest = Vector3.new(606.809, 401.412, -5370.44)
    elseif mobSelect == "Winter Warrior [Lv. 1050]" then
        nameQuest = "SnowMountainQuest"
        levelQuest = 2
        nameMon = "Winter Warrior"
        waitPos = Vector3.new(1251.21, 455.704, -5208.31)
        posQuest = Vector3.new(606.809, 401.412, -5370.44)
    elseif mobSelect == "Lab Subordinate [Lv. 1100]" then
        nameQuest = "IceSideQuest"
        levelQuest = 1
        nameMon = "Lab Subordinate"
        waitPos = Vector3.new(-5797.75, 42.6209, -4580.97)
        posQuest = Vector3.new(-6061.5, 15.9418, -4904.03)
    elseif mobSelect == "Horned Warrior [Lv. 1125]" then
        nameQuest = "IceSideQuest"
        levelQuest = 2
        nameMon = "Horned Warrior"
        waitPos = Vector3.new(-6403.82, 25.8365, -5829.71)
        posQuest = Vector3.new(-6061.5, 15.9418, -4904.03)
    elseif mobSelect == "Magma Ninja [Lv. 1175]" then
        nameQuest = "FireSideQuest"
        levelQuest = 1
        nameMon = "Magma Ninja"
        waitPos = Vector3.new(-5246.4, 67.0141, -6019.92)
        posQuest = Vector3.new(-5429.32, 15.9418, -5296.55)
    elseif mobSelect == "Lava Pirate [Lv. 1200]" then
        nameQuest = "FireSideQuest"
        levelQuest = 2
        nameMon = "Lava Pirate"
        waitPos = Vector3.new(-5330.63, 41.4341, -4738.42)
        posQuest = Vector3.new(-5429.32, 15.9418, -5296.55)
    elseif mobSelect == "Ship Deckhand [Lv. 1250]" then
        nameQuest = "ShipQuest1"
        levelQuest = 1
        nameMon = "Ship Deckhand"
        waitPos = Vector3.new(1165.6, 138.253, 33057.1)
        posQuest = Vector3.new(1038.57, 125.057, 32911.3)
    elseif mobSelect == "Ship Engineer [Lv. 1275]" then
        nameQuest = "ShipQuest1"
        levelQuest = 2
        nameMon = "Ship Engineer"
        waitPos = Vector3.new(907.269, 43.544, 32780.8)
        posQuest = Vector3.new(1038.57, 125.057, 32911.3)
    elseif mobSelect == "Ship Steward [Lv. 1300]" then
        nameQuest = "ShipQuest2"
        levelQuest = 1
        nameMon = "Ship Steward"
        waitPos = Vector3.new(918.404, 129.556, 33445.3)
        posQuest = Vector3.new(970.202, 125.057, 33245.8)
    elseif mobSelect == "Ship Officer [Lv. 1325]" then
        nameQuest = "ShipQuest2"
        levelQuest = 2
        nameMon = "Ship Officer"
        waitPos = Vector3.new(737.336, 186.917, 33090.7)
        posQuest = Vector3.new(970.202, 125.057, 33245.8)
    elseif mobSelect == "Arctic Warrior [Lv. 1350]" then
        nameQuest = "FrostQuest"
        levelQuest = 1
        nameMon = "Arctic Warrior"
        waitPos = Vector3.new(6087.44, 28.367, -6223.01)
        posQuest = Vector3.new(5669.22, 28.1667, -6483.55)
    elseif mobSelect == "Snow Lurker [Lv. 1375]" then
        nameQuest = "FrostQuest"
        levelQuest = 2
        nameMon = "Snow Lurker"
        waitPos = Vector3.new(5517.4, 60.521, -6830.13)
        posQuest = Vector3.new(5669.22, 28.1667, -6483.55)
    elseif mobSelect == "Sea Soldier [Lv. 1425]" then
        nameQuest = "ForgottenQuest"
        levelQuest = 1
        nameMon = "Sea Soldier"
        waitPos = Vector3.new(-3366.14, 47.053, -9702.81)
        posQuest = Vector3.new(-3053.65, 236.836, -10145.4)
    elseif mobSelect == "Water Fighter [Lv. 1450]" then
        nameQuest = "ForgottenQuest"
        levelQuest = 2
        nameMon = "Water Fighter"
        waitPos = Vector3.new(-3265.76, 298.664, -10551.1)
        posQuest = Vector3.new(-3053.65, 236.836, -10145.4)
    elseif mobSelect == "Pirate Millionaire [Lv. 1500]" then
        nameQuest = "PiratePortQuest"
        levelQuest = 1
        nameMon = "Pirate Millionaire"
        waitPos = Vector3.new(-576.513, 43.8363, 5524.21)
        posQuest = Vector3.new(-290.075, 42.9035, 5581.59)
    elseif mobSelect == "Pistol Billionaire [Lv. 1525]" then
        nameQuest = "PiratePortQuest"
        levelQuest = 2
        nameMon = "Pistol Billionaire"
        waitPos = Vector3.new(-49.9087, 117.962, 6045.62)
        posQuest = Vector3.new(-290.075, 42.9035, 5581.59)
    elseif mobSelect == "Dragon Crew Warrior [Lv. 1575]" then
        nameQuest = "AmazonQuest"
        levelQuest = 1
        nameMon = "Dragon Crew Warrior"
        waitPos = Vector3.new(6485.75, 51.5221, -971.287)
        posQuest = Vector3.new(5832.84, 51.6806, -1101.52)
    elseif mobSelect == "Dragon Crew Archer [Lv. 1600]" then
        nameQuest = "AmazonQuest"
        levelQuest = 2
        nameMon = "Dragon Crew Archer"
        waitPos = Vector3.new(6719.96, 431.406, 112.606)
        posQuest = Vector3.new(5832.84, 51.6806, -1101.52)
    elseif mobSelect == "Female Islander [Lv. 1625]" then
        nameQuest = "AmazonQuest2"
        levelQuest = 1
        nameMon = "Female Islander"
        waitPos = Vector3.new(4672.5, 780.053, 768.617)
        posQuest = Vector3.new(5448.86, 601.516, 751.131)
    elseif mobSelect == "Giant Islander [Lv. 1650]" then
        nameQuest = "AmazonQuest2"
        levelQuest = 2
        nameMon = "Giant Islander"
        waitPos = Vector3.new(4870.78, 669.953, 4.28749)
        posQuest = Vector3.new(5448.86, 601.516, 751.131)
    elseif mobSelect == "Marine Commodore [Lv. 1700]" then
        nameQuest = "MarineTreeIsland"
        levelQuest = 1
        nameMon = "Marine Commodore"
        waitPos = Vector3.new(2434.95, 123.681, -7371.11)
        posQuest = Vector3.new(2180.54, 27.8157, -6741.55)
    elseif mobSelect == "Marine Rear Admiral [Lv. 1725]" then
        nameQuest = "MarineTreeIsland"
        levelQuest = 2
        nameMon = "Marine Rear Admiral"
        waitPos = Vector3.new(3750.9, 173.226, -7058.35)
        posQuest = Vector3.new(2180.54, 27.8157, -6741.55)
    elseif mobSelect == "Fishman Raider [Lv. 1775]" then
        nameQuest = "DeepForestIsland3"
        levelQuest = 1
        nameMon = "Fishman Raider"
        waitPos = Vector3.new(-10526.3, 377.805, -8274.93)
        posQuest = Vector3.new(-10581.7, 330.873, -8761.19)
    elseif mobSelect == "Fishman Captain [Lv. 1800]" then
        nameQuest = "DeepForestIsland3"
        levelQuest = 2
        nameMon = "Fishman Captain"
        waitPos = Vector3.new(-11104.8, 373.84, -8793.09)
        posQuest = Vector3.new(-10581.7, 330.873, -8761.19)
    elseif mobSelect == "Forest Pirate [Lv. 1825]" then
        nameQuest = "DeepForestIsland"
        levelQuest = 1
        nameMon = "Forest Pirate"
        waitPos = Vector3.new(-13268, 428.194, -7781)
        posQuest = Vector3.new(-13234, 331.488, -7625.4)
    elseif mobSelect == "Mythological Pirate [Lv. 1850]" then
        nameQuest = "DeepForestIsland"
        levelQuest = 2
        nameMon = "Mythological Pirate"
        waitPos = Vector3.new(-13562.2, 522.039, -6740.32)
        posQuest = Vector3.new(-13234, 331.488, -7625.4)
    elseif mobSelect == "Jungle Pirate [Lv. 1900]" then
        nameQuest = "DeepForestIsland2"
        levelQuest = 1
        nameMon = "Jungle Pirate"
        waitPos = Vector3.new(-11986.3, 377.464, -10457)
        posQuest = Vector3.new(-12680.4, 389.971, -9902.02)
    elseif mobSelect == "Musketeer Pirate [Lv. 1925]" then
        nameQuest = "DeepForestIsland2"
        levelQuest = 2
        nameMon = "Musketeer Pirate"
        waitPos = Vector3.new(-13243.3, 496.261, -9586.88)
        posQuest = Vector3.new(-12680.4, 389.971, -9902.02)
    elseif mobSelect == "Reborn Skeleton [Lv. 1975]" then
        nameQuest = "HauntedQuest1"
        levelQuest = 1
        nameMon = "Reborn Skeleton"
        waitPos = Vector3.new(-8735.74, 143.131, 6031.94)
        posQuest = Vector3.new(-9479.22, 141.215, 5566.09)
    elseif mobSelect == "Living Zombie [Lv. 2000]" then
        nameQuest = "HauntedQuest1"
        levelQuest = 2
        nameMon = "Living Zombie"
        waitPos = Vector3.new(-10157.8, 139.652, 5947.01)
        posQuest = Vector3.new(-9479.22, 141.215, 5566.09)
    elseif mobSelect == "Demonic Soul [Lv. 2025]" then
        nameQuest = "HauntedQuest2"
        levelQuest = 1
        nameMon = "Demonic Soul"
        waitPos = Vector3.new(-9274.07, 204.696, 6042.18)
        posQuest = Vector3.new(-9516.99, 172.017, 6078.47)
    elseif mobSelect == "Posessed Mummy [Lv. 2050]" then
        nameQuest = "HauntedQuest2"
        levelQuest = 2
        nameMon = "Posessed Mummy"
        waitPos = Vector3.new(-9743.21, 68.6489, 6165.13)
        posQuest = Vector3.new(-9516.99, 172.017, 6078.47)
    elseif mobSelect == "Peanut Scout [Lv. 2075]" then
        nameQuest = "NutsIslandQuest"
        levelQuest = 1
        nameMon = "Peanut Scout"
        waitPos = Vector3.new(-2166.72, 90.5295, -10179.9)
        posQuest = Vector3.new(-2102.57, 38.1038, -10192.5)            
    elseif mobSelect == "Peanut President [Lv. 2100]" then
        nameQuest = "NutsIslandQuest"
        levelQuest = 2
        nameMon = "Peanut President"
        waitPos = Vector3.new(-2379.61, 140.666, -10427.6)
        posQuest = Vector3.new(-2102.57, 38.1038, -10192.5)
    elseif mobSelect == "Ice Cream Chef [Lv. 2125]" then
        nameQuest = "IceCreamIslandQuest"
        levelQuest = 1
        nameMon = "Ice Cream Chef"
        waitPos = Vector3.new(-901.45, 120.715, -10942.8)
        posQuest = Vector3.new(-821.255, 65.8195, -10965.2)
    elseif mobSelect == "Ice Cream Commander [Lv. 2150]" then
        nameQuest = "IceCreamIslandQuest"
        levelQuest = 2
        nameMon = "Ice Cream Commander"
        waitPos = Vector3.new(-653.074, 143.481, -11347.5)
        posQuest = Vector3.new(-821.255, 65.8195, -10965.2)
    end
end

AutoFarm:Line()

AutoFarm:Dropdown("Tween Type", {"Part", "Gravity"}, function (type)
    if type == "Gravity" then
        TweenType = false
    elseif type == "Part" then
        TweenType = true
    end
end)

AutoFarm:Toggle("Auto Farm Level", _G.AutoFarm, function (bool)
    _G.AutoFarm = bool
    All("Auto Farm")
    if _G.AutoFarm == false then wait(.5)
        StopTween()
    end
end)

local mobList = {};
if Firstsea then
elseif Secondsea then
    mobList = {
        "Raiders [Lv. 700]",
        "Mercenary [Lv. 725]",
        "Swan Pirate [Lv. 775]",
        "Factory Staff [Lv. 800]",
        "Marine Lieutenant [Lv. 875]",
        "Marine Captain [Lv. 900]",
        "Zombie [Lv. 950]",
        "Vampire [Lv. 975]",
        "Snow Trooper [Lv. 1000]",
        "Winter Warrior [Lv. 1050]",
        "Lab Subordinate [Lv. 1100]",
        "Horned Warrior [Lv. 1125]",
        "Magma Ninja [Lv. 1175]",
        "Lava Pirate [Lv. 1200]",
        "Ship Deckhand [Lv. 1250]",
        "Ship Engineer [Lv. 1275]",
        "Ship Steward [Lv. 1300]",
        "Ship Officer [Lv. 1325]",
        "Arctic Warrior [Lv. 1350]",
        "Snow Lurker [Lv. 1375]",
        "Sea Soldier [Lv. 1425]",
        "Water Fighter [Lv. 1450]"
    }
elseif Thirdsea then
    mobList = {
        "Pirate Millionaire [Lv. 1500]",
        "Pistol Billionaire [Lv. 1525]",
        "Dragon Crew Warrior [Lv. 1575]",
        "Dragon Crew Archer [Lv. 1600]",
        "Female Islander [Lv. 1625]",
        "Giant Islander [Lv. 1650]",
        "Marine Commodore [Lv. 1700]",
        "Marine Rear Admiral [Lv. 1725]",
        "Fishman Raider [Lv. 1775]",
        "Fishman Captain [Lv. 1800]",
        "Forest Pirate [Lv. 1825]",
        "Mythological Pirate [Lv. 1850]",
        "Jungle Pirate [Lv. 1900]",
        "Musketeer Pirate [Lv. 1925]",
        "Reborn Skeleton [Lv. 1975]",
        "Living Zombie [Lv. 2000]",
        "Demonic Soul [Lv. 2025]",
        "Posessed Mummy [Lv. 2050]",
        "Peanut Scout [Lv. 2075]",
        "Peanut President [Lv. 2100]",
        "Ice Cream Chef [Lv. 2125]",
        "Ice Cream Commander [Lv. 2150]"
    }
end

if Secondsea or Thirdsea then
    AutoFarm:Dropdown("Select Mob Here", mobList, function (bool)
        mobSelect = bool
    end)

    AutoFarm:Toggle("Auto Farm (Select Mob)", _G.ChooseMob, function (bool)
        _G.ChooseMob = bool
        All("Choose Mob")
        if _G.ChooseMob == false then wait(.5)
            StopTween()
        end
    end)
end

AutoFarm:Toggle("Mob Aura", _G.MobAura, function (bool)
    _G.MobAura = bool
    All("Mob Aura")
    if _G.MobAura == false then wait(.5)
        StopTween()
    end
end)

AutoFarm:Toggle("Big Hitbox Mob Near", _G.BigHitbox, function (bool)
    _G.BigHitbox = bool
    if _G.BigHitbox then
        while _G.BigHitbox do game:GetService("RunService").Heartbeat:wait()
            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if v.Parent and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude <= 500 then
                    v.Humanoid.WalkSpeed = 1
                    v.HumanoidRootPart.CanCollide = false
                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    v.HumanoidRootPart.Transparency = 0.5
                end
            end
        end
    end
end)

local WeaponList = {}
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA("Tool") then table.insert(WeaponList, v.Name) end end
for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") then table.insert(WeaponList, v.Name) end end

local WeaponDD = AutoFarm:Dropdown("Select Weapon", WeaponList, function (bool)
    _G.Weapon = bool
end)

AutoFarm:Button("Refresh Weapon", function ()
    WeaponDD:Clear() WeaponList = {}
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA("Tool") then WeaponDD:Add(v.Name) table.insert(WeaponList, v.Name) end end
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") then WeaponDD:Add(v.Name) table.insert(WeaponList, v.Name) end end
end)

AutoFarm:Line()
AutoFarm:Label("--[ Other Farm ]--")
if Firstsea then
    AutoFarm:Toggle("Auto Second Sea", _G.Auto2nd, function (bool)
        _G.Auto2nd = bool
        All("Second Sea")
        if _G.Auto2nd == false then wait(.5)
            StopTween()
        end
    end)
    AutoFarm:Toggle("Auto Saber", _G.AutoSaber, function (bool)
        _G.AutoSaber = bool
        All("Auto Saber")
        if _G.AutoSaber == false then wait(.5)
            StopTween()
        end
    end)
elseif Secondsea then
    AutoFarm:Toggle("Auto Third Sea", _G.Auto3rd, function (bool)
        _G.Auto3rd = bool
        All("Third Sea")
        if _G.Auto3rd == false then wait(.5)
            StopTween()
        end
    end)
    AutoFarm:Toggle("Auto Legendary Sword [HOP]", _G.AutoSword, function (bool)
        _G.AutoSword = bool
    end)

    AutoFarm:Toggle("Auto Bartilo Quest", _G.AutoBartilo, function (bool)
        _G.AutoBartilo = bool
        All("Bartilo")
        if _G.AutoBartilo == false then wait(.5)
            StopTween()
        end
    end)
elseif Thirdsea then
local EliteChecker = AutoFarm:Label("N/A")

spawn(function ()
        while wait(.1) do
            if TotalCounter then
                local TotalElite = tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"))
                EliteChecker:Update("Total Elites: "..TotalElite, TotalLabelColor)
            end
        end
    end)
    AutoFarm:Button("Open Haki Pad ", function ()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Winter Sky") wait(.5)
        repeat wait()
            TweenTo(Vector3.new(-5420.31, 1089.34, -2666.69), 300)
        until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5420.31, 1089.34, -2666.69)).magnitude <= 5 or TweenStopped
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Pure Red") wait(.5)
        repeat wait()
            TweenTo(Vector3.new(-5414.56, 314.238, -2212.27), 300)
        until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5414.56, 314.238, -2212.27)).magnitude <= 5 or TweenStopped
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Snow White") wait(.5)
        repeat wait()
            TweenTo(Vector3.new(-4971.21, 335.938, -3719.71), 300)
        until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-4971.21, 335.938, -3719.71)).magnitude <= 5 or TweenStopped
    end)

AutoFarm:Toggle("Auto Bone Farm", _G.BoneFarm, function (bool)
        _G.BoneFarm = bool
        All("Bone Farm")
        if _G.BoneFarm == false then wait(.5)
            StopTween()
        end
    end)

    AutoFarm:Toggle("Auto Candy Farm", _G.CandyFarm, function (bool)
        _G.CandyFarm = bool
        All("Candy Farm")
        if _G.CandyFarm == false then wait(.5)
            StopTween()
        end
    end)


    AutoFarm:Toggle("Auto Tushita Farm [HOP]", _G.Tushita, function (bool)
        _G.Tushita = bool
        FarmTushita()
        if _G.Tushita == false then wait(.5)
            StopTween()
        end
    end)

    AutoFarm:Toggle("Auto Buddy Sword [HOP]", _G.BuddySword, function (bool)
        _G.BuddySword = bool
        FarmBuddySwordHOP()
    end)

    AutoFarm:Toggle("Auto Elite Boss [HOP]", _G.AutoElite, function (bool)
        _G.AutoElite = bool
        All("Auto Elite")
        if _G.AutoElite == false then wait(.5)
            StopTween()
        end
    end)
	AutoFarm:Toggle("Auto Emma / Yama", _G.AutoEmma, function (bool)
		_G.AutoEmma = bool
	end)
    AutoFarm:Toggle("Auto Rainbow Haki [HOP]", _G.AutoRainbow, function (bool)
        _G.AutoRainbow = bool
        All("Rainbow Haki")
        if _G.AutoRainbow == false then wait(.5)
            StopTween()
        end
    end)
    AutoFarm:Toggle("Auto Electric Claw [Beta]", false, function (bool)
        AutoElectric = bool
        if AutoElectric == false then wait(.5)
            StopTween()
        end
    end)

    AutoFarm:Toggle("Auto Pirates Raid [Third Sea]", _G.PirateRaid, function (bool)
        _G.PirateRaid = bool
        PirateRaid()
        if _G.PirateRaid == false then wait(.5)
            StopTween()
        end
    end)
end

local AutoSea = false
if Secondsea or Thirdsea then
    AutoFarm:Toggle("Auto Haki Color [HOP]", _G.HakiColor, function (bool)
        _G.HakiColor = bool
    end)

    AutoFarm:Toggle("Auto SeaBeast - ;-;",AutoSea, function (bool)
         AutoSea = bool
         AutoSeaBeast()
         if AutoSea == false then wait(.5)
            StopTween()
         end
    end)
end

AutoFarm:Toggle("Auto Chest Farm", _G.ChestFarm, function (bool)
    _G.ChestFarm = bool
end)

spawn(function ()
    while wait() do
        if _G.ChestFarm then
            pcall(function()
                for i, v in pairs(game.Workspace:GetDescendants()) do
                    if string.find(v.Name, "Chest") then
                        if GodModeIsDone then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(3, 0, 0)
                        else
                            repeat wait()
                                TweenTo(v.Position + Vector3.new(3, 0, 0), 300)
                            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude <= 8 or not _G.ChestFarm
                        end
                        wait(1)
                    end
                end
            end)
        end
    end
end)


AutoFarm:Line()
AutoFarm:Label("--[ Mastery & Observation Farm ]--")
AutoFarm:Toggle("Observation Haki Farm [HOP]", _G.Observation, function (bool)
    _G.Observation = bool
    if _G.Observation then
        if not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
            game:GetService('VirtualUser'):CaptureController()
            game:GetService('VirtualUser'):SetKeyDown('0x65')
            wait(2)
            game:GetService('VirtualUser'):SetKeyUp('0x65')
        end
    else
        StopTween()
    end
end)
AutoFarm:Toggle("Auto Gun Mastery Farm", false, function (bool)
    GunMastery = bool
    MasteryFarm("Gun")
    if GunMastery == false then wait(.5)
        StopTween()
    end
end)
AutoFarm:Toggle("Auto Devil Fruit Mastery Farm", false, function (bool)
    FruitMastery = bool
    if FruitMastery and not GodModeIsDone then
        MasteryFarm("Fruit")
    elseif GodModeIsDone then
        library:Notification("This Function Not Support God Mode", "Ok")
    end
    if FruitMastery == false then wait(.5)
        StopTween()
    end
end)
if HealthPersen == nil then HealthPersen = 15 end
AutoFarm:Slider("% Health Mastery Farm", 1, 100, HealthPersen, function (bool)
    HealthPersen = bool
end)

local MasWeaponDD = AutoFarm:Dropdown("Select Weapon Farm Mastery", WeaponList, function (bool)
    MasWeapon = bool
end)
AutoFarm:Button("Refresh Weapon", function ()
    MasWeaponDD:Clear() WeaponList = {}
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA("Tool") then MasWeaponDD:Add(v.Name) table.insert(WeaponList, v.Name) end end
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") then MasWeaponDD:Add(v.Name) table.insert(WeaponList, v.Name) end end
end)
AutoFarm:Line()
AutoFarm:Label("--[ Boss Farm ]--")

local BossList = {}
for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if string.find(v.Name, "Boss") then
        table.insert(BossList, v.Name)
    end
end
local BossDD = AutoFarm:Dropdown("Select Boss",BossList,  function (bool)
    _G.SelectedBoss = bool
end)
AutoFarm:Button("Refresh Boss", function ()
    BossDD:Clear()
    BossList = {}
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if string.find(v.Name, "Boss") then
            BossDD:Add(v.Name)
            table.insert(BossList, v.Name)
        end
    end
end)
AutoFarm:Toggle("Farm All Boss", _G.AllBoss, function (bool)
    _G.AllBoss = bool
    All("All Boss")
    if _G.AllBoss == false then wait(.5)
        StopTween()
    end
end)
AutoFarm:Toggle("Boss Farm", _G.BossFarm, function (bool)
    _G.BossFarm = bool
    All("Farm Boss")
    if _G.BossFarm == false then wait(.5)
        StopTween()
    end
end)
local BossWeaponDD = AutoFarm:Dropdown("Select Weapon Boss", WeaponList, function (bool)
    _G.BossWeapon = bool
end)

AutoFarm:Button("Refresh Boss Weapon", function ()
    BossWeaponDD:Clear()
    WeaponList = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            BossWeaponDD:Add(v.Name)
            table.insert(WeaponList, v.Name)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            BossWeaponDD:Add(v.Name)
            table.insert(WeaponList, v.Name)
        end
    end
end)

local Stats = StarServer:Channel("Stats")

Stats:Label("--[ Auto Stats ]--")
Stats:Toggle("Melee", _G.Melee, function(vu)
    Mad = vu
end)

Stats:Toggle("Defense", _G.Defense, function(vu)
    Gan = vu
end)

Stats:Toggle("Sword", _G.Sword, function(vu)
    Dap = vu
end)

Stats:Toggle("Gun", _G.Gun, function(vu)
    Pun = vu
end)

Stats:Toggle("Devil Fruit", _G.DevilFruit, function(vu)
    DevilFruit = vu
end)

Stats:Toggle("Kaitan For Bypass", _G.Kaitan_Bypass, function(vu)
    Mad = vu
end)

Stats:Toggle("Kaitan For Tween", _G.Kaitan_Normal, function(vu)
    Gan = vu
    Mad = vu
end)


SelectPoint = 1
Stats:Slider("Set Point", 1,500,1, function(Point)
    SelectPoint = Point
end)

Stats:Label(""):Refresh("Status Players Stats")

local Level = Stats:Label("")
local Point = Stats:Label("")
local StatDefense = Stats:Label("")
local StatMelee = Stats:Label("")
local StatSword = Stats:Label("")
local StatGun = Stats:Label("")
local StatFruit = Stats:Label("")

spawn(function()
	while game:GetService("RunService").Heartbeat:wait() do
		Level:Refresh("Point : "..tostring(game:GetService("Players").LocalPlayer.Data.Points.Value))
		Point:Refresh("Level : "..tostring(game:GetService("Players").LocalPlayer.Data.Level.Value))
		StatMelee:Refresh("Melee : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value))
		StatDefense:Refresh("Defense : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats.Defense.Level.Value))
		StatSword:Refresh("Sword : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats.Sword.Level.Value))
		StatGun:Refresh("Gun : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats.Gun.Level.Value))
		StatFruit:Refresh("Devil Fruit : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats["Demon Fruit"].Level.Value))
	end
end)

spawn(function()
	while wait(.1) do
		if Mad then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", SelectPoint)
		end
	end
end)

spawn(function()
	while wait(.1) do
		if Gan then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", SelectPoint)
		end
	end
end)

spawn(function()
	while wait(.1) do
		if Dap then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", SelectPoint)
		end
	end
end)

spawn(function()
	while wait(.1) do
		if Pun then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", SelectPoint)
		end
	end
end)

spawn(function()
	while wait(.1) do
		if DevilFruit then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", SelectPoint)
		end
	end
end)

spawn(function()
	while wait(.1) do
		if _G.AutoStat then
			for i,v in pairs(_G.AutoStat) do
				if v == "Melee" and game.Players.LocalPlayer.Data.Stats.Melee.Level.Value ~= 2100 then
					repeat game:GetService("RunService").Heartbeat:wait()
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
					until game.Players.LocalPlayer.Data.Stats.Melee.Level.Value == 2100
				elseif v == "Defense" and game.Players.LocalPlayer.Data.Stats.Defense.Level.Value ~= 2100 then
					repeat game:GetService("RunService").Heartbeat:wait()
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", 1)
					until game.Players.LocalPlayer.Data.Stats.Defense.Level.Value == 2100
				elseif v == "Sword" and game.Players.LocalPlayer.Data.Stats.Sword.Level.Value ~= 2100 then
					repeat game:GetService("RunService").Heartbeat:wait()
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", 1)
					until game.Players.LocalPlayer.Data.Stats.Sword.Level.Value == 2100
				elseif v == "Gun" and game.Players.LocalPlayer.Data.Stats.Gun.Level.Value ~= 2100 then
					repeat game:GetService("RunService").Heartbeat:wait()
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", 1)
					until game.Players.LocalPlayer.Data.Stats.Gun.Level.Value == 2100
				elseif v == "DevilFruit" and game.Players.LocalPlayer.Data.Stats["Demon Fruit"].Level.Value ~= 2100 then
					repeat game:GetService("RunService").Heartbeat:wait()
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", 1)
					until game.Players.LocalPlayer.Data.Stats.Gun.Level.Value == 2100
				end
			end
		end
	end
end)

local Teleport = StarServer:Channel("Teleport")

Teleport:Label("--[ Misc ]--")
Teleport:Toggle("Ctrl + Click TP-Tween", _G.CTRL, function (bool)
    _G.CTRL = bool
end)
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()
Mouse.Button1Down:Connect(function ()
    if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
    if not Mouse.Target then return end
    if _G.CTRL then
        if GodModeIsDone then
            Plr.Character:MoveTo(Mouse.Hit.p)
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Mouse.Hit.p).magnitude <= 350 then
            Plr.Character:MoveTo(Mouse.Hit.p)
        end
    end
end)
if _G.TweenSpeed == nil then _G.TweenSpeed = 250 end
Teleport:Slider("Tween Speed", 1, 300, _G.TweenSpeed, function (bool)
    _G.TweenSpeed = bool
end)
Teleport:Button("Stop Tween", function ()
    wait(.5)
    StopTween()
end)
if Secondsea or Thirdsea then
    Teleport:Button("Tween To Seabeast", function ()
        for i, v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                if GodModeIsDone then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 100, 0))
                else
                    repeat wait()
                        TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 100, 0))
                    until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position + Vector3.new(0, 100, 0)).magnitude <= 5 or not v.Parent
                end
            end
        end
    end)
end
if Thirdsea then
    Teleport:Toggle("Using Teleport Gate", false, function (bool)
        gateTele = bool
    end)
end
Teleport:Line()
Teleport:Label("--[ Teleport Sea ]--")
if Firstsea then
    Teleport:Button("Teleport To Second Sea", function ()
        local args = {[1] = "TravelDressrosa"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
elseif Secondsea then
    Teleport:Button("Teleport To First Sea", function ()
        local args = {[1] = "TravelMain"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
    Teleport:Button("Teleport To Third Sea", function ()
        local args = {[1] = "TravelZou"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
elseif Thirdsea then
    Teleport:Button("Teleport To Second Sea", function()
        local args = {[1] = "TravelDressrosa"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
end
Teleport:Line()
Teleport:Label("--[ Island ]--")
if Firstsea then
    Teleport:Button("Pirate Start Island", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1027.59, 19.3245, 1367.29)
        else
            TweenTo(Vector3.new(1027.59, 19.3245, 1367.29), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Marine Start Island", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2684.3, 26.327, 1985.23)
        else
            TweenTo(Vector3.new(-2684.3, 26.327, 1985.23), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Middle Town", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-655.824, 7.85204, 1436.68)
        else
            TweenTo(Vector3.new(-655.824, 7.85204, 1436.68), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Jungle", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1249.77, 11.852, 341.356)
        else
            TweenTo(Vector3.new(-1249.77, 11.852, 341.356), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Pirate Village", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1122.35, 4.75205, 3855.92)
        else
            TweenTo(Vector3.new(-1122.35, 4.75205, 3855.92), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Desert", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1094.15, 6.43847, 4192.89)
        else
            TweenTo(Vector3.new(1094.15, 6.43847, 4192.89), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Frozen Village", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1198.01, 26.9725, -1211.73)
        else
            TweenTo(Vector3.new(1198.01, 26.9725, -1211.73), _G.TweenSpeed)
        end
    end)
    Teleport:Button("MarineFord", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4505.38, 20.6523, 4260.56)
        else
            TweenTo(Vector3.new(-4505.38, 20.6523, 4260.56), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Magma Village", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5231.76, 8.59013, 8467.88)
        else
            TweenTo(Vector3.new(-5231.76, 8.59013, 8467.88), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Sky 1st Floor", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4970.22, 717.672, -2622.35)
        else
            TweenTo(Vector3.new(-4970.22, 717.672, -2622.35), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Sky 2nd Floor", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4720.46, 854.517, -1943.15)
        else
            TweenTo(Vector3.new(-4720.46, 854.517, -1943.15), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Sky 3rd Floor", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7886.96, 5545.53, -394.544)
        else
            TweenTo(Vector3.new(-7886.96, 5545.53, -394.544), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Colosseum", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1428.35, 7.38934, -3014.37)
        else
            TweenTo(Vector3.new(-1428.35, 7.38934, -3014.37), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Prison", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4874.81, 5.65199, 735.57)
        else
            TweenTo(Vector3.new(4874.81, 5.65199, 735.57), _G.TweenSpeed)
        end
    end)
    Teleport:Button("In UnderWater City", function ()
        Entrance("Go to Underwater")
    end)
    Teleport:Button("Out UnderWater City", function ()
        Entrance("Out Underwater")
    end)
    Teleport:Button("Fountain City", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5213.1, 38.5011, 4095.69)
        else
            TweenTo(Vector3.new(5213.1, 38.5011, 4095.69), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Mob Island", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2850.2, 7.39225, 5354.99)
        else
            TweenTo(Vector3.new(-2850.2, 7.39225, 5354.99), _G.TweenSpeed)
        end
    end)
elseif Secondsea then
    Teleport:Dropdown("Teleport Flower", {"Red Flower", "Blue Flower"}, function (bool)
        FlowerSelected = bool
        if FlowerSelected == "Red Flower" then
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "Flower2" then
                    if GodModeIsDone then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 0, 5)
                    else
                        TweenTo(v.Position, _G.TweenSpeed)
                    end
                end
            end
        end
if FlowerSelected == "Blue Flower" then
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "Flower1" then
                    if GodModeIsDone then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 0, 5)
                    else
                        TweenTo(v.Position, _G.TweenSpeed)
                    end
                end
            end
        end
    end)
    Teleport:Button("First Spot", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(82.9491, 19.2667, 2834.99)
        else
            TweenTo(Vector3.new(82.9491, 19.2667, 2834.99), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Cafe",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-385.251, 73.0201, 297.388)
        else
            TweenTo(Vector3.new(-385.251, 73.0201, 297.388), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Kingdom Of Rose",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-195.1, 121.579, 279.9)
        else
            TweenTo(Vector3.new(-195.1, 121.579, 279.9), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Factory",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(427.452, 211.494, -429.336)
        else
            TweenTo(Vector3.new(427.452, 211.494, -429.336), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Mansion",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-390.096, 331.861, 673.465)
        else
            TweenTo(Vector3.new(-390.096, 331.861, 673.465), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Swan Room", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2302.19, 15.152, 663.811)
        else
            TweenTo(Vector3.new(2302.19, 15.152, 663.811), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Dark Arena", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3807.1, 14.6502, -3452.2)
        else
            TweenTo(Vector3.new(3807.1, 14.6502, -3452.2), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Green Bit", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2372.15, 72.9661, -3166.51)
        else
            TweenTo(Vector3.new(-2372.15, 72.9661, -3166.51), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Colosseum", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1836.58, 45.7947, 1360.31)
        else
            TweenTo(Vector3.new(-1836.58, 45.7947, 1360.31), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Ghost Island", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5571.84, 196.388, -795.433)
        else
            TweenTo(Vector3.new(-5571.84, 196.388, -795.433), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Ghost Island 2nd", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5930.73, 6.4027, -1189.42)
        else
            TweenTo(Vector3.new(-5930.73, 6.4027, -1189.42), _G.TweenSpeed)
        end
    end)

Teleport:Button("Snow Mountain", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1384.68, 453.512, -4990.1)
        else
            TweenTo(Vector3.new(1384.68, 453.512, -4990.1), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Cold Slide",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6026.96, 15.9518, -5071.96)
        else
            TweenTo(Vector3.new(-6026.96, 15.9518, -5071.96), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Magma Slide",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5478.39, 15.9518, -5246.91)
        else
            TweenTo(Vector3.new(-5478.39, 15.9518, -5246.91), _G.TweenSpeed)
        end
    end)
    Teleport:Button("In Cursed Ship",  function ()
        Entrance("Go to Ship")
    end)
    Teleport:Button("Out Cursed Ship",  function ()
        Entrance("Out Ship")
    end)
    Teleport:Button("Ice Castle",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5400.40381, 28.21698, -6236.99219)
        else
            TweenTo(Vector3.new(5400.40381, 28.21698, -6236.99219), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Forgotten Island",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3043.31543, 238.881271, -10191.5791)
        else
            TweenTo(Vector3.new(-3043.31543, 238.881271, -10191.5791), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Usoapp Island",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4748.78857, 8.35370827, 2849.57959)
        else
            TweenTo(Vector3.new(4748.78857, 8.35370827, 2849.57959), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Minisky Island",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-260.358917, 49325.7031, -35259.3008)
        else
            TweenTo(Vector3.new(-260.358917, 49325.7031, -35259.3008), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Indra Island",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-26698, 7.06173, 425.623)
        else
            TweenTo(Vector3.new(-26698, 7.06173, 425.623), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Lap Room",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6436.61, 250.62, -4500.64)
        else
            TweenTo(Vector3.new(-6436.61, 250.62, -4500.64), _G.TweenSpeed)
        end
    end)
    Teleport:Button("l'Église de Prophétie",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(239.79, -58.382, 1824.44)
        else
            TweenTo(Vector3.new(239.79, -58.382, 1824.44), _G.TweenSpeed)
        end
    end)
elseif Thirdsea then
    Teleport:Button("Port Town",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-269.081, 6.72994, 5313.31)
        else
            TweenTo(Vector3.new(-269.081, 6.72994, 5313.31), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Hydra Island (Support Gate Teleport)",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5317.27, 643.111, 336.468)
        elseif gateTele and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(5317.27, 643.111, 336.468)).magnitude > 500 then
            Entrance("Hydra")
        else
            TweenTo(Vector3.new(5317.27, 643.111, 336.468), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Secret Temple",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5226.1, 6.87257, 1111.05)
        else
            TweenTo(Vector3.new(5226.1, 6.87257, 1111.05), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Friendly Arena",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5227.64, 68.1246, -1453.46)
        else
            TweenTo(Vector3.new(5227.64, 68.1246, -1453.46), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Great Tree",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2267.83, 25.8876, -6600.01)
        else
            TweenTo(Vector3.new(2267.83, 25.8876, -6600.01), _G.TweenSpeed)
        end
    end)
Teleport:Button("Castle on the Sea (Support Gate Tele)",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4999.45, 318.181, -3010.54)
        elseif gateTele and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-4999.45, 318.181, -3010.54)).magnitude > 500 then
            Entrance("Castle")
        else
            TweenTo(Vector3.new(-4999.45, 318.181, -3010.54), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Rip Indra Boss Room",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5386.29, 335.627, -2565.9)
        else
            TweenTo(Vector3.new(-5386.29, 335.627, -2565.9), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Mansion (Support Gate Teleport)",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12549.7, 341.781, -7470.36)
        elseif gateTele and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12549.7, 341.781, -7470.36)).magnitude > 500 then
            Entrance("Mansion")
        else
            TweenTo(Vector3.new(-12549.7, 341.781, -7470.36), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Floating Turtle",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10038.9, 332.096, -8325.16)
        else
            TweenTo(Vector3.new(-10038.9, 332.096, -8325.16), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Longma Boss Room",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10253.8, 375.099, -9525.49)
        else
            TweenTo(Vector3.new(-10253.8, 375.099, -9525.49), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Beautiful Pirate Domain (Support Gate Teleport)",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5314.58203125, 25.419387817383, -125.94227600098)
        elseif gateTele then
            Entrance("Domain")
        else
            TweenTo(Vector3.new(5314.58203125, 25.419387817383, -125.94227600098), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Haunted Castle",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9506.11, 142.105, 5526.04)
        else
            TweenTo(Vector3.new(-9506.11, 142.105, 5526.04), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Soul Reaper Boss Room",  function()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9524.4, 316.233, 6736.14)
        else
            TweenTo(Vector3.new(-9524.4, 316.233, 6736.14), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Sea Of Treats",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-891.166, 65.8195, -10901.7)
        else
            TweenTo(Vector3.new(-891.166, 65.8195, -10901.7), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Peanut Island",  function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2009.89, 50.79, -9976.35)
        else
            TweenTo(Vector3.new(-2009.89, 50.79, -9976.35), _G.TweenSpeed)
        end
    end)
end

local Misc = StarServer:Channel("Misc")

Misc:Label("--[ Devil Fruits ]--")
Misc:Button("Buy Random Devil Fruit",  function ()
    local args = {[1] = "Cousin", [2] = "Buy"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Misc:Toggle("Auto Buy Random Devil Fruit",  false, function (bool)
    AutoBuyFruit = bool
    while AutoBuyFruit do wait(1)
        local args = {[1] = "Cousin", [2] = "Buy"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end)
fruitSelected = ""
Misc:Dropdown("Select Fruit Sniper", FruitList, function (bool)
    fruitSelected = bool
end)
Misc:Toggle("Devil Fruit Sniper",  false, function (bool)
    if fruitSelected == "" then
        library:Notification("Pls! Select fruit", "Ok")
    else
        BuyFruitSniper = bool
        while BuyFruitSniper do wait(1)
            local args = {[1] = "GetFruits"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {[1] = "PurchaseRawFruit", [2] = fruitSelected}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
Misc:Toggle("Bring Fruit (Tween-TP)",  _G.BringFruit, function (bool)
    _G.BringFruit = bool
    All("Bring Fruit")
    if _G.BringFruit == false then wait(.5)
        StopTween()
    end
end)
Misc:Toggle("Auto Store All Fruit",  _G.AutoStore, function (bool)
    _G.AutoStore = bool
end)
Misc:Line()
Misc:Label("--[ Misc ]--")
Misc:Button("Change To Pirates Team", function ()
    local args = {[1] = "SetTeam", [2] = "Pirates"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "Buso"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Misc:Button("Change To Marines Team",  function ()
    local args = {[1] = "SetTeam", [2] = "Marines"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "Buso"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Misc:Line()
Misc:Button("Open Inventory",  function ()
    if Firstsea then
        chest1 = Vector3.new(1083.03, 18.8626, 1325.01)
        chest2 = Vector3.new(-2553.69, 9.49121, 2005.98)
    elseif Secondsea then
        chest1 = Vector3.new(-297.84, 75.66, 297.03)
        chest2 = Vector3.new(123.57, 21.92, 2849.44)
    elseif Thirdsea then
        chest1 = Vector3.new(-217.493, 9.36051, 5322.15)
        chest2 = Vector3.new(-12571.8, 339.545, -7441.1)
    end
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest1).magnitude < (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest2).magnitude then
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(chest1)
        else
            repeat wait()
                TweenTo(chest1, 300)
            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest1).magnitude <= 5
        end
        wait(.5)
        local args = {[1] = "getInventoryWeapons"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
    else
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(chest2)
        else
            repeat wait()
                TweenTo(chest2, 300)
            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest2).magnitude <= 5
        end
        wait(.5)
        local args = {[1] = "getInventoryWeapons"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
    end
end)

Misc:Button("Open Fruits Inventory",  function ()
    local args = {[1] = "getInventoryFruits"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
end)

Misc:Button("Open Devil Shop",  function ()
    local args = {[1] = "GetFruits"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
end)

Misc:Button("Open Color",  function ()
    game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Colors.Visible = true
end)
Misc:Line()
Misc:Button("Remove Lava",  function()
    for i, v in pairs(game.Workspace:GetDescendants()) do
        if v.Name == "Lava" then
            v:Destroy()
        end
    end
    for i, v in pairs(game.ReplicatedStorage:GetDescendants()) do
        if v.Name == "Lava" then
            v:Destroy()
        end
    end
end)

Misc:Button("Redeem All Code!", function()
   	function UseCode(Text)
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
    end
    UseCode("UPD16")
    UseCode("2BILLION")
    UseCode("UPD15")
    UseCode("FUDD10")
    UseCode("BIGNEWS")
    UseCode("THEGREATACE")
    UseCode("SUB2GAMERROBOT_EXP1")
    UseCode("StrawHatMaine")
    UseCode("Sub2OfficialNoobie")
    UseCode("SUB2NOOBMASTER123")
    UseCode("Sub2Daigrock")
    UseCode("Axiore")
    UseCode("TantaiGaming")
    UseCode("STRAWHATMAINE") 
end)

local Dungeon = StarServer:Channel("Raid")

Dungeon:Label("--[ Auto Raid ]--")
    Dungeon:Dropdown("Select Chip For Fully Raid", {
        "Flame",
        "Ice",
        "Quake",
        "Light",
        "Dark",
        "String",
        "Rumble",
        "Magma",
        "Human: Buddha",
        "Sand"
    }, function (bool)
        _G.FullyChip = bool
    end)

Dungeon:Toggle("Fully Auto Raid ", _G.FullyRaid, function (bool)
        -- library:Notification("This Function Has Locked", "Uh Oh o_o")
        if _G.FullyChip == nil or _G.FullyChip == "" then
            library:Notification("Select Chip First", "Ok I Know")
        else
            _G.FullyRaid = bool
            FullyRaid()
            if _G.FullyRaid == false then wait(.5)
                StopTween()
            end
        end
    end)
Dungeon:Toggle("Kill Aura (Raid Only)",  false, function (bool)
        KillAura = bool
    end)

    Dungeon:Toggle("Auto Next Island",  false, function (bool)
        NextIsland = bool
        if NextIsland == false then wait(.5)
            StopTween()
        end
    end)

    Dungeon:Toggle("Auto Awakener",  false, function (bool)
        AutoAwaken = bool
    end)

    Dungeon:Toggle("Auto Join Raid (Tween)",  false, function (bool)
        AutoJoinRaid = bool
        if AutoJoinRaid == false then wait(.5)
            StopTween()
        end
    end)
if _G.RaidHeight == nil then _G.RaidHeight = 28 end
    Dungeon:Slider("Raid Height", 10, 130, _G.RaidHeight, function (bool)
        _G.RaidHeight = bool
    end)

    Dungeon:Line()
    Dungeon:Label("-- Buy Chip --")
    Dungeon:Dropdown("Select Chip", {
        "Flame",
        "Ice",
        "Quake",
        "Light",
        "Dark",
        "String",
        "Rumble",
        "Magma",
        "Human: Buddha",
        "Sand"
    }, function (bool)
        SelectChip = bool
    end)
    Dungeon:Button("Buy Selected Chip",  function ()
        if SelectChip == nil or SelectChip == "" then
            library:Notification("Select Chip First", "Ok?")
        else
            Funny("Buy Chip", SelectChip)
        end
    end)

local Shop = StarServer:Channel("Shop")

Shop:Label("--[ Update 17 ]--")

local Candy = Shop:Label("")
spawn(function ()
    while wait(.1) do
        if TotalCounter then
            Candy:Update("Total Candy: "..tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Candies", "Check")), TotalLabelColor)
        end
    end
end)

Shop:Button("Buy x2 Exp [50 Canndies]",  function ()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Candies", "Buy", 1, 1)
end)

Shop:Toggle("Auto Buy x2 Exp [50 Cannies]",  false, function (bool)
    AutoCandy1 = bool
    while AutoCandy1 do wait()
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Candies", "Check") >= 50 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Candies", "Buy", 1, 1)
        end
    end
end)

Shop:Line()
Shop:Button("Reset Stats [75 Candies]",  function ()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Candies", "Buy", 1, 2)
end)

Shop:Button("Recoll Race [100 Candies]",  function ()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Candies", "Buy", 1, 3)
end)

Shop:Line()
Shop:Button("Buy 300f [50 Candies]",  function ()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Candies", "Buy", 2, 1)
end)

Shop:Button("Buy 700f [100 Candies]",  function ()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Candies", "Buy", 2, 2)
end)

Shop:Line()
Shop:Button("Buy Elf Hat [250 Candies]",  function ()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Candies", "Buy", 3, 1)
end)

Shop:Button("Buy Santa Hat [500 Candies]",  function ()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Candies", "Buy", 3, 2)
end)

Shop:Button("Buy Sleigh [1000 Candies]",  function ()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Candies", "Buy", 3, 3)
end)

if Thirdsea then
    Shop:Line()
    local Bone = Shop:Label("")
    spawn(function ()
        while wait(.1) do
            if TotalCounter then
                Bone:Update("Total Bone: "..tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")), TotalLabelColor)
            end
        end
    end)

    Shop:Button("Buy Surprise",  function ()
        local args = {[1] = "Bones", [2] = "Check"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        local args = {[1] = "Bones", [2] = "Buy", [3] = 1, [4] = 1}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)

    Shop:Toggle("Auto Buy Surprise",  false, function (bool)
        AutoSurprise = bool
        while AutoSurprise do wait()
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check") >= 50 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
            end
        end
    end)

    Shop:Toggle("Auto x2 Exp [Bone]",  false, function (bool)
        AutoDupeExp = bool
        while AutoDupeExp do wait(.1)
            if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Level.Exp.Text, "2x") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
            end
        end
    end)
end

if Secondsea or Thirdsea then
    Shop:Line()
    Shop:Label("--[ Status ]--")
    Shop:Button("Stats Refund [2500 Fragment]", function ()
        local args = {[1] = "BlackbeardReward",[2] = "Refund",[3] = "1"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        local args = {[1] = "BlackbeardReward",[2] = "Refund",[3] = "2"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)

    Shop:Button("Race Reroll [3000 Fragment]",  function ()
        local args = {[1] = "BlackbeardReward",[2] = "Reroll",[3] = "2"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
end

Shop:Line()
Shop:Label("--[ Fighting Styles ]--")
Shop:Button("Black Step",  function ()
    local args = {[1] = "BuyBlackLeg"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Button("Electro",  function ()
    local args = {[1] = "BuyElectro"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Button("Fishman Karate",  function ()
    local args = {[1] = "BuyFishmanKarate"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Button("Dragon Claw",  function ()
    local args = {[1] = "BlackbeardReward", [2] = "DragonClaw", [3] = "1"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "BlackbeardReward", [2] = "DragonClaw",	[3] = "2"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Button("Superhuman",  function ()
    local args = {[1] = "BuySuperhuman"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Button("Death Step",  function ()
    local args = {[1] = "BuyDeathStep"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Button("Sharkman Karate",  function ()
    local args = {[1] = "BuySharkmanKarate", [2] = true}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "BuySharkmanKarate"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Button("Electric Claw",  function ()
    local args = {[1] = "BuyElectricClaw"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Button("Dragon Talon",  function ()
    local args = {[1] = "BuyDragonTalon"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Line()
Shop:Label("--[ Sword ]--")
Shop:Button("Katana",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
end)

Shop:Button("Cutlass",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
end)

Shop:Button("Duel Katana",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
end)

Shop:Button("Iron Mace",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
end)

Shop:Button("Pipe",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
end)

Shop:Button("Triple Katana",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
end)

Shop:Button("Dual-Headed Blade",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
end)

Shop:Button("Bisento", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
end)

Shop:Button("Soul Cane",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
end)

Shop:Line()
Shop:Label("--[ Gun ]--")
Shop:Button("Slingshot",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
end)

Shop:Button("Musket",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Musket")
end)

Shop:Button("Flintlock",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
end)

Shop:Button("Refined Flintlock",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
end)

Shop:Button("Cannon",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
end)

Shop:Button("Kabucha",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot","1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot","2")
end)

Shop:Line()
Shop:Label("--[ Accesories ]--")
Shop:Button("Black Cape",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Black Cape")
end)

Shop:Button("Toemo Ring",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring")
end)

Shop:Button("Swordsman Hat",  function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat")
end)

Shop:Line()
Shop:Label("--[ Abilities ]--")
Shop:Button("Skyjump",  function()
    local args = {[1] = "BuyHaki", [2] = "Geppo"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Button("Enchantment",  function()
    local args = {[1] = "BuyHaki", [2] = "Buso"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Button("Flash Step",  function()
    local args = {[1] = "BuyHaki", [2] = "Soru"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Button("Observation Haki",  function()
    local args = {[1] = "KenTalk", [2] = "Buy"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Line()
Shop:Toggle("Auto Buy Abilities",  false, function (bool)
    AutoAbilities = bool
    while AutoAbilities do wait(.1)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
    end
end)

local GameSetting = StarServer:Channel("Game")

GameSetting:Label("--[ HOP Function ]--")
GameSetting:Toggle("HOP Function", _G.HOP, function (bool)
    _G.HOP = bool
end)

GameSetting:Toggle("Low Hop Function", _G.LowHop, function (bool)
    _G.LowHop = bool
end)
GameSetting:Line()
GameSetting:Label("--[ Settings ]--")
if _G.AutoSetSpawn == nil then _G.AutoSetSpawn = true end
GameSetting:Toggle("Auto Set Spawn (Auto Farm)", _G.AutoSetSpawn, function (bool)
    _G.AutoSetSpawn = bool
end)

if _G.FastAttack == nil then _G.FastAttack = true end
GameSetting:Toggle("Fast Attack", _G.FastAttack, function (bool)
    _G.FastAttack = bool
end)

GameSetting:Toggle("Fast Attack", false, function (value)
    _G.FastAttk = value
end)

local CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework) 

local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)

spawn(function()
	for i = 1,math.huge do
		game:GetService("RunService").Heartbeat:wait()
		if _G.FastAttk then
			pcall(function()
					CameraShakerR:Stop()
					CombatFrameworkR.activeController.attacking = false
					CombatFrameworkR.activeController.timeToNextAttack = 0
					CombatFrameworkR.activeController.increment = 3
					CombatFrameworkR.activeController.hitboxMagnitude = 1000
			end)
		end
		game:GetService("RunService").Heartbeat:wait()
	end
end)

spawn(function()
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.FastAttk then
					VirtualUser:CaptureController()
					VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
			end
		end)
	end)
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.FastAttk then
					VirtualUser:CaptureController()
					VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
			end
		end)
	end)
end)

GameSetting:Toggle("Fast Attack (New!)",  _G.FastAttackNew, function (bool)
    _G.FastAttackNew = bool
end)

if _G.Magnet == nil then _G.Magnet = true end
GameSetting:Toggle("Bring Mob" , _G.Magnet, function (bool)
    _G.Magnet = bool
end)

if _G.AutoBuso == nil then _G.AutoBuso = true end
GameSetting:Toggle("Auto Buso Haki",  _G.AutoBuso, function (bool)
    _G.AutoBuso = bool
end)

GameSetting:Toggle("Auto Ken Haki",  _G.AutoKen, function (bool)
    _G.AutoKen = bool
end)
GameSetting:Toggle("Auto PvP",  false, function (bool)
    EnablePvP = bool
    while EnablePvP do wait()
        game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("EnablePvp")
    end
end)

GameSetting:Toggle("Damage Counter",  true, function (bool)
    pcall(function ()
        game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = bool
    end)
end)

if _G.HidePart == nil then _G.HidePart = true end
GameSetting:Toggle("Hide Float Part",  _G.HidePart, function (bool)
    _G.HidePart = bool
end)

if game.Players.LocalPlayer.Name == "AdMin_Roblox098" then
    library:Notification("Have A Nice Day Owner :)", "Thanks You")
    GameSetting:Toggle("Total Counter",  true, function (bool)
        TotalCounter = bool
    end)

    GameSetting:Textbox("Tween To Position",  false, function (Pos)
        TweenTo(Vector3.new(Pos), 300)
    end)
end

GameSetting:Line()
GameSetting:Label("--[ Mastery Settings ]--")
local SkillZ = true
GameSetting:Toggle("Skill Z",  SkillZ, function (bool)
    SkillZ = bool
end)

local ZHold = 1
GameSetting:Slider("Z Hold Time",  0, 15, ZHold, function (time)
    ZHold = time
end)

local SkillX = true
GameSetting:Toggle("Skill X",  SkillX, function (bool)
    SkillX = bool
end)

local XHold = 1
GameSetting:Slider("X Hold Time",  0, 15, XHold, function (time)
    XHold = time
end)

local SkillC = true
GameSetting:Toggle("Skill C",  SkillC, function (bool)
    SkillC = bool
end)

local CHold = 1
GameSetting:Slider("C Hold Time",  0, 15, CHold, function (time)
    CHold = time
end)

local SkillV = true
GameSetting:Toggle("Skill V",  SkillV, function (bool)
    SkillV = bool
end)

local VHold = 1
GameSetting:Slider("V Hold Time",  0, 15, VHold, function (time)
    VHold = time
end)

GameSetting:Line()
GameSetting:Label("--[ Game ]--")
GameSetting:Button("Rejoin",  function ()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

GameSetting:Button("Server Hop",  function ()
    Teleport()
end)

GameSetting:Button("Low Server Hop",  function ()
    LowServerHop()
end)

--[ FUNCTION ]--
function Funny(type, value)
    if type == "Code" then
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
    elseif type == "Buy Chip" then
        game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("RaidsNpc", "Select", value)
    end
end

Number = math.random(1, 1000000)
function ESP(type)
    function isnil(thing)
        return (thing == nil)
    end

    local function round(n)
        return math.floor(tonumber(n) + 0.5)
    end

    if type == "Players" then
        for i, v in pairs(game:GetService'Players':GetChildren()) do
            pcall(function()
                if not isnil(v.Character) then
                    if _G.EspPlayer then
                        if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                            local bill = Instance.new('BillboardGui',v.Character.Head)
                            bill.Name = 'NameEsp'..Number
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v.Character.Head
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            if v.Team == game.Players.LocalPlayer.Team then
                                name.TextColor3 = Color3.new(255, 255 ,255)
                            else
                                name.TextColor3 = Color3.new(255, 255 ,255)
                            end
                        else
                            v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                        end
                    else
                        if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                            v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                        end
                    end
                end
            end)
        end
    end

    if type == "Chest" then
        for i, v in pairs(game.Workspace:GetChildren()) do
            pcall(function()
                if string.find(v.Name,"Chest") then
                    if _G.EspChest then
                        if string.find(v.Name,"Chest") then
                            if not v:FindFirstChild('NameEsp'..Number) then
                                local bill = Instance.new('BillboardGui',v)
                                bill.Name = 'NameEsp'..Number
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1,200,1,30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new('TextLabel',bill)
                                name.Font = "GothamBold"
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1,0,1,0)
                                name.TextYAlignment = 'Top'
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                if v.Name == "Chest1" then
                                    name.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                                end
                                if v.Name == "Chest2" then
                                    name.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                                end
                                if v.Name == "Chest3" then
                                    name.TextColor3 = Color3.fromRGB(255, 255 ,255)
                                    name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                                end
                            else
                                v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                            end
                        end
                    else
                        if v:FindFirstChild('NameEsp'..Number) then
                            v:FindFirstChild('NameEsp'..Number):Destroy()
                        end
                    end
                end
            end)
        end
    end

    if type == "Fruit" then
        for i,v in pairs(game.Workspace:GetChildren()) do
            pcall(function()
                if _G.EspFruit then
                    if string.find(v.Name, "Fruit") then
                        if not v.Handle:FindFirstChild('NameEsp'..Number) then
                            local bill = Instance.new('BillboardGui',v.Handle)
                            bill.Name = 'NameEsp'..Number
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v.Handle
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 255 ,255)
                            name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                        else
                            v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                        end
                    end
                else
                    if v.Handle:FindFirstChild('NameEsp'..Number) then
                        v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
            end)
        end
    end
end

function Entrance(type)
    local args = {[1] = "GetUnlockables"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if type == "Go to Underwater" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Out Underwater" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(3864.6884765625, 6.7369503974915, -1926.2141113281)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Go to Ship" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Out Ship" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Castle" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(-12463.602539063, 378.32705688477, -7566.0830078125)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Mansion" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(-5089.6645507813, 318.50231933594, -3146.1267089844)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Hydra" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(-5099.0244140625, 318.50231933594, -3169.3083496094)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Domain" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(5314.58203125, 25.419387817383, -125.94227600098)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end

function Equip(toolName)
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(toolName) then
        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(toolName))
    end
end

function UseSkill(skill, time)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, skill, false, game)
    wait(time)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, skill, false, game)
end

function All(type)
    spawn(function ()
        pcall(function ()
            if type == "Auto Farm" and _G.AutoFarm then
                while _G.AutoFarm do game:GetService'RunService'.RenderStepped:Wait()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        levelCheck()
                        local MyLevel = game.Players.localPlayer.Data.Level.Value
                        if MyLevel >= 375 and MyLevel < 450 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                            if GodModeIsDone then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(61163.8515625, 11.6796875, 1819.7841796875)
                            else
                                Entrance("Go to Underwater")
                            end
                        elseif MyLevel >= 450 and MyLevel < 700 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                            if GodModeIsDone then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3864.6884765625, 6.7369503974915, -1926.2141113281)
                            else
                                Entrance("Out Underwater")
                            end
                        elseif MyLevel >= 1250 and MyLevel < 1350 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                            if GodModeIsDone then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(923.21252441406, 126.9760055542, 32852.83203125)
                            else
                                Entrance("Go to Ship")
                            end
                        elseif MyLevel >= 1350 and MyLevel < 1500 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                            if GodModeIsDone then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6508.5581054688, 89.034996032715, -132.83953857422)
                            else
                                Entrance("Out Ship")
                            end
                        end
                        repeat wait() until game:IsLoaded()
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(posQuest)
                        else
                            repeat wait()
                                TweenTo(posQuest, 300)
                            until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude <= 5 or not _G.AutoFarm
                        end
                        wait(.5)
                        if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude <= 5 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameQuest, levelQuest)
                            if _G.AutoSetSpawn then
                               local args = {[1] = "SetSpawnPoint"}
                               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and _G.AutoFarm then levelCheck()
                        if game:GetService("Workspace").Enemies:FindFirstChild(nameMob) then
                            pcall(function ()
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do levelCheck()
                                    if v.Name == nameMob then
                                        if _G.AutoFarm then StartMagnet = true else StartMagnet = false end
                                        if _G.AutoFarm then StartClick = true else StartClick = false end
                                        repeat game:GetService("RunService").Heartbeat:wait() levelCheck()
                                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameMon) then
                                                if game:GetService("Workspace").Enemies:FindFirstChild(nameMob) then
                                                    if (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone) then
                                                        repeat wait() until game.Players.LocalPlayer.Character break;
                                                    else
                                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                        if _G.Weapon == "" or _G.Weapon == nil then
                                                            for i, v in pairs(ListMelee) do
                                                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                                    _G.Weapon = v
                                                                end
                                                            end
                                                        end
                                                        Equip(_G.Weapon)
                                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                            local args = {[1] = "Buso"}
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                        end
                                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                            v.Humanoid.WalkSpeed = 1
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                            v.HumanoidRootPart.Transparency = 1
                                                            PosMon = v.HumanoidRootPart.CFrame
                                                        end
                                                        if GodModeIsDone then
                                                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0)
                                                        else
                                                            TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                                        end
                                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                                    end
                                                else levelCheck()
                                                    if GodModeIsDone then
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(waitPos)
                                                    else
                                                        TweenTo(waitPos, 300)
                                                    end
                                                end
                                            else
                                                local args = {[1] = "AbandonQuest"}
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                            end
                                        until v.Humanoid.Health <= 0 or _G.AutoFarm == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        if StartMagnet then StartMagnet = false end
                                        if StartClick then StartClick = false end
                                    end
                                end
                            end)
                        else levelCheck()
                            if GodModeIsDone then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(waitPos)
                            else
                                TweenTo(waitPos, 300)
                            end
                        end
                    end
                end
            elseif type == "Candy Farm" and _G.CandyFarm and Thirdsea then
                while _G.CandyFarm do game:GetService'RunService'.RenderStepped:Wait()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Peanut Scout [Lv. 2075]")
                    or game:GetService("Workspace").Enemies:FindFirstChild("Peanut President [Lv. 2100]")
                    or game:GetService("Workspace").Enemies:FindFirstChild("Ice Cream Chef [Lv. 2125]")
                    or game:GetService("Workspace").Enemies:FindFirstChild("Ice Cream Commander [Lv. 2150]")
                    then
                        RandomMob = math.random(1, 4)
                        if RandomMob == 1 then
                            CandyMob = "Ice Cream Commander [Lv. 2150]"
                            Position = Vector3.new(-744.19, 65.85, -11317.73)
                        elseif RandomMob == 2 then
                            CandyMob = "Ice Cream Chef [Lv. 2125]"
                            Position = Vector3.new(-941.36, 65.85, -11048.44)
                        elseif RandomMob == 3 then
                            CandyMob = "Peanut President [Lv. 2100]"
                            Position = Vector3.new(-2135.85, 70.3, -10521.58)
                        elseif RandomMob == 4 then
                            CandyMob = "Peanut Scout [Lv. 2075]"
                            Position = Vector3.new(-2203.7, 38.13, -10124.15)
                        end
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == CandyMob and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - Position).magnitude <= 350 then
                                if _G.CandyFarm then StartMagnet = true else StartMagnet = false end
                                if _G.CandyFarm then StartClick = true else StartClick = false end
                                repeat game:GetService("RunService").RenderStepped:Wait(.5)
                                    if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                        repeat wait() until game.Players.LocalPlayer.Character break;
                                    else
                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                        if _G.Weapon == "" or _G.Weapon == nil then
                                            for i, v in pairs(ListMelee) do
                                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                    _G.Weapon = v
                                                end
                                            end
                                        end
                                        Equip(_G.Weapon)
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then local args = {[1] = "Buso"} game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) end
                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                            v.Humanoid.WalkSpeed = 1
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                        end
                                        if GodModeIsDone then
                                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Position + Vector3.new(0, 25, 0))
                                        else
                                            TweenTo(Position + Vector3.new(0, 25, 0), 300)
                                        end
                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                    end
                                until v.Humanoid.Health <= 0 or _G.CandyFarm == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil
                                if StartMagnet then StartMagnet = false end
                                if StartClick then StartClick = false end
                            end
                        end
                    end
                end
            elseif type == "Bone Farm" and _G.BoneFarm and Thirdsea then
                while _G.BoneFarm do game:GetService'RunService'.RenderStepped:Wait()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]")
                    or game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]")
                    or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]")
                    then
                        RandomMob = math.random(1, 3)
                        if RandomMob == 1 then
                            BoneMob = "Posessed Mummy [Lv. 2050]"
                            Position = Vector3.new(-9573.1, 5.81833, 6197.55)
                        elseif RandomMob == 2 then
                            BoneMob = "Reborn Skeleton [Lv. 1975]"
                            Position = Vector3.new(-8762.44, 142.131, 6002.3)
                        elseif RandomMob == 3 then
                            BoneMob = "Living Zombie [Lv. 2000]"
                            Position = Vector3.new(-10153.4, 139.652, 5936.71)
                        end
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == BoneMob then
                                if _G.BoneFarm then StartMagnet = true else StartMagnet = false end
                                if _G.BoneFarm then StartClick = true else StartClick = false end
                                repeat game:GetService("RunService").RenderStepped:Wait(.5)
                                    if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                        repeat wait() until game.Players.LocalPlayer.Character break;
                                    else
                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                        if _G.Weapon == "" or _G.Weapon == nil then
                                            for i, v in pairs(ListMelee) do
                                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                    _G.Weapon = v
                                                end
                                            end
                                        end
                                        Equip(_G.Weapon)
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then local args = {[1] = "Buso"} game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) end
                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                            v.Humanoid.WalkSpeed = 1
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                        end
                                        if GodModeIsDone then
                                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Position + Vector3.new(0, 25, 0))
                                        else
                                            TweenTo(Position + Vector3.new(0, 25, 0), 300)
                                        end
                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                    end
                                until v.Humanoid.Health <= 0 or _G.BoneFarm == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil
                                if StartMagnet then StartMagnet = false end
                                if StartClick then StartClick = false end
                            end
                        end
                    end
                end
            elseif type == "Mob Aura" and _G.MobAura then
                while _G.MobAura do game:GetService'RunService'.RenderStepped:Wait()
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            if _G.MobAura then StartMagnet = true else StartMagnet = false end
                            if _G.MobAura then StartClick = true else StartClick = false end
                            repeat game:GetService("RunService").Heartbeat:wait()
                                if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                    repeat wait() until game.Players.LocalPlayer.Character break;
                                else
                                    if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                    if _G.Weapon == "" or _G.Weapon == nil then
                                        for i, v in pairs(ListMelee) do
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                _G.Weapon = v
                                            end
                                        end
                                    end
                                    Equip(_G.Weapon)
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        local args = {[1] = "Buso"}
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                        v.Humanoid.WalkSpeed = 1
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v.HumanoidRootPart.Transparency = 1
                                        AuraBringPos = v.HumanoidRootPart.CFrame
                                    end
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0)
                                    require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                end
                            until v.Humanoid.Health <= 0 or _G.MobAura == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil
                            if StartMagnet then StartMagnet = false end
                            if StartClick then StartClick = false end
                        end
                    end
                end
            elseif type == "Choose Mob" and _G.ChooseMob and not Firstsea then
                while _G.ChooseMob do game:GetService'RunService'.RenderStepped:Wait()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        MobCheck()
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(posQuest)
                        else
                            repeat wait()
                                TweenTo(posQuest, 300)
                            until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude <= 5 or not _G.ChooseMob
                        end
                        wait(.5)
                        if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude <= 5 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameQuest, levelQuest)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and _G.ChooseMob then
                        MobCheck()
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameMon) then
                            if game:GetService("Workspace").Enemies:FindFirstChild(mobSelect) then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == mobSelect then
                                        if _G.ChooseMob then StartMagnet = true else StartMagnet = false end
                                        if _G.ChooseMob then StartClick = true else StartClick = false end
                                        repeat game:GetService("RunService").RenderStepped:Wait(.5)
                                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameMon) then
                                                if game:GetService("Workspace").Enemies:FindFirstChild(mobSelect) then
                                                    if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                                        repeat wait() until game.Players.LocalPlayer.Character break;
                                                    else
                                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                        if _G.Weapon == "" or _G.Weapon == nil then
                                                            for i, v in pairs(ListMelee) do
                                                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                                    _G.Weapon = v
                                                                end
                                                            end
                                                        end
                                                        Equip(_G.Weapon)
                                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                            local args = {[1] = "Buso"}
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                        end
                                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                            v.Humanoid.WalkSpeed = 1
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                            v.HumanoidRootPart.Transparency = 1
                                                            MobChoosedPos = v.HumanoidRootPart.CFrame
                                                        end
                                                        if GodModeIsDone then
                                                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0)
                                                        else
                                                            TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                                        end
                                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                                    end
                                                else MobCheck()
                                                    if GodModeIsDone then
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(waitPos)
                                                    else
                                                        TweenTo(waitPos, 300)
                                                    end
                                                end
                                            else
                                                local args = {[1] = "AbandonQuest"}
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                            end
                                        until v.Humanoid.Health <= 0 or _G.ChooseMob == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        if StartMagnet then StartMagnet = false end
                                        if StartClick then StartClick = false end
                                    end
                                end
                            else MobCheck()
                                if GodModeIsDone then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(waitPos)
                                else
                                    TweenTo(waitPos, 300)
                                end
                            end
                        else
                            local args = {[1] = "AbandonQuest"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    end
                end
            elseif type == "Bring Fruit" and _G.BringFruit then
                repeat wait()
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v:IsA "Tool" then
                            repeat wait()
                                TweenTo(v.Handle.Position, 300)
                            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Handle.Position).magnitude <= 5 or not _G.BringFruit
                        end
                    end
                until not _G.BringFruit
            elseif type == "Farm Boss" and _G.BossFarm then
                while _G.BossFarm do game:GetService'RunService'.RenderStepped:Wait()
                    BossCheck()
                    if needQuest and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(posBossQuest)
                        else
                            repeat wait()
                                TweenTo(posBossQuest, 300)
                            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posBossQuest).magnitude <= 5 or not _G.BossFarm
                        end
                        wait(.5)
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posBossQuest).magnitude <= 5 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameBossQuest, levelBossQuest)
                        end
                    elseif not needQuest or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and needQuest) then BossCheck()
                        if not needQuest or (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameBoss) and needQuest) then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == _G.SelectedBoss then
                                    if _G.BossFarm then StartClick = true else StartClick = false end
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        if not needQuest or (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameBoss) and needQuest) then
                                            if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                                repeat wait() until game.Players.LocalPlayer.Character break;
                                            else
                                                if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                if _G.BossWeapon == "" or _G.BossWeapon == nil then
                                                    for i, v in pairs(ListMelee) do
                                                        if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                            _G.BossWeapon = v
                                                        end
                                                    end
                                                end
                                                Equip(_G.BossWeapon)
                                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                    local args = {[1] = "Buso"}
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                end
                                                if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                    v.Humanoid.WalkSpeed = 1
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                    v.HumanoidRootPart.Transparency = 1
                                                end
                                                if GodModeIsDone then
                                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(15, 25, 0)
                                                else
                                                    TweenTo(v.HumanoidRootPart.Position + Vector3.new(15, 25, 0), 300)
                                                end
                                            end
                                        elseif needQuest then
                                            local args = {[1] = "AbandonQuest"}
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                    until v.Humanoid.Health <= 0 or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or _G.BossFarm == false or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false and needQuest)
                                    if StartClick then StartClick = false end
                                end
                            end
                        elseif needQuest then
                            local args = {[1] = "AbandonQuest"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    end
                end
            elseif type == "All Boss" and _G.AllBoss then
                while _G.AllBoss do game:GetService'RunService'.RenderStepped:Wait()
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if string.find(v.Name, "Boss") then
                            _G.SelectedBoss = v.Name
                            repeat game:GetService'RunService'.RenderStepped:Wait()
                                BossCheck()
                                if needQuest and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                    if GodModeIsDone then
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(posBossQuest)
                                    else
                                        repeat wait()
                                            TweenTo(posBossQuest, 300)
                                        until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posBossQuest).magnitude <= 5 or not _G.AllBoss
                                    end
                                    wait(.5)
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posBossQuest).magnitude <= 5 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameBossQuest, levelBossQuest)
                                    end
                                elseif not needQuest or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and needQuest) then BossCheck()
                                    if not needQuest or (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameBoss) and needQuest) then
                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == _G.SelectedBoss then
                                                if _G.AllBoss then StartClick = true else StartClick = false end
                                                repeat game:GetService("RunService").Heartbeat:wait()
                                                    if not needQuest or (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameBoss) and needQuest) then
                                                        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                                            repeat wait() until game.Players.LocalPlayer.Character break;
                                                        else
                                                            if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                            if _G.BossWeapon == "" or _G.BossWeapon == nil then
                                                                for i, v in pairs(ListMelee) do
                                                                    if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                                        _G.BossWeapon = v
                                                                    end
                                                                end
                                                            end
                                                            Equip(_G.BossWeapon)
                                                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                                local args = {[1] = "Buso"}
                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                            end
                                                            if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                                v.Humanoid.WalkSpeed = 1
                                                                v.HumanoidRootPart.CanCollide = false
                                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                                v.HumanoidRootPart.Transparency = 1
                                                            end
                                                            if GodModeIsDone then
                                                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(15, 25, 0)
                                                            else
                                                                TweenTo(v.HumanoidRootPart.Position + Vector3.new(15, 25, 0), 300)
                                                            end
                                                            require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                                        end
                                                    elseif needQuest then
                                                        local args = {[1] = "AbandonQuest"}
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                    end
                                                until v.Humanoid.Health <= 0 or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or _G.AllBoss == false or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false and needQuest)
                                                if StartClick then StartClick = false end
                                            end
                                        end
                                    elseif needQuest then
                                        local args = {[1] = "AbandonQuest"}
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                end
                            until not game.Workspace.Enemies:FindFirstChild(_G.SelectedBoss) or _G.AllBoss == false
                        end
                    end
                end
            elseif type == "Kill Player Gun" and KillPlr2 then
                local Plr1 = game.Players.LocalPlayer
                local Plr2 = game.Players:FindFirstChild(selectedPlayer)
                repeat game:GetService("RunService").Heartbeat:wait()
                    Equip(Gun)
                    if GodModeIsDone then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = Plr2.Character.HumanoidRootPart.CFrame * CFrame.new(0, 70, -30)
                    else
                        TweenTo(Plr2.Character.HumanoidRootPart.Position + Vector3.new(0, 70, -30), 300)
                    end
                    Plr2.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    game:GetService("Players").LocalPlayer.Character[Gun].RemoteFunctionShoot:InvokeServer(Plr2.Character.HumanoidRootPart.Position, Plr2.Character.HumanoidRootPart)
                    game:GetService("Players").LocalPlayer.Character[Gun].RemoteEvent:FireServer(Plr2.Character.HumanoidRootPart.Position)
                until KillPlr2 == false
            elseif type == "Kill Player Melee" and KillPlr then
                local Plr1 = game.Players.LocalPlayer
                local Plr2 = game.Players:FindFirstChild(selectedPlayer)
                if KillPlr then StartClick = true else StartClick = false end
                repeat game:GetService("RunService").Heartbeat:wait()
                    Equip(WeaponPlayerFarm)
                    if GodModeIsDone then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = Plr2.Character.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
                    else
                        TweenTo(Plr2.Character.HumanoidRootPart.Position + Vector3.new(0, 15, 0), 300)
                    end
                    Plr2.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                until KillPlr == false
                if StartClick then StartClick = false end
            elseif type == "Auto Elite" and _G.AutoElite and Thirdsea then
                while _G.AutoElite do game:GetService("RunService").RenderStepped:Wait()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        EliteQuest = Vector3.new(-5419.21, 313.705, -2826.24)
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(EliteQuest)
                        else
                            repeat wait()
                                TweenTo(EliteQuest, 300)
                            until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - EliteQuest).magnitude <= 5 or not _G.AutoElite
                        end
                        wait(.5)
                        if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - EliteQuest).magnitude <= 5 then
                            local args = {[1] = "EliteHunter"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and _G.AutoElite then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo")
                        or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban")
                        or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre")
                        then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") and string.find(v.Name, "Diablo"))
                                or (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") and string.find(v.Name, "Urban"))
                                or (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") and string.find(v.Name, "Deandre"))
                                then
                                    if _G.AutoElite then StartClick = true else StartClick = false end
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo")
                                        or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban")
                                        or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre")
                                        then
                                            if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                                repeat wait() until game.Players.LocalPlayer.Character break;
                                            else
                                                if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                if _G.Weapon == "" or _G.Weapon == nil then
                                                    for i, v in pairs(ListMelee) do
                                                        if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                            _G.Weapon = v
                                                        end
                                                    end
                                                end
                                                Equip(_G.Weapon)
                                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                    local args = {[1] = "Buso"}
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                end
                                                if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                    v.Humanoid.WalkSpeed = 1
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                    v.HumanoidRootPart.Transparency = 1
                                                end
                                                if GodModeIsDone then
                                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0)
                                                else
                                                    TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                                end
                                                require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                            end
                                        else
                                            local args = {[1] = "AbandonQuest"}
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                    until v.Humanoid.Health <= 0 or _G.AutoElite == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    if StartClick then StartClick = false end
                                    CheckQuested = false
                                    if _G.HOP and Thirdsea then
                                        wait(1.5)
                                        Teleport() break;
                                    elseif _G.LowHop and Thirdsea then
                                        wait(1.5)
                                        LowServerHop() break;
                                    end
                                end
                            end
                        else
                            local args = {[1] = "AbandonQuest"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    end
                end
            elseif type == "Second Sea" and _G.Auto2nd and Firstsea then
                while _G.Auto2nd do  game:GetService'RunService'.RenderStepped:Wait()
                    if GodModeIsDone then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4849.29883, 5.65138149, 719.611877)
                    else
                        repeat wait()
                            TweenTo(Vector3.new(4849.29883, 5.65138149, 719.611877), 300)
                        until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(4849.29883, 5.65138149, 719.611877)).magnitude <= 5 or not _G.Auto2nd
                    end

                    wait(.5)

                    local args = {[1] = "DressrosaQuestProgress", [2] = "Detective"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    Equip("Key")
                    if GodModeIsDone then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.7124, 37.3751602, -1325.6488)
                    else
                        repeat wait()
                            TweenTo(Vector3.new(1347.7124, 37.3751602, -1325.6488), 300)
                        until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1347.7124, 37.3751602, -1325.6488)).magnitude <= 5 or not _G.Auto2nd
                    end

                    wait(.5)
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                    for i, v in pairs(ListMelee) do
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                            Equip(v)
                        end
                    end

                    wait(3)
                    if game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]")
                    and game.Workspace.Map.Ice.Door.CanCollide == false
                    and game.Workspace.Map.Ice.Door.Transparency == 1
                    then
                        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                                if _G.Auto2nd then StartClick = true else StartClick = false end
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                        repeat wait() until game.Players.LocalPlayer.Character break;
                                    else
                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                        if _G.Weapon == "" or _G.Weapon == nil then
                                            for i, v in pairs(ListMelee) do
                                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                    _G.Weapon = v
                                                end
                                            end
                                        end
                                        Equip(_G.Weapon)
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {[1] = "Buso"}
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                            v.Humanoid.WalkSpeed = 1
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                        end
                                        if GodModeIsDone then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0))
                                        else
                                            TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                        end
                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                    end
                                until v.Humanoid.Health <= 0 or _G.Auto2nd == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil
                                if StartClick then StartClick = false end
                                wait(.5)
                                local args = {[1] = "TravelDressrosa"}
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                _G.Auto2nd = false
                            end
                        end
                    else
                        Equip("Key")
                        if GodModeIsDone then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.7124, 37.3751602, -1325.6488)
                        else
                            repeat wait()
                                TweenTo(Vector3.new(1347.7124, 37.3751602, -1325.6488), 300)
                            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1347.7124, 37.3751602, -1325.6488)).magnitude <= 5 or not _G.Auto2nd
                        end
                    end
                end
            elseif type == "Third Sea" and _G.Auto3rd and Secondsea then
                while _G.Auto3rd do game:GetService'RunService'.RenderStepped:Wait()
                    if game.Workspace.Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
                        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "rip_indra [Lv. 1500] [Boss]" then
                                if _G.Auto3rd then StartClick = true else StartClick = false end
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                        repeat wait() until game.Players.LocalPlayer.Character break;
                                    else
                                        Equip(_G.Weapon)
                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                            v.HumanoidRootPart.Transparency = 1
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.Humanoid.WalkSpeed = 1
                                            v.HumanoidRootPart.CanCollide = false
                                        end
                                        if GodModeIsDone then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(10, 25, 0)
                                        else
                                            TweenTo(v.HumanoidRootPart.Position + Vector3.new(10, 25, 0), 300)
                                        end
                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                    end
                                until not v.Parent or v.Humanoid.Health <= 55000 or _G.Auto3rd == false
                                if StartClick then StartClick = false end
                            end
                        end

                        wait(.5)
                        for i = 1, 3 do wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                        end
                    else wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                    end
                end
            elseif type == "Bartilo" and _G.AutoBartilo and Secondsea then
                while _G.AutoBartilo do game:GetService'RunService'.RenderStepped:Wait()
                    local MyLevel = game.Players.localPlayer.Data.Level.Value
                    if MyLevel < 850 then
                        library:Notification("Bartilo Quest", "You Need To Level 850 Or Above")
                    elseif MyLevel >= 850 and _G.AutoBartilo then
                        if not Completed then
                            local args = {[1] = "getInventoryWeapons"}
                            for i, v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))) do
                                for i2, v2 in pairs(v) do
                                    if v2 == "Warrior Helmet" then
                                        library:Notification("Bartilo Quest", "You Already Completed")
                                        Completed = true
                                    else
                                        Completed = false
                                    end
                                end
                            end
                        end

                        if not Completed and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            BartiloQuest = Vector3.new(-458.408, 73.0201, 300.347)
                            if GodModeIsDone then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(BartiloQuest)
                            else
                                repeat wait()
                                    TweenTo(BartiloQuest, 300)
                                until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - BartiloQuest).magnitude <= 5 or not _G.AutoBartilo
                            end
                            wait(.5)
                            if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - BartiloQuest).magnitude <= 5 then
                                local args = {[1] = "StartQuest", [2] = "BartiloQuest", [3] = 1}
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                        elseif not Completed and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            BartiloMob = "Swan Pirate [Lv. 775]"
                            BartiloBoss = "Jeremy [Lv. 850] [Boss]"
                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") then
                                if game:GetService("Workspace").Enemies:FindFirstChild(BartiloMob) then
                                    pcall(function ()
                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == BartiloMob then
                                                if _G.AutoBartilo then StartClick = true else StartClick = false end
                                                repeat game:GetService("RunService").Heartbeat:wait()
                                                    if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                                        repeat wait() until game.Players.LocalPlayer.Character break;
                                                    else
                                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                        if _G.Weapon == "" or _G.Weapon == nil then
                                                            for i, v in pairs(ListMelee) do
                                                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                                    _G.Weapon = v
                                                                end
                                                            end
                                                        end
                                                        Equip(_G.Weapon)
                                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                            local args = {[1] = "Buso"}
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                        end
                                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                            v.Humanoid.WalkSpeed = 1
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                            v.HumanoidRootPart.Transparency = 1
                                                            BartiloBringPos = v.HumanoidRootPart.CFrame
                                                        end
                                                        if GodModeIsDone then
                                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0))
                                                        else
                                                            TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                                        end
                                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                                    end
                                                until v.Humanoid.Health <= 0 or _G.AutoBartilo == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                                if StartClick then StartClick = false end
                                                wait(.5)
                                                if GodModeIsDone then
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(BartiloQuest)
                                                else
                                                    repeat wait()
                                                        TweenTo(BartiloQuest, 300)
                                                    until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - BartiloQuest).magnitude <= 5 or not _G.AutoBartilo
                                                end
                                                wait(.5)
                                                local args = {[1] = "BartiloQuestProgress", [2] = "Bartilo"}
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Jeremy") then
                                                    pcall(function ()
                                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                            if v.Name == BartiloBoss then
                                                                if _G.AutoBartilo then StartClick = true else StartClick = false end
                                                                repeat game:GetService("RunService").Heartbeat:wait()
                                                                    if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                                                        repeat wait() until game.Players.LocalPlayer.Character break;
                                                                    else
                                                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                                        if _G.Weapon == "" or _G.Weapon == nil then
                                                                            for i, v in pairs(ListMelee) do
                                                                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                                                    _G.Weapon = v
                                                                                end
                                                                            end
                                                                        end
                                                                        Equip(_G.Weapon)
                                                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                                            local args = {[1] = "Buso"}
                                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                        end
                                                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                                            v.Humanoid.WalkSpeed = 1
                                                                            v.HumanoidRootPart.CanCollide = false
                                                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                                            v.HumanoidRootPart.Transparency = 1
                                                                        end
                                                                        if GodModeIsDone then
                                                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(15, 25, 0))
                                                                        else
                                                                            TweenTo(v.HumanoidRootPart.Position + Vector3.new(15, 25, 0), 300)
                                                                        end
                                                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                                                    end
                                                                until v.Humanoid.Health <= 0 or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or _G.AutoBartilo == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                                                if StartClick then StartClick = false end
                                                                wait(.5)
                                                                for i, v in pairs(game:GetService("Workspace").Map.Dressrosa.BartiloPlates:GetDescendants()) do
                                                                    if v:IsA("TouchTransmitter") then
                                                                        Plate1 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1
                                                                        Plate2 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2
                                                                        Plate3 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3
                                                                        Plate4 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4
                                                                        Plate5 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5
                                                                        Plate6 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6
                                                                        Plate7 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7
                                                                        Plate8 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8

                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate1, 0) --0 is touch
                                                                        wait()
                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate1, 1) -- 1 is untouch

                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate2, 0) --0 is touch
                                                                        wait()
                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate2, 1) -- 1 is untouch

                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate3, 0) --0 is touch
                                                                        wait()
                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate3, 1) -- 1 is untouch

                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate4, 0) --0 is touch
                                                                        wait()
                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate4, 1) -- 1 is untouch

                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate5, 0) --0 is touch
                                                                        wait()
                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate5, 1) -- 1 is untouch

                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate6, 0) --0 is touch
                                                                        wait()
                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate6, 1) -- 1 is untouch

                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate7, 0) --0 is touch
                                                                        wait()
                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate7, 1) -- 1 is untouch

                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate8, 0) --0 is touch
                                                                        wait()
                                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate8, 1) -- 1 is untouch
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end)
                                                end
                                            end
                                        end
                                    end)
                                else
                                    BartiloWaitPos = Vector3.new(977.465, 121.331, 1302.35)
                                    if GodModeIsDone then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(BartiloWaitPos)
                                    else
                                        TweenTo(BartiloWaitPos, 300)
                                    end
                                end
                            else
                                local args = {[1] = "AbandonQuest"}
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                        end
                    end
                end
            elseif type == "Rainbow Haki" and _G.AutoRainbow and Thirdsea then
                while _G.AutoRainbow do game:GetService'RunService'.RenderStepped:Wait()
                    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        if GodModeIsDone then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
                        else
                            TweenTo(Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875), 300)
                        end
                        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 200 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                        end
                    elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                            AutoRainbow_Boss = "Stone [Lv. 1550] [Boss]"
                        elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") then
                            AutoRainbow_Boss = "Island Empress [Lv. 1675] [Boss]"
                        elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                            AutoRainbow_Boss = "Kilo Admiral [Lv. 1750] [Boss]"
                        elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                            AutoRainbow_Boss = "Captain Elephant [Lv. 1875] [Boss]"
                        elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                            AutoRainbow_Boss = "Beautiful Pirate [Lv. 1950] [Boss]"
                        else
                            local args = {[1] = "AbandonQuest"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end

                        if game:GetService("Workspace").Enemies:FindFirstChild(AutoRainbow_Boss) then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == AutoRainbow_Boss then
                                    if _G.AutoRainbow then StartClick = true else StartClick = false end
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                            repeat wait() until game.Players.LocalPlayer.Character break;
                                        else
                                            if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                            if _G.Weapon == "" or _G.Weapon == nil then
                                                for i, v in pairs(ListMelee) do
                                                    if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                        _G.Weapon = v
                                                    end
                                                end
                                            end
                                            Equip(_G.Weapon)
                                            if GodModeIsDone then
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 25, 0))
                                            else
                                                TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 25, 0), 300)
                                            end
                                            require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                        end
                                    until _G.AutoRainbow == false or v.Humanoid.Health <= 0 or not v.Parent or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    if StartClick then StartClick = false end
                                end
                            end
                        elseif _G.HOP and Thirdsea then
                            wait(1.5)
                            Teleport() break;
                        elseif _G.LowHop and Thirdsea then
                            wait(1.5)
                            LowServerHop() break;
                        end
                    end
                end
            elseif type == "Auto Saber" and _G.AutoSaber and Firstsea then
                while _G.AutoSaber do game:GetService'RunService'.RenderStepped:Wait()
                    for i = 1, 5 do
                        local args = {[1] = "ProQuestProgress", [2] = "Plate", [3] = i}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end

                    local args = {[1] = "ProQuestProgress", [2] = "GetTorch"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    local args = {[1] = "ProQuestProgress", [2] = "DestroyTorch"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    local args = {[1] = "ProQuestProgress", [2] = "GetCup"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    Equip("Cup")

                    local args = {[1] = "ProQuestProgress", [2] = "FillCup", [3] = game:GetService("Players").LocalPlayer.Character.Cup}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    local args = {[1] = "ProQuestProgress", [2] = "SickMan"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    local args = {[1] = "ProQuestProgress", [2] = "RichSon"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    if game.Workspace.Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
                        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Mob Leader [Lv. 120] [Boss]" then
                                if _G.AutoSaber then StartClick = true else StartClick = false end
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                        repeat wait() until game.Players.LocalPlayer.Character break;
                                    else
                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                        if _G.Weapon == "" or _G.Weapon == nil then
                                            for i, v in pairs(ListMelee) do
                                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                    _G.Weapon = v
                                                end
                                            end
                                        end
                                        Equip(_G.Weapon)
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {[1] = "Buso"}
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                            v.Humanoid.WalkSpeed = 1
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                        end
                                        if GodModeIsDone then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 25, 15))
                                        else
                                            TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 25, 15), 300)
                                        end
                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                    end
                                until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoSaber == false or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone)
                                if StartClick then StartClick = false end
                            end
                        end
                    end

                    local args = {[1] = "ProQuestProgress", [2] = "RichSon"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    wait(2)
                    local args = {[1] = "ProQuestProgress"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    Equip("Relic")

                    local vDoor = game:GetService("Workspace").Map.Jungle.Final.Invis
                    vDoor.CanCollide = false
                    vDoor.Size = Vector3.new(20,20,20)

                    wait(1)
                    if GodModeIsDone then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1403.92944, 29.8519993, 6.61151266)
                    else
                        repeat wait()
                            TweenTo(Vector3.new(-1403.92944, 29.8519993, 6.61151266), 300)
                        until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1403.92944, 29.8519993, 6.61151266)).magnitude <= 5 or not _G.AutoSaber
                    end
                    wait(.5)

                    if game.Workspace.Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
                        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Saber Expert [Lv. 200] [Boss]" then
                                if _G.AutoSaber then StartClick = true else StartClick = false end
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                        repeat wait() until game.Players.LocalPlayer.Character
                                    else
                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                        if _G.Weapon == "" or _G.Weapon == nil then
                                            for i, v in pairs(ListMelee) do
                                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                    _G.Weapon = v
                                                end
                                            end
                                        end
                                        Equip(_G.Weapon)
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {[1] = "Buso"}
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                            v.Humanoid.WalkSpeed = 1
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                        end
                                        if GodModeIsDone then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 25, 15))
                                        else
                                            TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 25, 15), 300)
                                        end
                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                    end
                                until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoSaber == false
                                if StartClick then StartClick = false end
                            end
                        end
                    end

                    local args = {[1] = "KenTalk", [2] = "Buy"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
        end)
    end)
end

local Logia;
function StartGodMode()
    spawn(function ()
        for i, v in pairs(LogiaFruit) do
            if game.Players.localPlayer.Data.DevilFruit.Value == v then
                Logia = true break;
            else
                Logia = false
            end
        end
        if not GodModeIsDone and game:GetService("Players").LocalPlayer.Data.Stats.Defense.Level.Value == 1 then
            local Players = game:GetService'Players'.LocalPlayer
            local OldFrame;
            local Holding = false
            local Nearest = nil
            Players.Character.Humanoid:SetStateEnabled(15, false)
            Players.Character.Humanoid:SetStateEnabled(16, false)
            Players.CharacterRemoving:Connect(function ()
                if Players.Character then
                    local Torso = Players.Character:FindFirstChild'Torso'
                    if Torso ~= nil then OldFrame = Torso.CFrame end
                    if Players.Character:FindFirstChild'Foil' then Holding = true end
                end
            end)
            Players.CharacterAdded:Connect(function ()
                while Players.Character == nil do wait() end
                while Players.Character.Parent == nil do wait() end
                local Hum = Players.Character:FindFirstChild'Humanoid'
                local HumRP = Players.Character:FindFirstChild'HumanoidRootPart'
                if Hum ~= nil and HumRP ~= nil then
                    Hum:SetStateEnabled(15, false)
                    Hum:SetStateEnabled(16, false)
                    for i = 1, 10 do
                        HumRP.CFrame = OldFrame
                    end
                    if Holding then
                        Holding = false
                        local Foil = Players.Backpack:FindFirstChild'Foil'
                        if Foil ~= nil then
                            Foil.Parent = Players.Character
                        end
                    end
                end
            end)

            wait(1)
            if not Logia then
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if not Nearest then Nearest = v.HumanoidRootPart.Position end
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude <= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Nearest).magnitude then
                        Nearest = v.HumanoidRootPart.Position
                    end
                end

                repeat wait()
                    TweenTo(Nearest + Vector3.new(5, 0, 0), 300)
                until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Nearest).magnitude <= 25 or TweenStopped
            elseif Logia then
                if Thirdsea then
                    repeat wait()
                        TweenTo(game:GetService("Workspace").Enemies["Forest Pirate [Lv. 1825]"].HumanoidRootPart.Position + Vector3.new(5, 0, 0), 300)
                    until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace").Enemies["Forest Pirate [Lv. 1825]"].HumanoidRootPart.Position).magnitude <= 25 or TweenStopped
                elseif Secondsea then
                    repeat wait()
                        TweenTo(game:GetService("Workspace").Enemies["Marine Captain [Lv. 900]"].HumanoidRootPart.Position + Vector3.new(5, 0, 0), 300)
                    until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace").Enemies["Marine Captain [Lv. 900]"].HumanoidRootPart.Position).magnitude <= 25 or TweenStopped
                elseif Firstsea then
                    repeat wait()
                        TweenTo(game:GetService("Workspace").Enemies["Galley Captain [Lv. 650]"].HumanoidRootPart.Position + Vector3.new(5, 0, 0), 300)
                    until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace").Enemies["Galley Captain [Lv. 650]"].HumanoidRootPart.Position).magnitude <= 25 or TweenStopped
                end
            end

            wait(3)
            if game.Players.LocalPlayer.Character.Humanoid.Health < -1 then
                GodModeIsDone = true
                library:Notification("Player Has God Mode xD", "Ok Thanks")
            else
                StartGodMode()
            end
        elseif game:GetService("Players").LocalPlayer.Data.Stats.Defense.Level.Value > 1 then
            library:Notification("Make Sure Your Defense Point = 1", "Ok I Know")
        elseif GodModeIsDone then
            library:Notification("Player Has God Mode xD", "Ok Thanks")
        end
    end)
end

local HasChip = false
local JoinedRaid = false
local FruitCheck = false
local JoiningRaid = false
function FullyRaid()
    spawn(function ()
        pcall(function ()
            while _G.FullyRaid do wait(.1)
                --Doing Raid Check
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    JoinedRaid = true
                end

                -- Backpack Check
                if not HasChip and JoinedRaid == false and JoiningRaid == false then
                    -- Buy Chip & Check
                    if not FruitCheck then
                        Funny("Buy Chip", _G.FullyChip)
                        FruitCheck = true
                    else
                        local args = {[1] = "Cousin", [2] = "Buy"}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                    for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                        if string.find(v.Name, "Microchip") then
                            HasChip = true
                        elseif string.find(v.Name, "Fruit") then
                            Funny("Buy Chip", _G.FullyChip)
                            HasChip = true
                        end
                    end
                end

                -- Workspace Check
                if not HasChip and JoinedRaid == false and JoiningRaid == false then
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v:IsA "Tool" then
                            if (v.Handle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
                                v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            else
                                TweenTo(v.Handle.Position, 300)
                            end
                        end
                    end
                end

                -- Found Chip
                if HasChip and JoinedRaid == false and JoiningRaid == false then
                    for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                        if string.find(v.Name, "Microchip") then
                            if Thirdsea then
                                RaidPortal = Vector3.new(-5033.16, 314.953, -2949.96)
                                if GodModeIsDone then
                                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(RaidPortal)
                                else
                                    repeat wait()
                                        TweenTo(RaidPortal, 300)
                                    until (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - RaidPortal).magnitude <= 5 or not _G.FullyRaid
                                end
                                if _G.AutoSetSpawn then
                                   local args = {[1] = "SetSpawnPoint"}
                                   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector , 0.1)
                                HasChip = false
                                JoiningRaid = true
                            elseif Secondsea then
                                RaidPortal = Vector3.new(-6457.14, 252.737, -4451.57)
                                if GodModeIsDone then
                                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(RaidPortal)
                                else
                                    repeat wait()
                                        TweenTo(RaidPortal, 300)
                                    until (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - RaidPortal).magnitude <= 5 or not _G.FullyRaid
                                end
                                if _G.AutoSetSpawn then
                                   local args = {[1] = "SetSpawnPoint"}
                                   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                fireclickdetector(game:GetService("Workspace").Map["CircleIsland"].RaidSummon2.Button.Main.ClickDetector, 0.1)
                                HasChip = false
                                JoiningRaid = true
                            end
                        end
                    end
                end

                -- Wait TP To Raids Area
                if JoiningRaid then
                    repeat wait(1) until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true
                    JoiningRaid = false
                    JoinedRaid = true
                end

                -- Doing Raid
                if JoinedRaid then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                        KillAura = true
                        NextIsland = true
                        AutoAwaken = true
                    else
                        KillAura = false
                        NextIsland = false
                        AutoAwaken = false
                        JoinedRaid = false
                    end
                end
            end
        end)
    end)
end

local HasBoat = false
function AutoSeaBeast()
    spawn(function ()
        if AutoSea and (Thirdsea or Secondsea) then
            if not GodModeIsDone then
                while AutoSea do wait(.1)
                    if Thirdsea then
                        SpawnBoatPos = Vector3.new(-125.65, 6.73, 5259.55)
                    elseif Secondsea then
                        SpawnBoatPos = Vector3.new(-11.9033, 10.2767, 2926.24)
                    end
                    for i, v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") then
                            FoundSea = true
                        else
                            FoundSea = false
                        end
                    end
                    if FoundSea then
                        UseSkill("Space", 0.1) wait(1)
                        repeat wait()
                            repeat wait()
                                TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 50, 0))
                            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude <= 5 or not v.Parent or not AutoSea
                            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") and v.ToolTip == "Melee" then
                                    Equip(v.Name)
                                    UseSkil("Z", 0.1) wait(1)
                                    UseSkil("X", 0.1) wait(1)
                                    UseSkil("C", 0.1) wait(1)
                                end
                            end
                            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") and v.ToolTip == "Blox Fruit" then
                                    Equip(v.Name)
                                    UseSkil("Z", 0.1) wait(1)
                                    UseSkil("X", 0.1) wait(1)
                                    UseSkil("C", 0.1) wait(1)
                                    if #game.Players.LocalPLayer.Data.DevilFruit.Value == "Dragon-Dragon" then
                                        UseSkil("V") wait(1)
                                    end
                                end
                            end
                            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") and v.ToolTip == "Sword" then
                                    Equip(v.Name)
                                    UseSkil("Z", 0.1) wait(1)
                                    UseSkil("X", 0.1) wait(1)
                                end
                            end
                            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") and v.ToolTip == "Gun" then
                                    Equip(v.Name)
                                    UseSkil("Z", 0.1) wait(1)
                                    UseSkil("X", 0.1) wait(1)
                                end
                            end
                        until not v.Part or v:FindFirstChild("HumanoidRootPart") == nil or not AutoSea
                    else
                        if not HasBoat then
                            repeat wait()
                                TweenTo(SpawnBoatPos, 300)
                            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SpawnBoatPos).magnitude <= 5 or not AutoSea
                            wait(.5)
                            if Thirdsea then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "Swan")
                            elseif Secondsea then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "PirateBrigade")
                            end
                            wait(3)
                            if Thirdsea then
                                repeat wait()
                                    Tween(game.Workspace["Boats"]:FindFirstChild("Swan")["VehicleSeat"].Position, 100)
                                until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace["Boats"]:FindFirstChild("Swan")["VehicleSeat"].Position).magnitude <= 5 or not AutoSea
                            elseif Secondsea then
                                repeat wait()
                                    Tween(game.Workspace["Boats"]:FindFirstChild("PirateBrigade")["VehicleSeat"].Position, 100)
                                until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace["Boats"]:FindFirstChild("PirateBrigade")["VehicleSeat"].Position).magnitude <= 5 or not AutoSea
                            end
                            wait(1)
                            UseSkill("W", 30)
                            HasBoat = true
                        elseif HasBoat then
                            if Thirdsea then
                                if game.Workspace["Boats"]:FindFirstChild("Swan") then
                                    Tween(game.Workspace["Boats"]:FindFirstChild("Swan")["VehicleSeat"].Position, 100)
                                else
                                    HasBoat = false
                                end
                            elseif Secondsea then
                                if game.Workspace["Boats"]:FindFirstChild("PirateBrigade") then
                                    Tween(game.Workspace["Boats"]:FindFirstChild("PirateBrigade")["VehicleSeat"].Position, 100)
                                else
                                    HasBoat = false
                                end
                            end
                        end
                    end
                end
            else
                library:Notification("This Function Not Support God Mode :(", "Ok")
            end
        end
    end)
end

function StartFly()
    local mouse=game.Players.LocalPlayer:GetMouse''
    localplayer=game.Players.LocalPlayer
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
    local keys={a=false,d=false,w=false,s=false}
    local e1
    local e2
    local function start()
        local pos = Instance.new("BodyPosition",torso)
        local gyro = Instance.new("BodyGyro",torso)
        pos.Name = "WEEE"
        gyro.Name = "WEEE"
        pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
        pos.position = torso.Position
        gyro.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
        gyro.cframe = torso.CFrame
        repeat
            wait()
            localplayer.Character.Humanoid.PlatformStand = true
            local new = gyro.cframe - gyro.cframe.p + pos.position
            if not keys.w and not keys.s and not keys.a and not keys.d then
                speed = 1
            end
            if keys.w then
                new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed = speed + _G.FlySpeed
            end
            if keys.s then
                new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed = speed + _G.FlySpeed
            end
            if keys.d then
                new = new * CFrame.new(speed, 0, 0)
                speed = speed + _G.FlySpeed
            end
            if keys.a then
                new = new * CFrame.new(-speed, 0, 0)
                speed = speed + _G.FlySpeed
            end
            if speed > _G.FlySpeed then
                speed = _G.FlySpeed
            end
            pos.position = new.p
            if keys.w then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(speed * 15), 0, 0)
            elseif keys.s then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 15), 0, 0)
            else
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame
            end
        until not Flight and not ToggleFly
        if gyro then
            gyro:Destroy()
        end
        if pos then
            pos:Destroy()
        end
        flying = false
        localplayer.Character.Humanoid.PlatformStand = false
        speed = 0
    end
    e1 = mouse.KeyDown:connect(function (key)
        if not torso or not torso.Parent then
            flying=false e1:disconnect() e2:disconnect() return
        end
        if key == "w" then
            keys.w = true
        elseif key == "s" then
            keys.s = true
        elseif key == "a" then
            keys.a = true
        elseif key == "d" then
            keys.d = true
        end
    end)
    e2 = mouse.KeyUp:connect(function (key)
        if key == "w" then
            keys.w = false
        elseif key == "s" then
            keys.s = false
        elseif key == "a" then
            keys.a = false
        elseif key == "d" then
            keys.d = false
        end
    end)
    start()
end

function MasteryFarm(type)
    spawn(function ()
        pcall(function ()
            if type == "Gun" and GunMastery then
                while GunMastery do wait()
                    if GunMastery then
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            levelCheck()
                            local MyLevel = game.Players.localPlayer.Data.Level.Value
                            if MyLevel >= 375 and MyLevel < 450 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 and not GodModeIsDone then
                                Entrance("Go to Underwater")
                            elseif MyLevel >= 450 and MyLevel < 700 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 and not GodModeIsDone then
                                Entrance("Out Underwater")
                            elseif MyLevel >= 1250 and MyLevel < 1350 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 and not GodModeIsDone then
                                Entrance("Go to Ship")
                            elseif MyLevel >= 1350 and MyLevel < 1500 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 and not GodModeIsDone then
                                Entrance("Out Ship")
                            end
                            repeat wait() until game:IsLoaded()
                            if GodModeIsDone then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(posQuest)
                            else
                                repeat wait()
                                    TweenTo(posQuest, 300)
                                until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude <= 5 or not GunMastery
                            end
                            wait(.5)
                            if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude <= 5 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameQuest, levelQuest)
                            end
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and GunMastery then levelCheck()
                            if game:GetService("Workspace").Enemies:FindFirstChild(nameMob) then
                                pcall(function ()
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do levelCheck()
                                        if v.Name == nameMob then
                                            if GunMastery then StartMagnet = true else StartMagnet = false end
                                            repeat game:GetService("RunService").Heartbeat:wait() levelCheck()
                                                HealthMin = v.Humanoid.MaxHealth * HealthPersen / 100
                                                if (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone) then
                                                    repeat wait() until game.Players.LocalPlayer.Character break;
                                                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameMon) then
                                                    if game:GetService("Workspace").Enemies:FindFirstChild(nameMob) then
                                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                        if MasWeapon == "" or MasWeapon == nil then
                                                            for i, v in pairs(ListMelee) do
                                                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                                    MasWeapon = v
                                                                end
                                                            end
                                                        end
                                                        if v.Humanoid.Health <= HealthMin then
                                                            if StartClick then StartClick = false end
                                                            Equip(Gun)
                                                            game:GetService("Players").LocalPlayer.Character[Gun].RemoteFunctionShoot:InvokeServer(v.HumanoidRootPart.Position, v.HumanoidRootPart)
                                                            game:GetService("Players").LocalPlayer.Character[Gun].RemoteEvent:FireServer(v.HumanoidRootPart.Position)
                                                        else
                                                            StartClick = true
                                                            Equip(MasWeapon)
                                                        end
                                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                                        end
                                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                            v.Humanoid.WalkSpeed = 1
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                            v.HumanoidRootPart.Transparency = 1
                                                            MasPos = v.HumanoidRootPart.CFrame
                                                        end
                                                        if GodModeIsDone then
                                                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0)
                                                        else
                                                            TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                                        end
                                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                                    else levelCheck()
                                                        if GodModeIsDone then
                                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(waitPos)
                                                        else
                                                            TweenTo(waitPos, 300)
                                                        end
                                                    end
                                                else
                                                    local args = {[1] = "AbandonQuest"}
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                end
                                            until v.Humanoid.Health <= 0 or GunMastery == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            if StartMagnet then StartMagnet = false end
                                            if StartClick then StartClick = false end
                                        end
                                    end
                                end)
                            else levelCheck()
                                if GodModeIsDone then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(waitPos)
                                else
                                    TweenTo(waitPos, 300)
                                end
                            end
                        end
                    end
                end
            elseif type == "Fruit" and FruitMastery then
                if not GodModeIsDone then
                    while FruitMastery do wait()
                        if FruitMastery then
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                levelCheck()
                                local MyLevel = game.Players.localPlayer.Data.Level.Value
                                if MyLevel >= 375 and MyLevel < 450 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 and not GodModeIsDone then
                                    Entrance("Go to Underwater")
                                elseif MyLevel >= 450 and MyLevel < 700 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 and not GodModeIsDone then
                                    Entrance("Out Underwater")
                                elseif MyLevel >= 1250 and MyLevel < 1350 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 and not GodModeIsDone then
                                    Entrance("Go to Ship")
                                elseif MyLevel >= 1350 and MyLevel < 1500 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 and not GodModeIsDone then
                                    Entrance("Out Ship")
                                end
                                repeat wait() until game:IsLoaded()
                                repeat wait()
                                    TweenTo(posQuest, 300)
                                until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude <= 5 or not FruitMastery
                                wait(.5)
                                if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude <= 5 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameQuest, levelQuest)
                                end
                            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and FruitMastery then levelCheck()
                                if game:GetService("Workspace").Enemies:FindFirstChild(nameMob) then
                                    pcall(function ()
                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do levelCheck()
                                            if v.Name == nameMob then
                                                if FruitMastery then StartMagnet = true else StartMagnet = false end
                                                repeat game:GetService("RunService").Heartbeat:wait() levelCheck()
                                                    HealthMin = v.Humanoid.MaxHealth * HealthPersen / 100
                                                    if (game.Players.LocalPlayer.Character.Humanoid.Health <= 0) then
                                                        repeat wait() until game.Players.LocalPlayer.Character break;
                                                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameMon) then
                                                        if game:GetService("Workspace").Enemies:FindFirstChild(nameMob) then
                                                            if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                            if MasWeapon == "" or MasWeapon == nil then
                                                                for i, v in pairs(ListMelee) do
                                                                    if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                                        MasWeapon = v
                                                                    end
                                                                end
                                                            end
                                                            if v.Humanoid.Health <= HealthMin then
                                                                if game.Players.LocalPlayer.Data.DevilFruit.Value == "Light-Light" or game.Players.LocalPlayer.Data.DevilFruit.Value == "Ice-Ice" then
                                                                    if not StartClick then StartClick = true end
                                                                    if UseFruit then UseFruit = false end
                                                                    Equip(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                                                else
                                                                    if StartClick then StartClick = false end
                                                                    UseFruit = true
                                                                    Equip(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                                                end
                                                            elseif v.Humanoid.Health > HealthMin then
                                                                if UseFruit then UseFruit = false end
                                                                StartClick = true
                                                                Equip(MasWeapon)
                                                            end
                                                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                                local args = {[1] = "Buso"}
                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                            end
                                                            if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                                v.Humanoid.WalkSpeed = 1
                                                                v.HumanoidRootPart.CanCollide = false
                                                                if v.Humanoid.Health <= HealthMin then
                                                                    v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                                                                else
                                                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                                end
                                                                v.HumanoidRootPart.Transparency = 1
                                                                MasPos = v.HumanoidRootPart.CFrame
                                                                MasMob = v.HumanoidRootPart.Position
                                                            end
                                                            if v.Humanoid.Health <= HealthMin then
                                                                if game.Players.LocalPlayer.Data.DevilFruit.Value == "Light-Light" or game.Players.LocalPlayer.Data.DevilFruit.Value == "Ice-Ice" then
                                                                    TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                                                else
                                                                    TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 0, 35), 300)
                                                                end
                                                            else
                                                                TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                                            end
                                                            require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                                        else levelCheck()
                                                            TweenTo(waitPos, 300)
                                                        end
                                                    else
                                                        local args = {[1] = "AbandonQuest"}
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                    end
                                                until v.Humanoid.Health <= 0 or FruitMastery == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                                if StartMagnet then StartMagnet = false end
                                                if StartClick then StartClick = false end
                                            end
                                        end
                                    end)
                                else levelCheck()
                                    TweenTo(waitPos, 300)
                                end
                            end
                        end
                    end
                elseif GodModeIsDone then
                    library:Notification("This Function Not Support God Mode :(", "Ok")
                end
            end
        end)
    end)
end

function FarmTushita()
    spawn(function ()
        pcall(function ()
            if _G.Tushita then
                while _G.Tushita do game:GetService'RunService'.RenderStepped:Wait()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]") then
                        if _G.Tushita then StartClick = true else StartClick = false end
                        repeat game:GetService("RunService").Heartbeat:wait()
                            if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                repeat wait() until game.Players.LocalPlayer.Character break;
                            else
                                if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                if _G.BossWeapon == "" or _G.BossWeapon == nil then
                                    for i, v in pairs(ListMelee) do
                                        if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                            _G.BossWeapon = v
                                        end
                                    end
                                end
                                Equip(_G.BossWeapon)
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    local args = {[1] = "Buso"}
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                if game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]"):FindFirstChild("HumanoidRootPart") ~= nil then
                                    game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]").Humanoid.WalkSpeed = 1
                                    game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]").HumanoidRootPart.CanCollide = false
                                    game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]").HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]").HumanoidRootPart.Transparency = 1
                                end
                                if GodModeIsDone then
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]").HumanoidRootPart.CFrame * CFrame.new(15, 25, 0)
                                else
                                    TweenTo(game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]").HumanoidRootPart.Position + Vector3.new(15, 25, 0), 300)
                                end
                            end
                        until game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]").Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]").Parent or game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]"):FindFirstChild("HumanoidRootPart") == nil or _G.Tushita == false
                        if StartClick then StartClick = false end
                    else
                        if _G.HOP and Thirdsea then
                            wait(1.5)
                            Teleport()
                        elseif _G.LowHop and Thirdsea then
                            wait(1.5)
                            LowServerHop()
                        end
                    end
                end
            end
        end)
    end)
end

function FarmBuddySwordHOP()
    spawn(function ()
        pcall(function ()
            if _G.BuddySword then
                while _G.BuddySword do game:GetService'RunService'.RenderStepped:Wait()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
                        if _G.BuddySword then StartClick = true else StartClick = false end
                        repeat game:GetService("RunService").Heartbeat:wait()
                            if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                repeat wait() until game.Players.LocalPlayer.Character break;
                            else
                                if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                if _G.BossWeapon == "" or _G.BossWeapon == nil then
                                    for i, v in pairs(ListMelee) do
                                        if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                            _G.BossWeapon = v
                                        end
                                    end
                                end
                                Equip(_G.BossWeapon)
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    local args = {[1] = "Buso"}
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]"):FindFirstChild("HumanoidRootPart") ~= nil then
                                    game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]").Humanoid.WalkSpeed = 1
                                    game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]").HumanoidRootPart.CanCollide = false
                                    game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]").HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]").HumanoidRootPart.Transparency = 1
                                end
                                if GodModeIsDone then
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]").HumanoidRootPart.CFrame * CFrame.new(15, 25, 0)
                                else
                                    TweenTo(game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]").HumanoidRootPart.Position + Vector3.new(15, 25, 0), 300)
                                end
                            end
                        until game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]").Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]").Parent or game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]"):FindFirstChild("HumanoidRootPart") == nil or _G.BuddySword == false
                        if StartClick then StartClick = false end
                    else
                        if _G.HOP and Thirdsea then
                            wait(1.5)
                            Teleport()
                        elseif _G.LowHop and Thirdsea then
                            wait(1.5)
                            LowServerHop()
                        end
                    end
                end
            end
        end)
    end)
end

-- HOP FUNCTION
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService("HttpService"):JSONDecode(readfile("NotSameServers.json"))
end)

if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(AllIDs))
end

function TPReturner()
    local Site
    if foundAnything == "" then
        Site =
            game.HttpService:JSONDecode(
            game:HttpGet(
                "https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100"
            )
        )
    else
        Site =
            game.HttpService:JSONDecode(
            game:HttpGet(
                "https://games.roblox.com/v1/games/" ..
                    PlaceID .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. foundAnything
            )
        )
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0
    for i, v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _, Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(
                        PlaceID,
                        ID,
                        game.Players.LocalPlayer
                    )
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

function LowServerHop()
    library:Notification("Finding Lower Server...", "Ok")
    local maxplayers, gamelink, goodserver, data_table = math.huge, "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    if not _G.FailedServerID then _G.FailedServerID = {} end

    local function serversearch()
        data_table = game:GetService"HttpService":JSONDecode(game:HttpGetAsync(gamelink))
        for _, v in pairs(data_table.data) do
            pcall(function()
                if type(v) == "table" and v.id and v.playing and tonumber(maxplayers) > tonumber(v.playing) and not table.find(_G.FailedServerID, v.id) then
                    maxplayers = v.playing
                    goodserver = v.id
                end
            end)
        end
    end

    function getservers()
        pcall(serversearch)
        for i, v in pairs(data_table) do
            if i == "nextPageCursor" then
                if gamelink:find"&cursor=" then
                    local a = gamelink:find"&cursor="
                    local b = gamelink:sub(a)
                    gamelink = gamelink:gsub(b, "")
                end
                gamelink = gamelink .. "&cursor=" .. v
                pcall(getservers)
            end
        end
    end

    pcall(getservers)
    wait()
    if goodserver == game.JobId or maxplayers == #game:GetService"Players":GetChildren() - 1 then
    end
    table.insert(_G.FailedServerID, goodserver)
    game:GetService"TeleportService":TeleportToPlaceInstance(game.PlaceId, goodserver)
end

function PirateRaid()
    spawn(function ()
        pcall(function ()
            while _G.PirateRaid do game:GetService'RunService'.RenderStepped:Wait()
                local PiratesWaitPos = Vector3.new(-4999.45, 318.181, -3010.54)
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PiratesWaitPos).magnitude > 1000 then
                    if GodModeIsDone then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(PiratesWaitPos)
                    else
                        TweenTo(PiratesWaitPos, 300)
                    end
                else
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 750 then
                            if _G.PirateRaid then StartMagnet = true else StartMagnet = false end
                            if _G.PirateRaid then StartClick = true else StartClick = false end
                            repeat game:GetService("RunService").Heartbeat:wait()
                                if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone then
                                    repeat wait() until game.Players.LocalPlayer.Character break;
                                else
                                    if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                    if _G.Weapon == "" or _G.Weapon == nil then
                                        for i, v in pairs(ListMelee) do
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                _G.Weapon = v
                                            end
                                        end
                                    end
                                    Equip(_G.Weapon)
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        local args = {[1] = "Buso"}
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                        v.Humanoid.WalkSpeed = 1
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v.HumanoidRootPart.Transparency = 1
                                        PirateRaidPos = v.HumanoidRootPart.CFrame
                                    end
                                    if GodModeIsDone then
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0)
                                    else
                                        TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                    end
                                    require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                end
                            until v.Humanoid.Health <= 0 or _G.PirateRaid == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil
                            if StartMagnet then StartMagnet = false end
                            if StartClick then StartClick = false end
                        else
                            if GodModeIsDone then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(PiratesWaitPos)
                            else
                                TweenTo(PiratesWaitPos, 300)
                            end
                        end
                    end
                end
            end
        end)
    end)
end

do wait()
    if _G.AutoSaber then
        All("Auto Saber")
    end
    if _G.AutoFarm then
        All("Auto Farm")
    end
    if _G.BoneFarm then
        All("Bone Farm")
    end
    if _G.MobAura then
        All("Mob Aura")
    end
    if _G.ChooseMob then
        All("Choose Mob")
    end
    if _G.BringFruit then
        All("Bring Fruit")
    end
    if _G.BossFarm then
        All("Farm Boss")
    end
    if _G.AllBoss then
        All("All Boss")
    end
    if KillPlr then
        All("Kill Player Melee")
    end
    if KillPlr2 then
        All("Kill Player Gun")
    end
    if _G.AutoElite then
        All("Auto Elite")
    end
    if _G.Auto2nd then
        All("Second Sea")
    end
    if _G.Auto3rd then
        All("Third Sea")
    end
    if _G.AutoBartilo then
        All("Bartilo")
    end
    if _G.AutoRainbow then
        All("Rainbow Haki")
    end
    if _G.Tushita then
        FarmTushita()
    end
    if _G.BuddySword then
        FarmBuddySwordHOP()
    end
    if _G.PirateRaid then
        PirateRaid()
    end
    if _G.BringFruitHOP then
        loadstring(game:HttpGet'https://raw.githubusercontent.com/AstroStorage/Main-Games/main/BloxFruits/OtherFunction/BringFruit-HOP.lua')()
        repeat wait() until _G.BringFruitHOP == false
        if _G.HOP then
            Teleport()
        elseif _G.LowHop then
            LowServerHop()
        end
    end
end

--[ SPAWN ]--
spawn(function () -- Use Fruit Mastery Frarm
    while wait() do
        if UseFruit and FruitMastery and MasMob ~= nil then
            game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(MasMob)
            if SkillZ then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(ZHold)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
            end
            wait(1)
            game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(MasMob)
            if SkillX then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                wait(XHold)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
            end
            wait(1)
            game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(MasMob)
            if SkillC then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                wait(CHold)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
            end
            wait(1)
            game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(MasMob)
            if SkillV then
                if game.Players.LocalPlayer.Data.DevilFruit.Value == "Dragon-Dragon" or game.Players.LocalPlayer.Data.DevilFruit.Value == "Bird-Bird: Phoenix" then
                else
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                    wait(VHold)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                end
            end
            wait(1)
            game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(MasMob)
            if SkillZ then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(ZHold)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
            end
        end
    end
end)

spawn(function () -- Auto Electric Claw
    pcall(function ()
        while wait(.1) do
            if AutoElectric and Thirdsea then
                if (game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                elseif (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399) or (game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value <= 399) then
                    _G.Weapon = "Electro"
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") then
                    _G.Weapon = "Electric Claw"
                end

                if (game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400) then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw") == "..." and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start") == 4 then
                        if GodModeIsDone then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12550.4, 332.378, -7597.89)
                        else
                            TweenTo(Vector3.new(-12550.4, 332.378, -7597.89), 300)
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == 4 then
                        if GodModeIsDone then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10370.1, 331.654, -10129.5)
                        else
                            repeat wait()
                                TweenTo(Vector3.new(-10370.1, 331.654, -10129.5), 300)
                            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-10370.1, 331.654, -10129.5)).magnitude <= 5 or not AutoElectric
                        end
                        wait(1.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start")
                    end
                end
            end
        end
    end)
end)

spawn(function () -- Farm Observation
    while wait() do
        if _G.Observation then
            if not GodModeIsDone then
                if Secondsea then
                    if game.Workspace.Enemies:FindFirstChild("Marine Captain [Lv. 900]") then
                        if game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat wait()
                                TweenTo(game.Workspace.Enemies:FindFirstChild("Marine Captain [Lv. 900]").HumanoidRootPart.Position + Vector3.new(3, 0, 0), 300)
                            until _G.Observation == false or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            if _G.HOP then
                                Teleport()
                            elseif _G.LowHop then
                                LowServerHop()
                            else
                                repeat wait()
                                    TweenTo(game.Workspace.Enemies:FindFirstChild("Marine Captain [Lv. 900]").HumanoidRootPart.Position + Vector3.new(0, 15, 10), 300)
                                until _G.Observation == false or game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                            end
                        end
                    end
                elseif Firstsea then
                    if game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]") then
                        if game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat wait()
                                TweenTo(game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.Position + Vector3.new(3, 0, 0), 300)
                            until _G.Observation == false or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            if _G.HOP then
                                Teleport()
                            elseif _G.LowHop then
                                LowServerHop()
                            else
                                repeat wait()
                                    TweenTo(game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.Position + Vector3.new(0, 15, 10), 300)
                                until _G.Observation == false or game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                            end
                        end
                    end
                elseif Thirdsea then
                    if game.Workspace.Enemies:FindFirstChild("Forest Pirate [Lv. 1825]") then
                        if game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat wait()
                                TweenTo(game.Workspace.Enemies:FindFirstChild("Forest Pirate [Lv. 1825]").HumanoidRootPart.Position + Vector3.new(3, 0, 0), 300)
                            until _G.Observation == false or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            if _G.HOP then
                                Teleport()
                            elseif _G.LowHop then
                                LowServerHop()
                            else
                                repeat wait()
                                    TweenTo(game.Workspace.Enemies:FindFirstChild("Forest Pirate [Lv. 1825]").HumanoidRootPart.Position + Vector3.new(0, 15, 10), 300)
                                until _G.Observation == false or game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                            end
                        end
                    end
                end
            elseif GodModeIsDone then
                library:Notification("This Function Not Support God Mode", "Ok Thanks")
            end
        end
    end
end)

spawn(function() -- Cooldown Observation
    while wait(60) do 
        pcall(function()
            if _G.Observation and not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                game:GetService('VirtualUser'):CaptureController()
                game:GetService('VirtualUser'):SetKeyDown('0x65')
                wait(2)
                game:GetService('VirtualUser'):SetKeyUp('0x65')
            end
        end)
    end
end)

local FastAttackModule = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
game.Players.LocalPlayer:GetMouse().Button1Down:Connect(function ()
    if _G.FastAttackNew then
        pcall(function ()
            if FastAttackModule.activeController then
                if FastAttackModule.activeController.timeToNextAttack and FastAttackModule.activeController.timeToNextAttack ~= 0 then
                    FastAttackModule.activeController.timeToNextAttack = 0.3
                end
            end
        end)
    elseif _G.FastAttack then
        pcall(function ()
            FastAttackModule.activeController.attacking = false
            FastAttackModule.activeController.active = false
            FastAttackModule.activeController.timeToNextAttack = 0.3
        end)
    end
end)

spawn(function() -- Hit
    while game:GetService("RunService").RenderStepped:wait() do
        if (StartClick or AutoClick or AutoClickTG) then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
        end
    end
end)

spawn(function () -- Magnet
    while game:GetService("RunService").RenderStepped:wait(0.2) do
        if StartMagnet then
            if _G.AutoFarm and _G.Magnet and PosMon ~= nil then
                levelCheck()
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == nameMob and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                        v.Humanoid.WalkSpeed = 1
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.Transparency = 1
                        v.HumanoidRootPart.CFrame = PosMon
                    end
                end
            elseif (GunMastery or FruitMastery) and _G.Magnet and MasPos ~= nil then
                levelCheck()
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == nameMob and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                        v.Humanoid.WalkSpeed = 1
                        v.HumanoidRootPart.CanCollide = false
                        if v.Humanoid.Health <= HealthMin and FruitMastery then
                            v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                        else
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        end
                        v.HumanoidRootPart.Transparency = 1
                        v.HumanoidRootPart.CFrame = MasPos
                    end
                end
            elseif _G.CandyFarm and Position ~= nil then
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                        if v.Name == CandyMob and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - Position).magnitude <= 350 then
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = CFrame.new(Position)
                        end
                    end
                end
            elseif _G.BoneFarm and Position ~= nil then
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                        if v.Name == BoneMob
                        or (v.Name == "Demonic Soul [Lv. 2025]" and BoneMob == "Posessed Mummy [Lv. 2050]")
                        then
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = CFrame.new(Position)
                        end
                    end
                end
            elseif _G.MobAura and _G.Magnet and AuraBringPos ~= nil then
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                        if (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                            v.Humanoid.WalkSpeed = 1
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CFrame = AuraBringPos
                        end
                    end
                end
            elseif KillAura and _G.Magnet and KillAuraPos ~= nil then
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                        if (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                            v.Humanoid.WalkSpeed = 1
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CFrame = KillAuraPos
                        end
                    end
                end
            elseif _G.ChooseMob and _G.Magnet and MobChoosedPos ~= nil then
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == mobSelect and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                        v.Humanoid.WalkSpeed = 1
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.Transparency = 1
                        v.HumanoidRootPart.CFrame = MobChoosedPos
                    end
                end
            end
        end
    end
end)
