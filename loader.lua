local Modules = {
    AutoHarvest = "URL_TO_YOUR_RAW_GITHUB_HARVEST",
    AutoSell = "URL_TO_YOUR_RAW_GITHUB_SELL",
    AutoBuy = "URL_TO_YOUR_RAW_GITHUB_BUY",
    AutoSteal = "URL_TO_YOUR_RAW_GITHUB_STEAL"
}

-- You can create a simple function to handle loading
_G.LoadModule = function(moduleName)
    loadstring(game:HttpGet(Modules[moduleName]))()
end
