local IceLibrary = {}
local Players = game:GetService("Players")

local TweenService = game:GetService("TweenService")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local ContextActionService = game:GetService("ContextActionService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ServerStorage = game:GetService("ServerStorage")

local StarterGui = game:GetService("StarterGui")

local StarterPack = game:GetService("StarterPack")

local StarterPlayer = game:GetService("StarterPlayer")

local SoundService = game:GetService("SoundService")

local Lighting = game:GetService("Lighting")

local TextChatService = game:GetService("TextChatService")

local HttpService = game:GetService("HttpService")

local DataStoreService = game:GetService("DataStoreService")

local MarketplaceService = game:GetService("MarketplaceService")

local BadgeService = game:GetService("BadgeService")

local GroupService = game:GetService("GroupService")

local Teams = game:GetService("Teams")

local Debris = game:GetService("Debris")

local TeleportService = game:GetService("TeleportService")

local PathfindingService = game:GetService("PathfindingService")

local ReplicatedFirst = game:GetService("ReplicatedFirst")

local Workspace = game:GetService("Workspace")

local GuiService = game:GetService("GuiService")

local ProximityPromptService = game:GetService("ProximityPromptService")

local AnalyticsService = game:GetService("AnalyticsService")

local HapticService = game:GetService("HapticService")

local VRService = game:GetService("VRService")

local LocalizationService = game:GetService("LocalizationService")

local PhysicsService = game:GetService("PhysicsService")

local MemoryStoreService = game:GetService("MemoryStoreService")

local LocalPlayer = Players.LocalPlayer

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local player = game:GetService("Players").LocalPlayer

local displayName = player.DisplayName

local screenGui = Instance.new("ScreenGui")

screenGui.Name = "IceLibrary"

screenGui.ResetOnSpawn = false

screenGui.Parent = PlayerGui

local mainFrame = Instance.new("Frame")

mainFrame.Size = UDim2.new(0, 450, 0, 240)

mainFrame.Position = UDim2.new(0.5, -225, 0.5, -120)

mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

mainFrame.Active = true

mainFrame.Draggable = true

mainFrame.ClipsDescendants = true

mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")

corner.CornerRadius = UDim.new(0, 4)

corner.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")

titleLabel.Size = UDim2.new(0, 350, 0, 35)

titleLabel.Position = UDim2.new(0, 10, 0, -2)

titleLabel.BackgroundTransparency = 1

titleLabel.Text = ""

titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

titleLabel.Font = Enum.Font.SourceSans

titleLabel.TextSize = 18

titleLabel.TextXAlignment = Enum.TextXAlignment.Left

titleLabel.Parent = mainFrame

local closeButton = Instance.new("TextButton")

closeButton.Size = UDim2.new(0, 30, 0, 30)

closeButton.Position = UDim2.new(1, -32, 0, -0)

closeButton.BackgroundTransparency = 1

closeButton.Text = "x"

closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

closeButton.Font = Enum.Font.SourceSans

closeButton.TextSize = 20

closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()

	mainFrame:Destroy()

end)

local minimizeButton = Instance.new("TextButton")

minimizeButton.Size = UDim2.new(0, 30, 0, 30)

minimizeButton.Position = UDim2.new(1, -64, 0, 1)

minimizeButton.BackgroundTransparency = 1

minimizeButton.Text = "-"

minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

minimizeButton.Font = Enum.Font.SourceSans

minimizeButton.TextSize = 20

minimizeButton.Parent = mainFrame

local isMinimized = false

local originalSize = mainFrame.Size

local minimizedSize = UDim2.new(0, 450, 0, 32)

minimizeButton.MouseButton1Click:Connect(function()

	isMinimized = not isMinimized

	local targetSize = isMinimized and minimizedSize or originalSize

	local tween = TweenService:Create(mainFrame, TweenInfo.new(0.3), {Size = targetSize})

	tween:Play()

	minimizeButton.Text = isMinimized and "+" or "-"

end)

local tabButtonsScroll = Instance.new("ScrollingFrame")

tabButtonsScroll.Size = UDim2.new(0, 110, 1, -35)

tabButtonsScroll.Position = UDim2.new(0, 0, 0, 30)

tabButtonsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)

tabButtonsScroll.ScrollBarThickness = 4

tabButtonsScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

tabButtonsScroll.BorderSizePixel = 0

tabButtonsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

tabButtonsScroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always

tabButtonsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

tabButtonsScroll.Parent = mainFrame

local tabCorner = Instance.new("UICorner")

tabCorner.CornerRadius = UDim.new(0, 4)

tabCorner.Parent = tabButtonsScroll

local tabLayout = Instance.new("UIListLayout")

tabLayout.SortOrder = Enum.SortOrder.LayoutOrder

tabLayout.Padding = UDim.new(0, 4)

tabLayout.Parent = tabButtonsScroll

local tabPadding = Instance.new("UIPadding")

tabPadding.PaddingTop = UDim.new(0, 6)

tabPadding.PaddingLeft = UDim.new(0, 4)

tabPadding.PaddingRight = UDim.new(0, 4)

tabPadding.Parent = tabButtonsScroll

