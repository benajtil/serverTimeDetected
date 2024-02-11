local function calculateServerUptime(playerJoinTime)
    local currentTime = os.time()
    local elapsedTime = currentTime - playerJoinTime

    -- Convert elapsed time to hours, minutes, and seconds
    local hours = math.floor(elapsedTime / 3600)
    local minutes = math.floor((elapsedTime % 3600) / 60)
    local seconds = elapsedTime % 60

    return hours, minutes, seconds
end

local function updateUptimeUI(playerJoinTime)
    local hours, minutes, seconds = calculateServerUptime(playerJoinTime)
    -- Assuming you have a UI element named "ServerUptimeLabel" to display the server uptime
    script.Parent.ServerUptimeLabel.Text = "Server Uptime: " .. hours .. "h " .. minutes .. "m " .. seconds .. "s"
end

-- Function to handle the button click
local button = script.Parent.CheckButton
local isEnabled = false
local playerJoinTime = os.time()

button.MouseButton1Click:Connect(function()
    isEnabled = not isEnabled
    if isEnabled then
        button.Text = "Check"
        button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green color for enabled
        updateUptimeUI(playerJoinTime)
    else
        button.Text = "Off"
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red color for disabled
        -- Clear the UI text when turning off
        script.Parent.ServerUptimeLabel.Text = ""
    end
end)
