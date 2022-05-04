name = "Magical Pouches"
description = "Shrinks items to fit in your pocket!"
author = "Tony" -- https://steamcommunity.com/profiles/76561198002269576
version = "1.35b"
forumthread = ""
api_version = 10
all_clients_require_mod = true
client_only_mod = false
dst_compatible = true
icon_atlas = "modicon.xml"
icon = "modicon.tex"
server_filter_tags = {"magical", "pouch", "portable", "container"}
priority = 50

local function setTab(k)
    local name = {"Tools", "Survival", "Farm", "Science", "Structures", "Refine", "Magic"}
    return {description = ""..name[k].."", data = k}
end

local function setTech(k)
    local name = {"None", "Science Machine", "Alchemy Engine", "Prestihatitator", "Shadow Manip.", "Broken APS", "Repaired APS"}
    return {description = ""..name[k].."", data = k}
end

local function setSize(k)
    local slots = {4, 9, 16, 25, 100}
    return {description = ""..slots[k].." slots", data = k}
end

local function setCount(k)
    return {description = ""..k.."", data = k}
end

local function setSpoilage(k)
    local desc = {"Default", "25% longer", "50% longer", "75% longer", "None"}
    local val = {.5, .37, .25, .12, .001}
    return {description = ""..desc[k].."", data = val[k]}
end

local tab = {} for k=1,7,1 do tab[k] = setTab(k) end
local tech = {} for k=1,7,1 do tech[k] = setTech(k) end
local size = {} for k=1,5,1 do size[k] = setSize(k) end
local ingredient = {} for k=1,20,1 do ingredient[k] = setCount(k) end
local count = {} for k=1,11,1 do count[k] = setCount(k-6) end
local toggle = {{description = "Enabled", data = true}, {description = "Disabled", data = false}}
local interval = {} for k=1,10,1 do interval[k] = setCount(k/10) end
local position = {} for k=1,41,1 do position[k] = setCount(k*25-525) end
local spoilage = {} for k=1,5,1 do spoilage[k] = setSpoilage(k) end

configuration_options = {
    {name = "cfgRecipeTab", label = "Recipe Tab", options = tab, default = 1, hover = "The crafting tab on which the recipe is found."},
    {name = "cfgRecipeTech", label = "Recipe Tech", options = tech, default = 5, hover = "The research building required to see/craft the recipe."},
    {name = "cfgMPSize", label = "MP Size", options = size, default = 2, hover = "The size of the Magical Pouch."},
    {name = "cfgMPRope", label = "MP Rope", options = ingredient, default = 1, hover = "The amount of Rope required to craft the Magical Pouch."},
    {name = "cfgMPWeb", label = "MP Spider Web", options = ingredient, default = 15, hover = "The amount of Web required to craft the Magical Pouch."},
    {name = "cfgMPGems", label = "MP Purple Gem", options = ingredient, default = 5, hover = "The amount of Purple Gems required to craft the Magical Pouch."},
    {name = "cfgIMPRecipeToggle", label = "Toggle IMP", options = toggle, default = true, hover = "Enable/disable the Icy Magical Pouch"},
    {name = "cfgIMPSize", label = "IMP Size", options = size, default = 1, hover = "The size of the Icy Magical Pouch."},
    {name = "cfgIMPPerishMult", label = "IMP Spoilage", options = spoilage, default = .5, hover = "The rate at which food spils in the Icy Magical Pouch."},
    {name = "cfgIMPRope", label = "IMP Rope", options = ingredient, default = 1, hover = "The amount of Rope required to craft the Icy Magical Pouch."},
    {name = "cfgIMPWeb", label = "IMP Spider Web", options = ingredient, default = 15, hover = "The amount of Web required to craft the Icy Magical Pouch."},
    {name = "cfgIMPGems", label = "IMP Blue Gem", options = ingredient, default = 10, hover = "The amount of Blue Gems required to craft the Icy Magical Pouch."},
    {name = "cfgAutoCollectToggle", label = "Enable Auto-Collect", options = toggle, default = false, hover = "Enable/disable the auto-collect feature for all pouches."},
    {name = "cfgAutoCollectInterval", label = "Collect Interval", options = interval, default = .3, hover = "The interval in seconds at which the pouches collect loot."},
    {name = "cfgXPos", label = "UI Horizontal Position", options = position, default = 0, hover = "The horizontal position of the pouch window."},
    {name = "cfgYPos", label = "UI Vertical Position", options = position, default = 100, hover = "The vertical position of the pouch window."},
}