local tabContentFrame = Instance.new("Frame")

tabContentFrame.Size = UDim2.new(1, -110, 1, -35)

tabContentFrame.Position = UDim2.new(0, 110, 0, 35)

tabContentFrame.BackgroundTransparency = 1

tabContentFrame.Name = "TabContent"

tabContentFrame.Parent = mainFrame

Tabs = {}

CurrentTab = nil

function AddTab(tabName)

	local tabButton = Instance.new("TextButton")

	tabButton.Size = UDim2.new(1, 0, 0, 30)

	tabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

	tabButton.BorderSizePixel = 0

	tabButton.Text = tabName

	tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)

	tabButton.Font = Enum.Font.SourceSans

	tabButton.TextSize = 16

	tabButton.Parent = tabButtonsScroll

    tabButton.AutoButtonColor = false

	local buttonCorner = Instance.new("UICorner")

	buttonCorner.CornerRadius = UDim.new(0, 4)

	buttonCorner.Parent = tabButton

	local outerFrame = Instance.new("Frame")

outerFrame.Size = UDim2.new(1, 0, 1, 0)

outerFrame.BackgroundTransparency = 0

outerFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

outerFrame.Visible = false

outerFrame.Name = tabName

outerFrame.Parent = tabContentFrame

local outerCorner = Instance.new("UICorner")

outerCorner.CornerRadius = UDim.new(0, 4)

outerCorner.Parent = outerFrame

	local contentScroll = Instance.new("ScrollingFrame")

	contentScroll.Name = "ScrollArea"

	contentScroll.Size = UDim2.new(1, 0, 1, 0)

	contentScroll.BackgroundTransparency = 1

	contentScroll.BorderSizePixel = 0

	contentScroll.ScrollBarThickness = 0

	contentScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

	contentScroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always

	contentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)

	contentScroll.Parent = outerFrame

	local layout = Instance.new("UIListLayout")

	layout.SortOrder = Enum.SortOrder.LayoutOrder

	layout.Padding = UDim.new(0, 6)

	layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

	layout.Parent = contentScroll

	local padding = Instance.new("UIPadding")

padding.PaddingTop = UDim.new(0, 6)

padding.PaddingLeft = UDim.new(0, 6)

padding.PaddingRight = UDim.new(0, 6)

padding.Parent = contentScroll

local spacer = Instance.new("Frame")

spacer.Size = UDim2.new(1, 0, 0, 30)

spacer.BackgroundTransparency = 1

spacer.BorderSizePixel = 0

spacer.LayoutOrder = 999

spacer.Parent = contentScroll

	Tabs[tabName] = {

		Button = tabButton,

		Content = outerFrame,

		ScrollArea = contentScroll

	}

	tabButton.MouseButton1Click:Connect(function()

	for _, tab in pairs(Tabs) do

		tab.Content.Visible = false

		tab.Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

		tab.Button.TextColor3 = Color3.fromRGB(255, 255, 255)

	end

	outerFrame.Visible = true

	tabButton.TextColor3 = Color3.fromRGB(0, 255, 255)

	CurrentTab = tabName

end)

	if not CurrentTab then

	for _, tab in pairs(Tabs) do

		tab.Content.Visible = false

		tab.Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

		tab.Button.TextColor3 = Color3.fromRGB(255, 255, 255)

	end

	outerFrame.Visible = true

	tabButton.TextColor3 = Color3.fromRGB(0, 255, 255)

	CurrentTab = tabName

end

	return contentScroll

end

function AddButton(tabScrollFrame, text, callback)

	local button = Instance.new("TextButton")

	button.Size = UDim2.new(1, 0, 0, 30)

	button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

	button.Text = ""

	button.TextColor3 = Color3.fromRGB(255, 255, 255)

	button.Font = Enum.Font.SourceSans

	button.TextSize = 16

	button.BorderSizePixel = 0

	button.AutoButtonColor = true

	button.Parent = tabScrollFrame

	local padding = Instance.new("UIPadding")  

	padding.PaddingLeft = UDim.new(0, 6)  

	padding.PaddingRight = UDim.new(0, 6)  

	padding.Parent = button  

	local corner = Instance.new("UICorner")  

	corner.CornerRadius = UDim.new(0, 4)  

	corner.Parent = button

	local icon = Instance.new("ImageLabel")

	icon.Size = UDim2.new(0, 20, 0, 20)

	icon.Position = UDim2.new(0, 0, 0.5, -10)

	icon.BackgroundTransparency = 1

	icon.Image = "rbxassetid://125297170839506"

	icon.ScaleType = Enum.ScaleType.Fit

	icon.Parent = button

    local icon2 = Instance.new("ImageLabel")

icon2.Size = UDim2.new(0, 20, 0, 20)

icon2.Position = UDim2.new(1, -20, 0.5, -10)

icon2.BackgroundTransparency = 1

icon2.Image = "rbxassetid://80424246541245"

icon2.ScaleType = Enum.ScaleType.Fit

