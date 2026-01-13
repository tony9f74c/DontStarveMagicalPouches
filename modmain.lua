PrefabFiles = {
    "magicpouch",
    "icepouch",
}

local pouches = {
    "MP",
    "IMP",
}

local pouchAssets = {
    "pouchhuge_blue",
    "pouchbig_blue",
    "pouchmedium_blue",
    "pouchzilla_blue",
    "pouchsmall_blue",
    "pouchhuge_grey",
    "pouchbig_grey",
    "pouchsmall_grey",
    "pouchzilla_grey",
    "pouchmedium_grey"
}

Assets = {}
for k=1,#PrefabFiles,1 do
    table.insert(Assets, Asset("ATLAS", "minimap/"..PrefabFiles[k]..".xml"))
    table.insert(Assets, Asset("ATLAS", "images/inventoryimages/"..PrefabFiles[k]..".xml"))
end
for k=1,#pouchAssets,1 do
    table.insert(Assets, Asset("ATLAS", "images/inventoryimages/"..pouchAssets[k]..".xml"))
end

local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local TECH = GLOBAL.TECH
local Vector3 = GLOBAL.Vector3
local getConfig = GetModConfigData
local containers = GLOBAL.require "containers"
local FindEntity = GLOBAL.FindEntity

-- Get locale from configuration (set in modinfo.lua based on game language)
local localeSetting = getConfig("cfgLocale")
local isChinese = (localeSetting == "zh")
local toggleText = isChinese and "切换" or "Toggle"
local onText = isChinese and "开启" or "ON"
local offText = isChinese and "关闭" or "OFF"

local acEnabled = getConfig("cfgAutoCollectToggle")
-- local acEnabled = false

-- MAP ICONS --

AddMinimapAtlas("minimap/magicpouch.xml")
AddMinimapAtlas("minimap/icepouch.xml")

-- STRINGS --

if isChinese then
    STRINGS.NAMES.MAGICPOUCH = "魔法袋子"
    STRINGS.RECIPE_DESC.MAGICPOUCH = "缩小物品以放入口袋！"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.MAGICPOUCH = "缩小物品以放入口袋！"
    STRINGS.NAMES.ICEPOUCH = "冰魔法袋子"
    STRINGS.RECIPE_DESC.ICEPOUCH = "可以让食物永远保持新鲜的魔法袋子！"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEPOUCH = "可以让食物永远保持新鲜的魔法袋子！"
else
    STRINGS.NAMES.MAGICPOUCH = "Magical Pouch"
    STRINGS.RECIPE_DESC.MAGICPOUCH = "Shrinks items to fit in your pocket!"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.MAGICPOUCH = "Shrinks items to fit in your pocket!"
    STRINGS.NAMES.ICEPOUCH = "Icy Magical Pouch"
    STRINGS.RECIPE_DESC.ICEPOUCH = "A Magical Pouch that can keep food fresh forever!"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEPOUCH = "A Magical Pouch that can keep food fresh forever!"
end

-- RECIPES --

local isIMPEnabled = getConfig("cfgIMPRecipeToggle")

local recipeTabs = {
    RECIPETABS.TOOLS,
    RECIPETABS.SURVIVAL,
    RECIPETABS.FARM,
    RECIPETABS.SCIENCE,
    RECIPETABS.TOWN, RECIPETABS.REFINE,
    RECIPETABS.MAGIC,
}
local recipeTab = recipeTabs[getConfig("cfgRecipeTab")]

local recipeTechs = {
    TECH.NONE,
    TECH.SCIENCE_ONE, -- Science Machine
    TECH.SCIENCE_TWO, -- Alchemy Engine
    TECH.MAGIC_TWO, -- Prestihatitator
    TECH.MAGIC_THREE, -- Shadow Manipulator
    TECH.ANCIENT_TWO, -- Broken APS
    TECH.ANCIENT_FOUR, -- Repaired APS
    TECH.OBSIDIAN_TWO, -- Obsidian Workbench
}
local recipeTech = recipeTechs[getConfig("cfgRecipeTech")]

