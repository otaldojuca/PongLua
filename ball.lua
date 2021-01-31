

Ball = {}


function Ball:load()

	self.width = 15
	self.height = 15
	self.x = love.graphics.getWidth() / 2
	self.y = (love.graphics.getHeight()  - self.height) / 2;
	self.speed = 250
	self.xVelocity = - self.speed
	self.yVelocity = 0

end


function Ball:update(dt)

	self:move(dt)
	self:collide()

end


function Ball:collide()

	if checkCollision(self, Player) then
		self.xVelocity = self.speed
		local middleOfBall = self.y + self.height / 2
		local middleOfPlayer = Player.y + Player.height / 2
		local collisionPosition = middleOfBall - middleOfPlayer
		self.yVelocity = collisionPosition * 5
	end

	if checkCollision(self, Opponent) then
		self.xVelocity = - self.speed
		local middleOfBall = self.y + self.height / 2
		local middleOfOpponent = Opponent.y + Opponent.height / 2
		local collisionPosition = middleOfBall - middleOfOpponent
		self.yVelocity = collisionPosition * 5
	end

	if self.y < 0 then
		self.y = 0
		self.yVelocity = - self.yVelocity
	elseif self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self. height
		self.yVelocity = - self.yVelocity
	end

	if self.x < 0 then
      self.x = love.graphics.getWidth() / 2 - self.width / 2
      self.y = love.graphics.getHeight() / 2 - self.height / 2
      self.yVelocity = 0
      self.xVelocity = self.speed
   end

   if self.x + self.width > love.graphics.getWidth() then
      self.x = love.graphics.getWidth() / 2 - self.width / 2
      self.y = love.graphics.getHeight() / 2 - self.height / 2
      self.yVelocity = 0
      self.xVelocity = - self.speed
   end

end


function Ball:move(dt)

	self.x = self.x + self.xVelocity * dt 
	self.y = self.y + self.yVelocity * dt 

end


function Ball:draw()
	
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

end