icon2.Parent = button

	local label = Instance.new("TextLabel")

	label.BackgroundTransparency = 1

	label.Size = UDim2.new(1, -26, 1, 0)

	label.Position = UDim2.new(0, 26, 0, 0)

	label.Text = text

	label.TextColor3 = Color3.fromRGB(255, 255, 255)

	label.Font = Enum.Font.SourceSans

	label.TextSize = 16

	label.TextXAlignment = Enum.TextXAlignment.Left

	label.Parent = button

	if callback then  

		button.MouseButton1Click:Connect(callback)  

	end  

	return button

end

function AddDropdown(tabScrollFrame, text, options, callback)

	local dropdownHolder = Instance.new("Frame")

	dropdownHolder.Size = UDim2.new(1, 0, 0, 30)

	dropdownHolder.BackgroundTransparency = 1

	dropdownHolder.ClipsDescendants = true

	dropdownHolder.Parent = tabScrollFrame

	local dropdownButton = Instance.new("TextButton")

	dropdownButton.Size = UDim2.new(1, 0, 0, 30)

	dropdownButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

	dropdownButton.Text = ""

	dropdownButton.BorderSizePixel = 0

	dropdownButton.AutoButtonColor = true

	dropdownButton.Parent = dropdownHolder

	local corner = Instance.new("UICorner")

	corner.CornerRadius = UDim.new(0, 4)

	corner.Parent = dropdownButton

	local padding = Instance.new("UIPadding")

	padding.PaddingLeft = UDim.new(0, 6)

	padding.PaddingRight = UDim.new(0, 6)

	padding.Parent = dropdownButton

	local icon = Instance.new("ImageLabel")

	icon.Size = UDim2.new(0, 20, 0, 20)

	icon.Position = UDim2.new(0, 0, 0.5, -10)

	icon.BackgroundTransparency = 1

	icon.Image = "rbxassetid://124611046242544"

	icon.ScaleType = Enum.ScaleType.Fit

	icon.Parent = dropdownButton

	local icon2 = Instance.new("ImageLabel")

	icon2.Size = UDim2.new(0, 20, 0, 20)

	icon2.Position = UDim2.new(1, -20, 0.5, -10)

	icon2.BackgroundTransparency = 1

	icon2.Image = "rbxassetid://80424246541245"

	icon2.ScaleType = Enum.ScaleType.Fit

	icon2.Parent = dropdownButton

	local label = Instance.new("TextLabel")

	label.BackgroundTransparency = 1

	label.Size = UDim2.new(1, -26, 1, 0)

	label.Position = UDim2.new(0, 26, 0, 0)

	label.Text = text

	label.TextColor3 = Color3.fromRGB(255, 255, 255)

	label.Font = Enum.Font.SourceSans

	label.TextSize = 16

	label.TextXAlignment = Enum.TextXAlignment.Left

	label.Parent = dropdownButton

	local expanded = false

	local selected = nil

	local optionFrame = Instance.new("ScrollingFrame")

	optionFrame.Size = UDim2.new(1, 0, 0, 0)

	optionFrame.Position = UDim2.new(0, 0, 0, 25)

	optionFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

	optionFrame.ScrollBarThickness = 0

	optionFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

	optionFrame.VerticalScrollBarInset = Enum.ScrollBarInset.Always

	optionFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

	optionFrame.BorderSizePixel = 0

	optionFrame.ClipsDescendants = true

	optionFrame.Parent = dropdownHolder

	local cornerOptions = Instance.new("UICorner")

	cornerOptions.CornerRadius = UDim.new(0, 4)

	cornerOptions.Parent = optionFrame

	local paddingOpt = Instance.new("UIPadding")

	paddingOpt.PaddingTop = UDim.new(0, 4)

	paddingOpt.PaddingBottom = UDim.new(0, 4)

	paddingOpt.PaddingLeft = UDim.new(0, 6)

	paddingOpt.PaddingRight = UDim.new(0, 6)

	paddingOpt.Parent = optionFrame

	local layout = Instance.new("UIListLayout")

	layout.SortOrder = Enum.SortOrder.LayoutOrder

	layout.Padding = UDim.new(0, 2)

	layout.Parent = optionFrame

	local optionButtons = {}

	local function updateSelection(newSelected)

		for _, btn in pairs(optionButtons) do

			btn.TextColor3 = Color3.fromRGB(255, 255, 255)

		end

		if newSelected then

			newSelected.TextColor3 = Color3.fromRGB(0, 255, 255)

		end

	end

	local function createOption(optText)

		local optButton = Instance.new("TextButton")

		optButton.Size = UDim2.new(1, 0, 0, 27)

		optButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

		optButton.Text = optText

		optButton.TextColor3 = Color3.fromRGB(255, 255, 255)

		optButton.Font = Enum.Font.SourceSans

		optButton.TextSize = 16

		optButton.TextXAlignment = Enum.TextXAlignment.Left

		optButton.AutoButtonColor = true

		optButton.BorderSizePixel = 0

		optButton.Parent = optionFrame

		local optCorner = Instance.new("UICorner")

		optCorner.CornerRadius = UDim.new(0, 4)

		optCorner.Parent = optButton

		optButton.MouseButton1Click:Connect(function()

			selected = optButton

			label.Text = text .. ": " .. optText

			updateSelection(optButton)

			if callback then callback(optText) end

		end)

		table.insert(optionButtons, optButton)

	end

	for _, optText in ipairs(options) do

		createOption(optText)

	end

	dropdownButton.MouseButton1Click:Connect(function()

		expanded = not expanded

		local totalHeight = 0

		for _, child in ipairs(optionFrame:GetChildren()) do

			if child:IsA("TextButton") then

				totalHeight += child.AbsoluteSize.Y + layout.Padding.Offset

			end

		end

		totalHeight += paddingOpt.PaddingTop.Offset + paddingOpt.PaddingBottom.Offset

		local targetSize = expanded and UDim2.new(1, 0, 0, totalHeight) or UDim2.new(1, 0, 0, 0)

		optionFrame:TweenSize(targetSize, "Out", "Quad", 0.2, true)

		local holderTargetSize = expanded and UDim2.new(1, 0, 0, 30 + totalHeight) or UDim2.new(1, 0, 0, 30)

		dropdownHolder:TweenSize(holderTargetSize, "Out", "Quad", 0.2, true)

	end)

	local function selectOptionByText(optText)

		for _, btn in pairs(optionButtons) do

			if btn.Text == optText then

				selected = btn

				label.Text = text .. ": " .. optText

				updateSelection(btn)

				if callback then callback(optText) end

				break

			end

		end

	end

	local function unselectOption()

		selected = nil

		label.Text = text

		updateSelection(nil)

		if callback then callback(nil) end

	end

	return {

		Holder = dropdownHolder,

		AddOption = function(optText)

			createOption(optText)

		end,

		RemoveOption = function(optText)

			for i, btn in ipairs(optionButtons) do

				if btn.Text == optText then

					btn:Destroy()

					table.remove(optionButtons, i)

					if selected == btn then

						unselectOption()

					end

					break

				end

			end

		end,

		SelectOption = selectOptionByText,

		UnselectOption = unselectOption

	}

