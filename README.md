## NOTICE

**I have not tested this yet, I am still waiting for an answer on how the Roblox censorship should work in public games! If you use this, you are on your own for now. You *should* be fine without any censorship if you are displaying info about what the local user is currently playing on Spotify, however I am unsure if this statement is true. You will have to put a censorship if you share what the local user is listening to, to other players.** Also don't make the user play songs that contain swearing. Or NSFW. If you do that, you're dumb. ~~And will make me cry.~~

# Bloxify

<a href="https://github.com/atlasc0r3/bloxify">

![](https://github.com/AtlasC0R3/bloxify/blob/main/metadata/Exported/Full%20Logo.png)

</a>

An API wrapper for Spotify, built for Roblox games.

### What *exactly* is this?

This is a Roblox/Lua module script built for Roblox games, to connect Roblox and Spotify together. This can be utilised in many ways: an overlay for FPS games, a replacement for paid "boombox" game passes, a way to pause the in-game music if the user is playing something on Spotify, or even a replacement for any in-game music player. *\*cough\*, those are all ideas I just came up with, they probably have flaws. so uh, yeah.*

## Setup/Installation

So, you've decided you wanted to implement this in your game, or that you just want to screw around with it to see how it works.

1) Go to the `module` directory in this repository, and download `bloxify.lua`

2) Insert `bloxify.lua` in the game's ReplicatedStorage as a ModuleScript

Now, because this module is heavily dependent on another module, [Roblox Requests](https://github.com/jpatrickdill/roblox-requests), you'll need to set it up as well.

3) Go to https://github.com/jpatrickdill/roblox-requests and download the latest release (last tested on 0.5.1)

4) Follow the instructions on https://requests.paric.xyz/docs/guide/installation *(and please make sure that the http module script is on the root of ReplicatedStorage. please.)*

5) Enable HTTP requests for your Roblox game. If you don't know how, [this article is a good reference](https://developer.roblox.com/en-us/api-reference/class/HttpService#enabling-http-requests).

And you have inserted Bloxify in your game! Now, how do you use it? Well, here is an example of how you can add Bloxify to a regular, server-sided script.

```lua
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local spotapi = require(ReplicatedStorage.bloxify)

print(spotapi.getPlaying("INSERT SPOTIFY TOKEN HERE"))
```

To use it in LocalScripts, you could use RemoteEvents or RemoteFunctions at your advantage, as seen in the example in this repository (`example/Example.rbxl`).

**NOTE: This project is licensed with the MIT License, meaning that all I'm asking for, if you do use this module in your game, is that you simply credit me, either in your game's description or in-game, however you want, as long as I'm credited.**

## Special thanks

**[jpatrickdill](https://github.com/jpatrickdill/) (Patrick Dill) for making [Roblox Requests](https://github.com/jpatrickdill/roblox-requests), this was a huge help for this project.**

[Spotify](https://www.spotify.com/) *(obviously)* for making a pretty good music streaming service. Also for the somewhat decent API documentation.