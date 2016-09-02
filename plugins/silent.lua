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
 local hash = 'muteall:'..msg.to.id
  if redis:get(hash) and msg.to.type == 'channel' and not is_momod(msg)  then
   delete_msg(msg.id, ok_cb, false)
       end
    return msg
 end
 
local function run(msg, matches)
 if matches[1] == 'وضع الصامت' and is_momod(msg) then
       local hash = 'muteall:'..msg.to.id
       if not matches[2] then
              redis:set(hash, true)
             local text = "➪تم تفعيل وضع الصامت🔕 في مجموعه【"..msg.to.title.."】.."
             reply_msg(msg.id, text, ok_cb, false)
 else
 local hour = tonumber(matches[2]) * 360
 redis:setex(hash, hour, true)
 local text = "➥تم تفعيل وضع الصامت🔕 لمدة  ["..matches[2].."] ساعة⛔️"
 reply_msg(msg.id, text, ok_cb, false)
 end
 end
if matches[1] == 'الغاء الصامت' and is_momod(msg) then
               local hash = 'muteall:'..msg.to.id
        redis:del(hash)
          local text = "➥تم الغاء تفعيل وضع الصامت🔔 في مجموعه 【"..msg.to.title.."】.."
  end
end
return {
   patterns = {
      '^[/!#](وضع الصامت)$',
      '^[/!#](الغاء الصامت)$',
   '^[/!#](silent) (%d+)$',
 },
run = run,
  pre_process = pre_process
}
end