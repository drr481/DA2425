#lang racket

 (require math/statistics)

(define (next-line-it file)
  (let ((line (read-line file 'any)))
    (unless (eof-object? line)
      (displayln line)
      (next-line-it file))))
; llamada para leer un archivo.
;(call-with-input-file "ej_pts_01.txt" next-line-it)
(sort (list 5 3 4) <) ; Ordenar una lista