end

function AddMultiDropdown(tabScrollFrame, text, options, callback)

    local dropdownHolder = Instance.new("Frame")

    dropdownHolder.Size = UDim2.new(1, 0, 0, 30)

    dropdownHolder.BackgroundTransparency = 1

    dropdownHolder.ClipsDescendants = true

    dropdownHolder.Parent = tabScrollFrame

    local dropdownButton = Instance.new("TextButton")

    dropdownButton.Size = UDim2.new(1, 0, 0, 30)

    dropdownButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

    dropdownButton.Text = ""

    dropdownButton.BorderSizePixel = 0

    dropdownButton.AutoButtonColor = true

    dropdownButton.Parent = dropdownHolder

    local corner = Instance.new("UICorner")

    corner.CornerRadius = UDim.new(0, 4)

    corner.Parent = dropdownButton

    local padding = Instance.new("UIPadding")

    padding.PaddingLeft = UDim.new(0, 6)

    padding.PaddingRight = UDim.new(0, 6)

    padding.Parent = dropdownButton

    local icon = Instance.new("ImageLabel")

    icon.Size = UDim2.new(0, 20, 0, 20)

    icon.Position = UDim2.new(0, 0, 0.5, -10)

    icon.BackgroundTransparency = 1

    icon.Image = "rbxassetid://124611046242544"

    icon.ScaleType = Enum.ScaleType.Fit

    icon.Parent = dropdownButton

    local icon2 = Instance.new("ImageLabel")

    icon2.Size = UDim2.new(0, 20, 0, 20)

    icon2.Position = UDim2.new(1, -20, 0.5, -10)

    icon2.BackgroundTransparency = 1

    icon2.Image = "rbxassetid://80424246541245"

    icon2.ScaleType = Enum.ScaleType.Fit

    icon2.Parent = dropdownButton

    local label = Instance.new("TextLabel")

    label.BackgroundTransparency = 1

    label.Size = UDim2.new(1, -26, 1, 0)

    label.Position = UDim2.new(0, 26, 0, 0)

    label.Text = text

    label.TextColor3 = Color3.fromRGB(255, 255, 255)

    label.Font = Enum.Font.SourceSans

    label.TextSize = 16

    label.TextXAlignment = Enum.TextXAlignment.Left

    label.Parent = dropdownButton

    local expanded = false

    local selectedOptions = {}

    local optionFrame = Instance.new("ScrollingFrame")

    optionFrame.Size = UDim2.new(1, 0, 0, 0)

    optionFrame.Position = UDim2.new(0, 0, 0, 25)

    optionFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

    optionFrame.ScrollBarThickness = 0

    optionFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

    optionFrame.VerticalScrollBarInset = Enum.ScrollBarInset.Always

    optionFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

    optionFrame.BorderSizePixel = 0

    optionFrame.ClipsDescendants = true

    optionFrame.Parent = dropdownHolder

    local cornerOptions = Instance.new("UICorner")

    cornerOptions.CornerRadius = UDim.new(0, 4)

    cornerOptions.Parent = optionFrame

    local paddingOpt = Instance.new("UIPadding")

    paddingOpt.PaddingTop = UDim.new(0, 4)

    paddingOpt.PaddingBottom = UDim.new(0, 4)

    paddingOpt.PaddingLeft = UDim.new(0, 6)

    paddingOpt.PaddingRight = UDim.new(0, 6)

    paddingOpt.Parent = optionFrame

    local layout = Instance.new("UIListLayout")

    layout.SortOrder = Enum.SortOrder.LayoutOrder

    layout.Padding = UDim.new(0, 2)

    layout.Parent = optionFrame

    local function updateLabel()

        local fullText = text .. ": " .. table.concat(selectedOptions, ", ")

        if #fullText > 35 then

            fullText = string.sub(fullText, 1, 32) .. " ..."

        end

        label.Text = #selectedOptions > 0 and fullText or text

    end

    local function createOption(optText)

        local optButton = Instance.new("TextButton")

        optButton.Size = UDim2.new(1, 0, 0, 27)

        optButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

        optButton.Text = optText

        optButton.TextColor3 = Color3.fromRGB(255, 255, 255)

        optButton.Font = Enum.Font.SourceSans

        optButton.TextSize = 16

        optButton.TextXAlignment = Enum.TextXAlignment.Left

        optButton.AutoButtonColor = true

        optButton.BorderSizePixel = 0

        optButton.Parent = optionFrame

        local optCorner = Instance.new("UICorner")

        optCorner.CornerRadius = UDim.new(0, 4)

        optCorner.Parent = optButton

        optButton.MouseButton1Click:Connect(function()

            local found = table.find(selectedOptions, optText)

            if found then

                table.remove(selectedOptions, found)

                optButton.TextColor3 = Color3.fromRGB(255, 255, 255)

            else

                table.insert(selectedOptions, optText)

                optButton.TextColor3 = Color3.fromRGB(0, 255, 255)

            end

            updateLabel()

            if callback then callback(selectedOptions) end

        end)

    end

    for _, optText in ipairs(options) do

        createOption(optText)

    end

    dropdownButton.MouseButton1Click:Connect(function()

        expanded = not expanded

        local totalHeight = 0

        for _, child in ipairs(optionFrame:GetChildren()) do

            if child:IsA("TextButton") then

                totalHeight += child.AbsoluteSize.Y + layout.Padding.Offset

            end

        end

        totalHeight += paddingOpt.PaddingTop.Offset + paddingOpt.PaddingBottom.Offset

        local targetSize = expanded and UDim2.new(1, 0, 0, totalHeight) or UDim2.new(1, 0, 0, 0)

        optionFrame:TweenSize(targetSize, "Out", "Quad", 0.2, true)

        local holderTargetSize = expanded and UDim2.new(1, 0, 0, 30 + totalHeight) or UDim2.new(1, 0, 0, 30)

        dropdownHolder:TweenSize(holderTargetSize, "Out", "Quad", 0.2, true)

    end)

    return {

    Holder = dropdownHolder,

    AddOption = function(optText)

        createOption(optText)

    end,

    RemoveOption = function(optText)

        for _, child in ipairs(optionFrame:GetChildren()) do

            if child:IsA("TextButton") and child.Text == optText then

                child:Destroy()

                local found = table.find(selectedOptions, optText)

                if found then table.remove(selectedOptions, found) end

                updateLabel()

            end

        end

    end,

    SelectOption = function(optText)

        for _, child in ipairs(optionFrame:GetChildren()) do

            if child:IsA("TextButton") and child.Text == optText then

                if not table.find(selectedOptions, optText) then

                    table.insert(selectedOptions, optText)

                    child.TextColor3 = Color3.fromRGB(0, 255, 255)

                    updateLabel()

                    if callback then callback(selectedOptions) end

                end

            end

        end

    end,

    UnselectOption = function(optText)

        for _, child in ipairs(optionFrame:GetChildren()) do

            if child:IsA("TextButton") and child.Text == optText then

                local found = table.find(selectedOptions, optText)

                if found then

                    table.remove(selectedOptions, found)

                    child.TextColor3 = Color3.fromRGB(255, 255, 255)

                    updateLabel()

                    if callback then callback(selectedOptions) end

                end

            end

        end

    end

}

