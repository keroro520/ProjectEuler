/* 题意: 按给出规则求最大链的起始数.
		 规则: n->n/2(n is even) ; n->3n+1(n is odd)

	DP : 因为(3*n+1)有可能太大, 超出integer的范围, 所以必须得要long.
		 另外, DP数组不用定义到最大的num(num表链上的数), 因为DP数组本义就是为了节省时间, 而num太大的话实际上可以不用存, 因为不常用到, 所以我定义的数组f[N+1]. 那太大的num就用一般的递归方法来算就可以了, 这里为calc_2.
*/

// 因为需要DP, 而Scheme又不知道怎么用list来当作可变数组, 所以就用C写.


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#define N 1000000
int f[N+1];

int calc(long num);

int calc_2(long num) {
	if(0 == num%2) return calc(num/2) + 1;
	else return calc(3*num+1) + 1;
}

int calc(long num) {
	if( num >= N ) {
		return calc_2(num) + 1;
	}
	if(f[num]) return f[num];
	if(0 == num % 2) return f[num] = calc(num/2) + 1;
	else return f[num] = calc(3*num+1) + 1;
}

int main()
{
	long ans = 0;
	memset(f, 0, sizeof(f));
	f[1] = 1;
	for(int i = N; i > 0; i--)
		if(!f[i]) {
			f[i] = calc(i);
			ans = f[ans] < f[i] ? i : ans;
		}
	printf("%d\n", ans);
	return 0;
}

