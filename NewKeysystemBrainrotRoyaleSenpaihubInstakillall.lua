--[[ 
    ROBLOX KEY SYSTEM CLIENT (V6 - Cache Fix)
]]

-- 1. CONFIGURATION
-- Replace with your website URL (No trailing slash)
local WEBSITE_URL = "https://robloxpastebin.com" 
local KEY_PAGE_SLUG = "/keysystem" 

-- The Script to run after key is verified
local function RunMainScript()
    print("KEY VERIFIED! Starting Hub...")
    -- YOUR SCRIPT HERE
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Senpai1997/Updated-GUI-Open-Source-Scripts/refs/heads/main/BrainrotRoyaleSenpaihubInstakillall.lua"))()
end

-- //UI CODE START//
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local SubTitle = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local UICorner_Input = Instance.new("UICorner")
local VerifyBtn = Instance.new("TextButton")
local UICorner_Btn = Instance.new("UICorner")
local GetKeyBtn = Instance.new("TextButton")
local UICorner_Get = Instance.new("UICorner")
local StatusText = Instance.new("TextLabel")

ScreenGui.Name = "KeySystemUI_V6"
if gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 23, 42)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 240)

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 0, 0.08, 0)
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Font = Enum.Font.GothamBold
Title.Text = "SECURITY GATEWAY"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20.000

SubTitle.Parent = MainFrame
SubTitle.BackgroundTransparency = 1.000
SubTitle.Position = UDim2.new(0, 0, 0.18, 0)
SubTitle.Size = UDim2.new(1, 0, 0, 20)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "Please enter your access key"
SubTitle.TextColor3 = Color3.fromRGB(148, 163, 184)
SubTitle.TextSize = 14.000

KeyInput.Parent = MainFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0, 40)
KeyInput.Font = Enum.Font.GothamMedium
KeyInput.PlaceholderText = "Paste Key Here..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14.000

UICorner_Input.CornerRadius = UDim.new(0, 6)
UICorner_Input.Parent = KeyInput

VerifyBtn.Parent = MainFrame
VerifyBtn.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
VerifyBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
VerifyBtn.Size = UDim2.new(0.38, 0, 0, 35)
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.Text = "SUBMIT"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.TextSize = 14.000
UICorner_Btn.CornerRadius = UDim.new(0, 6)
UICorner_Btn.Parent = VerifyBtn

GetKeyBtn.Parent = MainFrame
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
GetKeyBtn.Position = UDim2.new(0.52, 0, 0.6, 0)
GetKeyBtn.Size = UDim2.new(0.38, 0, 0, 35)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.Text = "GET KEY"
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.TextSize = 14.000
UICorner_Get.CornerRadius = UDim.new(0, 6)
UICorner_Get.Parent = GetKeyBtn

StatusText.Parent = MainFrame
StatusText.BackgroundTransparency = 1.000
StatusText.Position = UDim2.new(0, 0, 0.82, 0)
StatusText.Size = UDim2.new(1, 0, 0, 20)
StatusText.Font = Enum.Font.Gotham
StatusText.Text = ""
StatusText.TextColor3 = Color3.fromRGB(255, 50, 50)
StatusText.TextSize = 13.000

local function setStatus(msg, color)
    StatusText.Text = msg
    StatusText.TextColor3 = color
    task.wait(2)
    StatusText.Text = ""
end

GetKeyBtn.MouseButton1Click:Connect(function()
    local link = WEBSITE_URL .. KEY_PAGE_SLUG
    if setclipboard then
        setclipboard(link)
        setStatus("Link copied to clipboard!", Color3.fromRGB(59, 130, 246))
    else
        setStatus("Executor doesn't support clipboard", Color3.fromRGB(255, 50, 50))
    end
end)

VerifyBtn.MouseButton1Click:Connect(function()
    local key = KeyInput.Text
    if key:gsub(" ", "") == "" then
        setStatus("Please enter a key", Color3.fromRGB(255, 50, 50))
        return
    end
    
    StatusText.Text = "Verifying..."
    StatusText.TextColor3 = Color3.fromRGB(255, 255, 0)
    
    -- IMPORTANT: ADDING TICK() TO BUST CACHE
    local requestUrl = WEBSITE_URL .. "/?verify=1&key=" .. key .. "&t=" .. tostring(tick())
    
    local success, response = pcall(function()
        return game:HttpGet(requestUrl)
    end)
    
    if success then
        -- Clean response string
        response = string.gsub(response, "^%s*(.-)%s*$", "%1")
        
        if response == "valid" then
            StatusText.Text = "Success!"
            StatusText.TextColor3 = Color3.fromRGB(0, 255, 0)
            
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            local tween = TweenService:Create(MainFrame, tweenInfo, {Size = UDim2.new(0, 0, 0, 0)})
            tween:Play()
            task.wait(0.6)
            ScreenGui:Destroy()
            RunMainScript()
        elseif response == "expired" then
            setStatus("Key has expired!", Color3.fromRGB(255, 50, 50))
        elseif response == "invalid" then
            setStatus("Invalid Key", Color3.fromRGB(255, 50, 50))
        else
            setStatus("Error: " .. response, Color3.fromRGB(255, 100, 0))
            print("Server Response:", response) -- Debug print
        end
    else
        setStatus("Connection Failed", Color3.fromRGB(255, 50, 50))
        warn("HTTP Error:", response)
    end
end)
