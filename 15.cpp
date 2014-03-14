/* 算法简单, 但是数字很大, 需要用long. 另外注意! 输出时一定要"%lld" !!! 我就是被这里给WA了一次
*/

#include <stdio.h>
#include <string.h>
#define N 21
long path[N][N];
int main()
{
	memset(path, 0, sizeof(path));
	path[0][0] = 1;
	for(int i = 0; i < N; i++)
		for(int j = 0; j < N; j++) {
			if(i-1 >= 0) path[i][j] += path[i-1][j];
			if(j-1 >= 0) path[i][j] += path[i][j-1];
			if(path[i][j] < 0) {printf("%d %d !\n", i, j); return 0;}
		}
	printf("%lld  %lld\n", path[2][2], path[N-1][N-1]);
	return 0;
}
