--[[ 
    ROBLOX KEY SYSTEM CLIENT (v4.0)
    Works with WordPress Key System Ultimate
]]

-- 1. CONFIGURATION
-- Replace this with your WordPress website URL (No trailing slash)
local WEBSITE_URL = "https://robloxpastebin.com" 

-- The slug of the page where you put [roblox_key_page]
local KEY_PAGE_SLUG = "/keysystem" 

-- The Script to run after key is verified
local function RunMainScript()
    -- PUT YOUR ACTUAL SCRIPT HERE
    print("Key Verified! Loading script...")
    
    -- Example: Loading Speed Hub X (As per your previous request)
    local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/Senpai1997/Updated-GUI-Open-Source-Scripts/refs/heads/main/BrainrotRoyaleSenpaihubInstakillall.lua"))()
    for PlaceID, Execute in pairs(Games) do
        if PlaceID == game.PlaceId then
            loadstring(game:HttpGet(Execute))()
        end
    end
end

-- /////////////////////////////////////////////////////////////////
-- UI & LOGIC CODE (DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING)
-- /////////////////////////////////////////////////////////////////

local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

-- Create UI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local DropShadow = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local SubTitle = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local UICorner_Input = Instance.new("UICorner")
local VerifyBtn = Instance.new("TextButton")
local UICorner_Btn = Instance.new("UICorner")
local GetKeyBtn = Instance.new("TextButton")
local UICorner_Get = Instance.new("UICorner")
local StatusText = Instance.new("TextLabel")

-- Properties
ScreenGui.Name = "KeySystemUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 23, 42) -- Dark Slate
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 240)

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Title
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 0, 0.08, 0)
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Font = Enum.Font.GothamBold
Title.Text = "SECURITY GATEWAY"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20.000

SubTitle.Name = "SubTitle"
SubTitle.Parent = MainFrame
SubTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubTitle.BackgroundTransparency = 1.000
SubTitle.Position = UDim2.new(0, 0, 0.18, 0)
SubTitle.Size = UDim2.new(1, 0, 0, 20)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "Please enter your access key"
SubTitle.TextColor3 = Color3.fromRGB(148, 163, 184)
SubTitle.TextSize = 14.000

-- Input Box
KeyInput.Name = "KeyInput"
KeyInput.Parent = MainFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0, 40)
KeyInput.Font = Enum.Font.GothamMedium
KeyInput.PlaceholderColor3 = Color3.fromRGB(100, 116, 139)
KeyInput.PlaceholderText = "Paste Key Here..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14.000

UICorner_Input.CornerRadius = UDim.new(0, 6)
UICorner_Input.Parent = KeyInput

-- Verify Button
VerifyBtn.Name = "VerifyBtn"
VerifyBtn.Parent = MainFrame
VerifyBtn.BackgroundColor3 = Color3.fromRGB(34, 197, 94) -- Green
VerifyBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
VerifyBtn.Size = UDim2.new(0.38, 0, 0, 35)
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.Text = "SUBMIT"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.TextSize = 14.000

UICorner_Btn.CornerRadius = UDim.new(0, 6)
UICorner_Btn.Parent = VerifyBtn

-- Get Key Button
GetKeyBtn.Name = "GetKeyBtn"
GetKeyBtn.Parent = MainFrame
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(59, 130, 246) -- Blue
GetKeyBtn.Position = UDim2.new(0.52, 0, 0.6, 0)
GetKeyBtn.Size = UDim2.new(0.38, 0, 0, 35)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.Text = "GET KEY"
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.TextSize = 14.000

UICorner_Get.CornerRadius = UDim.new(0, 6)
UICorner_Get.Parent = GetKeyBtn

-- Status Text
StatusText.Name = "StatusText"
StatusText.Parent = MainFrame
StatusText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StatusText.BackgroundTransparency = 1.000
StatusText.Position = UDim2.new(0, 0, 0.82, 0)
StatusText.Size = UDim2.new(1, 0, 0, 20)
StatusText.Font = Enum.Font.Gotham
StatusText.Text = ""
StatusText.TextColor3 = Color3.fromRGB(255, 50, 50)
StatusText.TextSize = 13.000

-- Logic Functions

local function setStatus(msg, color)
    StatusText.Text = msg
    StatusText.TextColor3 = color
    task.wait(2)
    StatusText.Text = ""
end

-- 1. Handle GET KEY Click
GetKeyBtn.MouseButton1Click:Connect(function()
    local link = WEBSITE_URL .. KEY_PAGE_SLUG
    setclipboard(link)
    setStatus("Link copied to clipboard!", Color3.fromRGB(59, 130, 246))
end)

-- 2. Handle VERIFY Click
VerifyBtn.MouseButton1Click:Connect(function()
    local key = KeyInput.Text
    
    -- Basic Validation
    if key:gsub(" ", "") == "" then
        setStatus("Please enter a key", Color3.fromRGB(255, 50, 50))
        return
    end
    
    StatusText.Text = "Verifying..."
    StatusText.TextColor3 = Color3.fromRGB(255, 255, 0)
    
    -- Construct API URL
    local requestUrl = WEBSITE_URL .. "/?verify=1&key=" .. key
    
    -- Send Request
    local success, response = pcall(function()
        return game:HttpGet(requestUrl)
    end)
    
    if success then
        -- Remove whitespace from response just in case
        response = response:gsub("%s+", "")
        
        if response == "valid" then
            StatusText.Text = "Success!"
            StatusText.TextColor3 = Color3.fromRGB(0, 255, 0)
            
            -- Success Animation
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            local tween = TweenService:Create(MainFrame, tweenInfo, {Size = UDim2.new(0, 0, 0, 0)})
            tween:Play()
            
            task.wait(0.6)
            ScreenGui:Destroy()
            
            -- RUN THE SCRIPT
            RunMainScript()
            
        elseif response == "expired" then
            setStatus("Key has expired!", Color3.fromRGB(255, 50, 50))
        elseif response == "invalid" then
            setStatus("Invalid Key", Color3.fromRGB(255, 50, 50))
        else
            setStatus("Unknown Response: " .. tostring(response), Color3.fromRGB(255, 100, 0))
        end
    else
        setStatus("Connection Error", Color3.fromRGB(255, 50, 50))
    end
end)
