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
do

local function pre_process(msg)
    
    --Checking mute
    local hash = 'mate:'..msg.to.id
    if redis:get(hash) and msg.fwd_from and not is_sudo(msg) and not is_owner(msg) and not is_momod(msg) and not is_admin1(msg)  then
            delete_msg(msg.id, ok_cb, true)
            send_large_msg(get_receiver(msg), 'عزيزي '..msg.from.first_name..'\nممنوع عمل اعادة توجيه من القنوات هنا التزم بقوانين المجموعة 👋👮\n#username @'..msg.from.username)
            return "done"
        end
    
        return msg
    end

  


local function vip_team1(msg, matches)
    chat_id =  msg.to.id
    
    if is_momod(msg) and matches[1] == 'امنع' then
      
            
                    local hash = 'mate:'..msg.to.id
                    redis:set(hash, true)
                    return ""
  elseif is_momod(msg) and matches[1] == 'اسمح' then
                    local hash = 'mate:'..msg.to.id
                    redis:del(hash)
                    return ""
end

end

return {
    patterns = {
         '^[/!#](امنع) = التوجيه$',
        '^[/!#](اسمح)  التوجيه$'
    },
    run = vip_team1,
    pre_process = pre_process
}
end