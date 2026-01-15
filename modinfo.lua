-- Localization

local translation = {
    en = {
        name = "Magical Pouches",
        description = "Shrinks items to fit in your pocket!",
        tags = {"magical", "pouch", "portable", "container"},
        tabs = {"Tools", "Survival", "Farm", "Science", "Structures", "Refine", "Magic"},
        techs = {"None", "Science Machine", "Alchemy Engine", "Prestihatitator", "Shadow Manip.", "Broken APS", "Repaired APS"},
        spoilage = {"Default", "25% longer", "50% longer", "75% longer", "None"},
        enabled = "Enabled",
        disabled = "Disabled",
        slots = " slots",
        recipeTab = {label = "Recipe Tab", hover = "The crafting tab on which the recipe is found."},
        recipeTech = {label = "Recipe Tech", hover = "The research building required to see/craft the recipe."},
        mpSize = {label = "MP Size", hover = "The size of the Magical Pouch."},
        mpRope = {label = "MP Rope", hover = "The amount of Rope required to craft the Magical Pouch."},
        mpWeb = {label = "MP Spider Web", hover = "The amount of Web required to craft the Magical Pouch."},
        mpGems = {label = "MP Purple Gem", hover = "The amount of Purple Gems required to craft the Magical Pouch."},
        impToggle = {label = "Toggle IMP", hover = "Enable/disable the Icy Magical Pouch"},
        impSize = {label = "IMP Size", hover = "The size of the Icy Magical Pouch."},
        impSpoilage = {label = "IMP Spoilage", hover = "The rate at which food spils in the Icy Magical Pouch."},
        impRope = {label = "IMP Rope", hover = "The amount of Rope required to craft the Icy Magical Pouch."},
        impWeb = {label = "IMP Spider Web", hover = "The amount of Web required to craft the Icy Magical Pouch."},
        impGems = {label = "IMP Blue Gem", hover = "The amount of Blue Gems required to craft the Icy Magical Pouch."},
        autoCollect = {label = "Enable Auto-Collect", hover = "Enable/disable the auto-collect feature for all pouches."},
        infiniteStacks = {label = "Infinite Stacks", hover = "Enable infinite stack size for pouch slots."},
        collectInterval = {label = "Collect Interval", hover = "The interval in seconds at which the pouches collect loot."},
        sanityDrain = {label = "Sanity Drain on Auto-Collect", hover = "Enable/disable sanity drain when pouches auto-collect items."},
        sanityDrainCount = {label = "Items per sanity point", hover = "The number of items to collect before draining one sanity point."},
        hungerDrain = {label = "Hunger Drain on Auto-Collect", hover = "Enable/disable hunger drain when pouches auto-collect items."},
        hungerDrainCount = {label = "Items per hunger point", hover = "The number of items to collect before draining one hunger point."},
        healthDrain = {label = "Health Drain on Auto-Collect", hover = "Enable/disable health drain when pouches auto-collect items."},
        healthDrainCount = {label = "Items per health point", hover = "The number of items to collect before draining one health point."},
        xPos = {label = "UI Horizontal Position", hover = "The horizontal position of the pouch window."},
        yPos = {label = "UI Vertical Position", hover = "The vertical position of the pouch window."},
        language = {label = "Language", hover = "Matches the game's language."},
    },
    zh = {
        name = "魔法袋子",
        description = "缩小物品以放入口袋！",
        tags = {"魔法", "袋子", "便携", "容器"},
        tabs = {"工具", "生存", "农场", "科学", "结构", "精炼", "魔法"},
        techs = {"无", "科学机器", "炼金引擎", "预言家帽子", "暗影操控器", "损坏的APS", "修复的APS"},
        spoilage = {"默认", "延长25%", "延长50%", "延长75%", "无"},
        enabled = "启用",
        disabled = "禁用",
        slots = " 格",
        recipeTab = {label = "配方标签", hover = "配方所在的制作标签。"},
        recipeTech = {label = "配方科技", hover = "查看/制作配方所需的研究建筑。"},
        mpSize = {label = "魔法袋子大小", hover = "魔法袋子的大小。"},
        mpRope = {label = "魔法袋子绳子", hover = "制作魔法袋子所需的绳子数量。"},
        mpWeb = {label = "魔法袋子蜘蛛网", hover = "制作魔法袋子所需的蜘蛛网数量。"},
        mpGems = {label = "魔法袋子紫宝石", hover = "制作魔法袋子所需的紫宝石数量。"},
        impToggle = {label = "切换冰魔法袋子", hover = "启用/禁用冰魔法袋子"},
        impSize = {label = "冰魔法袋子大小", hover = "冰魔法袋子的大小。"},
        impSpoilage = {label = "冰魔法袋子腐坏", hover = "食物在冰魔法袋子中腐坏的速度。"},
        impRope = {label = "冰魔法袋子绳子", hover = "制作冰魔法袋子所需的绳子数量。"},
        impWeb = {label = "冰魔法袋子蜘蛛网", hover = "制作冰魔法袋子所需的蜘蛛网数量。"},
        impGems = {label = "冰魔法袋子蓝宝石", hover = "制作冰魔法袋子所需的蓝宝石数量。"},
        autoCollect = {label = "启用自动收集", hover = "启用/禁用所有袋子的自动收集功能。"},
        infiniteStacks = {label = "无限堆栈", hover = "为袋槽启用无限堆叠大小。"},
        collectInterval = {label = "收集间隔", hover = "袋子收集战利品的间隔时间（秒）。"},
        sanityDrain = {label = "自动收集时消耗理智", hover = "启用/禁用袋子自动收集物品时消耗理智。"},
        sanityDrainCount = {label = "理智消耗量", hover = "每收集多少物品消耗一点理智。"},
        hungerDrain = {label = "自动收集时消耗饥饿值", hover = "启用/禁用袋子自动收集物品时消耗饥饿值。"},
        hungerDrainCount = {label = "饥饿值消耗量", hover = "每收集多少物品消耗一点饥饿值。"},
        healthDrain = {label = "自动收集时消耗生命值", hover = "启用/禁用袋子自动收集物品时消耗生命值。"},
        healthDrainCount = {label = "生命值消耗量", hover = "每收集多少物品消耗一点生命值。"},
        xPos = {label = "UI水平位置", hover = "袋子窗口的水平位置。"},
        yPos = {label = "UI垂直位置", hover = "袋子窗口的垂直位置。"},
        language = {label = "语言", hover = "匹配游戏语言。"},
    },
}

