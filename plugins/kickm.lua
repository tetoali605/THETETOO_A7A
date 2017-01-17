--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀ 
▀▄ ▄▀                                     ▀▄ ▄▀ 
▀▄ ▄▀    BY tetoo                         ▀▄ ▄▀ 
▀▄ ▄▀     BY nmore       (@l_l_lo)        ▀▄ ▄▀ 
▀▄ ▄▀ JUST WRITED BY l_l_ll               ▀▄ ▄▀ 
▀▄ ▄▀       broadcast  :   طـرد المحذوف      ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀ 
--]]

local function check_member_super_deleted(cb_extra, success, result) 
local receiver = cb_extra.receiver 
 local msg = cb_extra.msg 
  local deleted = 0 
if success == 0 then 
send_large_msg(receiver, "first set me as admin!") 
end 
for k,v in pairs(result) do 
  if not v.first_name and not v.last_name then 
deleted = deleted + 1 
 kick_user(v.peer_id,msg.to.id) 
 end 
 end 
 send_large_msg(receiver, deleted.."  🎀🎖 تــم طــرد الحـسابات المحـذوفةةة") 
 end 
local function run(msg, matches) 
if is_owner(msg) then 
 local receiver = get_receiver(msg) 
channel_get_users(receiver, check_member_super_deleted,{receiver = receiver, msg = msg}) 
 end 
 end 
 return { 
       patterns = { 
    "^(طرد المحذوف)$" 
 }, 
run = run, 
} 
-- @IQ_ABS
