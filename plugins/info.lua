--write by @amody6
--add ar_lang
local function callback_reply(extra, success, result)
	--icon & rank & amody6 ------------------------------------------------------------------------------------------------
	userrank = "Member"
	if tonumber(result.from.peer_id) == 122774063 then
		userrank = "Master ⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/master.webp", ok_cb, false)
	elseif is_sudo(result) then
		userrank = "Sudo ⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/sudo.webp", ok_cb, false)
	elseif is_admin2(result.from.peer_id) then
		userrank = "Admin ⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/admin.webp", ok_cb, false)
	elseif is_owner2(result.from.peer_id, result.to.id) then
		userrank = "Leader ⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/leader.webp", ok_cb, false)
	elseif is_momod(result.from.peer_id, result.to.id) then
		userrank = "Moderator ⭐"
		send_document(org_chat_id,"umbrella/stickers/mod.webp", ok_cb, false)
	elseif tonumber(result.from.peer_id) == tonumber(our_id) then
		userrank = "Umbrella-Cp ⭐⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/umb.webp", ok_cb, false)
	elseif result.from.username then
		if string.sub(result.from.username:lower(), -3) == "bot" then
			userrank = "API Bot"
			send_document(org_chat_id,"umbrella/stickers/api.webp", ok_cb, false)
		end
	end
	--custom rank by amody6 ------------------------------------------------------------------------------------------------
	local file = io.open("./info/"..result.from.peer_id..".txt", "r")
	if file ~= nil then
		usertype = file:read("*all")
	else
		usertype = "-----"
	end
	--cont ------------------------------------------------------------------------------------------------
	local user_info = {}
	local uhash = 'user:'..result.from.id
	local user = redis:hgetall(uhash)
	local um_hash = 'msgs:'..result.from.peer_id..':'..result.to.id
	user_info.msgs = tonumber(redis:get(um_hash) or 0)
	--msg type ------------------------------------------------------------------------------------------------
	if result.media then
		if result.media.type == "document" then
			if result.media.text then
				msg_type = "Sticker"
			else
				msg_type = "Unknown"
			end
		elseif result.media.type == "photo" then
			msg_type = "Photo"
		elseif result.media.type == "video" then
			msg_type = "Video"
		elseif result.media.type == "audio" then
			msg_type = "audio"
		elseif result.media.type == "geo" then
			msg_type = "LocaTion"
		elseif result.media.type == "contact" then
			msg_type = "Phone Number"
		elseif result.media.type == "file" then
			msg_type = "File"
		elseif result.media.type == "webpage" then
			msg_type = "site"
		elseif result.media.type == "unsupported" then
			msg_type = "gif"
		else
			msg_type = "Unknown"
		end
	elseif result.text then
		if string.match(result.text, '^%d+$') then
			msg_type = "Number"
		elseif string.match(result.text, '%d+') then
			msg_type = "Number"
		elseif string.match(result.text, '^@') then
			msg_type = "User-Name"
		elseif string.match(result.text, '@') then
			msg_type = "User-Name"
		elseif string.match(result.text, '[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]') then
			msg_type = "Link-telegram"
		elseif string.match(result.text, '[Hh][Tt][Tt][Pp]') then
			msg_type = "Link-Site"
		elseif string.match(result.text, '[Ww][Ww][Ww]') then
			msg_type = "Link-Site"
		elseif string.match(result.text, '?') then
			msg_type = "question"
		else
			msg_type = "Text"
		end
	end
	--hardware by bamody ------------------------------------------------------------------------------------------------
	if result.text then
		inputtext = string.sub(result.text, 0,1)
		if result.text then
			if string.match(inputtext, "[a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z]") then
				hardware = "Pc"
			elseif string.match(inputtext, "[A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z]") then
				hardware = "Mobile"
			else
				hardware = "-----"
			end
		else
			hardware = "-----"
		end
	else
		hardware = "-----"
	end
	--phone ------------------------------------------------------------------------------------------------
	if access == 1 then
		if result.from.phone then
			number = "0"..string.sub(result.from.phone, 3)
			if string.sub(result.from.phone, 0,2) == '98' then
				number = number.."\nIran : iran-islamic"
				if string.sub(result.from.phone, 0,4) == '9891' then
					number = number.."\nHamrah-e-Aval"
				elseif string.sub(result.from.phone, 0,5) == '98932' then
					number = number.."\nTalia"
				elseif string.sub(result.from.phone, 0,4) == '9893' then
					number = number.."\nIranCell"
				elseif string.sub(result.from.phone, 0,4) == '9890' then
					number = number.."\nIranCell"
				elseif string.sub(result.from.phone, 0,4) == '9892' then
					number = number.."\nRighTel"
				else
					number = number.."\nUnknown"
				end
			else
				number = number.."\nU.S.A\nUnknown"
			end
		else
			number = "-----"
		end
	elseif access == 0 then
		if result.from.phone then
			number = "you cant"
			if string.sub(result.from.phone, 0,2) == '98' then
				number = number.."\nIran : Iran-Slamic"
				if string.sub(result.from.phone, 0,4) == '9891' then
					number = number.."\nHamrah-e-Aval"
				elseif string.sub(result.from.phone, 0,5) == '98932' then
					number = number.."\nTalia"
				elseif string.sub(result.from.phone, 0,4) == '9893' then
					number = number.."\nIranCell"
				elseif string.sub(result.from.phone, 0,4) == '9890' then
					number = number.."\nIranCell"
				elseif string.sub(result.from.phone, 0,4) == '9892' then
					number = number.."\nRighTel"
				else
					number = number.."\nUnknown"
				end
			else
				number = number.."\nU.S.A\nUnknown"
			end
		else
			number = "-----"
		end
	end
	--info  by amody6------------------------------------------------------------------------------------------------
	local function getusernumo(phonen)