end

function AddToggle(tabScrollFrame, text, default, callback)

	local toggled = default or false

	local toggleButton = Instance.new("TextButton")

	toggleButton.Size = UDim2.new(1, 0, 0, 30)

	toggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

	toggleButton.BorderSizePixel = 0

	toggleButton.Text = ""

	toggleButton.AutoButtonColor = true

	toggleButton.Parent = tabScrollFrame

	local padding = Instance.new("UIPadding")  

	padding.PaddingLeft = UDim.new(0, 6)  

	padding.PaddingRight = UDim.new(0, 6)  

	padding.Parent = toggleButton

	local corner = Instance.new("UICorner")

	corner.CornerRadius = UDim.new(0, 4)

	corner.Parent = toggleButton

	local outerCircle = Instance.new("Frame")

	outerCircle.Size = UDim2.new(0, 20, 0, 20)

	outerCircle.Position = UDim2.new(0, 0, 0.5, -10)

	outerCircle.BackgroundTransparency = 1

	outerCircle.Parent = toggleButton

	local stroke = Instance.new("UIStroke")

	stroke.Color = Color3.fromRGB(35, 35, 35)

	stroke.Thickness = 2

	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	stroke.Parent = outerCircle

	local outerCorner = Instance.new("UICorner")

	outerCorner.CornerRadius = UDim.new(1, 0)

	outerCorner.Parent = outerCircle

	local innerDot = Instance.new("Frame")

	innerDot.Size = UDim2.new(0, 10, 0, 10)

	innerDot.Position = UDim2.new(0.5, -5, 0.5, -5)

	innerDot.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

	innerDot.BorderSizePixel = 0

	innerDot.Visible = toggled

	innerDot.Parent = outerCircle

	local innerCorner = Instance.new("UICorner")

	innerCorner.CornerRadius = UDim.new(1, 0)

	innerCorner.Parent = innerDot

    local icon2 = Instance.new("ImageLabel")

	icon2.Size = UDim2.new(0, 20, 0, 20)

	icon2.Position = UDim2.new(1, -20, 0.5, -10)

	icon2.BackgroundTransparency = 1

	icon2.Image = "rbxassetid://80424246541245"

	icon2.ScaleType = Enum.ScaleType.Fit

	icon2.Parent = toggleButton

	local label = Instance.new("TextLabel")

	label.BackgroundTransparency = 1

	label.Size = UDim2.new(1, -60, 1, 0)

	label.Position = UDim2.new(0, 30, 0, 0)

	label.Text = text

	label.Font = Enum.Font.Gotham

	label.TextSize = 14

	label.TextColor3 = Color3.fromRGB(255, 255, 255)

	label.TextXAlignment = Enum.TextXAlignment.Left

	label.Parent = toggleButton

	toggleButton.MouseButton1Click:Connect(function()

		toggled = not toggled

		innerDot.Visible = toggled

		pcall(callback, toggled)

	end)

