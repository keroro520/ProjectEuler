
(define (sum-of-squares n)
    (if (= 0 n)
        0
        (+ (square n) (sum-of-squares (- n 1)))))

(define (square-of-sum n)
    (define (sum n)
        (if (= 0 n)
            0
            (+ n (sum (- n 1)))))
    (square (sum n)))

(define (square x) (* x x))


(- (square-of-sum 100) (sum-of-squares 100) )
