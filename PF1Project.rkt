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

; BG-Color is using HTML codes
; it represent the color of background during the game
; source of colors information : https://htmlcolorcodes.com/
(define BG-Color (make-color 60 100 50))





;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


; BG-Width is a not negative number
; it represent width of background in the game.
(define BG-Width 2000)
                                                                             ;;;teammates, try running this program and try to find out what numbers suit best.

; BG-Height is a not negative number
; it represent height of background in the game.
(define BG-Height 1000)

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; BG is a image (background)
; it represents the background in the game

; BG: Number Number   -> image(World state)
; Given width and height and color of background and returns image of backgrounds
(define BG (empty-scene BG-Width BG-Height BG-Color))



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

;(define BOX-Width (image-width (bitmap ;path to the image we will use))
;(define BOX-Height (image-height (bitmap ;path to the image we will use))



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
;(define SUPERMARIO1 (bitmap ....)
;(define SUPERMARIO2 (bitmap ....)
;(define SUPERMARIO3 (bitmap ....)
;SuperMario original position

; ORIGINAL-POS : Number Number -> Number
; given two numbers and it returns a number which change subjects.
(define ORIGINAL-POS (make-posn 100 200)) 


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;Starting and ending objects.
;Documentation: https://docs.racket-lang.org/reference/vectors.html#%28def._%28%28quote._~23~25kernel%29._make-vector%29%29
;Following definiton works, we just need to upload the images through the respected foldier stored in our PC.

;(define box (make-vector 3))  ;box = START & END 
; https://docs.racket-lang.org/reference/vectors.html#%28def._%28%28quote._~23~25kernel%29._vector-set%21%29%29
;(vector-set! box 0 (bitmap "....."))
;(vector-set! box 1 (bitmap "....."))
;(vector-set! box 2 (bitmap "....."))





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


; World state
; A world is a (make-word posn char curr-box next-box fail?) where:
; posn is a Number
; char is a character
; current-box is a box, the current one we are in.
; next-box is a box, the next box of the one we are in right now.
; fail is a boolean, signifying whether we have not complied with the game rules.

; Interpretation: Our jumping game, which consists of posn which is the distance of the jump from some point to the end,
; curr-box is the box we are currently on
; next-box is the box in which we intend to go.
; fail? if the user succeeded in complying with the game rules.



; TEAMMATES: Please complete header, template and tests of this definition.

; Header ....
; Template....



(define-struct world [char dot curr-box next-box fail?])



;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;Character State
;A character is a (make-character position state frame points)
;Where:
;position is a Posn of the character game.
;State depends on the character state.
;resting -> 0
;powering-up -> 1
;jumping -> 2
;frame is the img we will set.
;points are the points accumulated by the user using the character.
;Interpretation: position is the Char's pos, state is the state of the character (what he is doing),
;frame is the image of our character complying with our key handlers,
;points are the points accumulated by the character.

;Teammates:
;Header + Template


(define-struct character [position state frame points])


;Tests/Examples



;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;A gamebox is (make-box id pos)
;id is a number, pos is the position of the char.
;Header+Template+tests please
(define-struct gamebox [id position])

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;KEY HANDLERS
;TEAMMATES- WRITE THE DESIGN RECIPE OF THE KEYEVENT OF PRESSING W
                            
                            
;; commented the following definition because we must create image of our character supermario in all its three states.
;(define (w-keyevent w key)
 ; (cond
  ;  [(and (key=? key " ") (not (= (character-state (world-char w)) 2)))
   ;      (make-world
    ;      (make-character (character-points (world-char w))
     ;                                 (make-posn
      ;                                (posn-x (character-position (world-char w)))
       ;                               (posn-y (character-position (world-char w)))) 1 SUPERMARIO2)                             
        ;              (make-posn
         ;             (+ MOVE-X (posn-x (world-dot w)))
          ;            (+ MOVE-Y (posn-y (world-dot w))))
           ;          
            ;         (world-curr-box w)
             ;        (world-next-box w)
              ;       (world-fail? w))]))



;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
