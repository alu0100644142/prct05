# Implementar en este fichero la clase para crear objetos racionales

require "./gcd.rb"

class Fraccion
	attr_accessor :num,:den

	def initialize(num,den)
		@num = num
		if(den == 0)
			@den = 1	
		else
			@den = den
		end
	end
		
	def to_s
		aux = Fraccion.new(num, den)
		aux = minimizar(aux.num, aux.den)
		"#{aux.num} / #{aux.den}"
	end

	def suma(x)
		aux = Fraccion.new(1,1)
		m = mcm(self.den, x.den)
		aux.num = (self.num * m / self.den) + (x.num * m / x.den)
		aux.den = m
		aux = minimizar(aux.num, aux.den)
		return aux
	end

	def resta(x)
		aux = Fraccion.new(1,1)
		m = mcm(self.den, x.den)
		aux.num = (self.num * m / self.den) - (x.num * m / x.den)
		aux.den = m
		aux = minimizar(aux.num, aux.den)
		return aux
	end	

	def producto(x)
		aux = Fraccion.new(1,1)
		aux.num = self.num * x.num
		aux.den = self.den * x.den
		aux = minimizar(aux.num, aux.den)
		return aux
	end

	def division(x)
		aux = Fraccion.new(1,1)
		aux.num = self.num * x.den
		aux.den = self.den * x.num
		aux = minimizar(aux.num, aux.den)
		return aux
	end

	def mcm(a,b)
		(a * b) / gcd(a,b)
	end

	def minimizar(a,b)
		max = gcd(a,b)
		aux = Fraccion.new(1,1)
		aux.num = a/max
		aux.den = b/max
		return aux
	end
end

a = Fraccion.new(3,0)
b = Fraccion.new(4,5)
