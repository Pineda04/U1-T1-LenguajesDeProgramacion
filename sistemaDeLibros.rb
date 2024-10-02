# sistema de gestion de libros
libros = []

# funcion para agregar libros
def libro_agregar(libros, tituloLibro, autorLibro, anioLibro)
  libro = {titulo: tituloLibro, autor: autorLibro, anio: anioLibro}
  libros << libro
  puts "Libro agregado correctamente: #{tituloLibro}"
end

# funcion para eliminar un libro
def libro_eliminar(libros, tituloLibro)
  libro_eliminado = libros.reject! { |libro| libro[:titulo] == tituloLibro }
  if libro_eliminado
    puts "Libro eliminado correctamente: #{tituloLibro}"
  else
    puts "El libro no pudo ser encontrado correctamente"
  end
end

# funcion para encontrar un libro
def libro_encontrar(libros, tituloLibro)
  libros.each do |libro|
    if libro[:titulo] == tituloLibro
      puts "Libro encontrado: Titulo libro: #{libro[:titulo]} Autor libro: #{libro[:autor]} Anio del libro: #{libro[:anio]}"
      return
    end
  end
  puts "El libro no pudo ser encontrado"
end

# funcion para mostrar todos los libros
def libros_mostrar(libros)
  if libros.empty?
    puts "No hay libros disponibles aún"
  else
    puts "Lista de libros:"
    libros.each do |libro|
      puts "Libro en biblioteca: Titulo: #{libro[:titulo]}, Autor: #{libro[:autor]}, Anio: #{libro[:anio]}"
    end
  end
end

#menu 
   
loop do
  puts "\n--- Sistema de Gestión de Libros ---"
  puts "1. Agregar libro"
  puts "2. Eliminar libro"
  puts "3. Buscar libro"
  puts "4. Mostrar todos los libros"
  puts "5. Salir"
  print "Selecciona una opcion: "
  opcion = gets.chomp.to_i

  case opcion
  when 1
    print "Introduzca el titulo del libro: "
    tituloLibro = gets.chomp
    print "Introduzca el autor del libro: "
    autorLibro = gets.chomp
    print "Introduzca el anio de publicacion: "
    anioLibro = gets.chomp.to_i
     libro_agregar(libros, tituloLibro, autorLibro, anioLibro)

  when 2
    print "Introduzca el titulo del libro a eliminar: "
    tituloLibro = gets.chomp
    libro_eliminar(libros, tituloLibro)

  when 3
    print "Introduzca el titulo del libro a buscar: "
    tituloLibro = gets.chomp
    libro_encontrar(libros, tituloLibro)

  when 4
    libros_mostrar(libros)

  when 5
    puts "Saliendo del sistema..."
    break

  else
    puts "Opcion invalida, Por favor selecciona una opcion valida"
  end
end
