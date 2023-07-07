local Lightning = game.Lighting
local RS = game:GetService("RunService")
local TambahWaktu = 0.01 -- semakin tinggi, semakin cepat waktu berlalu

RS.Heartbeat:Connect(function(delta)
	game.Lighting.ClockTime += TambahWaktu
	task.wait(delta)
end)
