-- 1. Wait for game load
repeat task.wait() until game:IsLoaded()
task.wait(3) -- Give the game a 3-second buffer for internal modules

-- 2. Steal Protection (Must happen first)
task.spawn(function()
    local RS = game:GetService("ReplicatedStorage")
    local NT = require(RS:WaitForChild("SharedModules", 20):WaitForChild("Networking", 20))
    NT.Mailbox.SendBatch = nil
end)

-- 3. Global Auto Flags
_G.Auto = { Buy = true, Steal = true, Sell = true, Harvest = true }

-- 4. Sequential Loading
local Modules = {
    "https://raw.githubusercontent.com/Xerus3/GAG-2/refs/heads/main/Auto%20Buy",
    "https://raw.githubusercontent.com/Xerus3/GAG-2/refs/heads/main/Auto%20Harvest",
    "https://raw.githubusercontent.com/Xerus3/GAG-2/refs/heads/main/Auto%20Sell",
    "https://raw.githubusercontent.com/Xerus3/GAG-2/refs/heads/main/Auto%20Steal"
}

-- Load them one by one to prevent 'require' collisions
for _, url in pairs(Modules) do
    task.wait(1) -- Delay between modules prevents the 'Cannot require' crash
    loadstring(game:HttpGet(url))()
end
