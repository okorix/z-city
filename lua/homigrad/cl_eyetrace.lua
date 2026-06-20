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
    if hg.ShouldCamDraw() then
        return hgTrace(self)
    else
        return oldGetEyeTrace(self, ...)
    end
end

function PLAYER:GetEyeTraceNoCursor(...)
    if hg.ShouldCamDraw() then
        return hgTrace(self)
    else
        return oldGetEyeTraceNoCursor(self, ...)
    end
end