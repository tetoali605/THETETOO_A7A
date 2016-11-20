do

 function mohammed(msg, matches)
 local ch =  220530711 ..msg.to.id--هنا حط ايديك
 local fuse =  طلب احدهم مجموعه🎀🎖\n\n🎀🎖ايديه   .. msg.from.id ..  \n\nاسمه🎀🎖   .. msg.from.print_name .. \n\nمعرفه🎀🎖 @  .. msg.from.username .. \n\nايدي المجموعه  🎀🎖  ..msg.to.id..  \n\n🎀🎖طلب منك\n  .. matches[1]
 local fuses =  !printf user#id  .. msg.from.id


   local text = matches[1]
   local chat = "user#id"..220530711--هنا حط ايديك

  local sends = send_msg(chat, fuse, ok_cb, false)
return  🎀🎖تم ارسال طلبك لصنع مجموعه الى المطور \n @l_l_lo\nالرجاء انتضار المطور لصنع مجموعه لك عزيزي \n\n@ ..msg.from.username
end
 end
 return {

  description = "SuperGroup request",

  usage = "",
  patterns = {
  "^اريد كروب$"
  },
  run = mohammed
 }
--by @l_l_lo