end

function AddSection(tabScrollFrame, text)

	local sectionLabel = Instance.new("TextLabel")

	sectionLabel.Size = UDim2.new(1, 0, 0, 30)

	sectionLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

	sectionLabel.BorderSizePixel = 0

	sectionLabel.Text = text

	sectionLabel.TextColor3 = Color3.fromRGB(0, 255, 255)

	sectionLabel.Font = Enum.Font.SourceSans

	sectionLabel.TextSize = 16

	sectionLabel.TextXAlignment = Enum.TextXAlignment.Left

	sectionLabel.Parent = tabScrollFrame

	local padding = Instance.new("UIPadding")

	padding.PaddingLeft = UDim.new(0, 6)

	padding.PaddingRight = UDim.new(0, 6)

	padding.Parent = sectionLabel

	local corner = Instance.new("UICorner")

	corner.CornerRadius = UDim.new(0, 4)

	corner.Parent = sectionLabel

	return sectionLabel

end

function AddTextBox(tabScrollFrame, config)

	local labelText = config.labelText or "Label"

	local placeholder = config.placeholder or "Enter text"

	local callback = config.callback

	local defaultText = config.defaultText or ""

	local textDisappear = config.textDisappear or false

	local holder = Instance.new("Frame")

	holder.Size = UDim2.new(1, 0, 0, 30)

	holder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

	holder.BorderSizePixel = 0

	holder.Parent = tabScrollFrame

	local corner = Instance.new("UICorner")

	corner.CornerRadius = UDim.new(0, 4)

	corner.Parent = holder

	local padding = Instance.new("UIPadding")

	padding.PaddingLeft = UDim.new(0, 6)

	padding.PaddingRight = UDim.new(0, 6)

	padding.Parent = holder

	local icon = Instance.new("ImageLabel")

	icon.Size = UDim2.new(0, 20, 0, 20)

	icon.Position = UDim2.new(0, 0, 0.5, -10)

	icon.BackgroundTransparency = 1

	icon.Image = "rbxassetid://74819884434743"

	icon.ScaleType = Enum.ScaleType.Fit

	icon.Parent = holder

	local label = Instance.new("TextLabel")

	label.Size = UDim2.new(0, 100, 1, 0)

	label.Position = UDim2.new(0, 26, 0, 0)

	label.BackgroundTransparency = 1

	label.Text = labelText

	label.TextColor3 = Color3.fromRGB(255, 255, 255)

	label.Font = Enum.Font.SourceSans

	label.TextSize = 16

	label.TextXAlignment = Enum.TextXAlignment.Left

	label.Parent = holder

	local textBox = Instance.new("TextBox")

	textBox.Size = UDim2.new(1, -160, 1, 0)

	textBox.Position = UDim2.new(0, 130, 0, 0)

	textBox.BackgroundTransparency = 1

	textBox.Text = defaultText

	textBox.PlaceholderText = placeholder

	textBox.TextColor3 = Color3.fromRGB(255, 255, 255)

	textBox.PlaceholderColor3 = Color3.fromRGB(160, 160, 160)

	textBox.Font = Enum.Font.SourceSans

	textBox.TextSize = 16

	textBox.TextXAlignment = Enum.TextXAlignment.Left

	textBox.ClearTextOnFocus = textDisappear

	textBox.Parent = holder

	local icon2 = Instance.new("ImageLabel")

	icon2.Size = UDim2.new(0, 20, 0, 20)

	icon2.Position = UDim2.new(1, -20, 0.5, -10)

	icon2.BackgroundTransparency = 1

	icon2.Image = "rbxassetid://80424246541245"

	icon2.ScaleType = Enum.ScaleType.Fit

	icon2.Parent = holder

	textBox.FocusLost:Connect(function(enterPressed)

		if callback and enterPressed then

			pcall(callback, textBox.Text)

		end

	end)

	return textBox

