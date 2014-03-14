(define (prime? n) (mr-prime? n 20))
(define (mr-prime? n times) ;Miller-Rabin素数检查
    (define (mr-test n)
        (= 1 (expmod (+ (random (- n 1)) 1) (- n 1) n)))
    (cond ((= 0 times) #t)
          ((mr-test n) (mr-prime? n (- times 1)))
          (else #f)))

(define (expmod base exp m)          ;一个数的幂对另一数取模(base^e) mod m
	(cond ((= exp 0) 1)
		  ((even? exp) 
		   (remainder (square (expmod base (/ exp 2) m)) 
		    		  m))
		  (else 
		   (remainder (* base (expmod base (- exp 1) m)) m))))

(define (square x) (* x x))


;; 主函数 : 0)n若是素数, 则返回n, 结束;
;;            n若不是素数就继续下一步
;;          1)i = 2
;;          2)如果i能整除n, 则n赋值为n/i, 跳到(1) ;
;;            否则i++, 继续(2)

;; 第一次写的时候是从n/2开始遍历, 看那个数能被n整除且是素数即为答案, 但是很慢, 于是就想倒过来, 因为一个数的因子从比较小的数开始找比较好找, 那就从小到大开始找, 找到一个因子就迭代一次(n = n/i), 速度就变快了很多.
(define (largest-prime-factor num)
    (define (help i num)
        (if (= 0 (modulo num i))
            (quotient num i)
            (help (+ i 1) num)))
    (if (prime? num)
        num
        (largest-prime-factor (help 2 num))))

;; Tesing
(largest-prime-factor 600851475143)
