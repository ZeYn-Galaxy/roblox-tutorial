local Player = game.Players

function characterSpawn(char)
	
	-- Buat Highligth
	local HightLight = Instance.new("Highlight")
	HightLight.OutlineColor = Color3.fromRGB(255, 255, 255) -- outline warna
	HightLight.FillTransparency = 1 -- background transparant
	HightLight.DepthMode = Enum.HighlightDepthMode.Occluded -- outline tidak tembus object
	HightLight.Parent = char -- set lokasi hight ke character
	
end

function playerMasuk(player)
	-- Deteksi Character Spawn
	player.CharacterAdded:Connect(characterSpawn)
end

-- Deteksi Player Masuk
Player.PlayerAdded:Connect(playerMasuk)
