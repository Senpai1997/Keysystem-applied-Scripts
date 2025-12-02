-- ============================================================================
-- ROBLOX KEY SYSTEM V11.3 - ALL FIXES
-- ============================================================================

-- Create the key verification UI with minimize and close buttons
local function createKeyUI()
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local KeyInput = Instance.new("TextBox")
    local SubmitButton = Instance.new("TextButton")
    local GetKeyButton = Instance.new("TextButton")
    local StatusLabel = Instance.new("TextLabel")
    local MinimizeButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    
    -- Configure ScreenGui
    ScreenGui.Name = "KeySystemUI"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Configure MainFrame
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 23, 42)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    MainFrame.Size = UDim2.new(0, 300, 0, 200)
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = MainFrame
    
    -- Configure Title
    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = "🔐 Script Key System"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16.000
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 10)
    TitleCorner.Parent = Title
    
    -- Minimize Button
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = MainFrame
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(234, 179, 8)
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Position = UDim2.new(1, -60, 0, 5)
    MinimizeButton.Size = UDim2.new(0, 25, 0, 20)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Text = "−"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 18.000
    
    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(0, 4)
    MinCorner.Parent = MinimizeButton
    
    -- Close Button
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    CloseButton.BorderSizePixel = 0
    CloseButton.Position = UDim2.new(1, -30, 0, 5)
    CloseButton.Size = UDim2.new(0, 25, 0, 20)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 20.000
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 4)
    CloseCorner.Parent = CloseButton
    
    -- Configure KeyInput
    KeyInput.Name = "KeyInput"
    KeyInput.Parent = MainFrame
    KeyInput.BackgroundColor3 = Color3.fromRGB(51, 65, 85)
    KeyInput.BorderSizePixel = 0
    KeyInput.Position = UDim2.new(0.5, -125, 0.3, 0)
    KeyInput.Size = UDim2.new(0, 250, 0, 30)
    KeyInput.Font = Enum.Font.Gotham
    KeyInput.PlaceholderText = "Enter your key here..."
    KeyInput.Text = ""
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.TextSize = 14.000
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 5)
    InputCorner.Parent = KeyInput
    
    -- Configure SubmitButton
    SubmitButton.Name = "SubmitButton"
    SubmitButton.Parent = MainFrame
    SubmitButton.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
    SubmitButton.BorderSizePixel = 0
    SubmitButton.Position = UDim2.new(0.5, -60, 0.55, 0)
    SubmitButton.Size = UDim2.new(0, 120, 0, 30)
    SubmitButton.Font = Enum.Font.GothamSemibold
    SubmitButton.Text = "✓ Submit Key"
    SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitButton.TextSize = 14.000
    
    local SubmitCorner = Instance.new("UICorner")
    SubmitCorner.CornerRadius = UDim.new(0, 5)
    SubmitCorner.Parent = SubmitButton
    
    -- Configure GetKeyButton
    GetKeyButton.Name = "GetKeyButton"
    GetKeyButton.Parent = MainFrame
    GetKeyButton.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
    GetKeyButton.BorderSizePixel = 0
    GetKeyButton.Position = UDim2.new(0.5, -60, 0.75, 0)
    GetKeyButton.Size = UDim2.new(0, 120, 0, 30)
    GetKeyButton.Font = Enum.Font.GothamSemibold
    GetKeyButton.Text = "🔑 Get Key"
    GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    GetKeyButton.TextSize = 14.000
    
    local GetKeyCorner = Instance.new("UICorner")
    GetKeyCorner.CornerRadius = UDim.new(0, 5)
    GetKeyCorner.Parent = GetKeyButton
    
    -- Configure StatusLabel
    StatusLabel.Name = "StatusLabel"
    StatusLabel.Parent = MainFrame
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Position = UDim2.new(0, 0, 0.9, 0)
    StatusLabel.Size = UDim2.new(1, 0, 0, 20)
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.Text = ""
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    StatusLabel.TextSize = 12.000
    
    return {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        KeyInput = KeyInput,
        SubmitButton = SubmitButton,
        GetKeyButton = GetKeyButton,
        StatusLabel = StatusLabel,
        MinimizeButton = MinimizeButton,
        CloseButton = CloseButton
    }
end