local pt
if string.match(phonen, "^98910") or string.match(phonen, "^98911") or string.match(phonen, "^98912") or string.match(phonen, "^98913") or string.match(phonen, "^98914") or string.match(phonen, "^98915") or string.match(phonen, "^98916") or string.match(phonen, "^98917") or string.match(phonen, "^98918") then
pt = 'Hamrah-e-aval'
elseif string.match(phonen, "^98919") or string.match(phonen, "^98990") then
pt = 'Hamrah-e-aval'
elseif string.match(phonen, "^98930") or string.match(phonen, "^98933") or string.match(phonen, "^98935") or string.match(phonen, "^98936") or string.match(phonen, "^98937") or string.match(phonen, "^98903") or string.match(phonen, "^98938") or string.match(phonen, "^98939") then
pt = 'IranCell'
elseif string.match(phonen, "^98901") or string.match(phonen, "^98902") then
pt = 'IranCell'
elseif string.match(phonen, "^98920") then
pt = 'Rightel'
elseif string.match(phonen, "^98921") then
pt = 'Rightel'
elseif string.match(phonen, "^98931") or string.match(phonen, "^989324") then
pt = 'Spadan'
elseif string.match(phonen, "^989329") then
pt = 'Taliya'
elseif string.match(phonen, "^98934") then
pt = 'KiSh'
elseif string.match(phonen, "^63908") then
pt = 'Philipin'
elseif string.match(phonen, "^1") then
pt = 'U.S.A'
elseif string.match(phonen, "^62") then
pt = 'Indonesia'
else
pt = 'Unknown'
end
return pt
end

local function getusernum(phonen)
local pt
if string.match(phonen, "^98") then
tt = 'Iran'
elseif string.match(phonen, "^63") then
tt = 'Philipin'
elseif string.match(phonen, "^1") then
tt = 'U.S.A'
elseif string.match(phonen, "^62") then
tt = 'Indonesia'
else
tt = 'Unknown'
end
return tt
end

if msg.from.phone then
    sim = '+'..string.gsub(tostring(msg.from.phone),string.sub(tostring(msg.from.phone),-4),'****')
	op = getusernumo(msg.from.phone)
	tt = getusernum(msg.from.phone)
	else
	sim = '----'
	op = '----'
	tt = '----'
	end
        local url , res = http.request('http://api.gpmod.ir/time/')
          if res ~= 200 then return "No connection" end
        local jdat = json:decode(url)
	info = "<>Full Name : "..string.gsub(result.from.print_name, "_", " ").."\n\n"
	.."<>First Name : "..(result.from.first_name or "-----").."\n\n"
	.."<>Last Name : "..(result.from.last_name or "-----").."\n\n"
	.."<>User Name: @"..(result.from.username or "-----").."\n\n"
	.."<>Your id :  "..result.from.peer_id.."\n\n"
        .."<>Phone Number : +"..(result.from.phone or '----').."\n\n"
		.."<>SimCard :  "..op.."\n\n"
		.."<>LocaTion  :  "..tt.."\n\n"
        .."<>MsG :  "..msg.text.."\n\n"
        .."<>Time :  "..jdat.ENtime.."\n\n"
        .."<>Date :  "..jdat.ENdate.."\n\n"
	.."<>Rank : "..usertype.."\n\n"
	.."<>Post : "..userrank.."\n\n"
	.."<>Connecector: "..hardware.."\n\n"
	.."<>Messages: "..user_info.msgs.."\n\n"
	.."<>Msg Text: "..msg_type.."\n\n"
	.."<>Group Name: "..string.gsub(msg.to.print_name, "_", " ").."\n\n"
	.."<>Group Id: "..msg.to.id.."\n\n"
        .."<>Link : telegram.me/"..(result.from.username or "-----").."\n\n"
        .."<>Id MsG :  "..msg.id.."\n\n"
	send_large_msg(org_chat_id, info)
