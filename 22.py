# 我是先在shell里面把names.txt格式搞了一下，再sort之后才用python处理的...

ans = 0
for name in range(1, 5164) :
	s = input()
	l = len(s)
	tmp = 0
	for i in range(l) :	
		tmp += ord(s[i]) - 64
	tmp = tmp * name
	ans += tmp
print(ans)
