local Player = game.Players.LocalPlayer
-- Service
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- Character
local character
local humanoid

-- Setting
local NORMAL_SPEED = 24 -- kecepatan normal
local SPRINT_SPEED = 50 -- kecepatan sprint
local KeyCode = Enum.KeyCode.LeftShift -- tombol keyboard yg diperlukan untuk run

-- Animasi Camera
local FieldOfView = Instance.new("IntValue")
FieldOfView.Value = 70 -- normal
local Tween = TweenInfo.new(0.5 , Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

FieldOfView:GetPropertyChangedSignal("Value"):Connect(function()
	game.Workspace.CurrentCamera.FieldOfView = FieldOfView.Value
end)

-- Char
Player.CharacterAdded:Connect(function(char)
	character = char -- character player
	-- autur kecepatan jadi normal speed
	character:WaitForChild("Humanoid").WalkSpeed = NORMAL_SPEED
end)

-- Deteksi Jika keycode dipencet
UIS.InputBegan:Connect(function(key)
	-- key adalah tombol yg dipencet oleh user
	if key.KeyCode == KeyCode then
		
		-- Validasi jika karakter ada dan jika humanoid didalam karakter ada
		if character and character:FindFirstChildOfClass("Humanoid") then
			humanoid = character:FindFirstChildOfClass("Humanoid")
			
			-- Validasi health harus diatas 0
			if humanoid.Health > 0 then
				humanoid.WalkSpeed = SPRINT_SPEED -- atur kecepetan karakter
				TS:Create(FieldOfView, Tween, {Value = 100}):Play() -- Play Animasi|normal 70
			end
		end
	end
end)

-- Deteksi Jika keycode selesai dipencet
UIS.InputEnded:Connect(function(key)
	if key.KeyCode == KeyCode then
		if humanoid then
			humanoid.WalkSpeed = NORMAL_SPEED -- balikkan ke normal
			TS:Create(FieldOfView, Tween, {Value = 70}):Play() -- PlayAnimasi
		end
	end
end)
