# Oxireun UI Library


## Booting the Library
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/oxireun/UiLibrary/refs/heads/main/2049.lua"))()
```

## Creating a Window
We use **Smart Arguments**. You don't need to memorize the order! Just pass what you want:
*   **String:** Window Title (e.g., `"Oxireun script"`) or Theme Name.
*   you can pass something for example icon.
*   **Big Number:** Logo ID for the floating icon (e.g., `128337196312757`).
*   **Small Number:** Shape of the floating icon (`1` = Round, `2` = Square).
* available colors`black` `grey` `red` `blue` `green` `pink` `orange` `yellow`
* if you delete the decal id, it will open without icon.

```lua
local Window = Library:NewWindow("Oxireun Script", 128337196312757, 1, "orange")
```

* 
## Adding a Footer
Add a sleek watermark or credit to the bottom of the UI. Uses Smart Arguments (Text, IconID, Shape).
```lua
Window:SetFooter("yt: oxireun", 128337196312757, 2)
```

## Creating Sections (Tabs)
```lua
local MainSection = Window:NewSection("Main")
```

### Button
```lua
MainSection:CreateButton("Click Me", function()
    print("Button Clicked!")
end)
```

### Toggle
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
```lua
MainSection:CreateTextbox("Target Player", function(text)
    print("Searching for:", text)
end)
```

### Dropdown
```lua
MainSection:CreateDropdown("Select Weapon", {"Sword", "Gun", "Knife"}, 1, function(selected)
    print("Equipped:", selected)
end)
```

---

## Notification
It auto-preloads your icons in the background and features a smooth, decreasing time bar.
*   **Format:** `(Title, Text, Duration(time),decal,shape,color )`
```lua
Library:SendNotification("Success!", "Script loaded perfectly.", 3, 128337196312757, 2, "green")
```

---

## Full Example Script

Here is a complete, working example using all the features of the Oxireun UI Library. Images load automatically in the background with zero manual preloading needed!

```lua

-- block anti multiple gui if you add this line you can use multiple guis(don't destroy gui).
if game:GetService("CoreGui"):FindFirstChild("OxireunUI") then return end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/oxireun/UiLibrary/refs/heads/main/2049.lua"))()


local Window = Library:NewWindow(
    "Oxireun Script", -- Window Title
    128337196312757,           -- Floating Logo ID
    2,                -- Shape (1 = Round, 2 = Square)
    "grey"            -- Theme Color
)

Window:SetFooter(
    "yt: oxireun", -- Footer Text
    128337196312757,        -- Footer Icon ID
    2              -- Shape (1 = Round, 2 = Square)
)

-- ========================================== --
-- MAIN SECTION
-- ========================================== --
local MainSection = Window:NewSection("Main") -- Tab Name

MainSection:CreateButton("Test Notification", function()
    Library:SendNotification(
        "Hello!",                         -- Title
        "This is a custom notification.", -- Message
        3,                                -- Duration (Seconds)
        128337196312757,                           -- Icon ID
        2                                 -- Shape (1 = Round, 2 = Square)
    )
end)

MainSection:CreateToggle("Auto Farm", false, function(val) -- Name, Default State, Callback
    print("Auto Farm:", val)
end)

MainSection:CreateTextbox("Search", function(text) -- Name, Callback
    print("Search for:", text)
end)

MainSection:CreateDropdown("Dropdown", {"Hello", "World"}, 1, function(selected) -- Name, Options Array, Default Index, Callback
    print("Selected:", selected)
end)

MainSection:CreateSlider("WalkSpeed", 16, 100, 16, function(val) -- Name, Min Value, Max Value, Default Value, Callback
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
    end
end)

-- ========================================== --
-- CREDITS SECTION
-- ========================================== --
local CreditsSection = Window:NewSection("Credits") -- Tab Name

CreditsSection:CreateButton("Copy YouTube", function()
    setclipboard("https://youtube.com/@oxireun0?si=MxEKGtHSNZm9gTdQ")
    
    Library:SendNotification(
        "Copied!",                           -- Title
        "YouTube link copied to clipboard!", -- Message
        3,                                   -- Duration (Seconds)
        108320733835485,                              -- Icon ID
        2                                    -- Shape (1 = Round, 2 = Square)
    )
end)

CreditsSection:CreateButton("Copy Discord", function()
    setclipboard("https://discord.gg/6M7CBfT2PJ")
    
    Library:SendNotification(
        "Copied!",                             -- Title
        "Discord invite copied to clipboard!", -- Message
        3,                                     -- Duration (Seconds)
        119731774091515,                                -- Icon ID
        2                                      -- Shape (1 = Round, 2 = Square)
    )
end)

```
