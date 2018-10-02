

nombre_paises = ['Alemania', 'Japon', 'China', 'Australia', 'Suecia']
paises = nombre_paises.map {|pais| Pais.find_or_create_by!(nombre: pais)}

nombre_cursos = ['Algebra', 'Calculo', 'Genetica', 'Estadistica', 'Java', 'Algoritmos', 'Arte', 'Historia', 'Biologia', 'Quimica', 'Fisica']
cursos = nombre_cursos.map {|nombre| Curso.find_or_create_by!(nombre: nombre)}

alemania = Pais.find_or_create_by!(nombre: 'Alemania')
japon = Pais.find_or_create_by!(nombre: 'Japon')
canada = Pais.find_or_create_by!(nombre: 'Canada')


cem = Cem.find_or_create_by!(nombre: 'CEM', pais_id: canada.id)
cel_japon1 = Cel.find_or_create_by!(nombre: 'CEL Japon 1', pais_id: japon.id)
cel_japon2 = Cel.find_or_create_by!(nombre: 'CEL Japon 2', pais_id: japon.id)
cel_alemania1 = Cel.find_or_create_by!(nombre: 'CEL Alemania 1', pais_id: alemania.id)
cel_alemania2 =Cel.find_or_create_by!(nombre: 'CEL Alemania 2', pais_id: alemania.id)

perfil_cem = Perfil.find_or_create_by!(nombre: 'CEM')
perfil_cel = Perfil.find_or_create_by!(nombre: 'CEL')
perfil_alumno = Perfil.find_or_create_by!(nombre: 'ALUMNO')
perfil_familia = Perfil.find_or_create_by!(nombre: 'FAMILIA')

familia1 = Familia.find_or_create_by!(nombre: 'Familia en Japon 1', cel_id: cel_japon1.id)
familia2 = Familia.find_or_create_by!(nombre: 'Familia en Japon 2', cel_id: cel_japon1.id)
familia3 = Familia.find_or_create_by!(nombre: 'Familia en Alemania 1', cel_id: cel_alemania1.id)

alumno1 = Alumno.find_or_create_by!(codigo_alumno: 'alumno1'){ |alumno|  alumno.nombre = 'Pablo' }
alumno2 = Alumno.find_or_create_by!(codigo_alumno: 'alumno2'){ |alumno|  alumno.nombre = 'Paulina' }
alumno2 = Alumno.find_or_create_by!(codigo_alumno: 'alumno3'){ |alumno|  alumno.nombre = 'Jairo' }
alumno2 = Alumno.find_or_create_by!(codigo_alumno: 'alumno4'){ |alumno|  alumno.nombre = 'Angel' }

Login.find_or_create_by!(username: 'cem', password: 'passpass', actor_id: cem.id,  nombre_tabla_actor: cem.class.name) { |perfil| perfil.perfil_id = perfil_cem.id }

Login.find_or_create_by!(username: 'cel_japon1', password: 'passpass', actor_id: cel_japon1.id,  nombre_tabla_actor: cel_japon1.class.name) { |perfil| perfil.perfil_id = perfil_cel.id }
Login.find_or_create_by!(username: 'cel_japon2', password: 'passpass', actor_id: cel_japon2.id,  nombre_tabla_actor: cel_japon2.class.name) { |perfil| perfil.perfil_id = perfil_cel.id }

Login.find_or_create_by!(username: 'cel_alemania1', password: 'passpass', actor_id: cel_alemania1.id,  nombre_tabla_actor: cel_alemania1.class.name) { |perfil| perfil.perfil_id = perfil_cel.id }
Login.find_or_create_by!(username: 'cel_alemania2', password: 'passpass', actor_id: cel_alemania2.id,  nombre_tabla_actor: cel_alemania2.class.name) { |perfil| perfil.perfil_id = perfil_cel.id }

Login.find_or_create_by!(username: 'alumno1', password: 'passpass', actor_id: alumno1.id,  nombre_tabla_actor: alumno1.class.name) { |perfil| perfil.perfil_id = perfil_alumno.id }
Login.find_or_create_by!(username: 'alumno2', password: 'passpass', actor_id: alumno2.id,  nombre_tabla_actor: alumno2.class.name) { |perfil| perfil.perfil_id = perfil_alumno.id }

Login.find_or_create_by!(username: 'familia1', password: 'passpass', actor_id: familia1.id,  nombre_tabla_actor: familia1.class.name) { |perfil| perfil.perfil_id = perfil_familia.id }
Login.find_or_create_by!(username: 'familia2', password: 'passpass', actor_id: familia2.id,  nombre_tabla_actor: familia2.class.name) { |perfil| perfil.perfil_id = perfil_familia.id }

programas = []
programas << ProgramaEstudio.find_or_create_by(nombre: 'Humanidades Japon', pais_id: japon.id, max_cupos: 50, min_cupos: 20, duracion: 'normal')
programas << ProgramaEstudio.find_or_create_by(nombre: 'Humanidades Alemania', pais_id: alemania.id, max_cupos: 50, min_cupos: 20, duracion: 'normal')
programas << ProgramaEstudio.find_or_create_by(nombre: 'Cientifico Canada', pais_id: canada.id, max_cupos: 50, min_cupos: 20, duracion: 'normal')
programas << ProgramaEstudio.find_or_create_by(nombre: 'Artistico Alemania', pais_id: japon.id, max_cupos: 50, min_cupos: 20, duracion: 'normal')
programas << ProgramaEstudio.find_or_create_by(nombre: 'Cultural Japon', pais_id: canada.id, max_cupos: 50, min_cupos: 20, duracion: 'normal')
programas << ProgramaEstudio.find_or_create_by(nombre: 'Cultural Canada', pais_id: alemania.id, max_cupos: 50, min_cupos: 20, duracion: 'normal')

programas.each do |programa_estudio|
  cantidad = rand(4) + 1
  cursos_a_crear = cursos.sample(cantidad)
  programa_estudio.reload.programa_cursos.destroy_all

  cursos_a_crear.map { |curso| ProgramaCurso.find_or_create_by!(curso_id: curso.id, programa_estudio_id: programa_estudio.id) }
end

# nombres
# programa_estudio.reload.programa_cursos.map(&:curso).map(&:nombre)
