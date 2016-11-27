do 
  function mohammed(msg, matches) 
  local reply_id = msg['id'] 
    local S = ' 🎀🎖     السورس    THE_TETOO 📁\n\n🎀🎖     الاصدار 📋 V3  \n\n🎀🎖     الموقع \n \nhttps://github.com/alzaem11/THETETOO_A4.git \n\n🎀🎖     المطور ابو عسوله : @l_l_lo  @l15ll \n\n🎀🎖     بـوت الـمـطـور  :  @k4k33_bot \n \n🎀🎖   قـنـاه الـسـورس :  @NO_NO2 '  reply_msg(reply_id, S, ok_cb, false) 
  end 
  return { 
    patterns = { 
  "^(الاصدار)$", 
    }, 
    run = mohammed 
  } 
  end 