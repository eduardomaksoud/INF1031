
stats = {}
g = love.graphics
function stats.reset()
  leftarrow_w = g.newImage("Icons/arrow_w.png")
  leftarrow_g= g.newImage("Icons/arrow_g.png")
  buy_w = g.newImage("Icons/buy_w.png")
  buy_g = g.newImage("Icons/buy_g.png")
  ball = g.newImage("Icons/ball.png")
  -- GETTING DIMENSIONS ----
  dla_x,dla_y = leftarrow_w:getDimensions()
  dbu_x,dbu_y = buy_w:getDimensions()
  font_mais = g.newFont("Font/adventure.ttf",25)
  texto = M.new(font_mais,"S")
end
function stats.load()
end
function stats.update()
x_m,y_m = love.mouse.getPosition()
down = love.mouse.isDown(1)
end
function stats.draw()
-- BACKGROUND DRAW ----
  for i = 0, love.graphics.getWidth() / background:getWidth() do
      for j = 0, love.graphics.getHeight() / background:getHeight() do
          love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
      end
  end
  love.graphics.draw(sound,420,15,0,1/18,1/18)
  if mouseover(x_m,y_m,{3,3+dla_x/4},{5,5+dla_y/4}) and Tela == stats then
    love.graphics.draw(leftarrow_w,3,5,0,1/4,1/4)
  else
    love.graphics.draw(leftarrow_g,3,5,0,1/4,1/4)
  end
--GRAPHICS LEADERBORAD DRAW ----

g.setColor(128/255,128/255,128/255)
g.circle("fill",68.1*2.5,71.4*1.5,51)
g.setColor(0,0,0)
g.circle("fill",68.1*2.5,71.4*1.5,33)
-- NUMBERS LEADERBOARD DRAW ----
recorde = tostring(arquivo.checaArquivo("Recorde"))
contador_s = (arquivo.checaArquivo("Alemanha") + arquivo.checaArquivo("Russia") + arquivo.checaArquivo("Brasil"))/3
coin = arquivo.checaArquivo("Coin")
M.drawtext(texto,240,71.4*5-71.4/2,recorde)
M.drawtext(texto,240,71.4*6-71.4/2,coin)
M.setColor(texto,255,255,255)
M.drawtext(texto,68.1*2.5,71.4*1.5,contador_s.."%")
M.setColor(texto,0,0,0)
M.drawtext(texto,240,71.4*5-71.4,"Recorde")
M.drawtext(texto,240,71.4*6-71.4,"Coins")
M.drawtext(texto,68.1*2.5,71.4*1.5+51+20,"Skins")
M.drawtext(texto,240,71.4*7-71.4,"Rodadas")
M.drawtext(texto,240,71.4*7-41.4,tostring(arquivo.checaArquivo("Rodadas")))
g.setColor(198,168,0)
g.setColor(255,255,255)
end
function stats.mousepressed(x,y,button,number)
  if button == 1 and x>420 and x<420+ds_x/18 and y>15 and y<15+ds_y/18 then
  if sound == sound_on then
      sound = sound_off
      musica:setVolume(0)
      somDoEngolir:setVolume(0)
      somDoAndar:setVolume(0)
    else
      sound = sound_on
      musica:setVolume(0.1)
      somDoEngolir:setVolume(0.1)
      somDoAndar:setVolume(0.15)
    end
  end
end
stats.keyreleased = function(key)
end
stats.mousereleased= function(x,y,button)
if mouseover(x_m,y_m,{3,3+dla_x/4},{5,5+dla_y/4}) and Tela == stats then
  if button == 1 then
    voltarMenu()
  end
end
end
return stats
