--[[

abo asola
]]
do

local function run(msg, matches)
if is_momod(msg) and matches[1]== "he3" then
return [[
🎀🎖اوامـر الـحمـايةة في ســورس تيـتو نكليـزي
#تسـتخدم معهـا [/!#]

🎀🎖قائمــةة المنع

🎀🎖/mute و امر للمنع

🎀🎖/unmute وامـر للفك المنع

🎀🎖audio 🏅الصـوت 

🎀🎖photo 🏅الصور

🎀🎖video 🏅الفيـديو 

🎀🎖gifs 🏅الصور المتحركةة
 
🎀🎖text 🏅الكتابةة

🎀🎖قائمــةة القفل

🎀🎖/lock و امر للقفل

🎀🎖/unlock وامر للفتح

🎀🎖/links 🏅 الروابط

🎀🎖/ flood 🏅 التكرار

🎀🎖/ spam 🏅الكلايـش 

🎀🎖/sticker 🏅 الملصقـاات

🎀🎖/tag 🏅تاك 

🎀🎖/ emoji 🏅الـسمايلات 

🎀🎖/bots 🏅البوتاات

🎀🎖/fwd 🏅اعادة توجيةة

🎀🎖/media 🏅الوسـائط او الميديا

🎀🎖/leave 🏅المغـادرةة

🎀🎖/all 🏅الكل


🎀🎖مـطور الســورس 
🎀🎖 @l_l_lo
🎀🎖قـناه السـورس
🎀🎖 @no_no2
🎀🎖بـوت تواصل السـورس
🎀🎖 @k4k33_bot


]]
end

if not is_momod(msg) then
return "🎀🎖للمـــشـرفيـن فقـط 🏅 انتـةة دايح مو مشـرف 💃️"
end

end
return {
description = "Help list", 
usage = "Help list",
patterns = {
"[#!/](he3)"
},
run = run 
}
end
