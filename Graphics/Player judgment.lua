local TNSFrames = {
	TapNoteScore_CheckpointHit = 0,
	TapNoteScore_W1 = 0,
	TapNoteScore_W2 = 1,
	TapNoteScore_W3 = 2,
	TapNoteScore_W4 = 3,
	TapNoteScore_W5 = 4,
	TapNoteScore_Miss = 5,
	TapNoteScore_CheckpointMiss = 5,
}

local sPlayer = Var "Player"

return Def.ActorFrame {
	Def.Sprite {
		Name="Judgment",
		Texture=THEME:GetPathG("Judgment", "Normal"),
		InitCommand=function(self) self:pause():visible(false):SetTextureFiltering(false) end,
		OnCommand=THEME:GetMetric("Judgment","JudgmentOnCommand"),
		ResetCommand=function(self) self:finishtweening():stopeffect():visible(false) end
	},
	
	JudgmentMessageCommand=function(self, params)
		local Judg = self:GetChild("Judgment")
		if params.Player ~= sPlayer then return end
		if params.HoldNoteScore then return end
		if string.find(params.TapNoteScore, "Mine") then return end
		
		local iFrame = TNSFrames[params.TapNoteScore]

		if not iFrame then return end

		self:playcommand("Reset")

		Judg:visible(true):setstate(iFrame)
		:zoom(2):diffusealpha(1):sleep(1):diffusealpha(0)
	end
}
