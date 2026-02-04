ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Motion Detector"
ENT.Spawnable = false
ENT.WorldModel = "models/mmod/weapons/w_slam.mdl"

ENT.Sound = "ambient/alarms/klaxon1.wav"
ENT.AlarmCD = 0

-- local developer = GetConVar("developer")
ENT.offsetPos = Vector(-2.25, 1.38, 0)
ENT.offsetAng = Angle(-90, 180, 0)

ENT.Color = Color(115, 135, 255)
ENT.ColorDetected = Color(255,0,0,175)

function ENT:Think()
	local tr = {}
	local pos, ang = self:GetPos(), self:GetAngles()
	local pos, ang = LocalToWorld(self.offsetPos, self.offsetAng, pos, ang)
	tr.start = pos
	tr.endpos = tr.start + ang:Forward() * 700
	tr.filter = self
	tr.collisiongroup = COLLISION_GROUP_PLAYER
	local tr = util.TraceLine(tr)

	self.TraceStart = pos
    self.TraceHitPos = tr.HitPos

	-- if CLIENT and developer:GetBool() and LocalPlayer():IsAdmin() then
	-- 	debugoverlay.Line(pos, tr.HitPos, 1, color_white, true)
	-- end

	if SERVER and tr.Hit and (tr.Entity:IsPlayer() or tr.Entity:IsNPC() or (tr.Entity:IsRagdoll() and tr.Entity:GetVelocity():LengthSqr() > 1)) then
		if self.AlarmCD > CurTime() or (tr.Entity:IsPlayer() and tr.Entity.PlayerClassName == "sc_guard") then return end
		self:ActivateAlarm(tr)

		self.AlarmCD = CurTime() + 1
		self:SetNWFloat("AlarmCD",self.AlarmCD)
	end

	if CLIENT and not self.HookAdded then
        self:CreateLaserHook()
    end

	self:NextThink(CurTime())
	return true
end