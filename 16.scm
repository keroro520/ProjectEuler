;; 算2^1000的每位数字的和  

;; 简单, 就是用fast-exp把2^1000算出来然后再分解

(define (square x) (* x x))

(define (pow-of-2 exp)
	(cond ((= 0 exp) 1)
		  ((even? exp) (square (pow-of-2 (/ exp 2))))
		  (else (* 2 (pow-of-2 (- exp 1))))))

(define (sum-of-digits num result)
	(if (= 0 num)
		result
		(sum-of-digits (quotient num 10) (+ result (modulo num 10)))))

(sum-of-digits (pow-of-2 15)
(sum-of-digits (pow-of-2 1000) 0)
