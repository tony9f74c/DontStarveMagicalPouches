local assets = {
    Asset("ANIM", "anim/magicpouch.zip"),
    Asset("ATLAS", "images/inventoryimages/magicpouch.xml"),
    Asset("IMAGE", "images/inventoryimages/magicpouch.tex"),
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
    inst.AnimState:SetBank("magicpouch")
    inst.AnimState:SetBuild("magicpouch")
    inst.AnimState:PlayAnimation("idle")
    inst.entity:AddSoundEmitter()

    inst:AddTag("Magical Pouch")

    local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("magicpouch.tex")
    
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then return inst end
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.cangoincontainer = true
    inst.components.inventoryitem.atlasname = "images/inventoryimages/magicpouch.xml"
    inst.components.inventoryitem:SetOnDroppedFn(ondropped)
    
    inst:AddComponent("inspectable")

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("magicpouch")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    inst.sanityDrainCounter = 0
    inst.hungerDrainCounter = 0
    inst.healthDrainCounter = 0

    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

    return inst
end

return Prefab("common/magicpouch", fn, assets)