local L = locale
local lang_key = "en"
if L then
    if L == "zh" or L == "zht" or L == "zhr" then
        lang_key = "zh"
    elseif translation[L] then
        lang_key = L
    end
end
local S = translation[lang_key] or translation.en

-- Mod info

name = S.name
description = S.description
author = "Tony" -- https://steamcommunity.com/profiles/76561198002269576
version = "260115b"
forumthread = ""
api_version = 10
all_clients_require_mod = true
client_only_mod = false
dst_compatible = true
icon_atlas = "modicon.xml"
icon = "modicon.tex"
server_filter_tags = S.tags
priority = 50

local function setTab(k)
    local name = S.tabs
    return {description = ""..name[k].."", data = k}
end

local function setTech(k)
    local name = S.techs
    return {description = ""..name[k].."", data = k}
end

local function setSize(k)
    local slots = {4, 9, 16, 25, 100}
    return {description = ""..slots[k]..S.slots, data = k}
end

local function setCount(k)
    return {description = ""..k.."", data = k}
end

local function setSpoilage(k)
    local desc = S.spoilage
    local val = {.5, .37, .25, .12, .001}
    return {description = ""..desc[k].."", data = val[k]}
end

local tab = {} for k=1,7,1 do tab[k] = setTab(k) end
local tech = {} for k=1,7,1 do tech[k] = setTech(k) end
local size = {} for k=1,5,1 do size[k] = setSize(k) end
local ingredient = {} for k=1,20,1 do ingredient[k] = setCount(k) end
local count = {} for k=1,11,1 do count[k] = setCount(k-6) end
local drainCount = {} for k=1,30,1 do drainCount[k] = setCount(k) end
local toggle = {{description = S.enabled, data = true}, {description = S.disabled, data = false}}
local interval = {} for k=1,10,1 do interval[k] = setCount(k/10) end
local position = {} for k=1,41,1 do position[k] = setCount(k*25-525) end
local spoilage = {} for k=1,5,1 do spoilage[k] = setSpoilage(k) end

