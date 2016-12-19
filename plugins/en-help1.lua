do

local function run(msg, matches)
if is_sudo(msg) and matches[1]== "he1" then
return [[
🎀🎖اوامـر الادريه في سـورس تيـتو نكليـزي
#تسـتخدم معها [/!#]
➖➖➖➖➖➖

🎀🎖/who 🏅قائمه اعـضاء الكـروب

🎀🎖/info 🏅معلـوماتـي

🎀🎖/gpinfo 🏅معلومات الكروب

🎀🎖/me 🏅مـوقعـي 

🎀🎖/id 🏅ايـدي الكروب او برد لضهور ايدي العضو

🎀🎖/link 🏅لضهور رابط الكروب

🎀🎖/ setlink 🏅وضع رابط

🎀🎖/newlink 🏅وضع رابط جديد

🎀🎖/setrules 🏅وضع قـوانـين

🎀🎖/rules 🏅لضهور القـوانين

🎀🎖/setabout 🏅لوضـع وصف

🎀🎖/setname 🏅 لـوضع اسـم

🎀🎖/setwlc 🏅لـوضع الترحـيب 

🎀🎖/setbye 🏅 لـوضع تـوديع

🎀🎖/setphoto 🏅لـوضع صوره

➖➖➖➖➖➖
🎀🎖مـطور الســورس
🎀🎖 @l_l_lo
🎀🎖قنـاة السـورس
🎀🎖 @no_no
🎀🎖بـووت تواصل السورس
🎀🎖 @k4k33_bot

🎀🎖معـرف مـطور البـوت 
@اكتب معرفك و لا تحذف حقوقنا

]]
end

if not is_momod(msg) then
return "🎀🎖للمـــشـرفيـن فقـط 🏅 انتـةة دايح مو مشـرف 💃️"
end

end
return {
description = "Help list", 
usage = "sudo list",
patterns = {
"[#!/](he1)"
},
run = run 
}
end