-- Verify key with server (FIXED - INCREASED TIMEOUT)
local function verifyKey(key)
    key = string.gsub(key, "%s+", "")
    
    local timestamp = tostring(os.time())
    local url = "https://robloxpastebin.com/?verify=1&key=" .. game:HttpService():UrlEncode(key) .. "&t=" .. timestamp
    
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("[DEBUG] Verifying Key:", key)
    print("[DEBUG] Request URL:", url)
    print("[DEBUG] Attempting connection...")
    
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)
    
    if success then
        local originalResponse = response
        response = string.gsub(response, "^%s*(.-)%s*$", "%1")
        response = string.gsub(response, "\r", "")
        response = string.gsub(response, "\n", "")
        response = string.gsub(response, "%z", "")
        response = string.lower(response)
        
        print("[DEBUG] Raw Response:", originalResponse)
        print("[DEBUG] Cleaned Response:", response)
        print("[DEBUG] Response Length:", #response)
        
        if response == "valid" then
            print("[SUCCESS] Key is VALID! ✓")
            print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
            return true, "valid"
        elseif response == "expired" then
            print("[ERROR] Key has EXPIRED")
            print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
            return false, "expired"
        elseif response == "used" then
            print("[ERROR] Key already USED")
            print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
            return false, "used"
        elseif response == "invalid" then
            print("[ERROR] Key is INVALID")
            print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
            return false, "invalid"
        else
            print("[ERROR] Unexpected Response:", response)
            print("[ERROR] First 100 chars:", string.sub(originalResponse, 1, 100))
            
            local bytes = ""
            for i = 1, math.min(20, #response) do
                bytes = bytes .. string.byte(response, i) .. " "
            end
            print("[ERROR] Response Bytes:", bytes)
            print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
            
            return false, "error"
        end
    else
        print("[ERROR] HTTP Request Failed:", response)
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        return false, "connection_error"
    end
end

-- Run the main script after verification
local function runMainScript()
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("[LOADING] Starting main script...")
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    
    local success, result = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Senpai1997/Updated-GUI-Open-Source-Scripts/refs/heads/main/BrainrotRoyaleSenpaihubInstakillall.lua"))()
    end)
    
    if success then
        print("[SUCCESS] ✓ Script loaded successfully!")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    else
        print("[ERROR] Failed to load script:", result)
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Script Error";
            Text = "Failed to load script. Check console (F9)";
            Duration = 5;
        })
    end
end

-- Initialize key system
local function initKeySystem()
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("[INIT] Key System Starting...")
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    
    local ui = createKeyUI()
    local isMinimized = false
    local originalSize = ui.MainFrame.Size
    local originalPosition = ui.MainFrame.Position
    
    -- Minimize functionality
    ui.MinimizeButton.MouseButton1Click:Connect(function()
        if not isMinimized then
            -- Minimize
            ui.MainFrame:TweenSize(UDim2.new(0, 300, 0, 30), "Out", "Quad", 0.3, true)
            ui.MinimizeButton.Text = "+"
            isMinimized = true
        else
            -- Restore
            ui.MainFrame:TweenSize(originalSize, "Out", "Quad", 0.3, true)
            ui.MinimizeButton.Text = "−"
            isMinimized = false
        end
    end)
    
    -- Close functionality
    ui.CloseButton.MouseButton1Click:Connect(function()
        ui.ScreenGui:Destroy()
        print("[INFO] Key system closed by user")
    end)
    
    -- Handle Get Key button
    ui.GetKeyButton.MouseButton1Click:Connect(function()
        local keyWebsite = "https://robloxpastebin.com/keysystem"
        
        if setclipboard then
            setclipboard(keyWebsite)
            ui.StatusLabel.Text = "✓ URL copied! Paste in browser"
            ui.StatusLabel.TextColor3 = Color3.fromRGB(34, 197, 94)
            
            print("[INFO] Key website URL copied to clipboard")
            print("[INFO] URL:", keyWebsite)
        else
            ui.StatusLabel.Text = "⚠ Clipboard not supported"
            ui.StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
            
            print("[WARNING] Clipboard function not available")
        end
    end)
    
    -- Handle Submit button
    ui.SubmitButton.MouseButton1Click:Connect(function()
        local key = ui.KeyInput.Text
        
        if key == "" then
            ui.StatusLabel.Text = "⚠ Please enter a key!"
            ui.StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
            return
        end
        
        ui.StatusLabel.Text = "⏳ Verifying..."
        ui.StatusLabel.TextColor3 = Color3.fromRGB(250, 204, 21)
        ui.SubmitButton.Text = "Checking..."
        ui.SubmitButton.Active = false
        
        -- Use task.spawn instead of task.delay for immediate execution
        task.spawn(function()
            wait(0.5) -- Small delay for UX
            
            local isValid, status = verifyKey(key)
            
            if isValid then
                ui.StatusLabel.Text = "✓ Key verified! Loading..."
                ui.StatusLabel.TextColor3 = Color3.fromRGB(34, 197, 94)
                ui.SubmitButton.Text = "✓ Success"
                
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Key Verified!";
                    Text = "Loading script...";
                    Duration = 3;
                })
                
                wait(1)
                ui.ScreenGui:Destroy()
                runMainScript()
            else
