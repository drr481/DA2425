#lang racket
; Ejercicio 2.D

; BOB
(define (bob-make-box x y w h)
    (attach-tag 'bob-box
         (cons (cons x y) (cons w h))))

(define (bob-box? box) (
        equal? (type-tag box) 'bob-box
    )
)

(define (bob-width b) (car (cdr (contents b))))
(define (bob-height b) (cdr (cdr (contents b))))

(define (bob-area box)
    (* (bob-width box) (bob-height box)))

; ALICE
(define (alice-make-box x1 y1 x2 y2)(
        attach-tag 'alice-box (cons (cons x1 y1) (cons x2 y2))
    )
)

(define (alice-box? box) (
        equal? (type-tag box) 'alice-box
    )
)

(define (alice-width box)
   (abs (- (car (cdr (contents box)))
           (car (car (contents box))))))

(define (alice-height box)
   (abs (- (cdr (cdr (contents box)))
           (cdr (car (contents box))))))

(define (alice-area box)
    (* (alice-width box) (alice-height box)))

; TAG
(define (attach-tag tag contents) (cons tag contents))
(define (type-tag datum) (car datum))
(define (contents datum) (cdr datum))

; Mapa
(define registry (make-hash))

(define (register name tag proc)
   (hash-set! registry (list name tag) proc))

(define (lookup name tag)
   (hash-ref registry (list name tag)))

; Funciones

(define (width box) (
        (lookup 'width (type-tag box)) box
    )
)

(define (height box) (
        (lookup 'height (type-tag box)) box
    )
)

(define (area box) (
        (lookup 'area (type-tag box)) box
    )
)

; Ejemplos

(define a (alice-make-box 1 2 3 4))
(define b (bob-make-box 1 2 3 4))

registry
(register 'width 'bob-box bob-width)
(register 'width 'alice-box alice-width)
(register 'height 'bob-box bob-height)
(register 'height 'alice-box alice-height)
(register 'area 'bob-box bob-area)
(register 'area 'alice-box alice-area)

(area a)