local localeOptions = {
    {description = lang_key == "zh" and "中文" or "English", data = lang_key},
}

configuration_options = {
    {name = "cfgLocale", label = S.language.label, options = localeOptions, default = lang_key, hover = S.language.hover},
    {name = "cfgRecipeTab", label = S.recipeTab.label, options = tab, default = 1, hover = S.recipeTab.hover},
    {name = "cfgRecipeTech", label = S.recipeTech.label, options = tech, default = 5, hover = S.recipeTech.hover},
    {name = "cfgMPSize", label = S.mpSize.label, options = size, default = 2, hover = S.mpSize.hover},
    {name = "cfgMPRope", label = S.mpRope.label, options = ingredient, default = 1, hover = S.mpRope.hover},
    {name = "cfgMPWeb", label = S.mpWeb.label, options = ingredient, default = 15, hover = S.mpWeb.hover},
    {name = "cfgMPGems", label = S.mpGems.label, options = ingredient, default = 5, hover = S.mpGems.hover},
    {name = "cfgIMPRecipeToggle", label = S.impToggle.label, options = toggle, default = true, hover = S.impToggle.hover},
    {name = "cfgIMPSize", label = S.impSize.label, options = size, default = 1, hover = S.impSize.hover},
    {name = "cfgIMPPerishMult", label = S.impSpoilage.label, options = spoilage, default = .5, hover = S.impSpoilage.hover},
    {name = "cfgIMPRope", label = S.impRope.label, options = ingredient, default = 1, hover = S.impRope.hover},
    {name = "cfgIMPWeb", label = S.impWeb.label, options = ingredient, default = 15, hover = S.impWeb.hover},
    {name = "cfgIMPGems", label = S.impGems.label, options = ingredient, default = 10, hover = S.impGems.hover},
    {name = "cfgInfiniteStacks", label = S.infiniteStacks.label, options = toggle, default = false, hover = S.infiniteStacks.hover},
    {name = "cfgAutoCollectToggle", label = S.autoCollect.label, options = toggle, default = false, hover = S.autoCollect.hover},
    {name = "cfgAutoCollectInterval", label = S.collectInterval.label, options = interval, default = .3, hover = S.collectInterval.hover},
    {name = "cfgSanityDrainToggle", label = S.sanityDrain.label, options = toggle, default = true, hover = S.sanityDrain.hover},
    {name = "cfgSanityDrainCount", label = S.sanityDrainCount.label, options = drainCount, default = 5, hover = S.sanityDrainCount.hover},
    {name = "cfgHungerDrainToggle", label = S.hungerDrain.label, options = toggle, default = false, hover = S.hungerDrain.hover},
    {name = "cfgHungerDrainCount", label = S.hungerDrainCount.label, options = drainCount, default = 5, hover = S.hungerDrainCount.hover},
    {name = "cfgHealthDrainToggle", label = S.healthDrain.label, options = toggle, default = false, hover = S.healthDrain.hover},
    {name = "cfgHealthDrainCount", label = S.healthDrainCount.label, options = drainCount, default = 5, hover = S.healthDrainCount.hover},
    {name = "cfgXPos", label = S.xPos.label, options = position, default = 0, hover = S.xPos.hover},
    {name = "cfgYPos", label = S.yPos.label, options = position, default = -250, hover = S.yPos.hover},
}