-- Magical Pouch --
local magicpouch = AddRecipe("magicpouch", {
    Ingredient("rope", getConfig("cfgMPRope")),
    Ingredient("silk", getConfig("cfgMPWeb")),
    Ingredient("purplegem", getConfig("cfgMPGems")),
}, recipeTab, recipeTech)
magicpouch.atlas = "images/inventoryimages/magicpouch.xml"
-- Icy Magical Pouch --
if isIMPEnabled then
    local icepouch = AddRecipe("icepouch", {
        Ingredient("rope", getConfig("cfgIMPRope")),
        Ingredient("silk", getConfig("cfgIMPWeb")),
        Ingredient("bluegem", getConfig("cfgIMPGems")),
    }, recipeTab, recipeTech)
    icepouch.atlas = "images/inventoryimages/icepouch.xml"
end

-- CONTAINER --

local params = {}

local pouchDetails = {
    {id = 1, name = "pouchsmall", xy = 2, offset = 40, buttonx = 0, buttony = -100},
    {id = 2, name = "pouchmedium", xy = 3, offset = 80, buttonx = 0, buttony = -145},
    {id = 3, name = "pouchbig", xy = 4, offset = 120, buttonx = 0, buttony = -185},
    {id = 4, name = "pouchhuge", xy = 5, offset = 160, buttonx = 5, buttony = -225},
    {id = 5, name = "pouchzilla", x = 20, y = 5, xoffset = 762, yoffset = 160, buttonx = 20, buttony = -225},
}

local old_widgetsetup = containers.widgetsetup
function containers.widgetsetup(container, prefab, data, ...)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
    container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
    else
        old_widgetsetup(container, prefab, data, ...)
    end
end

local function createPouch(num)
    local pouch = pouchDetails[getConfig("cfg"..pouches[num].."Size")]
    local container = {
        widget = {
            slotpos = {},
            animbank = nil,
            animbuild = nil,
            bgimage = (num == 1) and  pouch.name.."_grey.tex" or (num == 2) and pouch.name.."_blue.tex",
            bgatlas = (num == 1) and "images/inventoryimages/"..pouch.name.."_grey.xml" or (num == 2) and "images/inventoryimages/"..pouch.name.."_blue.xml",
            pos = Vector3(getConfig("cfgXPos"),getConfig("cfgYPos"),0),
            side_align_tip = 160,
            buttoninfo = acEnabled and {
                text = toggleText,
                position = Vector3(pouch.buttonx, pouch.buttony, 0),
            } or nil
        },
        type = "chest",
    }

    for y = (pouch.xy or pouch.y), 1, -1 do
        for x = 1, (pouch.xy or pouch.x) do
            table.insert(container.widget.slotpos, Vector3(80 * (x-1) - (pouch.offset or pouch.xoffset), 80 * (y-1) - (pouch.offset or pouch.yoffset), 0))
        end
    end

    return container
end

for k=1,#pouches,1 do params[PrefabFiles[k]] = createPouch(k) end

-- ITEM TEST --

-- Icy Magical Pouch --
function params.icepouch.itemtestfn(container, item, slot)
    if item:HasTag("icebox_valid") then return true end
    if item:HasTag("fresh") or item:HasTag("stale") or item:HasTag("spoiled") or item:HasTag("frozen") then return true end
    return false
end
-- Magical Pouch --
function params.magicpouch.itemtestfn(container, item, slot)
    if isIMPEnabled then
        return not params.icepouch.itemtestfn(container, item, slot) and
        not item:HasTag("Magical Pouch")
    else
        return not item:HasTag("Magical Pouch")
    end
end

for k, v in pairs(params) do containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0) end

-- AUTO-COLLECT --

