do

local function run(msg, matches)

local reply_id = msg['id']
if is_momod(msg) and matches[1] == 'م المطور' then 
    local ghost = [[
ســورس تيـتـو_نيـو🎖 TETOO_NEW
تـابع قـنـاه
@no_no2

➖🎖➖🎖➖🎖
❀ اوامـر الـمـطـور❀
🎀🎗 تفعيل 🎖للتـفعيل البـوت
🎀🎗 تعـطيل🎖لتعـطيل الـبوت
🎀🎗 موقعـي 🎖لاظهـار موقعك
🎀🎗 معلـوماتي🎖لـعرض معلومات العضو
🎀🎗الملفات  🎖لعرض ملفات السـورس
🎀🎗 تفعيل ملف 🎖لتفعيل ملف +اسم
🎀🎗تعطيل ملف  🎖لتعطيل ملف +اسـم
🎀🎗اذاعه 🎖للبـث في كروبات الـبوت
🎀🎗 تفعيل لمده🎖للتفعيل لبوت لمده زمنيه
🎀🎗 الردود🎖لعرض الردود
🎀🎗 رد اضف 🎖لاضافه رد
🎀🎗 رد حذف 🎖لحـذف رد
🎀🎗 تنـظيف بلعدد🎖لمسـح رسائل الكـروب
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
  "^(م المطور)$", 
}, 
run = run 
} 
end
