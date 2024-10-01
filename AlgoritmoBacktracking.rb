def generar_tablero
  tablero = Array.new(9) { Array.new(9, 0) }

  # Aqui lleno el tablero
  resolver_sudoku(tablero, encontrar_vacios(tablero))

  # Hay que poner algunas casillas con ceros
  celdas_a_eliminar = 40
  celdas_eliminadas = 0
  while celdas_eliminadas < celdas_a_eliminar
    fila = rand(0..8)
    col = rand(0..8)

    if tablero[fila][col] != 0
      tablero[fila][col] = 0
      celdas_eliminadas += 1
    end
  end

  tablero
end

def encontrar_vacios(tablero)
  vacios = []
  tablero.each_with_index do |fila, i|
    fila.each_with_index do |valor, j|
      vacios << [i, j] if valor == 0
    end
  end
  vacios
end

def es_valido?(tablero, fila, col, num)
  return false if tablero[fila].include?(num) || tablero.transpose[col].include?(num)

  # Aqui reviso el inicio del subcuadro de 3x3 donde quiero ingresar el numero
  inicio_fila = (fila / 3) * 3
  inicio_col = (col / 3) * 3

  # Recorro las posiciones dentro del subcuadro de 3x3
  (inicio_fila...inicio_fila + 3).each do |i|
    (inicio_col...inicio_col + 3).each do |j|
      return false if tablero[i][j] == num
    end
  end

  # Si nada de eso pasa pues el numero es valido y devuelvo true
  true
end

def resolver_sudoku(tablero, vacios, pos = 0)
  return true if pos == vacios.size

  # obtengo la posición actual vacia
  fila, col = vacios[pos]

  (1..9).to_a.shuffle.each do |num|
    if es_valido?(tablero, fila, col, num)
      tablero[fila][col] = num
      
      return true if resolver_sudoku(tablero, vacios, pos + 1)
      # Si no logramos resolver toca quitar el numero y retroceder y probar con otro
      tablero[fila][col] = 0
    end
  end
  # Si ningún número funciona, toca delvolver false y se retrocedera e intentara otra vez
  false
end

def mostrar_tablero(tablero)
  tablero.each { |fila| puts fila.join(" ") }
end

tablero_aleatorio = generar_tablero
puts "Sudoku aleatorio:"
mostrar_tablero(tablero_aleatorio)

# Resolver el sudoku
if resolver_sudoku(tablero_aleatorio, encontrar_vacios(tablero_aleatorio))
  puts "\nSudoku resuelto:"
  mostrar_tablero(tablero_aleatorio)
else
  puts "No se pudo resolver el Sudoku"
end
