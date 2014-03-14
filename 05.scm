
;;  题意中的smallest-multiple是能整除1~n 的最小的数, 即(1~n)的最小公倍数
;;  smallest-multiple的性质: 设smallest-multiple = (p1^e1)*(p2^e2)...(pn^en) , 其中pi易知都是素数, 则对于任意1 <= x <= n, 都能用x = (p1^i1)*(p2^i2)*...*(pn^in)来表示, 其中0 <= ii <= ei.

;;  思路:设result为(1~k)的最小公倍数, 设x = k + 1,
;;       而product-gcd为result和x的公约数之积, 则new-result = result * (n // product-gcd) 就是(1~k+1)的最小公倍数. 每次这样更新result, 最后答案就出来了.
         
(define (smallest-multiple maxn)
    (define (help n result)
        (if (< maxn n)
            result
            (help (+ n 1) (improve n result))))
    (help 1 1))


(define (improve n result)  ;更新result, 返回new-result
    (define (help i n result rest)
        (if (< n i)
            rest
            (if (= 0 (modulo n i))
                (if (= 0 (modulo result i))
                    (help 2 (quotient n i) (quotient result i) rest)
                    (help 2 (quotient n i) result (* rest i)))
                (help (+ i 1) n result rest))))
    (help 2 n result result))

(smallest-multiple 20)

;;  C++ code    思路by 严友成
;;  /*
;;      每个数x都可以分解成素数幂的积的形式 x = p1^i1 * p2^i2 * ... * pn^i2
;;      若goal = 20, 则对于每个x < 20, 有pk < 20, pk^ik < 20
;;      所以, smallest-product = p1^m1 * p2^m2 ...  其中pi < 20, pi^mi < 20
;;  */
;;  #include <stdio.h>
;;  #include <math.h>
;;  
;;  const int goal = 20;
;;  
;;  bool isPrime(int num) {
;;      for(int i = 2; i <= num/2; i++) if(num % i == 0) return false;
;;      return true;
;;  }
;;  int main()
;;  {
;;      long long ans = 1;
;;      for(int i = 2; i <= goal; i++) if(isPrime(i)) {
;;          long long tmp = i;
;;          do {
;;              tmp *= i;
;;          } while(tmp <= goal);
;;          tmp /= i;
;;          ans *= tmp;
;;  
;;          printf("$$ %lld\t\t%d\t\t%lld\n", i, tmp, ans);
;;      }
;;      printf("%lld\n", ans);
;;      return 0;
;;  }
;;  
