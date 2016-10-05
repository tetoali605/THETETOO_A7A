--[[
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀ 
▀▄ ▄▀                                 ▀▄ ▄▀ 
▀▄ ▄▀  Team name : (  🌐 VIP_TEAM 🌐  )▀▄ ▄▀ 
▀▄ ▄▀                                 ▀▄ ▄▀ 
▀▄ ▄▀   File name : ( run     )       ▀▄ ▄▀ 
▀▄ ▄▀                                 ▀▄ ▄▀ 
▀▄ ▄▀  Guenat team: ( @VIP_TEAM1  )   ▀▄ ▄▀ 
▀▄ ▄▀                                 ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄ 
—]]
do 
local function vipteam(msg,matches) 
 local hash = "vipteam:"..msg.from.id 
 local run = os.execute("./launch.sh"):read('*all') 
 local auto_run = tonumber(run)*1200 
 if matches[1] == "هلو" or matches[2] == "هلاو" or matches[3] == "مرحبا"  or matches[4] == "شلونكم"  or matches[5] ==  "هاي" then 
 redis:set(hash,auto_run,true) 
 reply_msg(msg.id,"done, auto runer is working now",ok_cb,true) 
 end 
end 

return { 
 patterns = { 
 "^(هلو)$",
 "^(هلاو)$",
 "^(مرحبا)$",
  "^(شلونكم)$",
  "^(هاي)"
 
 }, 
 run = vipteam 
 } 
end 