end

local function callback_res(extra, success, result)
	if success == 0 then
		return send_large_msg(org_chat_id, "not a username")
	end
	--icon & rank & by amody6 ------------------------------------------------------------------------------------------------
	if tonumber(result.id) == 122774063 then
		userrank = "Master ⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/master.webp", ok_cb, false)
	elseif is_sudo(result) then
		userrank = "Sudo ⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/sudo.webp", ok_cb, false)
	elseif is_admin2(result.id) then
		userrank = "Admin ⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/admin.webp", ok_cb, false)
	elseif is_owner2(result.id, extra.chat2) then
		userrank = "Leader ⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/leader.webp", ok_cb, false)
	elseif is_momod2(result.id, extra.chat2) then
		userrank = "Moderator ⭐"
		send_document(org_chat_id,"umbrella/stickers/mod.webp", ok_cb, false)
	elseif tonumber(result.id) == tonumber(our_id) then
		userrank = "Umbrella-Cp ⭐⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/umb.webp", ok_cb, false)
	elseif result.from.username then
		if string.sub(result.from.username:lower(), -3) == "bot" then
			userrank = "API Bot"
			send_document(org_chat_id,"umbrella/stickers/api.webp", ok_cb, false)
	else
		userrank = "Member"
	end
	end
	--custom rank ------------------------------------------------------------------------------------------------
	local file = io.open("./info/"..result.id..".txt", "r")
	if file ~= nil then
		usertype = file:read("*all")
	else
		usertype = "-----"
	end
	--phone ------------------------------------------------------------------------------------------------
	if access == 1 then
		if result.phone then
			number = "0"..string.sub(result.phone, 3)
			if string.sub(result.phone, 0,2) == '98' then
				number = number.."\nIran : Iran-Slamic"
				if string.sub(result.phone, 0,4) == '9891' then
					number = number.."\nHamrah-e-Aval"
				elseif string.sub(result.phone, 0,5) == '98932' then
					number = number.."\nTalia"
				elseif string.sub(result.phone, 0,4) == '9893' then
					number = number.."\nIranCell"
				elseif string.sub(result.phone, 0,4) == '9890' then
					number = number.."\nIranCell"
				elseif string.sub(result.phone, 0,4) == '9892' then
					number = number.."\nRighTel"
				else
					number = number.."\nUnknown"
				end
			else
				number = number.."\nU.S.A\nUnknown"
			end
		else
			number = "-----"
		end
	elseif access == 0 then
		if result.phone then
			number = "You Cant"
			if string.sub(result.phone, 0,2) == '98' then
				number = number.."\nIran : Iran-Slamic"
				if string.sub(result.phone, 0,4) == '9891' then
					number = number.."\nHamrah-e-Ava"
				elseif string.sub(result.phone, 0,5) == '98932' then
					number = number.."\nTalia"
				elseif string.sub(result.phone, 0,4) == '9893' then
					number = number.."\nIranCell"
				elseif string.sub(result.phone, 0,4) == '9890' then
					number = number.."\nIranCell"
				elseif string.sub(result.phone, 0,4) == '9892' then
					number = number.."\nRighTel"
				else
					number = number.."\nUnknown"
				end
			else
				number = number.."\nU.S.A\nUnknown"
			end
		else
			number = "-----"
		end
	end
	--info ------------------------------------------------------------------------------------------------
	info = "<>Full Name : "..string.gsub(result.print_name, "_", " ").."\n\n"
	.."<>First Name : "..(result.first_name or "-----").."\n\n"
	.."<>Last Name : "..(result.last_name or "-----").."\n\n"
	.."<>User Name : @"..(result.username or "-----").."\n\n"
	.."<>Your Id : "..result.id.."\n\n"
	.."<>Rank : "..usertype.."\n\n"
	.."<>Post : "..userrank.."\n\n"
	send_large_msg(org_chat_id, info)
