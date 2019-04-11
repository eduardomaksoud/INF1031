a = love.audio
g = love.graphics
w = love.window
require "arquivo"
require "snake"
require "t_inicio"
require "t_gameplay"
require "tabuleiro"
require "t_menu"
require "configs"
require "t_loja"
require "m_texto"
require "stats"
require "t_config"
msgr = require "mqtt/mqttLoveLibrary"

minhamat = "Daniellove"
--canal Faller
local mode = Menu
mode.reset()
function mensagemRecebida(mensagem)
  if mode == gameplay or mode == inicio then
    print("Mensagem")
    if mensagem == "up" then
      Tela = gameplay
      dir = {0,1}
    end
    if mensagem == "left" then
      Tela = gameplay
      dir = {-1,0}
    end
    if mensagem == "down" then
      Tela = gameplay
      dir = {0,-1}
    end
    if mensagem == "right" then
      Tela = gameplay
      dir = {-1,0}
      
      
    end
  end
end

function love.load()
  --janela
  love.graphics.setBackgroundColor(24/255, 80/255, 0)
  w.setMode(480,500)
  w.setTitle("Snake Game")
  mode.load()
  math.randomseed(os.time())
  Map_snake = t.geraMap()
  --janela
  
  --node
  msgr.start(minhamat,"Faller",mensagemRecebida)
  --node
  
  --Recorde
  Coins = arquivo.checaArquivo("Coin")
  Recorde = arquivo.checaArquivo("Recorde")
  Rodadas = arquivo.checaArquivo("Rodadas")
  --Recorde
  --skins
  skins ={ arquivo.checaArquivo("Russia"), arquivo.checaArquivo("Brasil"), arquivo.checaArquivo("Alemanha")}
  --skins
  --sons
  
  somDoEngolir = a.newSource("sons/engolir.wav","static")
  somDoAndar = a.newSource("sons/vrum.wav","static")
  musica = a.newSource("sons/musica.wav","static")
  musica:setVolume(0.1)
  somDoEngolir:setVolume(0.1)
  somDoAndar:setVolume(0.15)
  musica:play()
  musica:setLooping(true)
  
  --sons
  
  --imagens
  currentFrame = 2
  imageFile = g.newImage("images/"..currentSnake..".png")
  frames = require "frames"
  activeFrame = frames[currentFrame]
  trophy = g.newImage("images/trophy.png")
  stun = g.newImage("images/stun.png")
  --imagens
  
  --texto
  font_mais = g.newFont("Font/adventure.ttf",60)
  font_minus = g.newFont("Font/adventure.ttf",18)
  texto = M.new(font_mais,"S")
  texto_minus = M.new(font_minus,"")
  --texto
  
  --efeitos pontuacao
  scaleX = 1
  scaleY = 1
  --efeitos pontuacao 
  
  --pause
  pause = g.newImage("images/pause.png")
  estadoPause = false
  imagenumbers = g.newImage("images/pausenumber.png")
  txPause,tyPause = pause:getDimensions()
  framenumbers = {}
  framenumbers[1] = g.newQuad(0,0,84,124,imagenumbers:getDimensions())
  framenumbers[2] = g.newQuad(84,0,84,124,imagenumbers:getDimensions())
  framenumbers[3] = g.newQuad(177,0,84,124,imagenumbers:getDimensions())
  pausar = false
  scalePauseNumbers = 3.9
  nPause = math.floor(scalePauseNumbers)
  startnPause = false
  --pause
  
  --engolir maçã
  engMaca = 2
  --engolir maçã
  fonte = g.newImageFont("images/fonte.png", "abcdefghijklmnopqrstuvwxyz" .. "ABCDEFGHIJKLMNOPQRSTUVWXYZ".."0123456789" .. ".,!?-+/():;%" )
end
function love.draw()
  mode.draw()
  if estadoPause then
    g.setColor(255,255,255,0.3)
    g.draw(pause,(480-txPause)/2,(500-tyPause)/2)
  end
