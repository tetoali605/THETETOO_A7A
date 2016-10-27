do

local function run(msg, matches)

local reply_id = msg['id']
if is_momod(msg) and matches[1] == 'م2' then 
    local ghost = [[
▇▆▅▄ اوامـر خـاصه بلمجموعــه ▄▅▆▆

⚠️🔱 ضع صوره 🔲 لوضع صوره

⚠️🔱 ضع قوانين 🔲 لوضع قوانيـن

⚠️🔱ضع معرف 🔲 لوضع معرف

⚠️🔱 ضع وصف 🔲 لوضع وصف

⚠️🔱 ضع اسم 🔲 لـوضع اسـم

⚠️🔱 ضع رابـط 🔲 لوضع رابـط

⚠️🔱 الرابـط 🔲 لعـرض رابط كروب

▒▒██████████▒▒

⚠️🔱 المـطور 🔲لعـرض مطور

⚠️🔱 معلوماتي 🔲 لعـرض معلـوماتك

⚠️🔱 ايدي 🔲 لعرض ايدي كروب

⚠️🔱 ايدي بلرد 🔲 لعرض ايدي عضـو

⚠️🔱الاعـدادت 🔲 لعـرض اعدادات مجموعه

▒▒██████████▒▒
🔲قــناه سـورس
🔳 @no_no2
🔲مـطور السـورس
🔳 @l_l_lo
🔲 بـوت تواصـل
🔳 @k4k3_bot
▒▒██████████▒▒
]]
  reply_msg(reply_id, ghost, ok_cb, false) 
end 

local reply_id = msg['id'] 
if not is_momod(msg) then 
local ghost = "للـمـشـرفـيـن فـقـط 🌝😹" 
reply_msg(reply_id, ghost, ok_cb, false) 
end 

end 
return { 
patterns ={ 
  "^(م2)$", 
}, 
run = run 
} 
end