end

function AddParagraph(tabScrollFrame, titleText, descriptionText, thumbnailId, thumbWidth, thumbHeight)

    if not tabScrollFrame:FindFirstChild("ListLayout") then

    local listLayout = Instance.new("UIListLayout")

    listLayout.Name = "ListLayout"

    listLayout.Padding = UDim.new(0, 10)

    listLayout.SortOrder = Enum.SortOrder.LayoutOrder

    listLayout.Parent = tabScrollFrame

    end

	local holder = Instance.new("Frame")

	holder.Size = UDim2.new(1, 0, 0, 0)

	holder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

	holder.BorderSizePixel = 0

	holder.AutomaticSize = Enum.AutomaticSize.Y

	holder.ClipsDescendants = true

	holder.Parent = tabScrollFrame

	local corner = Instance.new("UICorner")

	corner.CornerRadius = UDim.new(0, 4)

	corner.Parent = holder

	local padding = Instance.new("UIPadding", holder)

	padding.PaddingTop = UDim.new(0, 6)

	padding.PaddingBottom = UDim.new(0, 6)

	padding.PaddingLeft = UDim.new(0, 8)

	padding.PaddingRight = UDim.new(0, 8)

	local layout = Instance.new("UIListLayout", holder)

	layout.FillDirection = Enum.FillDirection.Vertical

	layout.HorizontalAlignment = Enum.HorizontalAlignment.Left

	layout.SortOrder = Enum.SortOrder.LayoutOrder

	layout.Padding = UDim.new(0, 4)

	if typeof(thumbnailId) == "string" and thumbnailId ~= "" then

		local thumb = Instance.new("ImageLabel")

		if thumbWidth and thumbHeight then

			thumb.Size = UDim2.new(0, thumbWidth, 0, thumbHeight)

		else

			thumb.Size = UDim2.new(1, 0, 0, 100)

		end

		thumb.BackgroundTransparency = 0

		thumb.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

		thumb.Image = "rbxassetid://" .. thumbnailId

		thumb.ScaleType = Enum.ScaleType.Crop

		thumb.ClipsDescendants = true

		thumb.Parent = holder

		local thumbCorner = Instance.new("UICorner")

		thumbCorner.CornerRadius = UDim.new(0, 4)

		thumbCorner.Parent = thumb

	end

	local titleLabel = Instance.new("TextLabel")

	titleLabel.Size = UDim2.new(1, 0, 0, 0)

	titleLabel.BackgroundTransparency = 1

	titleLabel.Text = titleText

	titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

	titleLabel.Font = Enum.Font.SourceSans

	titleLabel.TextSize = 16

	titleLabel.TextXAlignment = Enum.TextXAlignment.Left

	titleLabel.TextWrapped = true

	titleLabel.AutomaticSize = Enum.AutomaticSize.Y

	titleLabel.Parent = holder

	local descLabel = Instance.new("TextLabel")

	descLabel.Size = UDim2.new(1, 0, 0, 0)

	descLabel.BackgroundTransparency = 1

	descLabel.Text = descriptionText

	descLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

	descLabel.Font = Enum.Font.SourceSans

	descLabel.TextSize = 14

	descLabel.TextXAlignment = Enum.TextXAlignment.Left

	descLabel.TextWrapped = true

	descLabel.AutomaticSize = Enum.AutomaticSize.Y

	descLabel.Parent = holder

	return holder

end

