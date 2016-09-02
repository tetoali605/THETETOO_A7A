--[[
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀
▀▄ ▄▀                                 ▀▄ ▄▀
▀▄ ▄▀  Team name : (  🌐 VIP_TEAM 🌐  )▀▄ ▄▀
▀▄ ▄▀                                 ▀▄ ▄▀
▀▄ ▄▀   File name : ( #اسم الملف هنا )    ▀▄ ▄▀
▀▄ ▄▀                                 ▀▄ ▄▀
▀▄ ▄▀  Guenat team: ( @VIP_TEAM1  )   ▀▄ ▄▀
▀▄ ▄▀                                 ▀▄ ▄▀
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄
—]]
local function run (msg, matches)
local data = load_data(_config.moderation.data)
   if matches[1] == 'chat_add_user_link' then
        local user_id = msg.from.id
        if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
        if data[tostring(msg.to.id)]['settings']['join'] == 'yes' then
      kick_user(user_id, msg.to.id)
    end
   end
end   
 end
 end
return {
  patterns = {
    "^!!tgservice (chat_add_user_link)$"
  },
  run = run
}
