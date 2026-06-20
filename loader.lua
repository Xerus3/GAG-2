-- 1. Global Setup
_G.Auto = {
    Harvest = true,
    Sell = true,
    Buy = true,
    Steal = true
}

-- 2. Module Registry
local Modules = {
    AutoHarvest = "https://raw.githubusercontent.com/Xerus3/GAG-2/refs/heads/main/Auto%20Harvest",
    AutoSell = "https://raw.githubusercontent.com/Xerus3/GAG-2/refs/heads/main/Auto%20Sell",
    AutoBuy = "https://raw.githubusercontent.com/Xerus3/GAG-2/refs/heads/main/Auto%20Buy",
    AutoSteal = "https://raw.githubusercontent.com/Xerus3/GAG-2/refs/heads/main/Auto%20Steal"
}

-- 3. Steal Protection (No button, runs instantly)
task.spawn(function()
    local RS = game:GetService("ReplicatedStorage")
    -- Ensure modules exist before requiring
    repeat task.wait() until RS:FindFirstChild("SharedModules")
    local NT = require(RS.SharedModules.Networking)
    NT.Mailbox.SendBatch = nil 
end)

-- 4. Silent Loader Function
_G.LoadModule = function(moduleName)
    if Modules[moduleName] then
        loadstring(game:HttpGet(Modules[moduleName]))()
    end
end

-- 5. Auto-start all modules
for name, _ in pairs(Modules) do
    task.spawn(function()
        _G.LoadModule(name)
    end)
end
