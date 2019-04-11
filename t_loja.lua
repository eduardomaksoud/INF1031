loja = {}
g = love.graphics
function loja.load()
end
function desenha_loja()
  --Player Coins
  g.draw(ball,80,15,0,1.5,1.5)
  M.drawtext(texto,150,35,tostring(arquivo.checaArquivo("Coin")))
  --Player coins
  -- BALL ICON DRAW ----
  checkRussia = arquivo.checaArquivo("Russia")
  checkAlemanha = arquivo.checaArquivo("Alemanha")
  checkBrasil = arquivo.checaArquivo("Brasil")
  Possui()
  -- BUYING RECTANGLES ----
  g.setColor(0,0,0)
  if mouseover(x_m,y_m,{67,69*4+67},{70.8,70.8+72}) and checkRussia==1 then
    g.setColor(204,169,0)
    g.rectangle("line",67,70.8,69*4,72)
    if love.mouse.isDown(1) then
      currentSnake = "snake_russia"
      imageFile = g.newImage("images/"..currentSnake..".png")
      frames = require "frames"
      activeFrame = frames[currentFrame]
    end
  else
    g.setColor(0,0,0)
    g.rectangle("line",67,70.8,69*4,72)
  end
  if mouseover(x_m,y_m,{67,67+69*4},{70.8*3,70.8*3+72}) and checkBrasil==1 then
    g.setColor(204,169,0)
    g.rectangle("line",67,70.8*3,69*4,72)
    if love.mouse.isDown(1) then
      currentSnake = "snake_brasil"
      imageFile = g.newImage("images/"..currentSnake..".png")
      frames = require "frames"
      activeFrame = frames[currentFrame]
    end
  else
    g.setColor(0,0,0)
    g.rectangle("line",67,70.8*3,69*4,72)
  end
  if mouseover(x_m,y_m,{67,67+69*4},{70.8*5,70.8*5+72}) and checkAlemanha==1 then
    g.setColor(204,169,0)
    g.rectangle("line",67,70.8*5,69*4,72)
    if love.mouse.isDown(1) then
      currentSnake = "snake_alemanha"
      imageFile = g.newImage("images/"..currentSnake..".png")
      frames = require "frames"
      activeFrame = frames[currentFrame]
    end
  else
    g.setColor(0,0,0)
    g.rectangle("line",67,70.8*5,69*4,72)
  end
  g.setColor(255,255,255)
-- BUY ICON DRAW ----
  if mouseover(x_m,y_m,{350-68*5,350-67*5+dbu_y/10},{78,70+dbu_y/10}) then
  --if (x_m>350-68*5 and x_m<350-68*5+dbu_y/10) and (y_m>78 and y_m<70+dbu_y/10) then
    g.draw(buy_g,350-68*5,70,1/8,1/8)
    if love.mouse.isDown(1) then
      print(Coins)
      print(precoRussia)
      if Coins >= precoRussia and skins[1] == 0 then
        Coins = Coins - precoRussia
        skins[1] = 1
        arquivo.geraArquivo(Recorde,Coins)
        loja.reset()
        Possui()
      end
    end
  else
    g.draw(buy_g,350-68*5,78,1/10,1/10)
  end
  if mouseover(x_m,y_m,{350-68*5,350-68*5+dbu_y/10},{70*3+8,70*3+dbu_y/10}) then
  --if (x_m>350-68*5 and x_m<350-68*5+dbu_y/10) and (y_m>70*3+8 and y_m<70*3+dbu_y/10) then
    g.draw(buy_g,350-68*5,70*3,1/8,1/8)
    if love.mouse.isDown(1) then
      if Coins >= precoBrasil and skins[2] == 0 then
        Coins = Coins - precoBrasil
        skins[2] = 1
        arquivo.geraArquivo(Recorde,Coins)
        loja.reset()
        Possui()
      end
    end
  else
    g.draw(buy_g,350-68*5,70*3+8,1/10,1/10)
  end
  if mouseover(x_m,y_m,{350-68*5,350-68*5+dbu_y/10},{70*5+8,70*5+dbu_y/10}) then
  --if (x_m>350-68*5 and x_m<350-68*5+dbu_y/10) and (y_m>70*5+8 and y_m<70*5+dbu_y/10) then
    g.draw(buy_g,350-68*5,70*5,1/8,1/8)
    if love.mouse.isDown(1) then
      if Coins >= precoAlemanha and skins[3] == 0 then
        Coins = Coins - precoAlemanha
        skins[3] = 1
        arquivo.geraArquivo(Recorde,Coins)
        loja.reset()
        Possui()
      end
    end
  else
    g.draw(buy_g,350-68*5,70*5+8,1/10,1/10)
  end


end
function mouseover(x_m,y_m,listax,listay)
  if (x_m>listax[1] and x_m<listax[2]) and (y_m>listay[1] and y_m<listay[2]) then
    return true
  else
    return false
  end
end
function desenhaSkins()
  -- PRICE DRAW ----
  M.drawtext(texto,68.5*3,71.4*4.9/2.1,"RUSSIA")
  M.drawtext(texto,68.5*3,71.4*9/2.1,"BRASIL")
  M.drawtext(texto,68.5*3,71.4*13/2.1,"ALEMANHA")
  g.setColor(255,255,255)
