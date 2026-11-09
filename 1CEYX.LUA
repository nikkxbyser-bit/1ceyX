-- 1ceyX
-- Custom UI for your Roblox game

local Players = game:GetService("Players")
local Stats = game:GetService("Stats")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "1ceyX"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(280, 320)
frame.Position = UDim2.new(0.5, -140, 0.5, -160)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
frame.Parent = gui

local function label(text, y)
    local item = Instance.new("TextLabel")
    item.Size = UDim2.new(1, -20, 0, 35)
    item.Position = UDim2.fromOffset(10, y)
    item.BackgroundTransparency = 1
    item.TextColor3 = Color3.new(1, 1, 1)
    item.Text = text
    item.TextSize = 17
    item.Parent = frame
    return item
end

label("1ceyX SETTINGS", 10)
local pingLabel = label("PING: Loading...", 55)
label("ACCURACY: Custom", 100)
label("CUSTOM KEY: E", 145)
label("TURN ON MACRO", 190)
label("TURN OFF MACRO KEY: Q", 235)

local function updatePing()
    local success, ping = pcall(function()
        return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    end)

    if success then
        pingLabel.Text = "PING: " .. math.floor(ping) .. " ms"
    end
end

task.spawn(function()
    while gui.Parent do
        updatePing()
        task.wait(1)
    end
end)

gui.Parent = player:WaitForChild("PlayerGui")
