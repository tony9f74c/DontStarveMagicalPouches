local getConfig = GetModConfigData
local perishMult = getConfig("cfgIMPPerishMult", "workshop-2709414303") or getConfig("cfgIMPPerishMult", "DontStarveMagicalPouches")

local assets = {
    Asset("ANIM", "anim/icepouch.zip"),
    Asset("ATLAS", "images/inventoryimages/icepouch.xml"),
    Asset("IMAGE", "images/inventoryimages/icepouch.tex"),
}

local function ondropped(inst, owner)
    inst.components.container:Close(owner)
end

local function onopen(inst)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/backpack_open", "open")
end

local function onclose(inst)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/backpack_close", "open")
end

local function OnSave(inst, data)
    data.sanityDrainCounter = inst.sanityDrainCounter or 0
    data.hungerDrainCounter = inst.hungerDrainCounter or 0
    data.healthDrainCounter = inst.healthDrainCounter or 0
end

local function OnLoad(inst, data)
    if data ~= nil then
        inst.sanityDrainCounter = data.sanityDrainCounter or 0
        inst.hungerDrainCounter = data.hungerDrainCounter or 0
        inst.healthDrainCounter = data.healthDrainCounter or 0
    end
end

local function fn(Sim)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddNetwork()
    MakeInventoryPhysics(inst)
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("icepouch")
    inst.AnimState:SetBuild("icepouch")
    inst.AnimState:PlayAnimation("idle")
    inst.entity:AddSoundEmitter()

    inst:AddTag("Magical Pouch")
    inst:AddTag("Icy Magical Pouch")

    local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("icepouch.tex")
    
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then return inst end

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.cangoincontainer = true
    inst.components.inventoryitem.atlasname = "images/inventoryimages/icepouch.xml"
    inst.components.inventoryitem:SetOnDroppedFn(ondropped)

    inst:AddComponent("preserver")
    inst.components.preserver:SetPerishRateMultiplier(perishMult)
    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("icepouch")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    inst.sanityDrainCounter = 0
    inst.hungerDrainCounter = 0
    inst.healthDrainCounter = 0

    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

    return inst
end

return Prefab( "common/icepouch", fn, assets)
