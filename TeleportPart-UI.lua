-- CLIENT --
local player = game.Players.LocalPlayer
local TextButton = script.Parent.TextButton

TextButton.MouseButton1Down:Connect(function()
	-- validasi jika character ada
	if player.Character then
		-- validasi jika darah karakter diatas 0
		if player.Character.Humanoid and player.Character.Humanoid.Health > 0 then
			-- kirim sinyal ke server melalui RemoteEvent
			game.ReplicatedStorage.Remote.TeleportPart:FireServer(player)
		end
	end
end)

-- SERVER --
local Remote = game.ReplicatedStorage.Remote

local Target = workspace.Target
-- Menerima sinyal dari client
Remote.TeleportPart.OnServerEvent:Connect(function(player)
	-- validasi lagi, jika character ada
	if player.Character and player.Character.Humanoid then
		-- validasi jika darah diatas 0
		if player.Character.Humanoid.Health > 0 then
			player.Character:SetPrimaryPartCFrame(Target.CFrame + Vector3.new(0,3,0))
		end
	end
end)
