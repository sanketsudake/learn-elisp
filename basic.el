
(message "Hello Emacs Newbie ! :-)")

;; Lisp List
;;Lisp Atom
;; ' tells no operation to be done on list
;; Or first atom of list is default operation
'(rose
  violet
  daisy
  buttercup)
(+ 2 2)

'(this list has (a list inside of it))
'()
'(this list includes "text between quotation marks")
(+ 1 2 3 4 5 6 7 8 9 10)
;; Evaluating Inner Lists
(+ 2 (+ 3 3))

;; C-x C-e eval-last-sexp
;; sexp symbolic expression

;; Variables
fill-column

;; Arguments
(concat "sanket" "sudake")
(substring "The quick brown fox jumped" 16 19)

;; An argument as the value of a variable or list
(+ 2 fill-column)
(number-to-string (+ 2 fill-column))
(concat "The " (number-to-string (+ 2 fill-column)) " red foxes")

;; 0
(+)  
;; 1
(*)  
;; 3
(+ 3)
;; 3
(* 3)

;; number-or-marker-p => test whether arg number or marker
;; zerop => whether argument has the value of zero
;; listp => whether argument is list

(message "This message appears in the echo area!")
(message "The name of this buffer is : %s" (buffer-name))
(message "The value of fill column is : %d" fill-column)
(message "There are %d %s in the office "
	 (- fill-column 40)
	 "Pink elephants"
	 )
(message "He saw %d %s"
	 (- fill-column 32)
	 (concat "red "
		 (substring
		  "The quick brown foxes jumped" 16 21)
		 " leaping ."))

;;Set variables with set or setq

(set 'flowers '(rose lilly lotus))
;; Evaluation of flowers ignored
'flowers
;; Evaluation of flowers happens
flowers

(setq carnivores '(lion tiger leopard))
;; Above same as
(setq 'carnivores '(lion tiger leopard))
;; Multiple setting of variables
(setq trees '(pines fir oak)
      animals '(dog cat lion))

;; Counting
;; Innitializer
(setq counter 0)
;; Increment
(setq counter (+ counter 1))
counter

(other-buffer)
(switch-to-buffer (other-buffer))
(forward-char)
(forward-sentence)
(buffer-size)
(point)
(point-min)
(point-max)
(mark-whole-buffer)

(defun multiply-by-seven (number)
  "Multiply NUMBER by seven"
  (* 7 number))

(multiply-by-seven 8)

(defun multiply-by-seven (number)	;Second version
  "Multiply NUMBER by seven"
  (+ number number number number number number number))

(defun multiply-by-seven (number)	;Interactive version
  "Multiply NUMBER by seven"
  (interactive "p")
  (message "The result is %d" (* 7 number)))

;; Let expression
(let ((zebra 'stripes)
      (tiger 'fierce))
  (message " %s %s" zebra tiger))

(let ((birch 3)
      pine
      fir
      (oak 'some))
  (message
   "Here are %d variable with %s, %s and %s value"
   birch pine fir oak))

(if (> 5 4)
    (message "5 is greater than 4"))

(defun type-of-animal (characteristic)
  "Print message in the echo area depending on CHARACTERISTIC.
If the CHARACTERISTIC is the symbol 'fierce'.
then warn of a tiger."
  (if (equal characteristic 'fierce)
      (message "It's a tiger.")))

(type-of-animal 'fierce)
(type-of-animal 'zebra)

;; If-then-else 
(if (> 4 5)
    (message "4 falsely greater than 5!")
  (message "4 is not greater than 5!"))

(if 4
    'true
  'false)
(if nil
    'true
  'false)
(defun back-to-indentation ()
  "Move point to first visible character on line."
  (interactive)
  (beginning-of-line 1)
  (skip-chars-forward " \t"))

(let ((foo (buffer-name))
      (bar (buffer-size)))
  (message
   "This buffer is %s and has %d characters."
   foo bar))

(message "We are %d characters into this buffer."
	 (- (point)
	    (save-excursion
	      (goto-char (point-min)) (point))))

emacs-major-version

;; C-h f RET type name of function
;; Describes all details about function

;; C-h v RET type name of variable

(defun simplified-beginning-of-buffer ()
  "Move point to beginning of the buffer;
leave mark at previos position"
  (interactive)
  (push-mark)
  (goto-char (point-min))

(defun simplified-end-of-buffer ()
  "Move point to beginning of the buffer;
leave mark at previos position"
  (interactive)
  (push-mark)
  (goto-char (point-max)))

;;car, cdr, cons
(require 'cl)
(car '(rose violet daisy buttercup))
(cdr '(rose violet daisy buttercup))

;; Returns first element of list
(car '((lion tiger cheetah)
       (gazelle antelope zebra)
       (whale dolphin seal)))
;; Returns all elements other than first
(cdr '((lion tiger cheetah)
       (gazelle antelope zebra)
       (whale dolphin seal)))
;; construct lists
(cons 'pine '(fir oak maple))
(cons 'buttercup ())
(cons 'daisy '(buttercup))

;; length of the list
(length '(buttercup))
(length '(daisy buttercup))
(length (cons 'violet '(daisy buttercup)))
(length ())

;; Return list from n elements
(nthcdr 1 '(pine fir oak maple))
(nthcdr 2 '(pine fir oak maple))
(nthcdr 4 '(pine fir oak maple))
(nthcdr 5 '(pine fir oak maple))

(defun nth (n list)
  "Return the Nth element of LIST
N counts from zero. It LIST is that long, nil is returned."
  (car (nthcdr n list)) )

;; Return nth element of the list
(nth 0 '("one" "two" "three"))
(nth 1 '("one" "two" "three"))


(setq animals '(antelope giraffe lion tiger))
animals
;; Set first element
(setcar animals 'hippopotamus)
animals
(setq domestic '(horse cow sheep goat))
;; Set cdr elements in list
(setcdr domestic '(cat dog))

;;  Trying this funny thing
(setq animals '(lion tiger))
(cons animals animals )

;;funcall funcall evaluates its first argument as a function. It passes its re-
;;maining arguments to its first argument.

;;How list are made
;;
;;  bouquet -> car  | cdr -> car    | cdr -> car       | cdr 
;;             rose |        violet |        buttercup | nil
;;
(setq bouquet '(rose violet buttercup))
;;  bouquet -> car  | cdr -> car    | cdr -> car       | cdr 
;;             rose |        violet |        buttercup | nil
;;
(setq flowers (cdr bouquet))
;;                flowers ->
;;  bouquet -> car  | cdr -> car    | cdr -> car       | cdr 
;;             rose |        violet |        buttercup | nil
;;
(setq bouquet (cons 'lily bouquet))
;;                flowers ->
;;  bouquet -> car  | cdr ->   car  | cdr -> car    | cdr -> car       | cdr 
;;             lily |          rose |        violet |        buttercup | nil
;;
(eq (cdr  (cdr bouquet)) flowers)
;; Returns true


;; Loops and recursion
;; while






