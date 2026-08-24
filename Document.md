# oxireun UI Library

This documentation is for the Oxireun UI Library.

## Booting the Library

    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/oxireun/UiLibrary/refs/heads/main/V1.lua"))()

## Creating a Window

    local Window = Library:NewWindow("Script")

## Creating a Section

    local MainSection = Window:NewSection("Main")

## Creating a Button

    MainSection:CreateButton("Button", function()

    end)

## Creating a Toggle

    MainSection:CreateToggle("Toggle", false, function(value)

    end)

## Creating a Textbox

    MainSection:CreateTextbox("Text box", function(text)

    end)

## Creating a Dropdown

    MainSection:CreateDropdown("Dropdown", {"Hello", "World", "Hello World"}, 1, function(selected)

    end)

## Creating a Slider

    MainSection:CreateSlider("Speed", 1, 100, 50, function(value)

    end)

## Full Example

    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/oxireun/UiLibrary/refs/heads/main/V1.lua"))()

    local Window = Library:NewWindow("Script")

    local MainSection = Window:NewSection("Main")

    MainSection:CreateButton("Button", function()

    end)

    MainSection:CreateToggle("Toggle", false, function(value)

    end)

    MainSection:CreateTextbox("Text box", function(text)

    end)

    MainSection:CreateDropdown("Dropdown", {"Hello", "World", "Hello World"}, 1, function(selected)

    end)

    MainSection:CreateSlider("Speed", 1, 100, 50, function(value)

    end)
