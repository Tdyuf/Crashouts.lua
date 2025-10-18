local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 230)
frame.Position = UDim2.new(0.5, -150, 0.5, -115)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "تابع الحساب لتشغيل السكربت\nFollow Account To Run Script"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

local copyButton = Instance.new("TextButton", frame)
copyButton.Size = UDim2.new(0.8, 0, 0, 40)
copyButton.Position = UDim2.new(0.1, 0, 0.35, 0)
copyButton.BackgroundColor3 = Color3.fromRGB(70,130,180)
copyButton.TextColor3 = Color3.fromRGB(255,255,255)
copyButton.Text = "نسخ الحساب / Copy Account"
copyButton.Font = Enum.Font.GothamBold
copyButton.TextScaled = true

local copyLabel = Instance.new("TextLabel", frame)
copyLabel.Size = UDim2.new(1, 0, 0, 20)
copyLabel.Position = UDim2.new(0, 0, 0.55, 0)
copyLabel.BackgroundTransparency = 1
copyLabel.Text = "@l_3lw"
copyLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
copyLabel.Font = Enum.Font.Gotham
copyLabel.TextScaled = true

local verifyButton = Instance.new("TextButton", frame)
verifyButton.Size = UDim2.new(0.8, 0, 0, 40)
verifyButton.Position = UDim2.new(0.1, 0, 0.7, 0)
verifyButton.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
verifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
verifyButton.Text = "تحقق / Check"
verifyButton.Font = Enum.Font.GothamBold
verifyButton.TextScaled = true

local discordButton

verifyButton.MouseButton1Click:Connect(function()
	verifyButton.Text = "جارِ التحقق... / Checking..."
	wait(1.5)
	verifyButton.Text = "⚠️ حدث خطأ في السكربت / Script Error"

	if not discordButton then
		discordButton = Instance.new("TextButton", frame)
		discordButton.Size = UDim2.new(0.8, 0, 0, 35)
		discordButton.Position = UDim2.new(0.1, 0, 0.87, 0)
		discordButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
		discordButton.TextColor3 = Color3.fromRGB(255,255,255)
		discordButton.Text = "يوزر الديسكورد للدعم الخاص بالسكربت\nDiscord User For Script Support"
		discordButton.Font = Enum.Font.GothamBold
		discordButton.TextScaled = true

		discordButton.MouseButton1Click:Connect(function()
			setclipboard("aldble")
			discordButton.Text = "✅ تم النسخ / Copied!"
			wait(1.5)
			discordButton.Text = "يوزر الديسكورد للدعم الخاص بالسكربت\nDiscord User For Script Support"
		end)
	end
end)
