#lang rosette

(output-smt #t)

(define-symbolic* x y integer?)

(define-syntax-rule (without-vc expr)
  (result-value (with-vc expr)))

(define (halide-div a b)
  (if (equal? b 0) 0 (without-vc (expression euclidean-div a b))))

(define (halide-mod a b)
  (if (equal? b 0) 0 (without-vc (expression euclidean-mod a b))))

(synthesize #:forall (list x)
            #:guarantee (assert (equal? x (halide-div x y))))