return Def.Quad {
    StartTransitioningCommand=function(self)
        self:FullScreen():diffuse(Color.Black)
		:linear(1):diffusealpha(0)
    end
}