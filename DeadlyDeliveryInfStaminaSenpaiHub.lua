-- ============================================================================
-- DIAGNOSTIC VERSION - FIND THE EXACT PROBLEM
-- ============================================================================

print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("KEY SYSTEM LOADED")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

-- Test HTTP Service
local HttpService = game:GetService("HttpService")
print("[TEST] HttpService found:", HttpService ~= nil)

-- Test basic HTTP request
print("[TEST] Testing basic HTTP request...")
local testSuccess, testResult = pcall(function()
    return game:HttpGet("https://httpbin.org/get")
end)
print("[TEST] Basic HTTP works:", testSuccess)
if not testSuccess then
    print("[ERROR] HTTP Test Failed:", testResult)
end

-- Create UI
local function createKeyUI()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    if not LocalPlayer:FindFirstChild("PlayerGui") then
        LocalPlayer:WaitForChild("PlayerGui", 10)
    end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "KeySystemUI_" .. tostring(math.random(1000, 9999))
    ScreenGui.ResetOnSpawn = false
    
    local success = pcall(function()
        ScreenGui.Parent = game:GetService("CoreGui")
    end)
    
    if not success then
        ScreenGui.Parent = LocalPlayer.PlayerGui
    end
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = ScreenGui
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 350, 0, 250)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 23, 42)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = MainFrame
    
    local Title = Instance.new("TextLabel")
    Title.Parent = MainFrame
    Title.Size = UDim2.new(1, 0, 0, 35)
    Title.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
    Title.BorderSizePixel = 0
    Title.Text = "🔐 Key System"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.Font = Enum.Font.GothamBold
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = Title
    
    local KeyInput = Instance.new("TextBox")
    KeyInput.Parent = MainFrame
    KeyInput.Position = UDim2.new(0.5, 0, 0, 50)
    KeyInput.AnchorPoint = Vector2.new(0.5, 0)
    KeyInput.Size = UDim2.new(0.9, 0, 0, 35)
    KeyInput.BackgroundColor3 = Color3.fromRGB(51, 65, 85)
    KeyInput.BorderSizePixel = 0
    KeyInput.Text = ""
    KeyInput.PlaceholderText = "Paste your key here..."
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.PlaceholderColor3 = Color3.fromRGB(148, 163, 184)
    KeyInput.TextSize = 14
    KeyInput.Font = Enum.Font.Gotham
    KeyInput.ClearTextOnFocus = false
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 8)
    InputCorner.Parent = KeyInput
    
    local SubmitBtn = Instance.new("TextButton")
    SubmitBtn.Parent = MainFrame
    SubmitBtn.Position = UDim2.new(0.5, 0, 0, 100)
    SubmitBtn.AnchorPoint = Vector2.new(0.5, 0)
    SubmitBtn.Size = UDim2.new(0.9, 0, 0, 35)
    SubmitBtn.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
    SubmitBtn.BorderSizePixel = 0
    SubmitBtn.Text = "✓ Verify Key"
    SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitBtn.TextSize = 15
    SubmitBtn.Font = Enum.Font.GothamBold
    
    local SubmitCorner = Instance.new("UICorner")
    SubmitCorner.CornerRadius = UDim.new(0, 8)
    SubmitCorner.Parent = SubmitBtn
    
    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Parent = MainFrame
    GetKeyBtn.Position = UDim2.new(0.5, 0, 0, 145)
    GetKeyBtn.AnchorPoint = Vector2.new(0.5, 0)
    GetKeyBtn.Size = UDim2.new(0.9, 0, 0, 35)
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
    GetKeyBtn.BorderSizePixel = 0
    GetKeyBtn.Text = "🔑 Get Key"
    GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    GetKeyBtn.TextSize = 15
    GetKeyBtn.Font = Enum.Font.GothamBold
    
    local GetKeyCorner = Instance.new("UICorner")
    GetKeyCorner.CornerRadius = UDim.new(0, 8)
    GetKeyCorner.Parent = GetKeyBtn
    
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Parent = MainFrame
    StatusLabel.Position = UDim2.new(0.5, 0, 0, 195)
    StatusLabel.AnchorPoint = Vector2.new(0.5, 0)
    StatusLabel.Size = UDim2.new(0.9, 0, 0, 40)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = "Ready to verify"
    StatusLabel.TextColor3 = Color3.fromRGB(148, 163, 184)
    StatusLabel.TextSize = 11
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.TextWrapped = true
    StatusLabel.TextYAlignment = Enum.TextYAlignment.Top
    
    print("[SUCCESS] UI Created")
    
    return {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        KeyInput = KeyInput,
        SubmitBtn = SubmitBtn,
        GetKeyBtn = GetKeyBtn,
        StatusLabel = StatusLabel
    }
end