end

local function callback_info(extra, success, result)
	if success == 0 then
		return send_large_msg(org_chat_id, "not a id")
	end
	--icon & rank ------------------------------------------------------------------------------------------------
	if tonumber(result.id) == 122774063 then
		userrank = "Master ⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/master.webp", ok_cb, false)
	elseif is_sudo(result) then
		userrank = "Sudo ⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/sudo.webp", ok_cb, false)
	elseif is_admin2(result.id) then
		userrank = "Admin ⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/admin.webp", ok_cb, false)
	elseif is_owner2(result.id, extra.chat2) then
		userrank = "Leader ⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/leader.webp", ok_cb, false)
	elseif is_momod2(result.id, extra.chat2) then
		userrank = "Moderator ⭐"
		send_document(org_chat_id,"umbrella/stickers/mod.webp", ok_cb, false)
	elseif tonumber(result.id) == tonumber(our_id) then
		userrank = "Umbrella-Cp ⭐⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"umbrella/stickers/umb.webp", ok_cb, false)
	elseif result.from.username then
		if string.sub(result.from.username:lower(), -3) == "bot" then
			userrank = "API Bot"
			send_document(org_chat_id,"umbrella/stickers/api.webp", ok_cb, false)
	else
		userrank = "Member"
	end
	end
	--custom rank ------------------------------------------------------------------------------------------------
	local file = io.open("./info/"..result.id..".txt", "r")
	if file ~= nil then
		usertype = file:read("*all")
	else
		usertype = "-----"
	end
	--phone ------------------------------------------------------------------------------------------------
	if access == 1 then
		if result.phone then
			number = "+"..string.sub(result.phone, 3)
			if string.sub(result.phone, 0,2) == '98' then
				number = number.."\nIran : Iran-Slamic "
				if string.sub(result.phone, 0,4) == '9891' then
					number = number.."\nHamrah-e-Aval"
				elseif string.sub(result.phone, 0,5) == '98932' then
					number = number.."\nTalia"
				elseif string.sub(result.phone, 0,4) == '9893' then
					number = number.."\nIranCell"
				elseif string.sub(result.phone, 0,4) == '9890' then
					number = number.."\nIranCell"
				elseif string.sub(result.phone, 0,4) == '9892' then
					number = number.."\nRighTel"
				else
					number = number.."\nUnknown"
				end
			else
				number = number.."\nU.S.A\nUnknown"
			end
		else
			number = "-----"
		end
	elseif access == 0 then
		if result.phone then
			number = "You Cant"
			if string.sub(result.phone, 0,2) == '98' then
				number = number.."\nIran : Iran-Slamic"
				if string.sub(result.phone, 0,4) == '9891' then
					number = number.."\nHamrah-e-Aval"
				elseif string.sub(result.phone, 0,5) == '98932' then
					number = number.."\nTalia"
				elseif string.sub(result.phone, 0,4) == '9893' then
					number = number.."\nIranCell"
				elseif string.sub(result.phone, 0,4) == '9890' then
					number = number.."\nIranCell"
				elseif string.sub(result.phone, 0,4) == '9892' then
					number = number.."\nRighTel"
				else
					number = number.."\nUnknown"
				end
			else
				number = number.."\nU.S.A\nUnknown"
			end
		else
			number = "-----"
		end
	end
	--name ------------------------------------------------------------------------------------------------
	if string.len(result.print_name) > 15 then
		fullname = string.sub(result.print_name, 0,15).."..."
	else
		fullname = result.print_name
	end
	if result.first_name then
		if string.len(result.first_name) > 15 then
			firstname = string.sub(result.first_name, 0,15).."..."
		else
			firstname = result.first_name
		end
	else
		firstname = "-----"
	end
	if result.last_name then
		if string.len(result.last_name) > 15 then
			lastname = string.sub(result.last_name, 0,15).."..."
		else
			lastname = result.last_name
		end
	else
		lastname = "-----"
	end
	--info ------------------------------------------------------------------------------------------------
	info = "<>Full Name : "..string.gsub(result.print_name, "_", " ").."\n\n"
	.."<>First Name : "..(result.first_name or "-----").."\n\n"
	.."<>Last Name : "..(result.last_name or "-----").."\n\n"
	.."<>User Name : @"..(result.username or "-----").."\n\n"
	.."<>Your Id : "..result.id.."\n\n"
	.."<>Rank : "..usertype.."\n\n"
	.."<>Post : "..userrank.."\n\n"
	send_large_msg(org_chat_id, info)
