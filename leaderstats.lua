-- membuat leaderstats

-- membuat data leaderstats
local Template = {
    ["Level"] = { TypeData = Instance.new("IntValue"), Default = 1 }, -- Integer/Bilangan Bulat
    ["Coins"] = { TypeData = Instance.new("NumberValue"), Default = 10.5 }, -- Float/Bilangan Desimal
    ["Rank"] = { TypeData = Instance.new("StringValue"), Default = "Starter" } -- String/Karakter
}

-- mendeteksi jika player masuk/join
game.Players.PlayerAdded:Connect(function(player)
    
    -- membuat folder bernama leaderstats
    local leaderstats = Instance.new("Folder") -- Folder
    leaderstats.Name = "leaderstats" -- Nama Folder
    leaderstats.Parent = player -- Lokasi Folder
    
    -- memasukkan object/data yg ada di template kedalam folder leaderstats
    for name, data in pairs(Template) do
        local obj = data.TypeData
        obj.Name = name -- nama object
        obj.Value = data.Default -- Default Value/nilai awal object
        obj.Parent = leaderstats -- lokasi object di leaderstats
    end
    
end)
