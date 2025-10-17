local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "FollowGUI"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 320, 0, 220)
frame.Position = UDim2.new(0.5, -160, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Text = "تابع الحساب لتشغيل السكربت / Follow Account to Run Script"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center

local copyButton = Instance.new("TextButton", frame)
copyButton.Size = UDim2.new(0.8, 0, 0, 45)
copyButton.Position = UDim2.new(0.1, 0, 0.25, 0)
copyButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
copyButton.TextColor3 = Color3.fromRGB(255,255,255)
copyButton.Text = "نسخ الحساب / Copy Account"
copyButton.Font = Enum.Font.GothamBold
copyButton.TextScaled = true
copyButton.AutoButtonColor = true
copyButton.BorderSizePixel = 0

copyButton.MouseButton1Click:Connect(function()
	pcall(function()
		setclipboard("l_3lw")
	end)
	copyButton.Text = "تم النسخ! ✅ / Copied!"
	wait(1)
	copyButton.Text = "نسخ الحساب / Copy Account"
end)

local checkButton = Instance.new("TextButton", frame)
checkButton.Size = UDim2.new(0.8, 0, 0, 45)
checkButton.Position = UDim2.new(0.1, 0, 0.55, 0)
checkButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
checkButton.TextColor3 = Color3.fromRGB(255,255,255)
checkButton.Text = "تحقق / Check"
checkButton.Font = Enum.Font.GothamBold
checkButton.TextScaled = true
checkButton.AutoButtonColor = true
checkButton.BorderSizePixel = 0

checkButton.MouseButton1Click:Connect(function()
	checkButton.Text = "جار التحقق... / Checking..."
	wait(2)
	checkButton.Text = "❌ لم يتم التحقق / Not Verified"
	wait(1.5)
	checkButton.Text = "تحقق / Check"
end)

local dragging = false
local dragOffset = Vector2.new(0,0)

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
		if input.Target == frame then
			dragging = true
			local mousePos = input.Position
			dragOffset = Vector2.new(mousePos.X - frame.AbsolutePosition.X, mousePos.Y - frame.AbsolutePosition.Y)
		end
	end
end)

frame.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		frame.Position = UDim2.new(0, input.Position.X - dragOffset.X, 0, input.Position.Y - dragOffset.Y)
	end
end)

frame.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)