if acEnabled then
    local interval = getConfig("cfgAutoCollectInterval")
    local cfgSanityDrainEnabled = getConfig("cfgSanityDrainToggle")
    local cfgSanityDrainCount = getConfig("cfgSanityDrainCount")
    local cfgHungerDrainEnabled = getConfig("cfgHungerDrainToggle")
    local cfgHungerDrainCount = getConfig("cfgHungerDrainCount")
    local cfgHealthDrainEnabled = getConfig("cfgHealthDrainToggle")
    local cfgHealthDrainCount = getConfig("cfgHealthDrainCount")

    -- Function to search for valid items
    local function searchForItem(inst)
        if not GLOBAL.TheWorld.ismastersim then
            return
        end

        local item = FindEntity(inst, 2, function(item) 
            return item.components.inventoryitem and 
            item.components.inventoryitem.canbepickedup and
            item.components.inventoryitem.cangoincontainer
        end)
        if item and inst.components.container:Has(item.prefab, 1) then -- if found item exists in the pouch
            local given = 0
            local itemCollected = false
            if item.components.stackable then
                local canBeStacked = inst.components.container:FindItem(function(existingItem)
                    return (existingItem.prefab == item.prefab and not existingItem.components.stackable:IsFull())
                end)
                if canBeStacked then
                    inst.components.container:GiveItem(item)
                    given = 1
                    itemCollected = true
                end
            end
            if not inst.components.container:IsFull() and given == 0 then -- else if stack is full but the pouch isn't
                inst.components.container:GiveItem(item)
                itemCollected = true
            end
            -- Drain sanity/hunger/health
            if itemCollected then
                local player = inst.components.inventoryitem.owner
                if player then
                    if cfgSanityDrainEnabled and cfgSanityDrainCount > 0 and player.components.sanity then
                        inst.sanityDrainCounter = (inst.sanityDrainCounter or 0) + 1
                        if inst.sanityDrainCounter >= cfgSanityDrainCount then
                            player.components.sanity:DoDelta(-1)
                            inst.sanityDrainCounter = 0
                        end
                    end
                    if cfgHungerDrainEnabled and cfgHungerDrainCount > 0 and player.components.hunger then
                        inst.hungerDrainCounter = (inst.hungerDrainCounter or 0) + 1
                        if inst.hungerDrainCounter >= cfgHungerDrainCount then
                            player.components.hunger:DoDelta(-1)
                            inst.hungerDrainCounter = 0
                        end
                    end
                    if cfgHealthDrainEnabled and cfgHealthDrainCount > 0 and player.components.health then
                        inst.healthDrainCounter = (inst.healthDrainCounter or 0) + 1
                        if inst.healthDrainCounter >= cfgHealthDrainCount then
                            player.components.health:DoDelta(-1)
                            inst.healthDrainCounter = 0
                        end
                    end
                end
            end
        end
    end

    -- Function to toggle auto-collect on/off
    local function buttonToggle(player, inst)
        if not GLOBAL.TheWorld.ismastersim then
            return
        end
        if not inst.autoCollectToggle then
            if not inst.autoCollectTask then
                inst.autoCollectTask = inst:DoPeriodicTask(interval, function() searchForItem(inst) end)
            end
            inst.autoCollectToggle = true
            if player and player.components.talker then
                player.components.talker:Say(onText)
            end
        else
            if inst.autoCollectTask then
                inst.autoCollectTask:Cancel()
                inst.autoCollectTask = nil
            end
            inst.autoCollectToggle = false
            if player and player.components.talker then
                player.components.talker:Say(offText)
            end
        end
    end

    -- Widget button function for MP
    function params.magicpouch.widget.buttoninfo.fn(inst)
        if GLOBAL.TheWorld.ismastersim then
            buttonToggle(inst.components.container.opener, inst)
        else
            SendModRPCToServer(GLOBAL.MOD_RPC["MagicalPouches"]["MPButtonToggle"], inst)
        end
    end
    AddModRPCHandler("MagicalPouches", "MPButtonToggle", buttonToggle)
    -- Widget button functions for IMP
    function params.icepouch.widget.buttoninfo.fn(inst)
        if GLOBAL.TheWorld.ismastersim then
            buttonToggle(inst.components.container.opener, inst)
        else
            SendModRPCToServer(GLOBAL.MOD_RPC["MagicalPouches"]["IMPButtonToggle"], inst)
        end
    end
    AddModRPCHandler("MagicalPouches", "IMPButtonToggle", buttonToggle)

end
