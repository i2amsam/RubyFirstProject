; Seven lanaguages in Seven Weeks
; Week 6 -- Clojure
; Day 1


; Problem 1:  Write a function (big st n) that returns true if a string is longer than n characters
(defn big (
	   [st n] (< n (.length st))
	)
)
(println "Problem 1: does hello have more than 6 characters?")
(println (big "hello" 6))

;Problem 2: Write a function (collection-type col) that returns :list, :map, or :vector based on the type of col

(defn collection-type (
	  [col] (let [colType (type col)] 
		  (if (= colType (type [])) ":vector"
		    (if (= colType (type {})) ":map"
		      (if (= colType (type '(1))) ":list" ":unknown")  
		    )
		  )
		)
	)
)

(println "Problem 2: types of collections")
(println (collection-type [1,2,3]))
(println (collection-type {:luke :jedi}))
(println (collection-type (list 1 2 3)))
