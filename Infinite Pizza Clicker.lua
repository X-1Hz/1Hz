local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success or not Rayfield then
    warn("Failed to load Rayfield UI Library!")
    return
end
local autoClick 	= false
function Click()
    game:GetService("ReplicatedStorage").Remotes.Click:FireServer()
end    

local Window = Rayfield:CreateWindow({
    Name = "1 Hz ┃ Infinite Pizza Clicker",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by 1 Hz",
    Theme = "Dark Blue", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "by 1 Hz"
    },
 
    Discord = {
       Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "YERMQTRRmQ", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = false -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "1 Hz ┃ Infinite Pizza Clicker",
       Subtitle = "Key System",
       Note = "Join Discord For Get Key!", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"ILOVE_1Hz"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })
 Rayfield:Notify({
    Title = "1 Hz ┃ Infinite Pizza Clicker",
    Content = "by 1 Hz",
    Duration = 6.5,
    Image = "check",
 })


 local farm = Window:CreateTab("Auto Farm", "circle-play")
local cred = Window:CreateTab("Credits", "cross")
local misc = Window:CreateTab("Misc", "settings-2")


local Toggle = farm:CreateToggle({
    Name = "Auto Click",
    CurrentValue = false,
    Flag = "wintoggle",
    Callback = function(Value)
        autoClick = Value
        while autoClick == true do
            Click()
            task.wait()
        end
    end,
})
local Button = misc:CreateButton({
    Name = "Rejoin",
    Callback = function()
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(game.PlaceId, p)    
    end,
 })

local dis = cred:CreateLabel("Join My discord For More Info!")
local Button = cred:CreateButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.com/YERMQTRRmQ")
    end,
 })

 