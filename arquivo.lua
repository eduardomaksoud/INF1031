arquivo = {}
arquivo.checaArquivo = function(string)
  local entrada = io.open("snake_a.txt")
  local texto = entrada:read("*a")
  local recorde = 0
  local media = 0
  entrada:close()
  for v,s in texto:gmatch("(%a+):%s(%d+)") do
    if v == string then
      return tonumber(s)
    end
  end
  return false
end

  arquivo.geraArquivo = function(Recorde,Coin)
    local  saida  =  io.open ("snake_a.txt ","w")
    saida:write("Snake game by Daniel Faller,Eduardo Brazão \n")
    saida:write("Recorde: ",Recorde,"\n")
    saida:write("Coin: ",Coin,"\n")
    saida:write("Russia: "..tostring(skins[1]).."\n")
    saida:write("Brasil: "..tostring(skins[2]).."\n")
    saida:write("Alemanha: "..tostring(skins[3]).."\n")
    saida:write("Rodadas: "..tostring(Rodadas).."\n")
    saida:close()
  end
  arquivo.coordenaArquivo = function(Recorde,contador,Coin)
    if Recorde<contador then
      Recorde = contador
    end
    Coin = Coin + contador
    arquivo.geraArquivo(Recorde,Coin)
  end
  arquivo.registarArquivo = function(contador)
    local  saida  =  io.open ("snake_a.txt ","w")
    saida:write("Snake game by Daniel Faller,Eduardo Brazão \n")
    saida:write("Recorde: ",contador,"\n")
    --saida:write("Média: ",contador,"\n")
    saida:close ()
  end
return arquivo