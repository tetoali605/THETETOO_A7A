
do

local function run(msg, matches)
local reply_id = msg['id']
if is_momod(msg) and matches[1]== 'م1' then
local S = [[  
ســورس تيـتـو_نيـو🎖 TETOO_NEW
تـابع قـنـاه
@no_no2
➖🎖➖🎖➖🎖

❀اوامـر تـرقـيه و الحـذف فـي مجموعه❀

🎀🎖طرد 🎗لـطرد العـظو من مجموعه
🎀🎖حظر🎗لحـظر العـظو من مجموعه
🎀🎖مغادرة 🎗لترك مجموعه
🎀🎖اطردني 🎗لترك مجموعه
🎀🎖حظر عام🎗لحظر من مجموعات البوت
🎀🎖الغاء الحظر🎗لفتح حظر عن العظو
🎀🎖الغاء العام 🎗لفتح حظر العام
➖🎗➖🎗➖🎗
🎀🎖ارفع ادمن 🎗لترقيه العظو الي ادمن
🎀🎖ارفع مدير 🎗لرفع ادمن
🎀🎖ارفع اداري 🎗لرفع اداري 

🎀🎖جميع اوامر تستخدم معها معرف و بعض منها الرد

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

