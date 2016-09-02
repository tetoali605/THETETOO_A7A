--[[
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀
▀▄ ▄▀                                 ▀▄ ▄▀
▀▄ ▄▀  Team name : (  🌐 VIP_TEAM 🌐  )▀▄ ▄▀
▀▄ ▄▀                                 ▀▄ ▄▀
▀▄ ▄▀   File name : ( #all )          ▀▄ ▄▀
▀▄ ▄▀                                 ▀▄ ▄▀
▀▄ ▄▀  Guenat team: ( @VIP_TEAM1  )   ▀▄ ▄▀
▀▄ ▄▀                                 ▀▄ ▄▀
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄
—]]
do
local function vip_team1(msg,matches)
if is_momod(msg) and matches[1]== 'pv' and matches[2]== 'help' then
      local help_text = tostring(_config.help_text_super)
            send_large_msg("user#id"..msg.from.id, help_text)
        return "Done sent a list of commands to the private !"
      end
        local reply_id = msg['id']
if not is_momod(msg) then
        local  iDev1 = 'only 4 admin'
reply_msg(msg.id, iDev1, ok_cb, false)
end 
end
return {
patterns ={"^[!/#](pv) (help)$"},
run = vip_team1 }
end