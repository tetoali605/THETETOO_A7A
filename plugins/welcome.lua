do 
local function iq_abs(msg,matches) 
local reply_id = msg['id'] 

if matches[1] == "chat_add_user" then -- Channel @DEV_PROX 
return '🌝🍷 اهـلا وسـهلا نـورت/ي عـزيـزي/تـي :-\n'..msg.from.first_name..'\n\n' 
..'📊 معرف الضافك :: @'..msg.from.username..'\n\n' 
..'📊 الايدي :: '..msg.from.id..'\n\n' 
..'📊 اسم المجموعة :: '..msg.to.title..'\n\n' 
..'📊 ايدي المجموعة :: '..msg.to.id..'\n\n' 
..'📊 تابع قناة البوت :: @VIP_TEAM1'
elseif matches[1] == "chat_add_user_link" then
return '🌝🍷 اهـلا وسـهلا نـورت/ي عـزيـزي/تـي:-\n'..msg.from.first_name..'\n\n' 
..'📊 معرفك :: @'..msg.from.username..'\n\n' 
..'📊 ايديك :: '..msg.from.id..'\n\n' 
..'📊 اسم المجموعة :: '..msg.to.title..'\n\n' 
..'📊 ايدي المجموعة :: '..msg.to.id..'\n\n' 
..'📊 تابع قناة البوت :: @VIP_TEAM1'
end 

if matches[1] == "chat_del_user" then 
local bye_name = msg.action.user.first_name 
return 'روحةبلا ردة 🌝🙌: '..bye_name 
end 
end 

return { 
patterns = { 
"^!!tgservice (chat_add_user)$", 
"^!!tgservice (chat_add_user_link)$", 
"^!!tgservice (chat_del_user)$", 
}, 
run = iq_abs, 
} 
end