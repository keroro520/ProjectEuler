;; 题意:找出因子数大于500的triangle数, 所谓的triangle数即用递增的自然数相加得到的数

;; 关键点是对于一个数, 求出它的因子的数目.   
;; 方法是分解质因数. num = (i^e1) * (j ^ e2), 则质因数数目 = (e1+1)*(e2+1), 这个公式是由简单的组合数学推导出来的. C(1, (e+1)). 如432 = 2^4 * 3^3, 即对于432的某一因子, 一定是由(2^i * 3^j)得来的, 其中i=0,1,2,3,4,  j=0,1,2,3.  所以ans = C(1, (4+1)) * C(1, (3+1)) = 4 * 5 = 20
;; 参考:http://wenku.baidu.com/view/2e51f518964bcf84b9d57b19.html

;; 没有使用DP优化.

(define (num_divisors num i result fact)
	(cond  ((= 1 num) 
		    (* result (if (= 0 fact) 1 (+ fact 1))))
		   ((= 0 (modulo num i)) 
		   	(num_divisors (quotient num i) i result (+ fact 1)))
		   (else (num_divisors num (+ i 1) (* result (+ fact 1)) 0))))


(define (triple i num)
	(define (enough? num) (< 500 (num_divisors num 2 1 0))) 
	(if (enough? num)
		num
		(triple (+ i 1) (+ i 1 num))))

(triple 1 1)
