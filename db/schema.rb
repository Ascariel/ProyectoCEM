# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_04_021242) do

  create_table "alumnos", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.integer "edad"
    t.string "codigo_alumno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cels", force: :cascade do |t|
    t.string "nombre"
    t.string "pais_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cems", force: :cascade do |t|
    t.string "nombre"
    t.string "email"
    t.string "telefono"
    t.string "pais_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cursos", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "familia", force: :cascade do |t|
    t.string "nombre"
    t.integer "cel_id"
    t.integer "pais_id"
    t.integer "estado_postulacion_cel", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logins", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password"
    t.integer "actor_id"
    t.string "nombre_tabla_actor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "perfil_id"
  end

  create_table "pais", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perfils", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programa_cels", force: :cascade do |t|
    t.integer "programa_estudio_id"
    t.integer "cel_id"
    t.integer "estado", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programa_cursos", force: :cascade do |t|
    t.integer "curso_id"
    t.integer "programa_estudio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programa_estudios", force: :cascade do |t|
    t.string "nombre"
    t.integer "pais_id"
    t.integer "max_cupos"
    t.integer "min_cupos"
    t.integer "duracion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