-- Verify with detailed logging
local function verifyKey(key, statusLabel)
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("[STEP 1] Starting verification...")
    statusLabel.Text = "[1/7] Starting verification..."
    task.wait(0.1)
    
    -- Clean key
    print("[STEP 2] Cleaning key...")
    statusLabel.Text = "[2/7] Cleaning key..."
    key = string.gsub(key, "%s+", "")
    print("[KEY] Original:", key)
    task.wait(0.1)
    
    -- Build URL
    print("[STEP 3] Building URL...")
    statusLabel.Text = "[3/7] Building request URL..."
    local timestamp = tostring(tick())
    local encodedKey = HttpService:UrlEncode(key)
    local url = "https://robloxpastebin.com/?verify=1&key=" .. encodedKey .. "&t=" .. timestamp
    print("[URL]", url)
    task.wait(0.1)
    
    -- Make request
    print("[STEP 4] Sending HTTP request...")
    statusLabel.Text = "[4/7] Sending request to server..."
    task.wait(0.1)
    
    local requestSuccess, response = pcall(function()
        return game:HttpGet(url, true)
    end)
    
    print("[STEP 5] Request completed")
    statusLabel.Text = "[5/7] Request completed..."
    task.wait(0.1)
    
    if not requestSuccess then
        print("[ERROR] HTTP Request failed:", response)
        statusLabel.Text = "ERROR: " .. tostring(response)
        return false, "connection_error"
    end
    
    -- Process response
    print("[STEP 6] Processing response...")
    statusLabel.Text = "[6/7] Processing server response..."
    print("[RAW RESPONSE]", response)
    print("[RAW LENGTH]", #response)
    
    -- Show first 100 characters
    local preview = string.sub(response, 1, 100)
    print("[PREVIEW]", preview)
    
    -- Show byte values
    local bytes = ""
    for i = 1, math.min(20, #response) do
        bytes = bytes .. string.byte(response, i) .. " "
    end
    print("[BYTES]", bytes)
    task.wait(0.1)
    
    -- Clean response
    local cleaned = string.gsub(response, "^%s*(.-)%s*$", "%1")
    cleaned = string.gsub(cleaned, "\r", "")
    cleaned = string.gsub(cleaned, "\n", "")
    cleaned = string.lower(cleaned)
    
    print("[CLEANED]", cleaned)
    print("[CLEANED LENGTH]", #cleaned)
    task.wait(0.1)
    
    -- Check response
    print("[STEP 7] Checking response...")
    statusLabel.Text = "[7/7] Validating response..."
    task.wait(0.1)
    
    if cleaned == "valid" then
        print("[RESULT] ✓ VALID KEY!")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        return true, "valid"
    elseif cleaned == "expired" then
        print("[RESULT] ✗ EXPIRED KEY")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        return false, "expired"
    elseif cleaned == "invalid" then
        print("[RESULT] ✗ INVALID KEY")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        return false, "invalid"
    else
        print("[RESULT] ✗ UNEXPECTED RESPONSE:", cleaned)
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        return false, "error"
    end
end

-- Load script
local function loadMainScript()
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("[LOADING] Main script...")
    
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Senpai1997/Updated-GUI-Open-Source-Scripts/refs/heads/main/DeadlyDeliveryInfStaminaSenpaiHub.lua"))()
    end)
    
    if success then
        print("[SUCCESS] ✓ Script loaded!")
    else
        print("[ERROR] Script failed:", err)
    end
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
end

-- Initialize
local function init()
    local ui = createKeyUI()
    
    -- Get Key button
    ui.GetKeyBtn.MouseButton1Click:Connect(function()
        local url = "https://robloxpastebin.com/keysystem?utm_source=keysystem&utm_medium=keysystem&utm_campaign=keysystem"
        
        if setclipboard then
            setclipboard(url)
            ui.StatusLabel.Text = "✓ URL copied to clipboard!"
            ui.StatusLabel.TextColor3 = Color3.fromRGB(34, 197, 94)
            print("[INFO] URL copied")
        else
            ui.StatusLabel.Text = "⚠ Clipboard not supported"
            ui.StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
        end
        
        task.wait(3)
        ui.StatusLabel.Text = "Ready to verify"
        ui.StatusLabel.TextColor3 = Color3.fromRGB(148, 163, 184)
    end)
    
    -- Submit button
    ui.SubmitBtn.MouseButton1Click:Connect(function()
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        print("🔘 VERIFY BUTTON CLICKED")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        
        local key = ui.KeyInput.Text
        
        if key == "" then
            print("[ERROR] No key entered")
            ui.StatusLabel.Text = "⚠ Please enter a key!"
            ui.StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
            return
        end
        
        print("[INFO] Key entered:", key)
        
        ui.StatusLabel.Text = "⏳ Starting verification..."
        ui.StatusLabel.TextColor3 = Color3.fromRGB(250, 204, 21)
        ui.SubmitBtn.Text = "Checking..."
        ui.SubmitBtn.Active = false
        
        print("[INFO] Spawning verification task...")
        
        task.spawn(function()
            print("[INFO] Inside task.spawn")
            
            local valid, status = verifyKey(key, ui.StatusLabel)
            
            print("[INFO] Verification returned:", valid, status)
            
            if valid then
                ui.StatusLabel.Text = "✓ VALID! Loading script..."
                ui.StatusLabel.TextColor3 = Color3.fromRGB(34, 197, 94)
                ui.SubmitBtn.Text = "✓ Verified"
                
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Key Verified!";
                    Text = "Loading script...";
                    Duration = 3;
                })
                
                task.wait(1.5)
                ui.ScreenGui:Destroy()
                loadMainScript()
            else
                ui.SubmitBtn.Text = "✓ Verify Key"
                ui.SubmitBtn.Active = true
                
                if status == "expired" then
                    ui.StatusLabel.Text = "⏰ Key expired! Get a new one"
                elseif status == "invalid" then
                    ui.StatusLabel.Text = "❌ Invalid key! Check and try again"
                elseif status == "connection_error" then
                    ui.StatusLabel.Text = "🌐 Connection failed! Check console (F9)"
                else
                    ui.StatusLabel.Text = "❌ Verification failed: " .. status
                end
                
                ui.StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
            end
        end)
        
        print("[INFO] Task spawned, waiting for result...")
    end)
    
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("✓ Key system ready!")
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
end

init()
