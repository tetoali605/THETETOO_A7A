--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀ 
▀▄ ▄▀                                        ▀▄ ▄▀ 
▀▄ ▄▀    BY tetoo                            ▀▄ ▄▀ 
▀▄ ▄▀     BY nmore       (@l_l_lo)           ▀▄ ▄▀ 
▀▄ ▄▀ JUST WRITED BY l_l_ll                  ▀▄ ▄▀ 
▀▄ ▄▀       broadcast  : الترحيب و التوديع        ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀ 
--]]

do
    
local function run(msg,matches)
    if matches[1] == "chat_add_user"  then 
     local text =   🎀➖🎗 @no_no2 اهلا و سـهلا بـك عـزيزي ❤️يـرجـي متـابعه قـناه السـورس  .. \n .. \n 
    .. 🎀🎗اسـمك🎖 :   ..msg.action.user.print_name.. \n 
    .. 🎀🎗معـرفك 🎖 : @ ..(msg.action.user.username or "لا يوجد").. \n 
    .. 🎀🎗الايـدي🎖 :  ..msg.action.user.id.. \n 
    .. 🎀🎗رقـم الـهاتـف🎖 :  ..(msg.action.user.phone or "لا يوجد").. \n 
    .. 🎀🎗اسـم الـضافك🎖 :  ..msg.from.print_name.. \n 
    .. 🎀🎗معـرف الضـافك🎖 : @ ..(msg.from.username or "لا يوجد").. \n 
    .. 🎀🎗الـتاريخ🎖 :  ..os.date( !%A, %B %d, %Y*\n , timestamp)
    .. 🎀🎗الـوقـت🎖 :  ..os.date(  %T* , os.time()).. \n   
     
     return reply_msg(msg.id, text, ok_cb, false)
     end
    if matches[1] == "chat_add_user_link" then
      local text =   اهلا بك في المجموعه كبد حياتي 🙈💋 .. \n .. \n 
      .. 🎀🎗اسـمك🎖 :   ..msg.action.user.print_name.. \n 
    .. 🎀🎗معـرفك 🎖 : @ ..(msg.action.user.username or "لا يوجد").. \n 
    .. 🎀🎗الايـدي🎖 :  ..msg.action.user.id.. \n 
    .. 🎀🎗رقـم الـهاتـف🎖 :  ..(msg.action.user.phone or "لا يوجد").. \n 
    .. 🎀🎗اسـم الـضافك🎖 :  ..msg.from.print_name.. \n 
    .. 🎀🎗معـرف الضـافك🎖 : @ ..(msg.from.username or "لا يوجد").. \n 
    .. 🎀🎗الـتاريخ🎖 :  ..os.date( !%A, %B %d, %Y*\n , timestamp)
    .. 🎀🎗الـوقـت🎖 :  ..os.date(  %T* , os.time()).. \n   
     
        return reply_msg(msg.id, text, ok_cb, false)
  end
      if matches[1] == "chat_del_user" then
       return "  @no_no2 🎀🎖  حبـيـب كـلبـي الله ويـاك➖ خلصت من عضـو الف حمداللـه الباقي تابـعو"..msg.action.user.first_name
end
end
 
return {
    patterns = {
        "^!!tgservice (chat_add_user)$",
        "^!!tgservice (chat_add_user_link)$",        
        "^!!tgservice (chat_del_user)$"
        
    },
 run = run
}
end
