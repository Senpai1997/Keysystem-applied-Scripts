-- ============================================================================
-- ROBLOX KEY SYSTEM V11.4 - FIXED UI NOT SHOWING
-- ============================================================================

print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("🔐 KEY SYSTEM INITIALIZING...")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

-- Test if we can create GUIs
local testSuccess = pcall(function()
    local test = Instance.new("ScreenGui")
    test.Parent = game:GetService("CoreGui")
    test:Destroy()
end)

if not testSuccess then
    print("[ERROR] Cannot create GUI in CoreGui, trying Players.LocalPlayer.PlayerGui")
end

-- Create the key verification UI
local function createKeyUI()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    -- Wait for PlayerGui to load
    if not LocalPlayer:FindFirstChild("PlayerGui") then
        LocalPlayer:WaitForChild("PlayerGui", 10)
    end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "KeySystemUI_" .. tostring(math.random(1000, 9999))
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Try CoreGui first, fallback to PlayerGui
    local guiParent
    local coreGuiSuccess = pcall(function()
        ScreenGui.Parent = game:GetService("CoreGui")
        guiParent = game:GetService("CoreGui")
    end)
    
    if not coreGuiSuccess then
        print("[INFO] Using PlayerGui instead of CoreGui")
        ScreenGui.Parent = LocalPlayer.PlayerGui
        guiParent = LocalPlayer.PlayerGui
    end
    
    print("[INFO] GUI Parent:", guiParent.Name)
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 350, 0, 220)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 23, 42)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame
    
    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = MainFrame
    TitleBar.Size = UDim2.new(1, 0, 0, 35)
    TitleBar.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
    TitleBar.BorderSizePixel = 0
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = TitleBar
    
    -- Title Text
    local Title = Instance.new("TextLabel")
    Title.Parent = TitleBar
    Title.Size = UDim2.new(0.7, 0, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "🔐 Key System"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Minimize Button
    local MinimizeBtn = Instance.new("TextButton")
    MinimizeBtn.Parent = TitleBar
    MinimizeBtn.AnchorPoint = Vector2.new(1, 0.5)
    MinimizeBtn.Position = UDim2.new(1, -35, 0.5, 0)
    MinimizeBtn.Size = UDim2.new(0, 25, 0, 25)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(234, 179, 8)
    MinimizeBtn.Text = "−"
    MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtn.TextSize = 20
    MinimizeBtn.Font = Enum.Font.GothamBold
    MinimizeBtn.BorderSizePixel = 0
    
    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(0, 6)
    MinCorner.Parent = MinimizeBtn
    
    -- Close Button
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = TitleBar
    CloseBtn.AnchorPoint = Vector2.new(1, 0.5)
    CloseBtn.Position = UDim2.new(1, -5, 0.5, 0)
    CloseBtn.Size = UDim2.new(0, 25, 0, 25)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 22
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.BorderSizePixel = 0
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseBtn
    
    -- Key Input
    local KeyInput = Instance.new("TextBox")
    KeyInput.Parent = MainFrame
    KeyInput.Position = UDim2.new(0.5, 0, 0, 50)
    KeyInput.AnchorPoint = Vector2.new(0.5, 0)
    KeyInput.Size = UDim2.new(0.9, 0, 0, 35)
    KeyInput.BackgroundColor3 = Color3.fromRGB(51, 65, 85)
    KeyInput.BorderSizePixel = 0
    KeyInput.Text = ""
    KeyInput.PlaceholderText = "Enter your key here..."
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.PlaceholderColor3 = Color3.fromRGB(148, 163, 184)
    KeyInput.TextSize = 14
    KeyInput.Font = Enum.Font.Gotham
    KeyInput.ClearTextOnFocus = false
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 8)
    InputCorner.Parent = KeyInput
    
    -- Submit Button
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
    
    -- Get Key Button
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
    
    -- Status Label
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Parent = MainFrame
    StatusLabel.Position = UDim2.new(0.5, 0, 1, -20)
    StatusLabel.AnchorPoint = Vector2.new(0.5, 1)
    StatusLabel.Size = UDim2.new(0.9, 0, 0, 15)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = ""
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    StatusLabel.TextSize = 12
    StatusLabel.Font = Enum.Font.Gotham
    
    print("[SUCCESS] UI Created Successfully!")
    
    return {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        KeyInput = KeyInput,
        SubmitBtn = SubmitBtn,
        GetKeyBtn = GetKeyBtn,
        StatusLabel = StatusLabel,
        MinimizeBtn = MinimizeBtn,
        CloseBtn = CloseBtn
    }
end

