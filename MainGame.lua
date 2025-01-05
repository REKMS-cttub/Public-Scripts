--[[
 Decompiled by Medal.
 Output modified by Argon for improved readability and clarity.
 Script: Main_Game
 Decompiled On: 2025-01-05 16:46:00
]]

local var_1 = script:FindFirstAncestor("MainUI")
local r_Spring_0 = require(var_1.Modules.Spring)
print("look behind you")
local class_1 = {}
repeat
    wait()
until game.Players.LocalPlayer.Character
class_1.player = game.Players.LocalPlayer
class_1.char = game.Players.LocalPlayer.Character
class_1.hum = class_1.char:WaitForChild("Humanoid")
workspace.CurrentCamera:Destroy()
wait()
local gs_TweenService_0 = game:GetService("TweenService")
local gs_CollectionService_0 = game:GetService("CollectionService")
class_1.ax_t = 0
class_1.ay_t = 0
class_1.az_t = 0
class_1.ax = 0
class_1.ay = 0
class_1.az = 0
class_1.cam = workspace.CurrentCamera
class_1.basecamcf = class_1.cam.CFrame
class_1.cam.CameraSubject = class_1.char:WaitForChild("Humanoid")
class_1.cam.CameraType = Enum.CameraType.Scriptable
class_1.remotes = game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder")
class_1.ce = {}
class_1.spring = r_Spring_0.new(Vector3.new(0, 0, 0))
class_1.spring:__newindex("Damper", 0.5)
class_1.spring:__newindex("Speed", 8)
class_1.recoil_spring = r_Spring_0.new(Vector3.new(0, 0, 0))
class_1.recoil_spring:__newindex("Damper", 0.7)
class_1.recoil_spring:__newindex("Speed", 9)
class_1.crouching = false
class_1.sprinting = false
class_1.aiming = false
class_1.holdclick = false
class_1.holdjump = false
class_1.freemouse = false
class_1.stunned = false
class_1.canUseItems = false
class_1.disableMovement = false
class_1.tool = nil
class_1.fakeTool = nil
class_1.sightui = nil
class_1.aimph = 0
class_1.fovspring = 90
class_1.fovtarget = 70
class_1.ti = nil
class_1.camlock = nil
class_1.camlockHead = 0
class_1.stopcam = false
class_1.deathtick = tick()
class_1.hideplayers = 0
class_1.hotbarenabled = true
class_1.tooloffset = Vector3.new(0, 0, 0)
class_1.chase = false
class_1.hiding = false
class_1.camlockedoffset = { 0, 0 }
class_1.camShakerModule = require(game:GetService("ReplicatedStorage"):WaitForChild("CameraShaker"))
class_1.csgo = CFrame.new(0, 0, 0)
class_1.gd = game:GetService("ReplicatedStorage"):WaitForChild("GameData")
local r_ClientModules"):WaitForChild("GetPlatform_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("ClientModules"):WaitForChild("GetPlatform"))
local v7, v8 = r_ClientModules"):WaitForChild("GetPlatform_0()
class_1.platform = v7
class_1.controller = v8
local r_ReplicaDataModule_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("ReplicaDataModule"))
class_1.camShaker = class_1.camShakerModule.new(200, function(p10)
    -- upvalues: (copy) class_1
    class_1.csgo = p10
end)
class_1.camShaker:Start()
local var_11 = class_1.camShaker:StartShake(0.5, 1, 2, Vector3.new(0, 0, 0))
for _, v12 in pairs(script:GetChildren()) do
    if v12:IsA("LocalScript") then
        v12.Disabled = false
    end
end
local gs_StarterGui_0 = game:GetService("StarterGui")
gs_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
gs_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
gs_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
gs_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Captures, false)
class_1.mouse = game.Players.LocalPlayer:GetMouse()
class_1.mouse.Icon = "rbxassetid://7767604747"
for _, v14 in pairs(script:GetChildren()) do
    if v14:IsA("BindableEvent") then
        class_1.ce[v14.Name] = v14
    end
