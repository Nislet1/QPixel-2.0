Config = {}

-- priority list can be any identifier. (hex steamid, steamid34, ip) Integer = power over other people with priority
-- a lot of the steamid converting websites are broken rn and give you the wrong steamid. I use https://steamid.xyz/ with no problems.
-- you can also give priority through the API, read the examples/readme.
Config.Priority = {
    -- Management / Community Managers
    ["steam:11000013fcd2349"] = 99, -- Aspect
    ["steam:110000142b5b05b"] = 99, -- BxRaycon
    ["steam:110000152d90217"] = 99, -- loleris

    ["steam:110000152928485"] = 99, -- BobbyD
    ["steam:1100001419279ef"] = 99, -- Nos
    -- Staff
    ["steam:11000014481bdb8"] = 90, -- Ryan
    ["steam:110000116976442"] = 90, -- Ramiii
    ["steam:110000118667dcc"] = 90, -- Lummox
    ["steam:11000014481bdb8"] = 90, -- MrInk
    ["steam:1100001449704b2"] = 90, -- Rakz
    ["steam:110000141817c16"] = 90, -- Mackkk
    ["steam:11000013d130311"] = 90, -- Etay
    ["steam:1100001148604a8"] = 90, -- Lucas
    -- Trust
    ["steam:"] = 85, -- N/A
    -- Tier 3 (70)
    ["steam:"] = 70, -- N/A
    -- Tier 2 (60)S
    ["steam:"] = 60, -- N/A
    -- Tier 1 (50)
    ["steam:"] = 50, -- N/A

}

-- require people to run steam
Config.RequireSteam = true

-- "whitelist" only server
Config.PriorityOnly = false

-- disables hardcap, should keep this true
Config.DisableHardCap = true

-- will remove players from connecting if they don't load within: __ seconds; May need to increase this if you have a lot of downloads.
-- i have yet to find an easy way to determine whether they are still connecting and downloading content or are hanging in the loadscreen.
-- This may cause session provider errors if it is too low because the removed player may still be connecting, and will let the next person through...
-- even if the server is full. 50 minutes should be enough
Config.ConnectTimeOut = 600

-- will remove players from queue if the server doesn't recieve a message from them within: __ seconds
Config.QueueTimeOut = 120

-- will give players temporary priority when they disconnect and when they start loading in
Config.EnableGrace = true

-- how much priority power grace time will give
Config.GracePower = 85

-- how long grace time lasts in seconds
Config.GraceTime = 120

-- on resource start, players can join the queue but will not let them join for __ milliseconds
-- this will let the  settle and lets other resources finish initializing
Config.JoinDelay = 40000

-- will show how many people have temporary priority in the connection message
Config.ShowTemp = false

-- simple localization
Config.Language = {
    joining = "\xF0\x9F\x8E\x89Joining QPixel...",
    connecting = "\xE2\x8F\xB3Connecting to QPixel...",
    idrr = "\xE2\x9D\x97[DPXQueue] Error: Couldn't retrieve any of your id's, try restarting.",
    err = "\xE2\x9D\x97[DPXQueue] There was an error",
    pos = "\xF0\x9F\x90\x8CYou are %d/%d in queue \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97[DPXQueue] Error: Error adding you to connecting list",
    timedout = "\xE2\x9D\x97[DPXQueue] Error: Timed out?",
    wlonly = "\xE2\x9D\x97[DPXQueue] You must be whitelisted to join this server. To apply, head to : https://discord.gg/novelcity",
    steam = "\xE2\x9D\x97 [DPXQueue] Error: Steam must be running"
}