function AddUserMessage(tabScrollFrame, messageText)

    if not tabScrollFrame:FindFirstChild("MessageListLayout") then

        local layout = Instance.new("UIListLayout")

        layout.Name = "MessageListLayout"

        layout.SortOrder = Enum.SortOrder.LayoutOrder

        layout.Padding = UDim.new(0, 10)

        layout.Parent = tabScrollFrame

    end

    local player = game:GetService("Players").LocalPlayer

    local userId = player.UserId

    local holder = Instance.new("Frame")  

    holder.Size = UDim2.new(1, 0, 0, 90)  

    holder.BackgroundTransparency = 1  

    holder.BorderSizePixel = 0  

    holder.Parent = tabScrollFrame  

    local avatar = Instance.new("ImageLabel")  

    avatar.Size = UDim2.new(0, 90, 0, 90)  

    avatar.Position = UDim2.new(0, 10, 0, 0)  

    avatar.BackgroundColor3 = Color3.fromRGB(20,20,20)  

    avatar.BackgroundTransparency = 0  

    avatar.BorderSizePixel = 0  

    avatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(userId) .. "&width=420&height=420&format=png"  

    avatar.ScaleType = Enum.ScaleType.Crop  

    avatar.Parent = holder  

    local avatarCorner = Instance.new("UICorner")  

    avatarCorner.CornerRadius = UDim.new(0, 4)  

    avatarCorner.Parent = avatar  

    local textHolder = Instance.new("Frame")  

    textHolder.Size = UDim2.new(0, 220, 0, 40)  

    textHolder.Position = UDim2.new(0, 105, 0, 0)

    textHolder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)  

    textHolder.BorderSizePixel = 0  

    textHolder.Parent = holder  

    local textCorner = Instance.new("UICorner")  

    textCorner.CornerRadius = UDim.new(0, 4)  

    textCorner.Parent = textHolder

    local textLabel = Instance.new("TextLabel")

    textLabel.Size = UDim2.new(1, 0, 1, 0)

    textLabel.BackgroundTransparency = 1

    textLabel.Text = messageText

    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    textLabel.Font = Enum.Font.SourceSans

    textLabel.TextSize = 16

    textLabel.TextXAlignment = Enum.TextXAlignment.Center

    textLabel.TextWrapped = true

    textLabel.Parent = textHolder

    return holder

end

function WindowSetTitle(title)

titleLabel.Text = title

end

function AddSlider(tabScrollFrame, labelText, config)
	local min = config.min or 0
	local max = config.max or 100
	local value = config.value or min
	local callback = config.callback or function() end

	local holder = Instance.new("Frame")
	holder.Size = UDim2.new(1, -10, 0, 60)
	holder.Position = UDim2.new(0, 5, 0, 0)
	holder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	holder.BorderSizePixel = 0
	holder.Parent = tabScrollFrame

	local holderCorner = Instance.new("UICorner")
	holderCorner.CornerRadius = UDim.new(0, 4)
	holderCorner.Parent = holder

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -10, 0, 20)
	label.Position = UDim2.new(0, 5, 0, 5)
	label.BackgroundTransparency = 1
	label.Text = labelText .. ": " .. tostring(value)
	label.Font = Enum.Font.SourceSans
	label.TextSize = 16
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = holder

	local sliderBar = Instance.new("Frame")
	sliderBar.Size = UDim2.new(1, -20, 0, 10)
	sliderBar.Position = UDim2.new(0, 10, 0, 35)
	sliderBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	sliderBar.BorderSizePixel = 0
	sliderBar.Parent = holder

	local sliderCorner = Instance.new("UICorner")
	sliderCorner.CornerRadius = UDim.new(0, 4)
	sliderCorner.Parent = sliderBar

	local filledBar = Instance.new("Frame")
	filledBar.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
	filledBar.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
	filledBar.BorderSizePixel = 0
	filledBar.Parent = sliderBar

	local filledCorner = Instance.new("UICorner")
	filledCorner.CornerRadius = UDim.new(0, 4)
	filledCorner.Parent = filledBar

	local circle = Instance.new("Frame")
	circle.Size = UDim2.new(0, 14, 0, 14)
	circle.AnchorPoint = Vector2.new(0.5, 0.5)
	circle.Position = UDim2.new((value - min) / (max - min), 0, 0.5, 0)
	circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	circle.BorderSizePixel = 0
	circle.ZIndex = 2
	circle.Parent = sliderBar

	local circleCorner = Instance.new("UICorner")
	circleCorner.CornerRadius = UDim.new(1, 0)
	circleCorner.Parent = circle

	local dragging = false
	local userInput = game:GetService("UserInputService")
	local runService = game:GetService("RunService")

	local function updateSlider(inputX)
		local relX = math.clamp((inputX - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
		local newValue = math.floor((relX * (max - min) + min) + 0.5)
		value = newValue
		filledBar.Size = UDim2.new(relX, 0, 1, 0)
		circle.Position = UDim2.new(relX, 0, 0.5, 0)
		label.Text = labelText .. ": " .. tostring(value)
		pcall(callback, value)
	end

	sliderBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			updateSlider(input.Position.X)
		end
	end)

	userInput.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)

	runService.RenderStepped:Connect(function()
		if dragging then
			local input = userInput:GetMouseLocation()
			updateSlider(input.X)
		end
	end)

	local sliderAPI = {}

	function sliderAPI.SetValue(v)
		value = math.clamp(v, min, max)
		local relX = (value - min) / (max - min)
		filledBar.Size = UDim2.new(relX, 0, 1, 0)
		circle.Position = UDim2.new(relX, 0, 0.5, 0)
		label.Text = labelText .. ": " .. tostring(value)
		pcall(callback, value)
	end

	function sliderAPI.GetValue()
		return value
	end

	setmetatable(sliderAPI, {
		__index = function(_, k)
			if k == "value" then
				return sliderAPI.GetValue()
			end
		end,
		__newindex = function(_, k, v)
			if k == "value" then
				sliderAPI.SetValue(v)
			end
		end
	})

	return sliderAPI
end

tabButtonsScroll.ScrollBarThickness = 0
return IceLibrary
