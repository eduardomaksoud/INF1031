  frames = {}
  q = newQuad
  --corpo horizontal
  frames[1] = g.newQuad(25,0,25,25,imageFile:getDimensions())
  --cabeca N
  frames[2] = g.newQuad(75,0,25,25,imageFile:getDimensions())
  --cabeca W
  frames[3] = g.newQuad(75,25,25,25,imageFile:getDimensions())
  --cabeca E
  frames[4] = g.newQuad(100,0,25,25,imageFile:getDimensions())
  --cabeca S
  frames[5] = g.newQuad(100,25,25,25,imageFile:getDimensions())
  --calda S
  frames[6] = g.newQuad(75,50,25,25,imageFile:getDimensions())
  --calda E
  frames[7] = g.newQuad(75,76,25,23,imageFile:getDimensions())
  --calda W
  frames[8] = g.newQuad(100,50,25,25,imageFile:getDimensions())
  --calda N
  frames[9] = g.newQuad(100,75,25,25,imageFile:getDimensions())
  --corpo 
  frames[10] = g.newQuad(50,25,25,25,imageFile:getDimensions())
  --curva esquerda-baixo
  frames[11] = g.newQuad(50,0,25,25,imageFile:getDimensions())
  --curva baixo-direita
  frames[12] = g.newQuad(0,0,25,25,imageFile:getDimensions())
  --curva cima-direita
  frames[13] = g.newQuad(0,25,25,25,imageFile:getDimensions())
  --curva esquerda-cima
  frames[14] = g.newQuad(50,50,25,25,imageFile:getDimensions())
  --circulo horizontal
  frames[15] = g.newQuad(26,76,25,25,imageFile:getDimensions())
  --circulo vertical
  frames[16] = g.newQuad(52,76,19,24,imageFile:getDimensions())
  --maca
  frames[18] = g.newQuad(0,75,25,25,imageFile:getDimensions())
  
  return frames