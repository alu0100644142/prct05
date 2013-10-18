# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion

require "./racional.rb"
require "test/unit"


class Test_fraccion < Test::Unit::TestCase

	def setup
    	@a = Fraccion.new(3,1)
		@b = Fraccion.new(4,5)
		@c = Fraccion.new(8,4)
  	end
 

	def test_initialize
		assert_not_equal 0,Fraccion.new(5,0).den
	end

	def test_suma
		assert_equal 19,@a.suma(@b).num
		assert_equal 5, @a.suma(@b).den
	end

	def test_resta
		assert_equal 11,@a.resta(@b).num
		assert_equal 5,@a.resta(@b).den
	end

	def test_producto
		assert_equal 12,@a.producto(@b).num
		assert_equal 5,@a.producto(@b).den
	end

	def test_division
		assert_equal 15,@a.division(@b).num
		assert_equal 4,@a.division(@b).den
	end
	
	def test_mcm
		assert_equal 5,Fraccion.new(1,1).mcm(@a.den,@b.den)
	end

	def test_minimizar
		assert_equal 2,Fraccion.new(1,1).minimizar(@c.num,@c.den).num
		assert_equal 1,Fraccion.new(1,1).minimizar(@c.num,@c.den).den
	end

end