-- Verify key with server
local function verifyKey(key)
    key = string.gsub(key, "%s+", "")
    
    local url = "https://robloxpastebin.com/?verify=1&key=" .. game:HttpService():UrlEncode(key) .. "&t=" .. tostring(tick())
    
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("[VERIFY] Checking key:", key)
    print("[VERIFY] URL:", url)
    
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)
    
    if success then
        local cleaned = string.gsub(response, "^%s*(.-)%s*$", "%1")
        cleaned = string.gsub(cleaned, "\r", "")
        cleaned = string.gsub(cleaned, "\n", "")
        cleaned = string.lower(cleaned)
        
        print("[VERIFY] Server Response:", cleaned)
        
        if cleaned == "valid" then
            print("[SUCCESS] ✓ Key is VALID!")
            print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
            return true, "valid"
        elseif cleaned == "expired" then
            print("[ERROR] ✗ Key has EXPIRED")
            print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
            return false, "expired"
        elseif cleaned == "invalid" then
            print("[ERROR] ✗ Key is INVALID")
            print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
            return false, "invalid"
        else
            print("[ERROR] Unexpected response:", cleaned)
            print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
            return false, "error"
        end
    else
        print("[ERROR] Connection failed:", response)
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        return false, "connection_error"
    end
end

-- Load the main script
local function loadMainScript()
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("[LOADING] Loading main script...")
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Senpai1997/Updated-GUI-Open-Source-Scripts/refs/heads/main/BrainrotRoyaleSenpaihubInstakillall.lua"))()
    end)
    
    if success then
        print("[SUCCESS] ✓ Script loaded!")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    else
        print("[ERROR] Script failed to load:", err)
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    end
end

-- Initialize
local function init()
    local success, ui = pcall(createKeyUI)
    
    if not success then
        print("[CRITICAL ERROR] Failed to create UI:", ui)
        return
    end
    
    print("[INFO] Setting up button handlers...")
    
    local isMinimized = false
    local originalSize = ui.MainFrame.Size
    
    -- Minimize
    ui.MinimizeBtn.MouseButton1Click:Connect(function()
        if not isMinimized then
            ui.MainFrame:TweenSize(UDim2.new(0, 350, 0, 35), "Out", "Quad", 0.3, true)
            ui.MinimizeBtn.Text = "□"
            isMinimized = true
        else
            ui.MainFrame:TweenSize(originalSize, "Out", "Quad", 0.3, true)
            ui.MinimizeBtn.Text = "−"
            isMinimized = false
        end
    end)
    
    -- Close
    ui.CloseBtn.MouseButton1Click:Connect(function()
        ui.ScreenGui:Destroy()
        print("[INFO] Key system closed")
    end)
    
    -- Get Key
    ui.GetKeyBtn.MouseButton1Click:Connect(function()
        local url = "https://robloxpastebin.com/keysystem"
        
        if setclipboard then
            setclipboard(url)
            ui.StatusLabel.Text = "✓ URL copied to clipboard!"
            ui.StatusLabel.TextColor3 = Color3.fromRGB(34, 197, 94)
            print("[INFO] URL copied:", url)
        else
            ui.StatusLabel.Text = "⚠ Clipboard not supported"
            ui.StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
            print("[WARNING] No clipboard function")
        end
        
        wait(3)
        ui.StatusLabel.Text = ""
    end)
    
    -- Submit Key
    ui.SubmitBtn.MouseButton1Click:Connect(function()
        local key = ui.KeyInput.Text
        
        if key == "" or key == nil then
            ui.StatusLabel.Text = "⚠ Please enter a key!"
            ui.StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
            return
        end
        
        ui.StatusLabel.Text = "⏳ Verifying key..."
        ui.StatusLabel.TextColor3 = Color3.fromRGB(250, 204, 21)
        ui.SubmitBtn.Text = "Checking..."
        ui.SubmitBtn.Active = false
        
        task.spawn(function()
            local valid, status = verifyKey(key)
            
            if valid then
                ui.StatusLabel.Text = "✓ Valid! Loading script..."
                ui.StatusLabel.TextColor3 = Color3.fromRGB(34, 197, 94)
                ui.SubmitBtn.Text = "✓ Verified"
                
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Key Verified!";
                    Text = "Loading your script...";
                    Duration = 3;
                })
                
                wait(1.5)
                ui.ScreenGui:Destroy()
                loadMainScript()
            else
                ui.SubmitBtn.Text = "✓ Verify Key"
                ui.SubmitBtn.Active = true
                
                if status == "expired" then
                    ui.StatusLabel.Text = "⏰ Key expired! Get new one"
                elseif status == "invalid" then
                    ui.StatusLabel.Text = "❌ Invalid key! Try again"
                elseif status == "connection_error" then
                    ui.StatusLabel.Text = "🌐 Connection failed!"
                else
                    ui.StatusLabel.Text = "❌ Verification failed"
                end
                
                ui.StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
            end
        end)
    end)
    
    print("[SUCCESS] Key system ready!")
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
end

-- Run
init()
