#include <stdio.h>
#define N 20
int a[N][N];
int main()
{
	int ans = -1, product;
	for(int i = 0; i < N; i++)
		for(int j = 0; j < N; j++) scanf("%d", &a[i][j]);
	for(int i = 0; i < N; i++)
		for(int j = 3; j < N; j++) {
			product = a[i][j] * a[i][j-1] * a[i][j-2] * a[i][j-3];
			ans = ans > product ? ans : product;
			product = a[j][i] * a[j-1][i] * a[j-2][i] * a[j-3][i];
			ans = ans > product ? ans : product;
		}
	for(int i = 3; i < N; i++) {
		for(int j = 3; j < N; j++) {
			product = a[i][j] * a[i-1][j-1] * a[i-2][j-2] * a[i-3][j-3];
			ans = ans > product ? ans : product;
		}
		for(int j = N-4; j >= 0; j--) {
			product = a[i][j] * a[i-1][j+1] * a[i-2][j+2] * a[i-3][j+3];
			ans = ans > product ? ans : product;
		}
	}
	printf("%d\n", ans);
	return 0;
}
