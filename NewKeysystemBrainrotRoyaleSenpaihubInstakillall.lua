-- ============================================================================
-- ROBLOX KEY SYSTEM - COMPLETE TEST SCRIPT
-- ============================================================================

-- Create the key verification UI
local function createKeyUI()
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local KeyInput = Instance.new("TextBox")
    local SubmitButton = Instance.new("TextButton")
    local GetKeyButton = Instance.new("TextButton")
    local StatusLabel = Instance.new("TextLabel")
    
    ScreenGui.Name = "KeySystemUI"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 23, 42)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    MainFrame.Size = UDim2.new(0, 300, 0, 200)
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = MainFrame
    
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
        KeyInput = KeyInput,
        SubmitButton = SubmitButton,
        GetKeyButton = GetKeyButton,
        StatusLabel = StatusLabel
    }
end

-- Verify key with server
local function verifyKey(key)
    key = string.gsub(key, "%s+", "")
    
    local timestamp = tostring(os.time())
    local url = "https://robloxpastebin.com/?verify=1&key=" .. game:HttpService():UrlEncode(key) .. "&t=" .. timestamp
    
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("[DEBUG] Verifying Key:", key)
    print("[DEBUG] Request URL:", url)
    
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

-- Run the main script
local function runMainScript()
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("[SUCCESS] KEY VERIFIED - LOADING SCRIPT!")
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    
    -- Your actual script here
    print("🚀 Main script loaded successfully!")
    
    -- Example: Load your hub
    -- local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/..."))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Senpai1997/Updated-GUI-Open-Source-Scripts/refs/heads/main/BrainrotRoyaleSenpaihubInstakillall.lua"))()
end

-- Initialize key system
local function initKeySystem()
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    print("[INIT] Key System Starting...")
    print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    
    local ui = createKeyUI()
    
    ui.GetKeyButton.MouseButton1Click:Connect(function()
        local keyWebsite = "https://robloxpastebin.com/keysystem"
        
        if setclipboard then
            setclipboard(keyWebsite)
            ui.StatusLabel.Text = "✓ URL copied! Paste in browser"
            ui.StatusLabel.TextColor3 = Color3.fromRGB(34, 197, 94)
            print("[INFO] Key website URL copied to clipboard")
        else
            ui.StatusLabel.Text = "⚠ Clipboard not supported"
            ui.StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
        end
    end)
    
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
        
        task.delay(0.5, function()
            local isValid, status = verifyKey(key)
            
            if isValid then
                ui.StatusLabel.Text = "✓ Key verified! Loading..."
                ui.StatusLabel.TextColor3 = Color3.fromRGB(34, 197, 94)
                ui.SubmitButton.Text = "✓ Success"
                
                task.delay(1, function()
                    ui.ScreenGui:Destroy()
                    runMainScript()
                end)
            else
                ui.SubmitButton.Text = "✓ Submit Key"
                
                if status == "expired" then
                    ui.StatusLabel.Text = "⏰ Key expired! Get a new one"
                    ui.StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
                elseif status == "used" then
                    ui.StatusLabel.Text = "⚠ Key already used!"
                    ui.StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
                elseif status == "connection_error" then
                    ui.StatusLabel.Text = "🌐 Connection failed! Try again"
                    ui.StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
                else
                    ui.StatusLabel.Text = "❌ Invalid key! Try again"
                    ui.StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
                end
            end
        end)
    end)
end

-- Start
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("🔐 ROBLOX KEY SYSTEM V11.2")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
initKeySystem()


---

### 5. Testing Checklist

✅ **Endpoint Test:** `https://robloxpastebin.com/?verify=1&key=TEST` returns `invalid`  
✅ **Generate Key:** Complete tasks and get a key with countdown timer  
✅ **Verify in Roblox:** Paste the key and it should say "Key verified!"  
✅ **Check Console:** Look for debug logs in your executor console  

---

## If You Get "Invalid Key" in Roblox

Check the **executor console** (F9 or console output). You'll see debug logs like:

[DEBUG] Verifying Key: ABCD-1234-EFGH-5678
[DEBUG] Raw Response: valid
[DEBUG] Cleaned Response: valid
[SUCCESS] Key is VALID! ✓
