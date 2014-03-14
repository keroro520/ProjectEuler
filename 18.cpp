// 简单DP

#include <string.h>
#include <stdio.h>

int max(int x, int y) { return x > y ? x : y; }

int main()
{
	int n, x;
	int ans[20][20];
	scanf("%d", &n);
	memset(ans, 0, sizeof(ans));
	scanf("%d", &ans[0][0]);
	for(int i = 1; i < n; i++)
		for(int j = 0; j <= i; j++) {
			scanf("%d", &x); 
			ans[i][j] = max((j-1 >= 0 ? ans[i-1][j-1] : 0) ,ans[i-1][j]) + x;
		}
	int result = -1;
	for(int j = 0; j < n; j++) result = result < ans[n-1][j] ? ans[n-1][j] : result;
	printf("%d\n", result);
	return 0;
}
