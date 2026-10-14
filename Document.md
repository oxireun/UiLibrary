# Oxireun UI Library


## Booting the Library
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/oxireun/UiLibrary/refs/heads/main/V1.lua"))()
```

## Creating a Window
We use **Smart Arguments**. You don't need to memorize the order! Just pass what you want:
*   **String:** Window Title (e.g., `"Oxireun script"`) or Theme Name.
*   you can pass something for example icon.
*   **Big Number:** Logo ID for the floating icon (e.g., `128337196312757`).
*   **Small Number:** Shape of the floating icon (`1` = Round, `2` = Square).

```lua
local Window = Library:NewWindow("Oxireun Script", 128337196312757, 2, "grey")
```

## Available Themes
* `"black"` (OLED Dark)
* `"grey"` (Sleek Graphite)
* `"red"` (Crimson Red)
* `"blue"` (Neon Cyan)
* `"green"` (Lime Green)
* `"pink"` (Deep Pink)
* `"orange"` (Orange Red)
* `"yellow"` (Bright Yellow)

## Adding a Footer
Add a sleek watermark or credit to the bottom of the UI. Uses Smart Arguments (Text, IconID, Shape).
```lua
Window:SetFooter("yt: oxireun", 128337196312757, 2)
```

## Creating Sections (Tabs)
Sections act as your tabs. You can create as many as you need.
```lua
local MainSection = Window:NewSection("Main")
```


### Button
A simple clickable button.
```lua
MainSection:CreateButton("Click Me", function()
    print("Button Clicked!")
end)
```

### Toggle
A switch for turning features on and off.
```lua
MainSection:CreateToggle("Auto Farm", false, function(state)
    print("Toggle State:", state)
end)
```

### Slider
A smooth slider for adjusting numeric values. (Name, Min, Max, Default, Callback)
```lua
MainSection:CreateSlider("WalkSpeed", 16, 100, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
```

### Textbox
An input box for typing custom text or numbers.
```lua
MainSection:CreateTextbox("Target Player", function(text)
    print("Searching for:", text)
end)
```

### Dropdown
A menu to select an option from a list. (Name, Options Table, Default Index, Callback)
```lua
MainSection:CreateDropdown("Select Weapon", {"Sword", "Gun", "Knife"}, 1, function(selected)
    print("Equipped:", selected)
end)
```

---

## Custom Notifications
Forget Roblox's default `SetCore`! Use our built-in notification system. It auto-preloads your icons in the background and features a smooth, decreasing time bar.
*   **Format:** `(Title, Text, Duration, ...SmartArgs)`
```lua
Library:SendNotification("Success!", "Script loaded perfectly.", 3, 128337196312757, 2, "green")
```

---

## Full Example Script

Here is a complete, working example using all the features of the Oxireun UI Library. Images load automatically in the background with zero manual preloading needed!

```lua

-- Anti-Duplicate: Prevents the UI from duplicating if executed multiple times
if game:GetService("CoreGui"):FindFirstChild("OxireunUI") then return end

-- Load the Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/oxireun/UiLibrary/refs/heads/main/V1.lua"))()

local myIcon = 128337196312757 -- İkon ID'miz

-- Create Window 
local Window = Library:NewWindow("Oxireun Script", myIcon, 2, "grey") -- "Oxireun Script" = Başlık, myIcon = Logo ID, 2 = Dörtgen Şekil, "grey" = Tema

-- Set Footer
Window:SetFooter("yt: oxireun", myIcon, 2) -- "yt: oxireun" = Alt Yazı, myIcon = İkon ID, 2 = Dörtgen Şekil

-- ========================================== --
-- MAIN SECTION
-- ========================================== --
local MainSection = Window:NewSection("Main") -- "Main" = Sekme (Tab) Adı

MainSection:CreateButton("Test Notification", function() -- "Test Notification" = Buton Adı
    
    Library:SendNotification("Hello!", "This is a custom notification.", 3, myIcon, 2) -- "Hello!" = Başlık, "This is..." = Mesaj, 3 = Ekranda Kalma Süresi (Saniye), myIcon = İkon ID, 2 = Dörtgen Şekil

end)

MainSection:CreateToggle("Auto Farm", false, function(val) -- "Auto Farm" = Toggle Adı, false = Kapalı olarak başlat
    print("Auto Farm:", val)
end)

MainSection:CreateTextbox("Search", function(text) -- "Search" = Kutunun içindeki ipucu yazısı
    print("Search for:", text)
end)

MainSection:CreateDropdown("Dropdown", {"Hello", "World"}, 1, function(selected) -- "Dropdown" = Adı, {"Hello", "World"} = Liste Seçenekleri, 1 = Başlangıçta 1. seçenek ("Hello") seçili olsun
    print("Selected:", selected)
end)

MainSection:CreateSlider("WalkSpeed", 16, 100, 16, function(val) -- "WalkSpeed" = Adı, 16 = Minimum Limit, 100 = Maksimum Limit, 16 = Başlangıç Değeri
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
    end
end)

-- ========================================== --
-- CREDITS SECTION
-- ========================================== --
local CreditsSection = Window:NewSection("Credits") -- "Credits" = 2. Sekme (Tab) Adı

CreditsSection:CreateButton("Copy YouTube", function() -- "Copy YouTube" = Buton Adı
  
    setclipboard("https://youtube.com/@oxireun0?si=MxEKGtHSNZm9gTdQ")
    
    Library:SendNotification("Copied!", "YouTube link copied to clipboard!", 3, myIcon, 2) -- 3 = Saniye, myIcon = İkon ID, 2 = Dörtgen
    
end)

CreditsSection:CreateButton("Copy Discord", function() -- "Copy Discord" = Buton Adı

    setclipboard("https://discord.gg/6M7CBfT2PJ")
    
    Library:SendNotification("Copied!", "Discord invite copied to clipboard!", 3, myIcon, 2) -- 3 = Saniye, myIcon = İkon ID, 2 = Dörtgen
    
end)


```
