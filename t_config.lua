config = {}
config.draw = function()
  x_m,y_m = love.mouse.getPosition()
  for i = 0, love.graphics.getWidth() / background:getWidth() do
      for j = 0, love.graphics.getHeight() / background:getHeight() do
          love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
      end
  end
  g.setColor(0,0,0)
  love.graphics.rectangle("fill",68,71,68.2*5,70.6*5)
  
  g.setColor(255,255,255,0.9)
  if love.mouse.isDown(1) then
    if mouseover(x_m,y_m,{68*2,68.2*3+68*2},{70.6*3-20,70.6*3+20}) then
      circlex = x_m
    elseif mouseover(x_m,y_m,{68*2,68.2*3+68*2},{70.6*5-20,70.6*5+20}) then
      musica:setLooping(false)
      musica:stop()
      circleEfeitos = x_m
    end
  end
  soundVolume = (circlex-68*2)/(68.2*3)
  soundEfeitos = (circleEfeitos - 68*2)/(68.2*3)
  M.setColor(texto,255,255,255)
  M.drawtext(texto,68*2,70.6*3-70.6*3/6,"Musica")
  M.drawtext(texto,68*4,70.6*3-70.6*3/6,string.format("%.2f",tostring(soundVolume)))
  M.drawtext(texto,68*2,70.6*5-70.6*3/6,"Efeitos")
  M.drawtext(texto,68*4,70.6*5-70.6*3/6,string.format("%.2f",tostring(soundEfeitos)))
  g.setColor(255,255,255)
  g.rectangle("fill",68*2,70.6*3,68.2*3,5)
  g.rectangle("fill",68*2,70.6*5,68.2*3,5)
  g.setColor(128,128,128)
  g.circle("fill",circlex,70.6*3+2.5,10)
  g.circle("fill",circleEfeitos,70.6*5+2.5,10)
  -- 0.5 -- x
  -- 0.1 -- 1/2
  x = 1/2*1/2*10
  musica:setVolume( soundVolume/10)
  somDoEngolir:setVolume( soundEfeitos*2/10)
  somDoAndar:setVolume( soundEfeitos*2*15/100)
  if mouseover(x_m,y_m,{25*16+dla_x/12,25*17+dla_x/6},{5,dla_y/6+5}) then
      g.draw(leftarrow_w,25*16+dla_x/12,dla_y/12-5,0,1/6)
      if love.mouse.isDown(1) then
        Tela = Menu
        Menu.reset()
      end
  else
   g.draw(leftarrow_g,25*16+dla_x/12,dla_y/12-5,0,1/6)
  
  end
end
config.load = function()
end
config.update = function()
end
config.reset = function()
  circlex = 170.3+68
  circleEfeitos = 170.3+68 
  font_mais = g.newFont("Font/adventure.ttf",30)
  texto = M.new(font_mais,"S")
  leftarrow_w = g.newImage("Icons/arrow_w.png")
  leftarrow_g= g.newImage("Icons/arrow_g.png")
  dla_x,dla_y = leftarrow_g:getDimensions()
end
config.mousepressed = function()

end
function config.mousereleased(x,y,button)
  if mouseover(x_m,y_m,{68*2,68.2*3+68*2},{70.6*5-20,70.6*5+20}) then
    somDoAndar:play()
    musica:play()
    musica:setLooping(true)
  end
end
config.keyreleased = function(key)
end
return config