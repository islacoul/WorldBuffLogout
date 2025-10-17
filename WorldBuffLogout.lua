local mainFrame = CreateFrame("Frame")
local isEnabled = false

mainFrame:SetScript("OnEvent", function(event, arg1)
    if event == "PLAYER_ENTERING_WORLD" then
        DEFAULT_CHAT_FRAME:AddMessage("WorldBuffLogout loaded. Use |cffffff00/fu|r to toggle auto-logout.", 0.5, 1.0, 0.5)
        mainFrame:UnregisterEvent("PLAYER_ENTERING_WORLD")
    end
    
    if event == "CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS" then
        if isEnabled == true then
            if arg1 == "You gain Rallying Cry of the Dragonslayer" then
                Logout()
            end
        end
    end
end)

mainFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
mainFrame:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS")

SLASH_WORLDBUFFLOGOUT1 = "/fu"
SlashCmdList["WORLDBUFFLOGOUT"] = function()
    isEnabled = not isEnabled
    
    if isEnabled then
        DEFAULT_CHAT_FRAME:AddMessage("WorldBuffLogout: |cff00ff00Enabled|r. Auto-logout is active.", 1, 1, 0)
    else
        DEFAULT_CHAT_FRAME:AddMessage("WorldBuffLogout: |cffff0000Disabled|r.", 1, 1, 0)
    end
end