# 💜 Oxireun UI Library V1

A clean, modern, and lightweight Roblox UI library. Features include auto-preloading images, smart arguments, anti-cheat protection (`gethui`), glassmorphism, and a custom notification system.

## Booting the Library
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/oxireun/UiLibrary/refs/heads/main/V1.lua"))()
```

## Creating a Window
We use **Smart Arguments**. You don't need to memorize the order! Just pass what you want:
*   **String:** Window Title (e.g. `"My Hub"`) or Theme (`"black"`, `"grey"`, `"red"`, `"orange"`, etc. Leave blank for default Purple).
*   **Big Number:** Logo ID for the floating icon (e.g. `128337196312757`).
*   **Small Number:** Shape of the icon (`1` = Round, `2` = Square).

```lua
local Window = Library:NewWindow("Oxireun Script", 128337196312757, 2, "grey")
```

## Adding a Footer
Add a sleek watermark at the bottom. (Text, IconID, Shape)
```lua
Window:SetFooter("yt: oxireun", 128337196312757, 2)
```

## Sections & Elements
```lua
local Main = Window:NewSection("Main")

Main:CreateButton("Button", function()
    print("Clicked!")
end)

Main:CreateToggle("Toggle", false, function(state)
    print("State:", state)
end)

Main:CreateTextbox("Search", function(text)
    print("Input:", text)
end)

Main:CreateDropdown("Dropdown", {"A", "B", "C"}, 1, function(selected)
    print("Selected:", selected)
end)

Main:CreateSlider("Speed", 1, 100, 50, function(value)
    print("Value:", value)
end)
```

## Custom Notifications
Forget `SetCore`! Use our built-in notification system. It auto-preloads your icons in the background and uses the same Smart Arguments.
```lua
Library:SendNotification("Success!", "Script loaded perfectly.", 3, 128337196312757, 2)
```

---

## 💎 Full Example
*(Note: Images load automatically in the background, zero manual preloading needed!)*

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/oxireun/UiLibrary/refs/heads/main/V1.lua"))()

local myIcon = 128337196312757

-- Create Window (Title, LogoID, Square Shape, Grey Theme)
local Window = Library:NewWindow("Oxireun Script", myIcon, 2, "grey")

-- Set Footer
Window:SetFooter("yt: oxireun", myIcon, 2)

-- ========================================== --
-- MAIN SECTION
-- ========================================== --
local MainSection = Window:NewSection("Main")

MainSection:CreateButton("Test Notification", function()
    Library:SendNotification("Hello!", "This is a custom notification.", 3, myIcon, 2)
end)

MainSection:CreateToggle("Auto Farm", false, function(val)
    print("Auto Farm:", val)
end)

MainSection:CreateTextbox("Search", function(text)
    print("Search for:", text)
end)

MainSection:CreateDropdown("Dropdown", {"Hello", "World"}, 1, function(selected)
    print("Selected:", selected)
end)

MainSection:CreateSlider("WalkSpeed", 16, 100, 16, function(val)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
    end
end)

-- ========================================== --
-- CREDITS SECTION
-- ========================================== --
local CreditsSection = Window:NewSection("Credits")

CreditsSection:CreateButton("Copy YouTube", function()
    setclipboard("https://youtube.com/@oxireun0?si=MxEKGtHSNZm9gTdQ")
    
    Library:SendNotification(
        "Copied!", 
        "YouTube link copied to clipboard!", 
        3, 
        myIcon, 
        2 
    )
end)

CreditsSection:CreateButton("Copy Discord", function()
    setclipboard("https://discord.gg/6M7CBfT2PJ")
    
    Library:SendNotification(
        "Copied!", 
        "Discord invite copied to clipboard!", 
        3, 
        myIcon, 
        2 
    )
end)
```
