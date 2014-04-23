""" Reference implementation of CracklePop, a FizzBuzz variant. """
from __future__ import print_function

for i in range(1, 101):
    if i % 15 == 0:
        print("CracklePop")
    elif i % 5 == 0:
        print("Pop")
    elif i % 3 == 0:
        print("Crackle")
    else:
        print(i)
