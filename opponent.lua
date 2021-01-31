

Opponent = {}


function Opponent:load()

	self.width = 20
	self.height = 100
	self.x = love.graphics.getWidth() - self.width - 50
	self.y = (love.graphics.getHeight()  - self.height) / 2;
	self.speed = 500
	self.yVelocity = 0

end


function Opponent:update(dt)
	
	self:move(dt)
	self:interceptBall()
	self:checkBoundaries(dt)

end


function Opponent:move(dt)
	
	self.y = self.y + self.yVelocity * dt

end


function Opponent:checkBoundaries(dt)

	if self.y < 0 then
		self.y = 0
	elseif self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.height
	end

end


function Opponent:interceptBall()

	if Ball.y + Ball.height < self.y then
      self.yVelocity = -self.speed
   elseif Ball.y > self.y + self.height then
      self.yVelocity = self.speed
   else
      self.yVelocity = 0
   end

end


function Opponent:draw()
	
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

end

