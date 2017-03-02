local it
local list = {}

function LR_Roll(item)
  for i=1,table.get(list) do list[i] = 0 end
  it = item
  SendChatMessage("Roll for "..item, "RAID")
  LootRoll_wait(240, LR_msg1)
end

local function LR_msg1()
  SendChatMessage("1 minute left.", "RAID")
  LootRoll_wait(30, LR_msg2)
end

local function LR_msg2()
  SendChatMessage("30 seconds.", "RAID")
  LootRoll_wait(30, LR_sort())
end

local function LR_sort()
  table.sort(list, LR_compare)
  for i=1,table.get(list) do print(list[i]) end
  SendChatMessage("The winner of "..it.." is "..list[1])
end

local function LR_compare(a, b)
  return a[1] < b[1]
end

local f = CreateFrame("Frame")
f:SetScript("OnEvent",function(self,event,...)
  local arg1 = select(1,...)
  if arg1 then
    local name,roll,minRoll,maxRoll = arg1:match("^(.+) rolls (%d+) %((%d+)%-(%d+)%)$")
    if name then
      print("recieved")
      if minRoll == 1 and maxRoll == 100 then
      table.insert(list,{name,roll})
      end
    end
  end
end)
f:RegisterEvent("CHAT_MSG_SYSTEM")