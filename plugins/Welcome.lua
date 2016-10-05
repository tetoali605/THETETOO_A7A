do
    
local function vipteam1(msg,matches)
    if matches[1] == "chat_add_user"  then 
     local vipteam = 'ديربالك حيفجركم 🙀 ارهابي هاذا اطفرو 🏃🏻🏃🏻'..'\n'..'\n'
    ..'⚜ أسہمہكہ🔰: :  '..msg.action.user.first_name..'\n'
    ..'⚜مہعہرفہكہ🔰:: @'..(msg.action.user.username or "Not")..'\n'
    ..'⚜🆔  : '..msg.action.user.id..'\n'
    ..'📱رقہمہكہ🔰: '..(msg.action.user.phone or "Not")..'\n'
    ..'🔻➖🔺➖🔻➖🔺➖🔻'..'\n'
    ..'⚜أسہمہ ألكہروبہ🔰: : '..msg.to.title..'\n'
    ..'⚜ألكہروبہ🆔 : '..msg.to.id..'\n'
    ..'🔻➖🔺➖🔻➖🔺➖🔻'..'\n'
    ..'⚜أسہمہ أليہ ضأفہكہ🔰: '..msg.from.print_name..'\n'
    ..'⚜مہعہرفہ أليہ ضأفہكہ🔰:: @'..(msg.from.username or "Not")..'\n'
    ..'⚜ألضأفہكہ🆔: '..msg.from.id..'\n'
    ..'⚜رقہمہ أليہ ضأفہكہ🔰 : '..(msg.from.phone or "Not")..'\n'
    ..'🔻➖🔺➖🔻➖🔺➖🔻'..'\n'
    ..'🌐 Chaneel :@vip_team1'..'\n'
        return reply_msg(msg.id, vipteam, ok_cb, false)
  end
  if matches[1] == "chat_add_user_link" then
      local vipteam1 =  'ديربالك حيفجركم 🙀 ارهابي هاذا اطفرو 🏃🏻🏃🏻'..'\n'..'\n'
    ..'⚜أسہمہكہ🔰:   '..msg.action.user.first_name..'\n'
    ..'⚜مہعہرفہكہ🔰: @'..(msg.action.user.username or "Not")..'\n'
    ..'⚜ 🆔  : '..msg.action.user.id..'\n'
    ..'📱رقہمہكہ🔰: '..(msg.action.user.phone or "Not")..'\n'
    ..'🔻➖🔺➖🔻➖🔺➖🔻'..'\n'
    ..'⚜أسہمہ ألكہروبہ🔰:  '..msg.to.title..'\n'
    ..'⚜🆔 : '..msg.to.id..'\n'
    ..'🔻➖🔺➖🔻➖🔺➖🔻'..'\n'
    ..'🌐 Chaneel : @vip_team1'..'\n'
        return reply_msg(msg.id, vipteam1, ok_cb, false)
    end
     if matches[1] == "chat_del_user"  then 
       local bye_name = msg.action.user.first_name 
       return "bye"..bye_name 
   end 
end
return {
    patterns = {
        "^!!tgservice (chat_add_user)$",
        "^!!tgservice (chat_add_user_link)$",
        "^!!tgservice (chat_del_user)$",
    },
 run = vipteam1
}
end
