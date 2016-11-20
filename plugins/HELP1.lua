
do

local function run(msg, matches)
local reply_id = msg['id']
if is_momod(msg) and matches[1]== 'م1' then
local S = [[  
ســورس تيـتـو_نيـو🎖 TETOO_NEW
تـابع قـنـاه
@no_no2
➖🎖➖🎖➖🎖
❀ اوامرالاولـيه فـي المجمـوعه  ❀

🎀🎗 حظر🎖لحـظر العـظو من مجـموعه
🎀🎗 الغاء الحظر🎖للغاء الحـظر عن العظو
🎀🎗منـع 🎖لـمنــع كلــمه معيــنه
🎀🎗 الغاء المنع🎖لفك المنـع عـن الكلمه
🎀🎗 كتم 🎖لكتم العـظو
🎀🎗 كتم 🎖لفـك الكتـم
🎀🎗المكتـومين 🎖لعـرض المكتوميـن
🎀🎗 تاك🎖لعمل تاك للجميع
🎀🎗 تصـميـم🎖لتـصميم الاسم
🎀🎗 زخرفه 🎖لزخرفه اسـم

➖➖➖➖➖➖➖
◤ ســـــورس تيـتــو_نيـــو
🎀🎗مــطور الــسـورس
🎖➖ @l_l_lo
🎖➖ @ll15l
🎀🎗بــوت الــتواصـل
🎖➖ @k4k3_bot

🎀🎗قـناه الســورس
🎖➖ @no_no2
◢

]]
reply_msg(reply_id, S, ok_cb, false) 
end

if not is_momod(msg) then
local S = "   للـمـشـرفـيـن فـقـط 👮🖕🏿"
reply_msg(reply_id, S, ok_cb, false)
end

end
return {
description = "Help list", 
usage = "Help list",
patterns = {
"^(م1)$",
},
run = run 
}
end

