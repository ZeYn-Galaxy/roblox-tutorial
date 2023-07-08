local Start = workspace.Start -- Part yang akan disentuh untuk teleport
local Target = workspace.Target -- Part yang akan jadi target/tujuan
local Debounce = false -- untuk menghindari spam

Start.Touched:Connect(function(hit)
	-- Jika object yang nyentuh start memiliki humanoid dan Debounce == false
	if hit.Parent:FindFirstChild("Humanoid") and not Debounce then
		Debounce =  true -- ubah jadi true untuk hindari spam
		-- check apakah object adalah player
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		-- jika player
		if player then
			-- Pindahkan posisi character ke target yg dituju
			-- Target.CFrame + Vector3.new(x, y, z) | tambahkan nilai y, jika mau posisi character
			-- ketika di teleport posisi character lebih tinggi target
			hit.Parent:SetPrimaryPartCFrame(Target.CFrame + Vector3.new(0,2,0)) 

			print("AA")
		end
	end
	task.wait(1) -- delay, untuk debounce jadi false
	Debounce = false
end)
