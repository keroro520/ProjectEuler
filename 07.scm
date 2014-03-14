;; 求第10001个素数
;; 直接用Miller-Rabin的方法也可以.
;; 我原以为Miller-Rabin判断素数法有漏洞, 即有些数会被漏掉, 于是加了条"如果Miller-Rabin认为是素数, 那就再用暴举法判断是不是真的是素数", 结果跟直接用MR一样.
;; Why? 不是说MR有漏洞吗? 难道费马小定理有漏, 其改进MR就没有漏了? 

(define (find-prime term)
    (define (help i term)
        (if (and (prime? i) (check-again-prime? i))
            (if (= 1 term)
                i
                (help (+ i 1) (- term 1)))
            (help (+ i 1) term)))
    (help 2 term))

(define (prime? n)
    (define (mr-test n times)
        (cond ((= 0 times) #t)
              ((mr-prime? n (+ (random (- n 1)) 1)) (mr-test n (- times 1)))
              (else #f)))
     (define (mr-prime? n a)
        (= (remainder 1 n) (expmod a (- n 1) n)))
     (mr-test n 40))

(define (expmod a e n)
    (cond ((= 0 e) 1)
          ((even? e) (remainder (square (expmod a (/ e 2) n)) n))
          (else (remainder (* a (expmod a (- e 1) n)) n))))

(define (check-again-prime? num)
    (define (help i)
        (let ((half-num (quotient num 2)))
             (cond ((> i half-num) #t)
                   ((= 0 (remainder num i)) #f)
                   (else (help (+ i 1))))))
    (help 2))

(define (square x) (* x x))

(find-prime 10001)
