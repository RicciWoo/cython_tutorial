from integrate import Function, integrate

class MyPolynomial(Function):
	def evaluate(self, x):
		return 2*x*x + 3*x - 10

print('>>> integrate(MyPolynomial(), 0, 1, 10000)')
print(integrate(MyPolynomial(), 0, 1, 10000))