end

local function run(msg, matches)
	local data = load_data(_config.moderation.data)
	org_chat_id = "channel#id"..msg.to.id
	if is_sudo(msg) then
		access = 1
	else
		access = 0
	end
	if matches[1] == 'dinfo' and is_sudo(msg) then
		azlemagham = io.popen('rm ./info/'..matches[2]..'.txt'):read('*all')
		return 'Anjam shod'
	elseif matches[1] == '/info' and is_sudo(msg) then
		local name = string.sub(matches[2], 1, 50)
		local text = string.sub(matches[3], 1, 10000000000)
		local file = io.open("./info/"..name..".txt", "w")
		file:write(text)
		file:flush()
		file:close() 
		return "anjam shod"
	elseif #matches == 2 then
		local cbres_extra = {chatid = msg.to.id}
		if string.match(matches[2], '^%d+$') then
			return user_info('user#id'..matches[2], callback_info, cbres_extra)
		else
			return res_user(matches[2]:gsub("@",""), callback_res, cbres_extra)
		end
	else
		--custom rank ------------------------------------------------------------------------------------------------
		local file = io.open("./info/"..msg.from.id..".txt", "r")
		if file ~= nil then
			usertype = file:read("*all")
		else
			usertype = "-----"
		end
		--hardware ------------------------------------------------------------------------------------------------
		if matches[1] == "info" then
			hardware = "كمبيوتر"
		else
			hardware = "هاتف"
		end
		if not msg.reply_id then
			--contor ------------------------------------------------------------------------------------------------
			local user_info = {}
			local uhash = 'user:'..msg.from.id
			local user = redis:hgetall(uhash)
			local um_hash = 'msgs:'..msg.from.id..':'..msg.to.id
			user_info.msgs = tonumber(redis:get(um_hash) or 0)
			--icon & rank ------------------------------------------------------------------------------------------------
			if tonumber(msg.from.id) == 122774063 then
				userrank = "المدير ⭐️⭐️⭐️⭐️"
				send_document("channel#id"..msg.to.id,"umbrella/stickers/master.webp", ok_cb, false)
			elseif is_sudo(msg) then
				userrank = "مطور ⭐️⭐️⭐️⭐️⭐️"
				send_document("channel#id"..msg.to.id,"umbrella/stickers/sudo.webp", ok_cb, false)
			elseif is_admin2(msg) then
				userrank = "ادمن ⭐️⭐️⭐️"
				send_document("channel#id"..msg.to.id,"umbrella/stickers/admin.webp", ok_cb, false)
			elseif is_owner2(msg) then
				userrank = "زعيم⭐️⭐️"
				send_document("channel#id"..msg.to.id,"umbrella/stickers/leader.webp", ok_cb, false)
			elseif is_momod(msg) then
				userrank = "مساعد ⭐️"
				send_document("channel#id"..msg.to.id,"umbrella/stickers/mod.webp", ok_cb, false)
			else
				userrank = "مجرد عضو🌝"
			end
			--number ------------------------------------------------------------------------------------------------
			if msg.from.phone then
				numberorg = string.sub(msg.from.phone, 3)
				number = "+"..string.sub(numberorg, 0,6)
				if string.sub(msg.from.phone, 0,2) == '98' then
					number = number.."\nIran : Iran-Slamic"
					if string.sub(msg.from.phone, 0,4) == '9891' then
						number = number.."\nHamrah-e-Aval"
					elseif string.sub(msg.from.phone, 0,5) == '98932' then
						number = number.."\nTalia"
					elseif string.sub(msg.from.phone, 0,4) == '9893' then
						number = number.."\nIranCell"
					elseif string.sub(msg.from.phone, 0,4) == '9890' then
						number = number.."\nIranCell"
					elseif string.sub(msg.from.phone, 0,4) == '9892' then
						number = number.."\nRighTel"
					else
						number = number.."\nUnknown"
					end
				else
					number = number.."\nU.S.A\nUnknown"
				end
			else
				number = "-----"
			end
			--info ------------------------------------------------------------------------------------------------
			local function getusernumo(phonen)
