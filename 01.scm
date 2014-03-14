;; remainder和modulo的区别还没有仔细看

;; Project Euler 01
(define (f maxn)
    (define (help term ans)
        (if (<= maxn term)
            ans
            (help (+ 1 term) (+ ans (if (or (= 0 (remainder term 3)) (= 0 (remainder term 5)))
                        term 
                        0)))))
    (help 1 0 ))

