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
local function run(msg, matches)
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['english'] then
                lock_english = data[tostring(msg.to.id)]['settings']['english']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_english == "yes" then
       delete_msg(msg.id, ok_cb, true)
    end
end
 
return {
  patterns = {
"[Aa](.*)",
"[Bb](.*)",
"[Cc](.*)",
"[Dd](.*)",
"[Ee](.*)",
"[Ff](.*)",
"[Gg](.*)",
"[Hh](.*)",
"[Ii](.*)",
"[Jj](.*)",
"[Kk](.*)",
"[Ll](.*)",
"[Mm](.*)",
"[Nn](.*)",
"[Oo](.*)",
"[Pp](.*)",
"[Qq](.*)",
"[Rr](.*)",
"[Ss](.*)",
"[Tt](.*)",
"[Uu](.*)",
"[Vv](.*)",
"[Ww](.*)",
"[Xx](.*)",
"[Yy](.*)",
"[Zz](.*)",
  },
  run = run
}