end
var_1:WaitForChild("MainFrame")
var_1.MainFrame.Crosshair.Visible = true
var_1:WaitForChild("LobbyFrame"):Destroy()
for _, v15 in pairs(class_1.char:GetDescendants()) do
    if v15:IsA("BasePart") then
        v15.CastShadow = false
    end
end
for _, v16 in game:GetService("ReplicatedStorage"):WaitForChild("TempClothing"):GetChildren() do
    v16:Destroy()
end
function class_1.update()
    -- upvalues: (copy) class_1, (copy) gs_CollectionService_0, (copy) r_ClientModules"):WaitForChild("GetPlatform_0, (copy) var_1, (copy) r_ReplicaDataModule_0, (copy) gs_TweenService_0, (copy) var_11
    pcall(function()
        -- upvalues: (ref) class_1, (ref) gs_CollectionService_0
        local var_1 = class_1.char:GetAttribute("ScreechOn") or class_1.char:GetAttribute("Giggled") or (class_1.char:GetAttribute("InCutscene") or class_1.char:GetAttribute("Animating")) or (class_1.char:GetAttribute("Climbing") or class_1.char:GetAttribute("Stunned") or (class_1.char:GetAttribute("Hiding") or class_1.char.PrimaryPart.Anchored))
        game:GetService("ProximityPromptService").Enabled = not (class_1.char:GetAttribute("Giggled") or class_1.char:GetAttribute("InCutscene") or (class_1.char:GetAttribute("Animating") or class_1.char:GetAttribute("Climbing"))) and (not (class_1.char:GetAttribute("Stunned") or class_1.char:GetAttribute("Hiding")) and (not class_1.char.PrimaryPart.Anchored and class_1.hum.Health >= 0.1)) and true or false
        for _, v18 in gs_CollectionService_0:GetTagged("EyesParticle") do
            v18.Texture = var_1 and (not class_1.dead and class_1.hum.Health > 0.1) and "rbxassetid://18280184574" or "rbxassetid://10183704772"
        end
    end)
    pcall(function()
        -- upvalues: (ref) class_1, (ref) r_ClientModules"):WaitForChild("GetPlatform_0, (ref) var_1, (ref) r_ReplicaDataModule_0, (ref) gs_TweenService_0, (ref) var_11
        local var_1 = class_1
        local var_1 = class_1
        local v21, v22 = r_ClientModules"):WaitForChild("GetPlatform_0()
        var_1.platform = v21
        var_1.controller = v22
        if class_1.freemouse or class_1.dead then
            var_1.MainFrame.Visible = false
            class_1.mouse.Icon = ""
        else
            var_1.MainFrame.Visible = true
            class_1.mouse.Icon = "rbxassetid://2833720882"
        end
        local var_1 = var_1.MainFrame:WaitForChild("MobileButtons")
        local v24
        if class_1.controller == "mobile" and class_1.camlock == nil then
            v24 = class_1.stopcam == false and true or class_1.basecontrols
        else
            v24 = false
        end
        var_1.Visible = v24
        if class_1.dead then
            class_1.hideplayers = -1
        end
        local var_1 = r_ReplicaDataModule_0 and r_ReplicaDataModule_0.data
        if var_1 then
            var_1 = r_ReplicaDataModule_0.data.Settings.HideLayers
        end
        if not var_1 then
            for _, v26 in game:GetService("ReplicatedStorage"):WaitForChild("TempClothing"):GetChildren() do
                v26.Parent = class_1.char
            end
        end
        if class_1.hideplayers > 1 then
            pcall(function()
                -- upvalues: (ref) class_1, (ref) gs_TweenService_0
                if class_1.char.PrimaryPart.LocalTransparencyModifier < 1 then
                    for _, v27 in pairs(class_1.char:GetDescendants()) do
                        if v27:IsA("BasePart") then
                            gs_TweenService_0:Create(v27, TweenInfo.new(1), {
                                ["LocalTransparencyModifier"] = 1
                            }):Play()
                        end
                    end
                end
            end)
        elseif class_1.hideplayers < -1.1 and class_1.char:FindFirstChild("Head") then
            if class_1.char.Head.LocalTransparencyModifier > 0 then
                for _, v28 in pairs(class_1.char:GetDescendants()) do
                    if v28:IsA("BasePart") or v28:IsA("Decal") then
                        gs_TweenService_0:Create(v28, TweenInfo.new(0.05), {
                            ["LocalTransparencyModifier"] = 1
                        }):Play()
                    end
                end
            end
        elseif class_1.hideplayers < -0.1 and class_1.char:FindFirstChild("Head") then
            if class_1.char.Head.LocalTransparencyModifier > 0 then
                for _, v29 in pairs(class_1.char:GetDescendants()) do
                    if v29:IsA("BasePart") then
                        gs_TweenService_0:Create(v29, TweenInfo.new(0.05), {
                            ["LocalTransparencyModifier"] = 0
                        }):Play()
                    end
                end
            end
        elseif class_1.dead == false then
            for _, v30 in pairs(class_1.char:GetDescendants()) do
                if v30:IsA("BasePart") then
                    v30.LocalTransparencyModifier = 1
                    if v30.Parent == class_1.char or (v30:FindFirstAncestorOfClass("Tool") or v30:FindFirstAncestorOfClass("Model") and v30:FindFirstAncestorOfClass("Model"):GetAttribute("ShowInFirstPerson")) or (v30:FindFirstAncestor("OffhandHandle") or (v30.Name == "OffhandHandle" or v30:FindFirstChildOfClass("WrapLayer") and (v30:FindFirstChild("FaceFrontAttachment") == nil and (v30:FindFirstChild("FaceCenterAttachment") == nil and (v30:FindFirstChild("HairAttachment") == nil and (v30:FindFirstChild("HatAttachment") == nil and (v30:FindFirstChild("NeckRigAttachment") == nil and v30.Parent:GetAttribute("HideInFirstPerson") ~= true))))))) then
                        if v30.Name == "Torso" or v30.Name == "Head" then
                            v30.LocalTransparencyModifier = 1
                        else
                            v30.LocalTransparencyModifier = 0
                        end
                    end
                end
                if var_1 and v30:FindFirstChildOfClass("WrapLayer") then
                    v30.Parent = game.ReplicatedStorage.TempClothing
                end
            end
        else
            for _, v31 in pairs(class_1.char:GetDescendants()) do
                if v31:IsA("BasePart") then
                    v31.LocalTransparencyModifier = 0
                end
            end
        end
        if r_ReplicaDataModule_0.data then
            class_1.camsmoothamt = r_ReplicaDataModule_0.data.Settings.ReduceMotion and 60 or 25
            local var_1 = r_ReplicaDataModule_0.data.Settings.Sensitivity / 100
            local var_1 = math.clamp(var_1, 0.005, 5)
            local var_1 = r_ReplicaDataModule_0.data.Settings.Sensitivity
            if var_1 > 50 then
                local var_1 = (var_1 + (var_1 - 50) * 3) / 100
                var_1 = math.clamp(var_1, 0.005, 10)
            end
            class_1.camSens = math.clamp(var_1, 0.03, 10) or 0.5
            game.SoundService.Main.Music.Volume = r_ReplicaDataModule_0.data.Settings.VolumeMusic / 50
            game.SoundService.MusicLobby.Volume = r_ReplicaDataModule_0.data.Settings.VolumeMusicLobby / 50
            local var_1 = class_1
            local var_1 = class_1
            local v38, v39 = r_ClientModules"):WaitForChild("GetPlatform_0()
            var_1.platform = v38
            var_1.controller = v39
            if class_1.camsmoothamt >= 50 then
                var_11:SetScaleMagnitude(0)
                return
            end
            var_11:SetScaleMagnitude(0.5)
        end
    end)
