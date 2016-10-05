--[[
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀ 
▀▄ ▄▀                                 ▀▄ ▄▀ 
▀▄ ▄▀  Team name : (  🌐 VIP_TEAM 🌐  )▀▄ ▄▀ 
▀▄ ▄▀                                 ▀▄ ▄▀ 
▀▄ ▄▀   File name : ( #موقعي     )    ▀▄ ▄▀ 
▀▄ ▄▀                                 ▀▄ ▄▀ 
▀▄ ▄▀  Guenat team: ( @VIP_TEAM1  )   ▀▄ ▄▀ 
▀▄ ▄▀                                 ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄ 
—]]
do 

local function vip_team1(msg, matches) 
if is_sudo(msg) then 
        local text =  "ყօմ მɾε ოყ ʂմძօ 😻💪🏻".."\n".."⚜ყօɾ nმოε⚜:"..msg.from.first_name..'\n'.."⚜ყօɾ 🆔⚜:"..msg.from.id.."\n".."⚜ĝɾoυթ nმოε⚜:"..msg.to.title.."\n".."⚜ĝɾoυթ🆔⚜:"..msg.to.id
        return reply_msg(msg.id, text, ok_cb, false) 
     end 
if is_momod(msg) then 
        local text =  "ყօմ მɾε ค∂ოιη🌝✋🏻".."\n".."⚜ყօɾ nმოε⚜:"..msg.from.first_name..'\n'.."⚜ყօɾ 🆔⚜:"..msg.from.id.."\n".."⚜ĝɾoυթ nმოε⚜:"..msg.to.title.."\n".."⚜ĝɾoυթ🆔⚜:"..msg.to.id--vi
        return reply_msg(msg.id, text, ok_cb, false) 
     end 
if not is_momod(msg) then 
        local text =  "ყօմ მɾε ʝմʂէ ʍҽʍҍҽɾ🌚😹".."\n".."⚜ყօɾ nმოε⚜:"..msg.from.first_name..'\n'.."⚜ყօɾ 🆔⚜:"..msg.from.id.."\n".."⚜ĝɾoυթ nმოε⚜:"..msg.to.title.."\n".."⚜ĝɾoυթ🆔⚜:"..msg.to.id
        return reply_msg(msg.id, text, ok_cb, false) 
     end 
if is_owner(msg) then 
        local text = "ყօմ მɾε ૦ωηєɾ😺💯".."/n".."⚜ყօɾ nმოε⚜:"..msg.from.first_name..'\n'.."⚜ყօɾ 🆔⚜:"..msg.from.id.."\n".."⚜ĝɾoυթ nმოε⚜:"..msg.to.title.."\n".."⚜ĝɾoυթ🆔⚜:"..msg.to.id
        return reply_msg(msg.id, text, ok_cb, false) 
     end 
     end 

return { 
  patterns = { 
   "^(me)$", 
  },
  run = vip_team1, 
}
end