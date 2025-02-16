(defvar piece1
    '((name . "Moonlight Sonata")
      (performer . ((name . "Claudio Arrau")))
      (length-secs . (+ (* 17.0 60) 26))))

(defvar piece2
    '((performer . ((name . "Daniel Barenboim")))
      (name . "Moonlight Sonata")
      (length-secs . (+ (* 16.0 60) 49))))

(defvar non-piece1
    '((name . "Moonlight Sonata")
      (performer . ((name . "Daniel Barenboim")))
      (length-secs . (+ (* 16.0 60) 49))
      (author . "Ludwig van Beethoven")))

(defvar non-piece2
    '((name . "Moonlight Sonata")
      (performer . "Daniel Barenboim")
      (length-secs . (+ (* 16.0 60) 49))))

(defvar pause1
    '((item-variant . pause)
      (length-secs . 5.0)))

(defun personp (a) ;; is "a" a person?
    (and
        (= 1 (length a)) ;; assert that there is exactly one component
        (let ((name (cdr (assoc 'name a)))) ;; extract a component called 'name
            (stringp name) ;; assert that name is a string
        )))

(defun format-person (p)
    (let ((name (cdr (assoc 'name p))))
        name))

(defun itemp (a)
    (let ;; extract expected components (set nil if absent):
        ((name (cdr (assoc 'name a)))
         (performer (cdr (assoc 'performer a)))
         (length-secs (cdr (assoc 'length-secs a))))
        (and ;; all of the following must hold:
            (= 3 (length a)) ;; there are exactly three components
            (stringp name)
            (personp performer)
            (numberp (eval length-secs))
            t)))

(defun format-item (i)
    (let 
        ((name (cdr (assoc 'name i)))
         (performer (cdr (assoc 'performer i)))
         (length-secs (cdr (assoc 'length-secs i)))
        )
        (format nil "~A by ~A (~,1F)" name (format-person performer) (eval length-secs))))

(defun test-item (a) 
    (if (itemp a) 
        (format t "A valid item: ~A~%" (format-item a))
        (format t "An invalid item: ~S~%" a)
    )
)

(test-item piece1)
(test-item piece2)
(test-item non-piece1)
(test-item non-piece2)
(test-item pause1)
