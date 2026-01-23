-- Executor-only visual loading screen (Delta / Synapse-style)
-- Purely client-side visuals. No remotes. No data.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Clean old UI
pcall(function()
    if game.CoreGui:FindFirstChild("XLAM_HUB_UI") then
        game.CoreGui.XLAM_HUB_UI:Destroy()
    end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "XLAM_HUB_UI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Fullscreen black overlay
local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1,1)
bg.Position = UDim2.fromScale(0,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BorderSizePixel = 0
bg.Parent = gui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.fromScale(1,0.15)
title.Position = UDim2.fromScale(0,0.35)
title.BackgroundTransparency = 1
title.Text = "XLAM HUB"
title.TextColor3 = Color3.fromRGB(200,0,0)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.Parent = bg

-- Subtitle (smaller and moved closer under title)
local subtitle = Instance.new("TextLabel")
subtitle.AnchorPoint = Vector2.new(0.5, 0)
-- placed just below the reduced title box to decrease the gap
subtitle.Position = UDim2.fromScale(0.5, 0.48)
subtitle.Size = UDim2.fromScale(0.7, 0.03) -- slightly wider but shorter
subtitle.BackgroundTransparency = 1
subtitle.Text = "Make a repost of any video from my tiktok and dm me to get free stuff"
subtitle.TextColor3 = Color3.fromRGB(255,255,255)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.TextWrapped = true
subtitle.TextXAlignment = Enum.TextXAlignment.Center
subtitle.Parent = bg

-- Splash text (above bar) — moved lower accordingly
local splash = Instance.new("TextLabel")
splash.AnchorPoint = Vector2.new(0.5, 0)
splash.Position = UDim2.fromScale(0.5, 0.62) -- slightly higher than before
splash.Size = UDim2.fromScale(0.9, 0.05)
splash.BackgroundTransparency = 1
splash.TextColor3 = Color3.fromRGB(220,220,220)
splash.TextScaled = true
splash.Font = Enum.Font.Gotham
splash.TextXAlignment = Enum.TextXAlignment.Center
splash.Parent = bg

-- Loading bar (moved a bit up to keep compact layout)
local barBack = Instance.new("Frame")
barBack.AnchorPoint = Vector2.new(0.5, 0)
barBack.Position = UDim2.fromScale(0.5, 0.69) -- raised a touch
barBack.Size = UDim2.fromScale(0.6, 0.028)
barBack.BackgroundColor3 = Color3.fromRGB(25,25,25)
barBack.BorderSizePixel = 0
barBack.Parent = bg

local barFill = Instance.new("Frame")
barFill.Position = UDim2.fromScale(0,0)
barFill.Size = UDim2.fromScale(0,1)
barFill.BackgroundColor3 = Color3.fromRGB(120,0,0)
barFill.BorderSizePixel = 0
barFill.Parent = barBack

-- Percentage text (moved accordingly)
local percentLabel = Instance.new("TextLabel")
percentLabel.AnchorPoint = Vector2.new(0.5, 0)
percentLabel.Position = UDim2.fromScale(0.5, 0.725) -- adjusted to match new bar position
percentLabel.Size = UDim2.fromScale(0.18, 0.04)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.TextColor3 = Color3.fromRGB(200,200,200)
percentLabel.TextScaled = true
percentLabel.Font = Enum.Font.Gotham
percentLabel.TextXAlignment = Enum.TextXAlignment.Center
percentLabel.Parent = bg

-- Splashes pool
local allSplashes = {
    "Disabling anti-cheat","Bypassing server checks","Enabling server bypass",
    "Reading game memory","Writing to client memory","Hooking game events",
    "Injecting modules","Intercepting replication","Syncing with server",
    "Loading players","Scanning signatures","Bypassing client protections",
    "Modifying game values","Forcing required flags","Blocking integrity checks",
    "Intercepting RemoteEvents","Activating hidden features","Updating offsets",
    "Verifying bypass stability","Cheat ready"
}

-- Random 10 splashes
math.randomseed(tick() + os.time())
local splashes = {}
local pool = {table.unpack(allSplashes)}
for i = 1, 10 do
    if #pool == 0 then break end
    local idx = math.random(1, #pool)
    table.insert(splashes, table.remove(pool, idx))
end

-- Loading simulation: 90–180 sec
local totalTime = math.random(90,180)
local elapsed = 0
local progress = 0
local splashIndex = 1
local nextSplashChange = tick() + math.random(5,20)
splash.Text = splashes[splashIndex] or "Initializing"

-- Red blinking effect
spawn(function()
    while gui.Parent do
        TweenService:Create(barFill, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(255,0,0)}):Play()
        task.wait(0.6)
        TweenService:Create(barFill, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(120,0,0)}):Play()
        task.wait(0.6)
    end
end)

local multiplier = 1.0
local nextSpeedChange = tick() + math.random(1,5)

while elapsed < totalTime do
    local dt = RunService.RenderStepped:Wait()
    elapsed = elapsed + dt
    if tick() >= nextSpeedChange then
        local r = math.random()
        if r < 0.2 then
            multiplier = 0
        elseif r < 0.6 then
            multiplier = math.random() * 0.6 + 0.2
        else
            multiplier = math.random() * 2.0 + 0.5
        end
        nextSpeedChange = tick() + math.random(1,5)
    end
    progress = math.clamp(progress + (dt * multiplier) / totalTime * 0.99, 0, 0.99)
    barFill.Size = UDim2.fromScale(progress, 1)
    percentLabel.Text = tostring(math.floor(progress * 100)) .. "%"
    if tick() >= nextSplashChange then
        splashIndex = splashIndex + 1
        if splashes[splashIndex] then
            splash.Text = splashes[splashIndex]
            nextSplashChange = tick() + math.random(5,20)
        end
    end
end

-- Freeze at 99%
barFill.Size = UDim2.fromScale(0.99,1)
percentLabel.Text = "99%"
splash.Text = "The cheat is almost ready. Don't close the game"
while true do RunService.RenderStepped:Wait() end
