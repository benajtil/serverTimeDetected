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

-- Get the player's join time (time when they joined the server)
local playerJoinTime = os.time()

-- Update server uptime UI
updateUptimeUI(playerJoinTime)
