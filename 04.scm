;; 求两个三位数的最大回文乘积
;; 思路: 暴力枚举a, b

;; Note: 一开始我从大到小暴力枚举a,b时, 是b不断减, 减到100时a--,b=a再继续枚举, 一遇到一个回文乘积就结束, 但是结果不对, 因为我的枚举方法并不能保证该回文乘积一定最大, a < b < c < d, a*d不一定大于b*c.
;; 修正方法是修改结束条件, 直到a<100时才结束.

(define largest-palindrome-product  ;product of two 3-digit numbers
    (define (help a b result)
        (if (> 100 b)
            (if (> 100 a)
                result
                (help (- a 1) (- a 1) result))
            (if (< result (* a b))
                (if (palindrome? (* a b))
                    (help a (- b 1) (* a b))
                    (help a (- b 1) result))
                (help a (- b 1) result))))
    (help 999 999 0))


(define (palindrome? num)       ; 回文数判断
    (define (reverse-int num result)
        (if (= 0 num)
            result
            (reverse-int (quotient num 10) (+ (modulo num 10) (* 10 result)))))
    (= num (reverse-int num 0)))

largest-palindrome-product
