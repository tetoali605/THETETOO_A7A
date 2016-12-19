package.path = package.path..';.luarocks/share/lua/5.2/?.lua;.luarocks/share/lua/5.2/?/init.lua'
package.cpath = package.cpath..';.luarocks/lib/lua/5.2/?.so'
http = require('socket.http')
https = require('ssl.https')
url = require('socket.url')
json = require('dkjson')
require("config")
require("extra")

function bot_run()
	bot = nil
	while not bot do
		bot = send_req(send_api.."/getMe")
	end
	bot = bot.result
	local runlog = bot.first_name.." [@"..bot.username.."]\nis run in: "..os.date("%F - %H:%M:%S")
	print(runlog)
	send_msg(sudo_id, runlog)
	plugin = dofile('plugin.lua')
	last_update = last_update or 0
	last_cron = last_cron or os.time()
	startbot = true
end

function send_req(url)
	local dat, res = https.request(url)
	local tab = json.decode(dat)
	if res ~= 200 then return false end
	if not tab.ok then return false end
	return tab
end

function bot_updates(offset)
	local url = send_api.."/getUpdates?timeout=10"
	if offset then
		url = url.."&offset="..offset
	end
	return send_req(url)
end

function load_data(filename)
	local f = io.open(filename)
	if not f then
		return {}
	end
	local s = f:read('*all')
	f:close()
	local data = json.decode(s)
	return data
end

function save_data(filename, data)
	local s = json.encode(data)
	local f = io.open(filename, 'w')
	f:write(s)
	f:close()
end

function send_msg(chat_id, text, use_markdown)
	local text_len = string.len(text)
	local num_msg = math.ceil(text_len / 3000)
	if num_msg <= 1 then
		local send = send_api.."/sendMessage?chat_id="..chat_id.."&text="..url.escape(text).."&disable_web_page_preview=true"
		if use_markdown then
			send = send.."&parse_mode=Markdown"
		end
		return send_req(send)
	else
		text = text:gsub("*","")
		text = text:gsub("`","")
		text = text:gsub("_","")
		local f = io.open("large_msg.txt", 'w')
		f:write(text)
		f:close()
		local send = send_api.."/sendDocument"
		local curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "document=@large_msg.txt"'
		return io.popen(curl_command):read("*all")
	end
end

function send_document(chat_id, name)
	local send = send_api.."/sendDocument"
	local curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "document=@'..name..'"'
	return io.popen(curl_command):read("*all")
end

function send_key(chat_id, text, keyboard, resize, mark)
	local response = {}
	response.keyboard = keyboard
	response.resize_keyboard = resize
	response.one_time_keyboard = false
	response.selective = false
	local responseString = json.encode(response)
	if mark then
		sended = send_api.."/sendMessage?chat_id="..chat_id.."&text="..url.escape(text).."&disable_web_page_preview=true&reply_markup="..url.escape(responseString)
	else
		sended = send_api.."/sendMessage?chat_id="..chat_id.."&text="..url.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..url.escape(responseString)
	end
	return send_req(sended)
end

function string:input()
	if not self:find(' ') then
		return false
	end
	return self:sub(self:find(' ')+1)
end

function msg_receive(msg)
	if msg.date < os.time() - 5 then return end
	if not msg.text then
		msg.text = msg.caption or ''
	end
	if string.match(msg.text:lower(), '^[@'..bot.username..']*') then
		blocks = load_data("blocks.json")
		if blocks[tostring(msg.from.id)] then
			return
		end
		flood = load_data("flood.json")
		if not flood[tostring(msg.from.id)] then
			flood[tostring(msg.from.id)] = {f=0,d=msg.date}
			save_data("flood.json", flood)
		end
		if flood[tostring(msg.from.id)].f > 5 then
			if flood[tostring(msg.from.id)].d > msg.date - 2 then
				if msg.from.id == sudo_id or msg.from.id == bot.id then
					flood[tostring(msg.from.id)] = {f=1,d=msg.date}
					save_data("flood.json", flood)
				else
					chats = load_data("chats.json")
					requests = load_data("requests.json")
					blocks[tostring(msg.from.id)] = true
					save_data("blocks.json", blocks)
					send_msg(msg.from.id, "_You are_ *Blocked* _for spaming_", true)
					send_msg(admingp, msg.from.id.." _for spaming_ *Blocked*", true)
					if requests[tostring(msg.from.id)] then
						requests[tostring(msg.from.id)] = false
						save_data("requests.json", requests)
					elseif chats.id == tonumber(msg.from.id) then
						chats.id = 0
						save_data("chats.json", chats)
					end
					flood[tostring(msg.from.id)] = {f=1,d=msg.date}
					save_data("flood.json", flood)
					return
				end
			else
				flood[tostring(msg.from.id)] = {f=1,d=msg.date}
				save_data("flood.json", flood)
			end
		else
			flood[tostring(msg.from.id)].f = flood[tostring(msg.from.id)].f+1
			save_data("flood.json", flood)
		end
		local success, result = pcall(
			function()
				return plugin.launch(msg)
			end
		)
		if not success then
			print(msg.text, result)
			return
		end
		if type(result) == 'table' then
			msg = result
		elseif result ~= true then
			return
		end
	end
end

function query_receive(msg)
	local success, result = pcall(
		function()
			return plugin.inline(msg)
		end
	)
	if not success then
		return
	end
	if type(result) == 'table' then
		msg = result
	elseif result ~= true then
		return
	end
end

bot_run()

while startbot do
	local res = bot_updates(last_update+1)
	if res then
		for i,v in ipairs(res.result) do
			last_update = v.update_id
			if v.edited_message then
				msg_receive(v.edited_message)
			elseif v.message then
				msg_receive(v.message)
			elseif v.inline_query then
				query_receive(v.inline_query)
			end
		end
	else
		print("error while")
	end
	if last_cron < os.time() - 30 then
		if plugin.cron then
			local res, err = pcall(
				function()
					plugin.cron()
				end
			)
			if not res then print('error: '..err) end
		end
		last_cron = os.time()
	end
end