end
function class_1.playaudio(p_u_40, p_u_41, p_u_42, p_u_43, p_u_44)
    -- upvalues: (copy) class_1
    local _, v55 = pcall(function()
        -- upvalues: (ref) p_u_44, (copy) p_u_41, (ref) p_u_43, (ref) p_u_40, (ref) class_1, (copy) p_u_42
        if not p_u_44 then
            p_u_44 = 1
        end
        local v45
        if p_u_41 == nil then
            v45 = nil
        elseif p_u_41:IsA("Attachment") then
            v45 = p_u_41.WorldPosition
        else
            v45 = p_u_41.Position
        end
        pcall(function()
            -- upvalues: (ref) p_u_43, (ref) p_u_40
            if p_u_43 then
                p_u_40.RollOffMaxDistance = p_u_43
                if p_u_43 < 50 then
                    p_u_40.RollOffMinDistance = 2
                    return
                end
            else
                p_u_43 = p_u_40.RollOffMaxDistance
            end
        end)
        if p_u_41 and (p_u_40 and v45) then
            local var_1 = p_u_43
            if (class_1.cam.CFrame.p - v45).Magnitude < math.clamp(var_1, 0, 500) then
                p_u_40 = p_u_40:Clone()
                p_u_40.Parent = p_u_41
                if p_u_42 and p_u_42 == true then
                    local var_1 = (class_1.cam.CFrame.p - v45).Magnitude
                    if var_1 > 5 then
                        local var_1 = RaycastParams.new()
                        var_1.CollisionGroup = "NoPlayer"
                        var_1.FilterDescendantsInstances = { p_u_41, class_1.char }
                        local var_1 = workspace:Raycast(class_1.cam.CFrame.p, (v45 - class_1.cam.CFrame.p).unit * var_1, var_1)
                        if var_1 then
                            local var_1 = var_1.Position
                            if var_1 and (var_1 - class_1.cam.CFrame.p).Magnitude < var_1 - 4 then
                                local var_1 = var_1.Y - class_1.cam.CFrame.p.y
                                local _ = var_1 + math.abs(var_1) * 3
                                local var_1 = Instance.new("EqualizerSoundEffect")
                                var_1.HighGain = -var_1 * 0.25 / p_u_44
                                var_1.MidGain = -var_1 * 0.125 / p_u_44
                                var_1.LowGain = -var_1 * 0.025 / p_u_44
                                var_1.Parent = p_u_40
                            end
                        end
                    end
                end
                local var_1 = p_u_40
                var_1.Pitch = var_1.Pitch + math.random(-100, 100) / 4000
                p_u_40:Play()
                game.Debris:AddItem(p_u_40, p_u_40.TimeLength * p_u_40.Pitch + 2)
                return
            end
        end
        if not (p_u_40 and p_u_41) then
            if p_u_40 then
                p_u_40 = p_u_40:Clone()
                p_u_40.Parent = class_1.char
                local var_1 = p_u_40
                var_1.Pitch = var_1.Pitch + math.random(-100, 100) / 4000
                p_u_40:Play()
                game.Debris:AddItem(p_u_40, p_u_40.TimeLength * p_u_40.Pitch + 2)
            end
        end
    end)
    if v55 then
        warn(v55)
    end
end
class_1.update()
task.spawn(function()
    -- upvalues: (copy) class_1
    for _ = 1, 30 do
        class_1.update()
        wait(0.1)
    end
end)
pcall(function()
    -- upvalues: (copy) r_ReplicaDataModule_0, (copy) class_1
    r_ReplicaDataModule_0.event.Settings.Event:Connect(class_1.update)
end)
return class_1
