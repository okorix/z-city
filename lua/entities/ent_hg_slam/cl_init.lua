include("shared.lua")

local laserMaterial = CreateMaterial("tripmine_laser", "UnlitGeneric", {
	["$basetexture"] = "sprites/laserbeam",
	["$additive"] = "1",
	["$vertexcolor"] = "1",
	["$vertexalpha"] = "1",
	["$nocull"] = "1",
	["$brightness"] = "64",
	["$textureScrollRate"] = "25.6",
})

function ENT:CreateLaserHook()
	self.HookAdded = true
	hook.Add("PostDrawOpaqueRenderables", "SlamRender"..self:EntIndex(), function()
		if not self.TraceStart or not self.TraceHitPos then return end
		
		render.SetMaterial(laserMaterial)
		
		local segments = 10
		
		for i = 1, segments do
			local segStart = LerpVector((i - 1) / segments, self.TraceStart, self.TraceHitPos)
			local segEnd = LerpVector(i / segments, self.TraceStart, self.TraceHitPos)
			
			render.DrawBeam(
				segStart,
				segEnd,
				0.35,
				0,
				1,
				Color(255, 55, 52, 64 - i * 6)
			)
		end
	end)
end

function ENT:Draw()
	self:DrawModel()
end

function ENT:OnRemove()
	hook.Remove("PostDrawOpaqueRenderables","SlamRender"..self:EntIndex())
end