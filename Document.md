# 💜 Oxireun UI Library V1

## A highly advanced, modern, and lightweight UI Library for Roblox. Features
include Smart Preloading, Custom Themes, Glassmorphism, Floating Logos, Dynamic
Text Scaling, Anti-Cheat Protection (gethui), and a built-in Custom Notification
System.

🚀 Booting the Library

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/oxireun/UiLibrary/refs/heads/main/V1.lua"))()

⚡ Preloading Icons (Optional)

Preload your image IDs so they instantly appear with zero delay when needed.

Library:PreloadIcons({128337196312757, 13809623192})

🪟 Creating a Window

The library uses Smart Arguments. You can pass arguments in any order!

- Title: String (e.g., "Script")
- LogoID: Number (e.g., 12345678) - Creates a draggable floating icon when
  minimized.
- Shape: 1 (Round) or 2 (Square) - Applies to the floating logo.
- Theme: "black", "grey", "red", "blue", "green", "pink", "orange", "yellow".
  (Leave empty for Default Purple).

local Window = Library:NewWindow("Oxireun Script", 128337196312757, 2, "grey")

🏷️ Setting a Footer

Add a sleek watermark or credit to the bottom of the UI. (Text, IconID, Shape).

Window:SetFooter("yt: oxireun", 128337196312757, 2)

📁 Creating a Section

local MainSection = Window:NewSection("Main")

🔘 Creating Elements

Button:

MainSection:CreateButton("Button", function()
print("Clicked!")
end)

Toggle:

MainSection:CreateToggle("Toggle", false, function(value)
print("Toggle:", value)
end)

Textbox:

MainSection:CreateTextbox("Text box", function(text)
print("Input:", text)
end)

Dropdown:

MainSection:CreateDropdown("Dropdown", {"Hello", "World", "Hello World"}, 1, function(selected)
print("Selected:", selected)
end)

Slider:

MainSection:CreateSlider("Speed", 1, 100, 50, function(value)
print("Speed:", value)
end)

🔔 Custom Notifications

Send beautiful in-game notifications with a decreasing time bar. Supports Smart
Arguments just like the Window!

- Args: Title, Text, Duration, IconID, Shape(1 or 2), Theme(optional)

Library:SendNotification("Success!", "Script loaded perfectly.", 3, 128337196312757, 2)

💎 Full Example Script

Here is a complete, working example using all the features of the Oxireun UI
Library.

-- Anti-Duplicate: Prevents the UI from duplicating if executed multiple times
if game:GetService("CoreGui"):FindFirstChild("OxireunUI") then return end

-- 1. Load the Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/oxireun/UiLibrary/refs/heads/main/V1.lua"))()

-- 2. Preload your images for 0-delay loading
local myIcon = 128337196312757
Library:PreloadIcons({myIcon})

-- 3. Create the Window (Title, LogoID, Square Shape, Grey Theme)
local Window = Library:NewWindow("Oxireun Hub", myIcon, 2, "grey")

-- 4. Set a custom Footer
Window:SetFooter("yt: oxireun", myIcon, 2)

-- ========================================== --
-- MAIN SECTION
-- ========================================== --
local MainSection = Window:NewSection("Main")

MainSection:CreateButton("Click Me!", function()
Library:SendNotification("Button Clicked", "You just clicked the test button!", 3, myIcon, 2)
end)

MainSection:CreateToggle("Auto Farm", false, function(value)
print("Auto Farm is now:", value)
end)

MainSection:CreateTextbox("Search Player", function(text)
print("Searching for:", text)
end)

MainSection:CreateDropdown("Select Weapon", {"Sword", "Gun", "Knife"}, 1, function(selected)
print("Selected Weapon:", selected)
end)

MainSection:CreateSlider("WalkSpeed", 16, 100, 16, function(value)
if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end
end)

-- ========================================== --
-- CREDITS SECTION
-- ========================================== --
local CreditsSection = Window:NewSection("Credits")

CreditsSection:CreateButton("Copy YouTube", function()
setclipboard("https://youtube.com/@oxireun0?si=MxEKGtHSNZm9gTdQ")

-- Custom Notification System  
Library:SendNotification(  
    "Copied!",   
    "YouTube link copied to clipboard!",   
    3,   
    myIcon,   
    2 -- 2 makes the notification icon square  
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
