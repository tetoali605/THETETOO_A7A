--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀ 
▀▄ ▄▀                                     ▀▄ ▄▀ 
▀▄ ▄▀    BY tetoo                         ▀▄ ▄▀ 
▀▄ ▄▀     BY nmore       (@l_l_lo)        ▀▄ ▄▀ 
▀▄ ▄▀ JUST WRITED BY l_l_ll               ▀▄ ▄▀ 
▀▄ ▄▀       broadcast  : وضــع الـتـرحيـب      ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀ 
--]]

local function run(msg, matches, callback, extra)

local data = load_data(_config.moderation.data)

local group_welcome = data[tostring(msg.to.id)]['group_welcome']
-------------------------- Data Will be save on Moderetion.json
    
if matches[1] == 'حذف الترحيب' and not matches[2] and is_owner(msg) then 
    
   data[tostring(msg.to.id)]['group_welcome'] = nil --delete welcome
        save_data(_config.moderation.data, data)
        
        return '🎀🎖تــم ✖️حــذف تــرحـيب فـي ســورس تيـتو'
end
if not is_owner(msg) then 
    return '🎀🎖للمـــشـرفيـن فقـط 🏅 انتـةة دايح مو مشـرف 💃️'
end
--------------------Loading Group Rules
local rules = data[tostring(msg.to.id)]['rules']
    
if matches[1] == 'rules' and matches[2] and is_owner(msg) then
    if data[tostring(msg.to.id)]['rules'] == nil then --when no rules found....
        return 'No Rules Found!\n\nSet Rule first by /set rules [rules]\nOr\nset normal welcome by /setwlc [wlc msg]'
end
data[tostring(msg.to.id)]['group_welcome'] = matches[2]..'\n\nGroup Rules :\n'..rules
        save_data(_config.moderation.data, data)
        
        return '🎀🎖تــم ✔️وضــع تــرحـيب فـي ســورس تيـتو:\n'..matches[2]
end
if not is_owner(msg) then 
    return '🎀🎖للمـــشـرفيـن فقـط 🏅 انتـةة دايح مو مشـرف 💃'
end

if matches[1] and is_owner(msg) then
    
data[tostring(msg.to.id)]['group_welcome'] = matches[1]
        save_data(_config.moderation.data, data)
        
      return '🎀🎖تــم ✔️وضــع تــرحـيب فـي ســورس تيـتو: \n'..matches[1]
end
if not is_owner(msg) then 
    return 'للمشرفين فقط🌝🍷'
end


    
end
return {
  patterns = {
  "^[!/]setwlc (rules) +(.*)$",
  "^وضع ترحيب +(.*)$",
  "^(حذف الترحيب)$"
  },
  run = run
} 
 