end
function pontuacao()
  Coin = arquivo.checaArquivo("Coin")
  Recorde = arquivo.checaArquivo("Recorde")
  Rodadas = arquivo.checaArquivo("Rodadas")
  M.setColor(texto_minus,198, 169, 0)
  --M.drawtext(texto_minus,225-30,20-65,"Pontuacao: ")
  g.setColor(255,255,255)
  g.rectangle("line",0,-50,25*8,25*8)
  g.draw(imageFile,frames[18],100,-38)
  g.setColor(198/255,169/255,0)
  love.graphics.print(tostring(gameplay.contador),140,-30,0,scaleX*2,scaleY*2,5,5,0)
  if gameplay.contador>Recorde then
    M.setColor(texto_minus,198, 169, 0)
    --M.drawtext(texto_minus,25,20-65,"Recorde: ")
    g.setColor(255,255,255)
    g.draw(trophy,0,20-60)
    g.setColor(198/255,169/255,0)
    love.graphics.print(tostring(gameplay.contador),40,-30,0,scaleX*2,scaleY*2,5,5,0)
  else 
    M.setColor(texto_minus,198, 169, 0)
    --M.drawtext(texto_minus,25,20-65,"Recorde: ")
    g.setColor(255,255,255)
    g.draw(trophy,0,20-60) 
    g.setColor(198/255,169/255,0)
    love.graphics.print(tostring(Recorde),40,-30,0,2,2,5,5,0)
  end 
end

function love.update(dt)
  msgr.checkMessages()
  if estadoDeStun then
    Snake_obj:atordoado(dt)
  end
  if not pausar then
    efeito(dt)
    mode.update(dt)
    mode = Tela
    if love.keyboard.isDown("c") then
      mode = loja
      mode.reset()
    end
  end
  if startnPause then
    PauseNumbers(dt)
  end
  if transition then
    transition = transition - 1*dt
  end
end

function efeito(dt)
  scaleX = scaleX -2 *dt
  scaleY = scaleY -2 *dt
  
  if scaleX <= 1 then
    scaleX = 1
    scaleY = 1
  end
end

function PauseNumbers(dt)
  scalePauseNumbers = scalePauseNumbers - 1.5 *dt
  nPause = math.floor(scalePauseNumbers)
  if nPause <= 0 then
    pausar = false
    startnPause = false
    nPause = 3
    scalePauseNumbers = 4
  end
end
function macaEngolida(cobra,n)
  local circle = 0
  if cobra.corpo[n] and n<#cobra.corpo then
    if cobra.corpo[n].frame == 1 then
      circle = 15    
    else
      circle = 16
    end
    g.setColor(255,255,255)
    g.draw(imageFile,frames[circle],cobra.corpo[n].x*t.tam_quad(1),cobra.corpo[n].y*t.tam_quad(2),0)
    --g.circle("fill",cobra.corpo[n].x*t.tam_quad(1)+t.tam_quad(1)/2,cobra.corpo[n].y*t.tam_quad(2)+t.tam_quad(2)/2,10)
  else
    engMaca = 0
  end
end

function voltarMenu()
if Snake_obj then
    gameplay.reset()
  end
  Menu.reset()
  Tela = Menu

end
function love.keyreleased(key)
  if key == "p" and Tela == gameplay then
    if pausar == true then
      estadoPause = false
      startnPause = true
    else
      startnPause = false
      pausar = true
      estadoPause = true
    end
  end
  if pausar then
    somDoAndar:pause()
    somDoEngolir:pause()
    love.graphics.setColor(0,0,0,0.5)
    g.draw(pause,240,200,0,1,1)
  end
  mode.keyreleased(key)
end
function love.mousepressed(x,y,button)
  mode.mousepressed(x,y,button)
end
function love.mousereleased(x,y,button)
  mode.mousereleased(x,y,button)
end
love.keypressed = function(key)
  if love.keyboard.isDown("escape") then
    voltarMenu()
  end
end