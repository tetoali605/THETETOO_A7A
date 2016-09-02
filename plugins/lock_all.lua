--[[
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀
▀▄ ▄▀                                 ▀▄ ▄▀
▀▄ ▄▀  Team name : (  🌐 VIP_TEAM 🌐  )▀▄ ▄▀
▀▄ ▄▀                                 ▀▄ ▄▀
▀▄ ▄▀   File name : ( #lock_all )     ▀▄ ▄▀
▀▄ ▄▀                                 ▀▄ ▄▀
▀▄ ▄▀  Guenat team: ( @VIP_TEAM1  )   ▀▄ ▄▀
▀▄ ▄▀                                 ▀▄ ▄▀
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄
—]]
function pre_process(msg)
local saeco = "mate"..msg.to.id
if redis:get(saeco) and msg.text and not is_momod(msg) then
delete_msg(msg.id, ok_cb, false) 
local sajody = "🙂 اهلاً "..msg.from.first_name.."\n".."لا ترسل اي شيئ الكروب الان في وضع الصامت 🔇 \n انتضر قليلاً 😌"
return reply_msg(msg.id, sajody, ok_cb, false)
end
return msg
end
local function saeco(msg,matches)
if matches[1] == "فتح الكل" and is_momod(msg) then
local saeco = "mate"..msg.to.id
redis:set(saeco, true)
local wathiq = "☺️ اهلا "..msg.from.first_name.."\n".."تم الغاء قفل الكل ✅"
return reply_msg(msg.id, wathiq, ok_cb, false)
end
if matches[1] == "قفل الكل" and is_momod(msg) then
local saeco = "mate"..msg.to.id
redis:del(saeco)
local mustafaip = "☺️ اهلاً "..msg.from.first_name.."\n".."تم تفعيل امر قفل الكل ✅"
return reply_msg(msg.id, mustafaip, ok_cb, false)
end
if matches[1] == "فتح الكل" and not is_momod(msg) then
local ali = "🙁 اسف جداً "..msg.from.first_name.."\n".."🙂 فقط الادمنز يستطيعون استخدام هذا الامر"
return reply_msg(msg.id, ali, ok_cb, false)
end
if matches[1] == "قفل الكل" and not is_momod(msg) then
local ali = "🙁 اسف جداً "..msg.from.first_name.."\n".."🙂 فقط الادمنز يستطيعون استخدام هذا الامر"
return reply_msg(msg.id, ali, ok_cb, false)
end
end

return { 
patterns = { 
    "^[!/#](فتح الكل)$", 
    "^[!/#](قفل الكل)$" 
}, 
run = saeco, 
pre_process = pre_process 
} 