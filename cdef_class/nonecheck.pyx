#cython: nonecheck=True
#        ^^^ Turns on nonecheck globally

import cython

# Turn off nonecheck locally for the function
@cython.nonecheck(False)
def func():
    cdef MyClass obj = None
    try:
        # Turn nonecheck on again for a block
        with cython.nonecheck(True):
            print obj.myfunc() # Raises exception
    except AttributeError:
        pass
    print obj.myfunc() # Hope for a crash!

# There is a compiler directive nonecheck which turns 
# on checks for this, at the cost of decreased speed. 
# Here’s how compiler directives are used to dynamically 
# switch on or off nonecheck.
