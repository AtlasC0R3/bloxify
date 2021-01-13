local ReplicatedStorage = game:GetService('ReplicatedStorage')
local http = require(ReplicatedStorage.http)  -- get jpatrickdill's Roblox Requests
-----------------------------------------------------------------------------------

local bloxify = {}
-- This is where the real fun begins: where I can actually write stuff.

function bloxify.getPlaying(token)
	local auth = 'Bearer ' .. token
	local url = 'https://api.spotify.com/v1/me/player/currently-playing'
	local header = {Accept = 'application/json', Authorization = auth}

	local r = http.get(url, { headers=header })

	if (r.status_code ~= 200) then
		return r.status_code
	else
		return r:json()
	end
end

function bloxify.skipSong(token)
	--[[
	Tell the Spotify API to skip song, then return the currently playing song (after the song has been skipped).
	]]--
	local auth = 'Bearer ' .. token
	local url = 'https://api.spotify.com/v1/me/player/next'
	-- local url = 'https://httpbin.org/post'
	local header = {Accept = 'application/json', Authorization = auth}

	http.post(url, { headers=header, data="h" })  -- And before you ask, yes, a data form is required. Spotify's APIs don't like it when the header "Content-Length" is nonexistent, so we have to make Roblox add it. This is idiotic.
	wait(0.05)
	
	return bloxify.getPlaying(token)
end

function bloxify.previousSong(token)
	local auth = 'Bearer ' .. token
	local url = 'https://api.spotify.com/v1/me/player/previous'
	-- local url = 'https://httpbin.org/post'
	local header = {Accept = 'application/json', Authorization = auth}

	http.post(url, { headers=header, data="h" })
	wait(0.05)
	
	return bloxify.getPlaying(token)
end

function bloxify.togglePlaying(token)
	local auth = 'Bearer ' .. token
	local header = {Authorization = auth}

	local r = http.get('https://api.spotify.com/v1/me/player/currently-playing'	, { headers=header })
	if r.status_code == 200 then
		if r:json().is_playing then
			-- Is currently playing: pausing...
			local url = 'https://api.spotify.com/v1/me/player/pause'
			local r = http.put(url, { headers=header, data="h" })
		else
			-- Is on pause: resuming...
			local url = 'https://api.spotify.com/v1/me/player/play'
			local r = http.put(url, { headers=header, data={h="h"} })  -- I hate Spotify's APIs.
		end
	else
		-- Could not retrieve: attempting to resume...
		local url = 'https://api.spotify.com/v1/me/player/play'
		http.put(url, { headers=header, data={h="h"} })
	end
	wait(0.05)
	
	return bloxify.getPlaying(token)
end

function bloxify.playTracks(token, tracks)
	local auth = 'Bearer ' .. token
	local header = {Authorization = auth}

	local url = 'https://api.spotify.com/v1/me/player/play'

	if type(tracks) == 'table' then
		-- We just need to pass it on!
		http.put(url, { headers=header, data={uris=tracks} })
	else
		-- We need to make a table (basically a dictionary, for all of you Python people) out of the track the user passed
		http.put(url, { headers=header, data={uris={tracks}}})
	end
end

function bloxify.queueTracks(token, tracks)
	local auth = 'Bearer ' .. token
	local header = {Authorization = auth}

	local url = 'https://api.spotify.com/v1/me/player/queue'

	if type(tracks) == 'table' then
		for thing, track in pairs(tracks) do  -- There's got to be a better way of doing this...
			http.post(url, { headers=header, data={h="h"}, query={uri=track}})
		end
	else
		http.post(url, { headers=header, data={h="h"}, query={uri=tracks}})
	end
end

function bloxify.playContext(token, context)
	local auth = 'Bearer ' .. token
	local header = {Authorization = auth}

	local url = 'https://api.spotify.com/v1/me/player/play'
	http.put(url, { headers=header, data={context_uri=context} })
end


function bloxify.getPlaylists(token)
	local auth = 'Bearer ' .. token
	local header = {Authorization = auth}

	local url = 'https://api.spotify.com/v1/me/playlists'
	local r = http.get(url, { headers=header })
	if r.status_code ~= 200 then
		return r.status_code
	else
		return r:json()
	end
end


return bloxify

