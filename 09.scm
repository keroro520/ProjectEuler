;; 求满足a^2 + b^2 = c^2 (1), a + b + c = n (2) 的abc的乘积

;; 直接用上面的公式来枚举太慢了, 可以变换一下
;;   a^2 + b^2 = [n-(a+b)]^2
;; ==> n^2 + 2ab - 2n(a+b) = 0      ;利用这个公式来判断就快了

;(define (square x) (* x x))
;(define (triple? a b c) (= 0 (- (square c) (square a) (square b))))

(define (special-pythagorean-triplet n)
    (define (ok? a b)
        (= 0 (- (* n n) (* -2 a b) (* 2 n (+ a b)))))
    (define (help a b)
        (if (>= b (- n a b))
            (help (+ a 1) (+ a 2))      ;因为a < b < c
            (if (ok? a b)
                (* a b (- n a b))
                (help a (+ b 1)))))
    (help 1 2))

(special-pythagorean-triplet 1000)
