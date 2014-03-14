# 23
from math import *

def abundant(x) :
	tmp = 1
	for i in range(2, int(sqrt(x)+1) ) :
		if x % i == 0 :
			tmp += i
			if x//i != i : tmp += x//i
	if tmp > x : return 1
	return 0

abun = []

for x in range(1, 28123) : 
	if abundant(x) == 1: abun.append(x)
ans = 28123*(28123+1)//2 - sum(abun) * (len(abun) + 1)

for i in range(4) : 
	if print(abun[i])
print(ans)
		
