local PLAYER = FindMetaTable("Player")
local oldGetEyeTrace = PLAYER.GetEyeTrace
local oldGetEyeTraceNoCursor = PLAYER.GetEyeTraceNoCursor

local function hgTrace(self)
	if self ~= LocalPlayer() then return nil end
	if not (hg and hg.eyeTrace) then return nil end

	local ok, tr = pcall(hg.eyeTrace, self, 8192)
	if ok and tr then return tr end
	return nil
end

function PLAYER:GetEyeTrace(...)
	return hgTrace(self) or oldGetEyeTrace(self, ...)
end

function PLAYER:GetEyeTraceNoCursor(...)
	return hgTrace(self) or oldGetEyeTraceNoCursor(self, ...)
end