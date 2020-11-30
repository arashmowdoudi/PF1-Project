;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname PF1Project) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; PROGRAMMING FUNDAMENTALS 1
; GROUP PROJECT
; KELVIN LIKOLLARI
; ARASH MOWDOUDI
; KIERAN MCKEE


;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;Import the requirement libraries for startng the program.
(require 2htdp/image)
(require 2htdp/universe)


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;Draw the original scene, a welcome screen for the user, telling him what you should do in order to win/fail the game.


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; color of backgrouf with rgb
(define BG-COLOR (make-color 60 100 50))


; source of colors information : https://htmlcolorcodes.com/


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; width of background in the game.
(define BG-WIDTH 2000)
                                                                            

; HEIGHT of background in the game.
(define BG-HEIGHT 1000)

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; it represent background of game.
(define BG (empty-scene BG-WIDTH BG-HEIGHT BG-COLOR))



;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;bitmap idea received from here: https://stackoverflow.com/questions/5355251/bitmap-in-dr-racket

;;Teammates: uncomment the definition below for it to work.

;START/ORIGINAL SCENE SHOWN TO USER AFTER HAVING CMD+R THE PROGRAM.
;(define start (bitmap ;....path to the image we will add)
               ;))

;END/FAIL SCENE SHOWN TO USER AFTER HAVING FAILED TO COMPLY WITH THE GAME'S RULES.
;; Teammates: uncomment the following definition please
;(define end (bitmap ;.... path to the image we will put in order to show to user the fail scenery.
             ;))

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


; Points
; Each character starts from a starting position and has to jump to the ending position
; with the help of key-events. There are many stages in the game, and as it is in all games,
; the difficulty increases with every level passed aka the distance between the starting and
; the ending position increases so you should adjust the key-event in that way so that you 
; do not go out of bounds. For each level passed, the user collects +1 points to the accumulator.


(define 1-POINT 1)
(define 2-POINTS 2)
(define 3-POINTS 3)
(define 4-POINTS 4)

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;Starting position.

;;Teammates, please adjust those numbers below to your preferences.Test them out please

;(define POS-ORIG-BOX (make-posn 200 500))



;Ending Position

;;Teammates, please adjust those numbers below to your preferences.Test them out please

;(define FIN-BOX (make-posn (+.....)


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



;BOX WIDTH/HEIGHT

;(c): https://docs.racket-lang.org/teachpack/2htdpimage.html#%28def._%28%28lib._2htdp%2Fimage..rkt%29._image-width%29%29

;Writing it after having written the boxes function.
;the box-width and height will be the same to the first box we will have in our game.  (starting-box). so we will use the starting box.
(define BOX-WIDTH (image-width  (bitmap "images/sm-images/starting-box.png")))
(define BOX-HEIGHT (image-height (bitmap "images/sm-images/starting-box.png")))




;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;Character Movement
;X Axis
(define MOVE-X +200)
(define MOVE2-X 20)
;Y Axis
(define MOVE-Y +100)
(define MOVE2-Y 10)


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;Game Character:
(define SUPERMARIO1 (bitmap "images/sm-images/relax.png"))


;SuperMario getting ready to jump
(define SUPERMARIO2 (bitmap "images/sm-images/readytojump.png"))


;SuperMario on the jumping state.
(define SUPERMARIO3 (bitmap "images/sm-images/sm2.png"))

;SuperMario original position
(define ORIGINAL-POS (make-posn 100 200)) ;NUMBERS ARE SUBJECT TO CHANGE.


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;Starting and ending objects.
;Documentation: https://docs.racket-lang.org/reference/vectors.html#%28def._%28%28quote._~23~25kernel%29._make-vector%29%29
;Following definiton works, we just need to upload the images through the respected foldier stored in our PC.

(define boxes (make-vector 3))  ;boxes = START & END1 & END2 (for the two levels) 
; https://docs.racket-lang.org/reference/vectors.html#%28def._%28%28quote._~23~25kernel%29._vector-set%21%29%29
(vector-set! boxes 0 (bitmap "images/sm-images/starting-box.png"))
(vector-set! boxes 1 (bitmap "images/sm-images/final-box.png"))
(vector-set! boxes 2 (bitmap "images/sm-images/final-box.png"))






;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; BOX POSITIONS: CURRENT AND RANDOM ONE.
;

;UNCOMMENT AFTER HAVING UNCOMMENTED THE DEFINITION WHERE WE DEFINES POS-ORIG-BOX AND FIN-BOX


;Current Object
;(define current-scene-box (make-gamebox (random 0 3) POS-ORIG-BOX))

;Random one
;(define random-box (make-gamebox (random 0 3) FIN-BOX))


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Character resting
;(define rest-scene-char (make-character 0 ORIGINAL-POS -1 SUPERMARIO2)) ;supermario2 is bound to change

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


; Initial World

;WRITE INITIAL WORLD DEFINITION HERE

;(define INITIAL-WORLD (make-world......))

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Interpretation: A world is a struct where
; char is Image
; dot
; curr-box is Posn
; next-box is Posn
; fail? is  Boolean

; Our jumping game, which consists of posn which is the distance of the jump from some point to the end,
; curr-box is the box we are currently on
; next-box is the box in which we intend to go.
; fail? if the user failed in complying with the game rules.



(define-struct world [char dot curr-box next-box fail?])



;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Character State
; A character is a struct where:
; position is Posn
; State is Number [0,2]
; frame is Image
; points is Number

;points are the points accumulated by the user using the character.
;Interpretation: position is the Char's pos, state is the state of the character (what he is doing),
;frame is the image of our character complying with our key handlers,
;points are the points accumulated by the character.



(define-struct character [position state frame points])

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;A gamebox is (make-box id pos)
;id is a number, pos is the position of the char.
;Header+Template+tests please
(define-struct gamebox [id position])

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;KEY HANDLERS
;TEAMMATES- WRITE THE DESIGN RECIPE OF THE KEYEVENT OF PRESSING W
                            
                            
;; commented the following definition because we must create image of our character supermario in all its three states.
(define (w-keyevent w key)
  (cond
    [(and (key=? key " ") (not (= (character-state (world-char w)) 2)))
         (make-world
          (make-character (character-points (world-char w))
                                      (make-posn
                                      (posn-x (character-position (world-char w)))
                                      (posn-y (character-position (world-char w)))) 1 SUPERMARIO2)                             
                      (make-posn
                      (+ MOVE-X (posn-x (world-dot w)))
                      (+ MOVE-Y (posn-y (world-dot w))))
                     
                     (world-curr-box w)
                     (world-next-box w)
                     (world-fail? w))]

;Or case, used when the program has just started executing or/and after having failed.
     [(or (key=? key "\r") (= (character-state (world-char w)) -1) (not (false? (world-fail? w))))
         (make-world
          (make-character (character-points (world-char w))
                                     (make-posn
                                    (posn-x (character-position (world-char w)))
                                     (posn-y (character-position (world-char w))))
                                     0
                                     SUPERMARIO)
                     ORIGINAL-POS
                     (world-curr-box w)
                     (world-next-box w)
                     #false) 
        [else w]]))


;Tests/Examples

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;What happens after we have stopped clicking w? The character will start jumping


;(define (after-w w key)
;  (cond
;    [(key=? key " ") (make-world (make-character (character-points (world-char w))
;                                                 ;update the position of the character/ jumping state
;                                                 (make-posn
;                                                  (posn-x (character-position (world-char w)))
;                                                  (posn-y (character-position (world-char w)))) 2
;                                                                                                SUPERMARIO3))]))
                