-- SKIN DRAW ----
--RUSSIA
  g.draw(russia,cabeca_russia,65*4,80,0,2,2)
  g.draw(russia,corpo_russia,65*4-50,80,0,2,2)
  g.draw(russia,corpo_russia,65*4-100,80,0,2,2)
  g.draw(russia,cauda_russia,65*4-150,80,0,2,2)
--BRASIL
  g.draw(brasil,cabeca_brasil,65*4,75*3,0,2,2)
  g.draw(brasil,corpo_brasil,65*4-50,75*3,0,2,2)
  g.draw(brasil,corpo_brasil,65*4-100,75*3,0,2,2)
  g.draw(brasil,cauda_brasil,65*4-150,75*3,0,2,2)
--ALEMANHA
  g.draw(alemanha,cabeca_alemanha,65*4,73*5,0,2,2)
  g.draw(alemanha,corpo_alemanha,65*4-50,73*5,0,2,2)
  g.draw(alemanha,corpo_alemanha,65*4-100,73*5,0,2,2)
  g.draw(alemanha,cauda_alemanha,65*4-150,73*5,0,2,2)
end
function carrega_loja()
  alemanha = g.newImage("Game_Skins/snake_alemanha.png")
  brasil = g.newImage("Game_Skins/snake_brasil.png")
  russia = g.newImage("Game_Skins/snake_russia.png")
  cabeca_russia = g.newQuad(103,0,25,23,russia:getDimensions())
  cabeca_brasil = g.newQuad(103,0,22,23,brasil:getDimensions())
  cabeca_alemanha = g.newQuad(103,0,22,23,alemanha:getDimensions())
  corpo_russia = g.newQuad(25,0,25,25,russia:getDimensions())
  corpo_brasil = g.newQuad(25,0,25,25,brasil:getDimensions())
  corpo_alemanha = g.newQuad(25,0,25,25,alemanha:getDimensions())
  cauda_russia = g.newQuad(100,50,25,25,russia:getDimensions())
  cauda_brasil = g.newQuad(100,50,25,25,brasil:getDimensions())
  cauda_alemanha = g.newQuad(100,50,25,25,alemanha:getDimensions())
  end
function loja.update()
  x_m,y_m = love.mouse.getPosition()
  down = love.mouse.isDown(1)
end
function loja.draw()
-- BACKGROUND DRAW ----
    for i = 0, g.getWidth() / background:getWidth() do
        for j = 0, g.getHeight() / background:getHeight() do
           g.draw(background, i * background:getWidth(), j * background:getHeight())
        end
    end
  g.draw(sound,420,15,0,1/18,1/18)
-- LEFT ARROW ICON DRAW ----
  if (x_m>3 and x_m<3+dla_x/4) and (y_m>5 and y_m<5+dla_y/4) then
    g.draw(leftarrow_w,3,5,0,1/4,1/4)
  else
    g.draw(leftarrow_g,3,5,0,1/4,1/4)
  end
  desenha_loja()
  desenhaSkins()
end
function loja.mousepressed(x,y,button,number)
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
function loja.reset()
  leftarrow_w = g.newImage("Icons/arrow_w.png")
  leftarrow_g= g.newImage("Icons/arrow_g.png")
  buy_w = g.newImage("Icons/buy_w.png")
  buy_g = g.newImage("Icons/buy_g.png")
  ball = g.newImage("Icons/ball.png")
  -- GETTING DIMENSIONS ----
  dla_x,dla_y = leftarrow_w:getDimensions()
  dbu_x,dbu_y = buy_w:getDimensions()
  carrega_loja()
  font_mais = g.newFont("Font/adventure.ttf",30)
  texto = M.new(font_mais,"S")
  precoAlemanha = 70  
  precoRussia = 5
  precoBrasil = 10
  currentSnake = "snake"
  imageFile = g.newImage("images/"..currentSnake..".png")
  frames = require "frames"
  activeFrame = frames[currentFrame]
  
end
function Possui()
  if checkRussia == 1 then
    M.drawtext(texto_minus,380,100,"OWNED")
  else
    g.setColor(255,255,255)
    g.draw(ball,350,80)
    M.drawtext(texto,395,93,tostring(precoRussia))
  end
  
  if checkBrasil == 1 then
    M.drawtext(texto_minus,380,75*3,"OWNED")
  else
    g.setColor(255,255,255)
    g.draw(ball,350,75*3)
    M.drawtext(texto,395,71.4*3+71.4/3,tostring(precoBrasil))
  end
  if checkAlemanha == 1 then
    M.drawtext(texto_minus,380,71.4*5+71.4/3,"OWNED")
  else
    g.setColor(255,255,255)
    g.draw(ball,350,73*5)
    M.drawtext(texto,395,70*5+30,tostring(precoAlemanha))
  end
  
end
loja.keyreleased = function(key)
end
function loja.mousereleased(x,y,button)
if (x>3 and x<3+dla_x/4) and (y>5 and y<5+dla_y/4) then
  if button == 1 then
    voltarMenu()
  end
end
end
return loja