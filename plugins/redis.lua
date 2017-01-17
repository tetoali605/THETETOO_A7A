--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀ 
▀▄ ▄▀                                    ▀▄ ▄▀ 
▀▄ ▄▀    BY tetoo                         ▀▄ ▄▀ 
▀▄ ▄▀     BY nmore       (@l_l_lo)        ▀▄ ▄▀ 
▀▄ ▄▀ JUST WRITED BY l_l_ll               ▀▄ ▄▀ 
▀▄ ▄▀       broadcast  : ريـــدس            ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀ 
--]]

do 
function run(msg, matches) 
  if matches[1] == "رست" and is_sudo(msg) then 
    return os.execute("./launch.sh"):read('*all') 
  elseif matches[1] == "حدث" and is_sudo(msg) then 
     return io.popen("git pull"):read('*all') 
  elseif  matches[1] == "ريديس" and is_sudo(msg) then 
    return io.popen("redis-server"):read('*all') 
  end 
end 
return { 
  patterns = { 
    "^(رست)", 
    "^(حدث)", 
    "^(ريديس)" 
  }, 
  run = run 
} 
end 