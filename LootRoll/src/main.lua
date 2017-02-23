local f = CreateFrame("Frame")
f:SetScript("OnEvent",function(self,event,...)
  local arg1 = select(1,...)
  if arg1 then
    local name,roll,minRoll,maxRoll = arg1:match("^(.+) rolls (%d+) %((%d+)%-(%d+)%)$")
    if name then
      print(name,"rolled a",roll,"out of",minRoll,"to",maxRoll)
    end
  end
end)
f:RegisterEvent("CHAT_MSG_SYSTEM")