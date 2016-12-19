 do 
local function run(msg,matches) 
if msg.text then 
local name = matches[1] 
local file = matches[3] 
local Ali = get_receiver(msg) 
fi = io.open("./plugins/".. name..".lua" 
,"w+") 
print(fi) 
fi:write(file) 
fi:close() 
send_large_msg(Ali, "done") 
end 

end 
return { 
 patterns = { 
  "/add (.*) (-)\n\n(.*)" 
  }, 
  run = run 
 } 

end 
 