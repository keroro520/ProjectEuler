;; 菲波那契数列偶数之和(<= 4000000)

(define sum-of-even-fibonacci-numbers
    (define maxn 4000000)
    (define (enough? num) (< maxn num))
    (define (help a b sum)
        (let ((c (+ a b)))
             (if (enough? c)
                 sum
                 (help b c (+ sum (if (even? c) c 0))))))
    (help 1 2 2))

sum-of-even-fibonacci-numbers
