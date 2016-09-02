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
local function hero(msg,matches)
if is_sudo(msg) then
local url = "http://tts.baidu.com/text2audio?lan=ar&ie=UTF-8&text=__انتة__مطور__هذا_البوت_يا_عزيزي__"
--- Hero
local file = download_to_file(url,'.ogg')
send_audio(get_receiver(msg) , file, ok_cb, false)
      end
    if is_owner(msg) and not is_sudo(msg) then
local url = "http://tts.baidu.com/text2audio?lan=ar&ie=UTF-8&text=__انتة__مدير_هذة_المجموعة_يا_عزيزي__" 
local file = download_to_file(url,'.ogg')
send_audio(get_receiver(msg) , file, ok_cb, false)
      end
 if is_momod(msg) and not is_sudo(msg) and not is_owner(msg)  then
local url = "http://tts.baidu.com/text2audio?lan=ar&ie=UTF-8&text=__انتة__ادمن_في_هذة_المجموعة_يا_عزيزي__" 
local file = download_to_file(url,'.ogg')
send_audio(get_receiver(msg) , file, ok_cb, false)
      end
if not is_momod(msg) then
local url = "http://tts.baidu.com/text2audio?lan=ar&ie=UTF-8&text=__انتة__عضو_في_هذة_المجموعة_يا_عزيزي__"
local file = download_to_file(url,'.ogg')
send_audio(get_receiver(msg) , file, ok_cb, false)
      end 
end

return {
  patterns = {
  "^(من انا)$"
  },
  run = hero,
} 
end