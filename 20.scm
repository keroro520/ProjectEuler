
;   题意: 对蛇形矩阵求对角和
;   思路: 可见, 每一圈的4个对角线上的数字的间隔是相等的, 所以对于某一圈上对角线上的4个数的和, 我们可以直接求出 = 4 * now-position + 10 * interval. now-position是上一圈的最后一个数字, 即右上角.
(define (spiral-diagonals spiral)
    (define (iter interval now-position result)
        (if (> interval spiral)
            result
            (iter (+ interval 2) (+ now-position (* 4 interval)) (+ result (* now-position 4) (* 10 interval)))))
    (iter 2 1 1))

(spiral-diagonals 1001)
