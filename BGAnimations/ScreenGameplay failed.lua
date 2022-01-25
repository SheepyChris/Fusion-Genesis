return Def.ActorFrame {
	Def.Quad {
		StartTransitioningCommand=function(self)
			self:FullScreen():diffuse(Color.Black)
			:diffusealpha(0):linear(1.5):diffusealpha(1)
		end
	},
	
	Def.Quad {
		StartTransitioningCommand=function(self)
			self:zoomto(256, 224):Center():MaskSource()
		end
	},
	
	Def.Quad {
		StartTransitioningCommand=function(self)
			self:FullScreen():diffuse(Color.White):MaskDest()
			:diffusealpha(0):sleep(0.1):linear(1.5):diffusealpha(1):sleep(0.001):diffusealpha(0)
			:sleep(2.5):diffusealpha(1):linear(1.5):diffusealpha(0)
		end
	},
	
	Def.Quad {
		StartTransitioningCommand=function(self)
			self:zoomto(256, 224):Center():diffuse(Color.White)
			:MaskDest():ztestmode("ZTestMode_WriteOnFail")
			:diffusealpha(0):linear(1.5):diffusealpha(1)
			:sleep(2.5):linear(1.5):diffusealpha(0)
		end
	},
	
	Def.Sound {
		File=THEME:GetPathS("", "Explosion"),
		StartTransitioningCommand=function(self)
			self:play()
		end
	}
}