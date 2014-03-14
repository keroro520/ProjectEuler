
;; 和谐数
;; 题意: 求小于10000的和谐数之和.

;; 方法: 暴力, 没有用DP.  DP可以减一半时间, 就是对于已经做过sum-of-divisors的数可以记录下来, 不用再重新做. 也可以直接在程序开头先把所有数的因子数之和求出来保存着.

(define (sum-of-divisors num)
	(define (help i result)
		(if (> i (/ num 2))
			result
			(help (+ i 1) (+ result (if (= 0 (modulo num i)) i 0)))))
	(help 1 0))

(define (sum-of-amicable-numbers maxn)
	(define (amicable? x)
		(let ((other (sum-of-divisors x)))
			 (and (not (= x other)) (= x (sum-of-divisors other)))))
	(define (help i result)
		(cond ((>= i maxn) result)
			  ((amicable? i)
			   (help (+ i 1) (+ result i)))
			  (else (help (+ i 1) result))))
	(help 1 0))

;(sum-of-amicable-numbers 10000)
	

;; Scheme DP法, 未成功
(define (test_2 maxn)
	(define (init i l)
		(if (< maxn i)
			l
			(init (+ i 1) (append l (list (sum-of-divisors i))))))

	(define (amicable? l x)
		(let ((other (list-ref l (- x 1))))
		    (or	 (and (> other 0)		;;这里检查了好久!!! MARK,漏了这里一直RE
					  (< other maxn)
				 	  (not (= x other))
				 	  (= x (list-ref l (- other 1))))
				 (and (not (= other x)) (>= other maxn) (= x (sum-of-divisors other))))))

	(define (help l i result)
	    	 (if (>= i maxn)
				 result
	    		 (help l (+ i 1) (if (amicable? l i) (+ result i) result))))
	
	(let ((l (init 0 '())))
	     (help l 1 0)))


;; Testing
;(test_2 10000)















