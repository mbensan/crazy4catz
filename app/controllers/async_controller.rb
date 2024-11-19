class AsyncController < ApplicationController
  def index
  end

  def algo
    nombre = "Matias"
    edad = 28

    nuevo_div = "<div><ul><li>Nombre: #{nombre}</li><li>Edad: #{edad}</li></ul></div>"
  end
end
