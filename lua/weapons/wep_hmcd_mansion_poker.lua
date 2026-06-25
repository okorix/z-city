if SERVER then
    resource.AddWorkshop("2484790252") -- mu_hmcd_mansion
    AddCSLuaFile()
end

SWEP.Base = "weapon_melee"
SWEP.PrintName = "Fire Iron"
SWEP.Instructions = "This is a thick iron rod 600 mm long, bent at the end at a 90 degree angle with wooden grip. It is used for moving firewood and coal in the firebox.\n\nLMB to attack.\nRMB to block."
SWEP.Category = "Weapons - Melee"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.WorldModel = "models/mu_hmcd_mansion/weapon_poker/w_poker.mdl"
SWEP.WorldModelReal = "models/mu_hmcd_mansion/weapon_poker/v_poker.mdl"
SWEP.WorldModelExchange = "models/mu_hmcd_mansion/weapon_poker/w_poker.mdl"
SWEP.ViewModel = ""

SWEP.weaponPos = Vector(0.2341, 14.1812, 2.262)
SWEP.weaponAng = Angle(-90.1729, -90, 0)
SWEP.attack_ang = Angle(0, 0, 0)
SWEP.sprint_ang = Angle(15, 0, 0)
SWEP.basebone = 43
SWEP.BreakBoneMul = 0.2

SWEP.AnimList = {
    ["idle"] = "idle",
    ["deploy"] = "draw",
    ["attack"] = "attack",
    ["attack2"] = "attack_miss",
}

if CLIENT then
    SWEP.BounceWeaponIcon = false
    SWEP.WepSelectIcon = surface.GetTextureID("vgui/wep_hmcd_mansion_poker")
    SWEP.IconOverride = "vgui/wep_hmcd_mansion_poker"
end

SWEP.setlh = true
SWEP.setrh = true
SWEP.TwoHanded = false
SWEP.NoHolster = true

SWEP.HoldPos = Vector(-1.3806, 0, 0)
SWEP.HoldAng = Angle(0, 0, 0)
SWEP.AttackPos = Vector(0, 0, 0)
SWEP.HoldType = "melee"

SWEP.DamageType = DMG_CLUB
SWEP.DamagePrimary = 14
SWEP.DamageSecondary = 12
SWEP.PenetrationPrimary = 1.0
SWEP.PenetrationSecondary = 0.8
SWEP.MaxPenLen = 2
SWEP.PainMultiplier = 0.4
SWEP.PenetrationSizePrimary = 1
SWEP.PenetrationSizeSecondary = 2
SWEP.StaminaPrimary = 9
SWEP.StaminaSecondary = 7
SWEP.AttackLen1 = 70
SWEP.AttackLen2 = 60

SWEP.AttackSwing = "weapons/iceaxe/iceaxe_swing1.wav"
SWEP.AttackHit = "snd_jack_hmcd_hammerhit.wav"
SWEP.Attack2Hit = "snd_jack_hmcd_hammerhit.wav"
SWEP.AttackHitFlesh = "snd_jack_hmcd_axehit.wav"
SWEP.Attack2HitFlesh = "snd_jack_hmcd_axehit.wav"
SWEP.DeploySnd = "Metal.ImpactSoft"

SWEP.weight = 1.5

function SWEP:CanSecondaryAttack()
    return false
end

SWEP.AttackTimeLength = 0.15
SWEP.Attack2TimeLength = 0.1

SWEP.AnimTime1 = 1.0
SWEP.AttackTime = 0.15
SWEP.WaitTime1 = 0.85

SWEP.AnimTime2 = 1.0
SWEP.Attack2Time = 0.1
SWEP.WaitTime2 = 0.9

SWEP.AttackRads = 55
SWEP.AttackRads2 = 55

SWEP.SwingAng = -90
SWEP.SwingAng2 = 0
