local c
local player = Var "Player"
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt")

return Def.ActorFrame {
	InitCommand=function(self)
		self:valign(1)
	end,
	
	Def.BitmapText {
		Font="Combo",
		Name="Number",
		OnCommand=THEME:GetMetric("Combo", "NumberOnCommand")
	},
	
	Def.Sprite {
		Name="Label",
		Texture=THEME:GetPathG("", "Gameplay/ComboLabel"),
		OnCommand=THEME:GetMetric("Combo", "LabelOnCommand")
	},
	
	InitCommand = function(self)
		c = self:GetChildren()
		c.Number:visible(false):SetTextureFiltering(false)
		c.Label:visible(false):SetTextureFiltering(false)
	end,
	
	ComboCommand=function(self, param)
		local iCombo = param.Combo
		if not iCombo or iCombo < ShowComboAt then
			c.Number:visible(false)
			c.Label:visible(false)
			return
		end
		
		c.Number:visible(true)
		c.Label:visible(true)
		c.Number:settext(string.format("%03i", iCombo))
		self:stoptweening():sleep(1):queuecommand("Hide")
	end,
	
	HideCommand=function(self)
		c.Number:visible(false)
		c.Label:visible(false)
	end
}
