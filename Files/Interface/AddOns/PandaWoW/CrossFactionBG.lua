local soloFrame = CreateFrame("Frame")

soloFrame:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" then
        if addonName == "Blizzard_PVPUI" then
            ConquestFrame.Arena5v5.TeamSizeText:SetText(GetLocale()=='ruRU' and 'Соло' or 'Solo');
            
            hooksecurefunc('ConquestFrame_UpdateJoinButton', function()
                if ConquestFrame.selectedButton.id == 3 and GetNumGroupMembers() == 0 then
                    ConquestFrame.JoinButton.tooltip = nil;
                    ConquestFrame.JoinButton:Enable();
				elseif ConquestFrame.selectedButton.id == 4 then
				    if GetNumGroupMembers() == 0 then
					    ConquestFrame.RatedBG.TeamSizeText:SetText(GetLocale()=='ruRU' and 'Соло' or 'Solo');
						ConquestFrame.JoinButton.tooltip = nil;
                        ConquestFrame.JoinButton:Enable();
					else
					    ConquestFrame.RatedBG.TeamSizeText:SetText(CONQUEST_SIZE_STRINGS[ConquestFrame.RatedBG:GetID()]);
					end
                end
            end)
        elseif addonName == "Blizzard_InspectUI" then
            InspectPVPFrame.Arena5v5.BGType:SetText(GetLocale() == 'ruRU' and 'Соло бои на арене' or 'Solo Arena Battles');
        end
    end
end)

soloFrame:RegisterEvent("ADDON_LOADED")
