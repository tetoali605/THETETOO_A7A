--@dev_kasper
do
local function pre_process(msg)
 local hash =  muteall: ..msg.to.id
  if redis:get(hash) and msg.to.type ==  channel  and not is_momod(msg)  then
   delete_msg(msg.id, ok_cb, false)
       end
    return msg
 end --@dev_kasper
local function run(msg, matches)
 if matches[1] ==  muteall  or matches[1] ==  قفل المجموعه  and is_momod(msg) then
       local hash =  muteall: ..msg.to.id
       if not matches[2] then
              redis:set(hash, true)
             return "تم ✅ قفل 🔒 المجموعه 👥"
 else --@dev_kasper
local hour = string.gsub(matches[2],  h ,   )
 local num1 = tonumber(hour) * 3600
local minutes = string.gsub(matches[3],  m ,   )
 local num2 = tonumber(minutes) * 60
local second = string.gsub(matches[4],  s ,   )
 local num3 = tonumber(second) 
local num4 = tonumber(num1 + num2 + num3)
redis:setex(hash, num4, true)
 return "تم ✅ قفل 🔒 المجموعه 👥\n⏺ الساعات (s) : "..matches[2].."\n⏺ الدقايق (s) : "..matches[3].." \n⏺ الثواني (s) : "..matches[4]..""
 end
 end --@dev_kasper
if matches[1] ==  unmuteall  or matches[1] ==  فتح المجموعه  and is_momod(msg) then
               local hash =  muteall: ..msg.to.id
        redis:del(hash)
          return "تم ✅ فتح 🔓 المجموعه 👥"
  end
end
return {
   patterns = {
       ^[/!#](muteall)$ ,
       ^[/!#](unmuteall)$ ,
    ^[/!#](muteall) (.*) (.*) (.*)$ ,
 ^(قفل المجموعه)$ ,
       ^(فتح المجموعه)$ ,
    ^(قفل المجموعه) (.*) (.*) (.*)$ ,
 }, --@dev_kasper
run = run,
  pre_process = pre_process
}
end