local pt
if string.match(phonen, "^98910") or string.match(phonen, "^98911") or string.match(phonen, "^98912") or string.match(phonen, "^98913") or string.match(phonen, "^98914") or string.match(phonen, "^98915") or string.match(phonen, "^98916") or string.match(phonen, "^98917") or string.match(phonen, "^98918") then
pt = 'Hamrah-e-aval'
elseif string.match(phonen, "^98919") or string.match(phonen, "^98990") then
pt = 'Hamrah-e-aval'
elseif string.match(phonen, "^98930") or string.match(phonen, "^98933") or string.match(phonen, "^98935") or string.match(phonen, "^98936") or string.match(phonen, "^98937") or string.match(phonen, "^98903") or string.match(phonen, "^98938") or string.match(phonen, "^98939") then
pt = 'IranCell'
elseif string.match(phonen, "^98901") or string.match(phonen, "^98902") then
pt = 'IranCell'
elseif string.match(phonen, "^98920") then
pt = 'Rightel'
elseif string.match(phonen, "^98921") then
pt = 'Rightel'
elseif string.match(phonen, "^98931") or string.match(phonen, "^989324") then
pt = 'Spadan'
elseif string.match(phonen, "^989329") then
pt = 'Taliya'
elseif string.match(phonen, "^98934") then
pt = 'KiSh'
elseif string.match(phonen, "^63908") then
pt = 'Philipin'
elseif string.match(phonen, "^1") then
pt = 'U.S.A'
elseif string.match(phonen, "^62") then
pt = 'Indonesia'
else
pt = 'لم يتم التعرف📛'
end
return pt
end

local function getusernum(phonen)
local pt
if string.match(phonen, "^98") then
tt = 'Iran'
elseif string.match(phonen, "^63") then
tt = 'Philipin'
elseif string.match(phonen, "^1") then
tt = 'U.S.A'
elseif string.match(phonen, "^62") then
tt = 'Indonesia'
else
tt = 'Unknown'
end
return tt
end

if msg.from.phone then
    sim = '+'..string.gsub(tostring(msg.from.phone),string.sub(tostring(msg.from.phone),-4),'****')
	op = getusernumo(msg.from.phone)
	tt = getusernum(msg.from.phone)
	else
	sim = '----'
	op = '----'
	tt = '----'
	end
                        local url , res = http.request('http://api.gpmod.ir/time/')
                        if res ~= 200 then return "No connection" end
                        local jdat = json:decode(url)
			local info = "🌐 اسمك الكامل : "..string.gsub(msg.from.print_name, "_", " ").."\n\n"
					.."♈️ اسمك الاول : "..(msg.from.first_name or "-----").."\n\n"
					.."♏️ اسمك الثاني : "..(msg.from.last_name or "-----").."\n\n"
					.."👁 معرفك : @"..(msg.from.username or "-----").."\n\n"
					.."🆔 ايديك : "..msg.from.id.."\n\n"
                                        .."📞 رقم هاتفك : +"..(msg.from.phone or "-----").."\n\n"
										.."🔖 سيم كرتك :  "..op.."\n\n"
										.."⚫️ منطقتك  :  "..tt.."\n\n"
									    .."📨 الرسالة المرسلة :  "..msg.text.."\n\n"	
                                        .."⏱ الوقت :  "..jdat.ENtime.."\n\n"
                                        .."📅 التاريخ :  "..jdat.ENdate.."\n\n"
				 	.."👮 رتبتك : "..usertype.."\n\n"
	      				.."الرسالة من 👮 : "..userrank.."\n\n"
					.."📡 اتصالك من : "..hardware.."\n\n"
					.."📤 عدد رسائلك المرسلة : "..user_info.msgs.."\n\n"
					.."♉️ اسم الكروب : "..string.gsub(msg.to.print_name, "_", " ").."\n\n"
					.."🆔 ايدي الكروب : "..msg.to.id.."\n\n"
                                        .."🔸 رابط حسابك: telegram.me/"..(msg.from.username or "-----").."\n\n"
                                        .."☢ ايدي الرسالة :  "..msg.id.."\n\n"
			return info
		else
			get_message(msg.reply_id, callback_reply, false)
		end
	end
end

return {
	description = "User Infomation",
	usagehtm = 'ملف يعطيك معلومات كاملة عنك من المطور @amody6 ',
	usage = {
		user = {
			"info: اطلاعات شما",
			"info (Reply): حتى تعرف معلوماته",
			},
		sudo = {
			"/info (id) (txt) : حتى يعطيك معلومات عنك",
			},
		},
	patterns = {
		"^(معلوماتي) (.*)$",
		"^(معلوماتي) ([^%s]+) (.*)$",
		"^(معلومات) (.*)$",
		"^(معلوماتي)$",
	},
	run = run,
}

--write by @amody6
--add ar_lang