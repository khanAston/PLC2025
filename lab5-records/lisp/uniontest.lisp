; example records, represented as association lists:
(defvar someday1
    '((mday . 1) (month . JAN) (year . 1901))) ; list of (<key> . <value>) pairs

(defvar someday2
    '((yday . 111) (year . 1901)))

(defvar notaday
    '((yay . 111) (year . 1901)))

(defun formatDate (date)
    (let ((mday (cdr (assoc 'mday date))) ; cdr = return value (ie second component of a pair)
          (yday (cdr (assoc 'yday date))) ; assoc = lookup a pair by the key
          (year (cdr (assoc 'year date))) ; assoc returns nil if the key is not found
          (month (cdr (assoc 'month date))))
         (if mday ; ie if mday exists (ie not nil)
            (format nil "~S/~S/~S" mday month year)
            (format nil "~S//~S" yday year))))

(defun write-new-line ()
    (write-string (format nil "~%")))

(write-string (formatDate someday1))
(write-new-line)
(write-string (formatDate someday2))
(write-new-line)

; a structure-checking function for a union type
; that is similar to the type Date in file uniontest.hs:
(defun datep (date)
    (and (listp date)
        (or (and (= 3 (length date))
                (let ((mday (cdr (assoc 'mday date)))
                        (year (cdr (assoc 'year date)))
                        (month (cdr (assoc 'month date))))
                    (and mday month year))) ; ie all three exist
            (and (= 2 (length date))
                (let ((yday (cdr (assoc 'yday date)))
                        (year (cdr (assoc 'year date))))
                    (and yday year)))))) ; ie both components exist

; test the above type-checking function:
(defun checkdate (maybedate)
    (if (datep maybedate)
        (write-string (format nil "The record ~S is a valid date.~%" maybedate))
        (write-string (format nil "The record ~S is NOT a valid date.~%" maybedate))
    )
)

(checkdate someday1)
(checkdate notaday)
