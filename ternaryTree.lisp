; Charles Effinger
; CS 450 - Program 4 - Lisp Ternary Tree

; This function is used to find the nodes in the tree. The parameter L is the 
; current list and A is the which node is desired- either 1 or 2.
(defun findNode (L A) 
	(cond
		((null L) nil)
		; If a is atom, check if it is the 'first' atom.
		((atom (car L)) 
			(cond 
				; If it is a nil atom, ignore it and continue.
				((null (car L)) (findNode (cdr L) A))
				; Return if A is 1
				((eq 1 A) (car L))
				; Ignore otherwise and recurse with A as 1.
				(T (findNode (cdr L) 1))
			)
		)
		; If not an atom, recurse on the rest of L.
		(T (findNode (cdr L) A))
)
)

; This function inserts number C into the list L. It will call itself 
; recursively until it finds the correct position for the number.  
(defun insert (L C)
	(cond
		; If there is not a node, C can be inserted without worry
		((null (findNode L 1) ) (cons C nil))
		; If there is a single node, we need to figure out the 
		; order of nodes.
		((null (findNode L 2) ) 
			(cond 
				; If C <= the node, place it in front of 
				; the node.
				((<= C (findNode L 1)) (cons nil (cons C 
					(cons nil (cons (findNode L 1) 
							  (cons nil nil))))))   
				; If C > the node, place it behind the node.
				; Now that there are tow nodes, we also need to
				; create children for the nodes, initialized as
				; empty lists,
				(T (cons nil (cons (findNode L 1) 
					(cons nil (cons C (cons nil nil))))))
			)
		)
		; If there are two nodes, find the proper position for C and
		; recurse on that area.	
		(T 
			; REFERENCE: car L = left child, 
			;	     cdr L = everything but the left child. 
			;	     cadr L = left node
			;	     caddr L = middle child
			;	     cdddr L = right node and right child
			;	     cadddr L = right node
			;	     caddddr L = right child
			(cond 
				; If C <= the first node, recurse on the left
				; child.
				((<= C (findNode L 1)) (cons (insert (car L) C) 
								       (cdr L))) 
				; If the C <= the second node, recurse on the 
				; middle child.
				((<= C (findNode L 2)) (cons (car L) (cons 
					( cadr L) (cons (insert (caddr L) C) 
								   (cdddr L))))) 
				; If C > the second node, recurse on the right
				; child. 
				(T (cons (car L) (cons (cadr L) (cons (caddr L) 
    					(cons (cadddr L) (cons (insert 
						(car(cddddr L)) C ) nil))))))
			)
		) 
	)
)

; This function will initialize the tree by placing the first element in the 
; list as the head. 
(defun initTree (L) 
	(cond
		; If the list is null, build an empty tree
		((null L) (buildTree nil nil)) 
		(T (buildTree (cons (car L) nil) (cdr L)))	
	)
)

(defun buildTree (L A) 
	(print L)
	(cond
		; If there are no values left, return the current list.
		((null (car A)) L)
		; Otherwise, recurse on the next value from the input and place
		; it in the tree. 
		(T (buildTree (insert L (car A)) (cdr A)))
	) 
)

; This function will build the ternary tree from command line input.
(defun run () 
	(format t "~%~%Input a List: ")
	(initTree(READ))
;       (run) ; Uncomment to loop program
)

; This function will build the ternary tree from a given file.
(defun runFromFile () 
	(format t "~%~%Input a Data File (\"filename\"): ") 
	(initTree(READ(OPEN(READ))))
;	(runFromFile); Uncomment to loop program
)

