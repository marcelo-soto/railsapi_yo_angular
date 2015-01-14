class ProductosController < ApplicationController
	def index
		productos = Producto.all.select(:id, :codigo, :descripcion)
		render json: productos
	end

	def show
		id = params["id"]
		#:id, :codigo, :descripcion

		salida = nil
		producto = nil

		if Producto.exists?(id)
			producto = Producto.find(id)
		end

		if not params["f"].nil?
			if producto.attributes.keys.include?(params["f"])
				salida = producto.send(params["f"])
			end
		end

		render json: salida
	end

	def update
		Producto.update(params[:id], producto_params)
  		render json: {status: :ok}
  	end

  	def get_descripcion
  		descripcion = Producto.select(:id, :descripcion).find(params["producto_id"])
  		render json: descripcion
  	end

	private
	def producto_params
		params.permit(:codigo, :descripcion)  	
	end
end
