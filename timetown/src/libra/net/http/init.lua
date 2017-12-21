--
-- Author: hongjie
-- Date: 2017-12-21 11:15:41
--
http = {}
function http.get(url, callback)
	local netStatus = network.getInternetConnectionStatus()
	if netStatus == kCCNetworkStatusNotReachable then
		callback({
			success = false,
			msg = '网络状态不稳定'
		})
		return
	elseif netStatus == kCCNetworkStatusReachableViaWiFi then
		-- wifi
	elseif netStatus == kCCNetworkStatusReachableViaWWAN then
		-- 3G
	end
	local request = network.createHTTPRequest(function(event)
		-- callback(event, index)
		local request = event.request
		if event.name == "completed" then
			if request:getResponseStatusCode() ~= 200 then
				callback({
					success = false,
					msg = '服务器状态:' .. request:getResponseStatusCode()	
				})
			else
				callback(json.decode(request:getResponseData()))
			end
		elseif event.name == 'failed' then
			callback({
				success = false,
				msg = '网络状态不稳定'
			})
		end
	end, url, "GET")
	request:setTimeout(20)
	request:start()	
end
