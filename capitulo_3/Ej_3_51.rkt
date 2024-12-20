#lang racket
; Ejercicio 3.51

(define (enumerate-interval start stop)
    (if (> start stop)
        empty-stream
        (stream-cons start 
                     (enumerate-interval (+ start 1) stop))))

(define (stream-map proc s)
    (if (stream-empty? s) 
        empty-stream
        (stream-cons (proc (stream-first s))
                     (stream-map proc (stream-rest s)))))

(define (stream-sum s)
    (if (stream-empty? s)
        0
	(+ (stream-first s) (stream-sum (stream-rest s)))))

(define (show x)
  (displayln x)
  x)

(define x 
  (stream-map 
   show 
   (enumerate-interval 0 10)))

(stream-ref x 5)
; Devuelve: un show del elemento número 5 de x
(stream-ref x 7)
; Devuelve: un show del elemento número 7 de x