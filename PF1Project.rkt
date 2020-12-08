;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname PF1Project) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; PROGRAMMING FUNDAMENTALS 1
; GROUP PROJECT
; KELVIN LIKOLLARI
; ARASH MOWDOUDI
; KIERAN MCKEE (ABSENT - DO NOT KNOW WHERE HE IS - HE HAS BEEN OFFLINE SINCE 20 NOVEMBER AND NOT RESPONDING TO OUR MESSAGES)
; MEMBERS

;PS1: Numbers in all definitions are subject to change!

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;Import the required libraries for starting the program.
(require 2htdp/image)
(require 2htdp/universe)


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; source of colors information : https://htmlcolorcodes.com/
; color of backgroud with rgb
; Interpretation: The color of the background
; Header: (define bg-color (make-color integer integer integer))
;Template: (define bg-color (make-color 221 211 28))

;Code:
(define BG-COLOR (make-color 0 0 0))

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; width of background in the game.
;Interpretation: the background scene parameters of the game (in this case, width)
;header/template (define BG-WIDTH ...) where ... will be an int number.

;Code:
(define BG-WIDTH 1999)  


;Interpretation: the background scene parameters of the game (in this case, height).
;header/template (define BG-HEIGHT ...) where ... will be an int number.
;HEIGHT of background in the game.
;Note to Teammates: height must be < width for better showing results.

;Code:
(define BG-HEIGHT 999) 

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; it represent background of game.
; Draw the background scene of the game.
; A background is one of:
; empty-scene where creates an empty scene (a white rectangle with a black outline.)
; BG-Width Which is the width of the background
; BG-Height Which is the height of the background.
; BG-Color which will be the color of the background.
; Interpretation: the background of our scenery.
; Header: (define BG (... ... ... ...))
; Template
; (define BG (empty-scene BG-width Bg0Height BG-COLOUR))

;Code:
(define BG (empty-scene BG-WIDTH BG-HEIGHT BG-COLOR))



;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;bitmap idea received from here: https://www.reddit.com/r/Racket/comments/291g5b/loading_pngjpeg_image_in_racket/
;bitmap implementation adopted from here : https://stackoverflow.com/questions/5355251/bitmap-in-dr-racket

;Start/original scene shown to user after having cmd+r the program.
;Interpretation: The starting scene of the Game.
;Header: (define start-scene (bitmap "......"))
;Template:
;(define start-scene (bitmap "...path-to-image..."))

;Code:
(define start (bitmap "images/sm-images/welcome.png"))



;End/fail scene shown to user after having failed to comply with the game's rules.
;Interpretation: The fail scene of the Game.
;Header: (define end-scene (bitmap "......"))
;Template
;(define end (bitmap "-path-to-image"))
 
;Code:
(define end (bitmap "images/sm-images/gj.png"))

;path to the image we will put in order to show to user the fail scenery.
            

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


; Points
; Each character starts from a starting position and has to jump to the ending position
; with the help of key-events. There are many stages in the game, and as it is in all games,
; the difficulty increases with every level passed aka the distance between the starting and
; the ending position increases so you should adjust the key-event in that way so that you 
; do not go out of bounds. For each level passed, the user collects +1 points to the accumulator.
; Interpretations: The number of points per each successful attempt.
; Header: (define P1 1) (define P2 2)
; Template:
; (define 1-Point 1)
; (define 2-points 2)

;Code:
(define 1-POINT 1)
(define 2-POINTS 2)
(define 3-POINTS 3)
(define 4-POINTS 4)


;Tests/Examples
(check-expect 1-POINT 1)
(check-expect 2-POINTS 2)
(check-expect 3-POINTS 3)
(check-expect 4-POINTS 4)


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



;BOX WIDTH/HEIGHT
;(c): https://docs.racket-lang.org/teachpack/2htdpimage.html#%28def._%28%28lib._2htdp%2Fimage..rkt%29._image-width%29%29

;Writing it after having written the boxes function.
;the box-width and height will be the same to the first box we will have in our game.  (starting-box). so we will use the starting box.
;Given the definitions of the box width & height, upload their respective pictures.
;Interpretation: The image showing width and the height of the boxes.
;Header (define BOX-HEIGHT (image-height (bitmap "........"))) , similarly we do the width
;Template: (define BOX-HEIGHT (image-height (bitmap "path-to-image")))

;Code:
(define BOX-WIDTH (image-width  (bitmap "images/sm-images/starting-box.png")))

(define BOX-HEIGHT (image-height (bitmap "images/sm-images/starting-box.png")))



;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;Character Movement
;X Axis
;Interpretation: The 2 kind of movements on the X axis, 1 big and 1 small.
;Header: (define movex + ....)
;(define movex ....)
;Template (define MOVE-X + number)
;(define MOVE2-X + number)
(define MOVE-X +150)
(define smallx 8)
 
;Y Axis
;Interpretation: The 2 kind of movements on the Y axis, 1 big and 1 small.
;Similar template to previous defs
;Code:
(define MOVE-Y -95)
(define smally -5)



;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;Game Character:
;Interpretation: The initial state of supermario.
;Header/Template: similar to previous examples when used bitmap.
;Code:
(define SUPERMARIO1 (bitmap "images/sm-images/relax.png"))


;SuperMario getting ready to jump
;Interpretation: a jumping state of our character.
;Code:
(define SUPERMARIO2 (bitmap "images/sm-images/readytojump.png"))


;SuperMario on the jumping state.
;Interpretation: the flying in-game character. :)
;Code:
(define SUPERMARIO3 (bitmap "images/sm-images/sm2.png"))


;;(define ORIGINAL-POS (make-posn 300 550)) ;TeamMates: NUMBERS ARE SUBJECT TO CHANGE.


;Tests/Examples
;(check-random ORIGINAL-POS (make-posn 300 550))

;SuperMario original position 
;Interpretation: the original position onto the box of SuperMario.
;Code:
(define ORIGINAL-POSITION (make-posn 200 480))

(define INITIAL-POSN ORIGINAL-POSITION)

;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;Starting position.

;Teammates, please adjust those numbers below to your preferences.Test them out please
;Interpretation: position of the original/starting box.
;A Box is a:
;(make-posn Number Number))
;Where number number are the x and y coordinates respectively of the original box.
;Header: (define ORIG (make-posn ... ...))
;Template
; (define original-box (make-posn 100 100))

;Code:
(define POS-ORIG-BOX (make-posn 250 700))

(check-expect POS-ORIG-BOX (make-posn 250 700))


 
 



;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





;Ending Position

;Teammates, please adjust those numbers below to your preferences.Test them out please
;Given the starting box position, create the final one.
;Interpretation: The position of the juping-to box (final box)
;A box is a:
;(make-posn Number Number))
;Where number number are the x and y coordinates respectively of the original box.
;But the final box has not the same position, so we must apply the small movements defined previously.
;Header: (define final (make-posn (.. (..._... ) (.... (...) ...)
;Template
;(define FIN-BOX (make-posn ( .. (.. number number) number ) (... (... number number) number)))))

;Code:
(define POS-NEXT-BOX (make-posn 1500 650))









;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------








;Starting and ending objects.

;Documentation: https://docs.racket-lang.org/reference/vectors.html#%28def._%28%28quote._~23~25kernel%29._make-vector%29%29
;Teammates: Following definiton works, we just need to upload the images through the respected folder stored in our PC.
;Boxes Created & Uploaded using bitmap.
;Interpretation: Boxes in all its 3 states,
;starting, ending ------- starting, ending2
;Header
;(define box (make-vector ...) (.... box ... (bitmap "...."....)))
;Template:
;(define boxes (make-vector number-of-vectors (vector-set boxes starting-box (bitmap "-path-to-image") ------> similar, but now add box at ending1 position and box at ending 2 position.

;Code:
(define boxes (make-vector 3))  ;boxes = START & END1 & END2 (for the two levels) 
; https://docs.racket-lang.org/reference/vectors.html#%28def._%28%28quote._~23~25kernel%29._vector-set%21%29%29
(vector-set! boxes 0 (bitmap "images/sm-images/starting-box.png"))
(vector-set! boxes 1 (bitmap "images/sm-images/final-box.png"))
(vector-set! boxes 2 (bitmap "images/sm-images/final-box.png"))


 

 






;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------








; Interpretation: A world is a make-world where:
; char is Image
; posn is a Position
; curr-box is Posn
; next-box is Posn
; fail? is  Boolean
; Given a world, return a newly updated world with its parameters updated.
; world : World -> World
; Our jumping game, which consists of posn which is the distance of the jump from some point to the end,
; char, which is the ingame character
; curr-box is the box we are currently on
; next-box is the box in which we intend to go.
; fail? if the user failed in complying with the game rules

(define-struct world [char posn current-box next-box fail?])


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


; Character state
; a character is one of (make-character points position state frame) where:
; position is Posn
; state is one of:
; 0 if Supermario is in resting state.
; 1 if Supermario is ready to jump
; 2 if Supermario is jumping.
; a state is one of the three  states of Supermario, ie resting, getting ready to jump and jumping
; frame is Image
; points is Number
; points are the points accumulated by the user using the character.
; Interpretation: position is the Char's pos, state is the state of the character (what he is doing),
; frame is the image of our character complying with our state
; points are the points accumulated by the character.

(define-struct character [points position state frame])



;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



; A MB is a (make-box boxes-look position)
; Where 
; state is one of:
; - 0 if stable
; - 1 if moving
; - 2 if jumping
; boxes-look is a Number,
; position-of-boxes is a Posn,
; speed in a Number in [0, 5].
; INTERPRETATION:boxes-look is used to give different look to the boxes, position-of-boxes indicates the position of the boxes

(define-struct MB [boxes-look position-of-boxes]) ;MB = mariobox





;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;Box Positions:
;Current Box
;Random box

;Current Object
;The starting box is a (make-gamebox (random number number) POS)
;Where random are random coordinates of the starting scene box
;pos is the position of the original box.
;Interpretation: the starting box scene and its coordinates.
;Header: (define rest-scene-box (make-gamebox (random .. ..) pos)
;Template
;(define rest-scene-box (make-gamebox (random number number) POS-ORIG-BOX))
;Code
(define REST-SCENE-BOX (make-MB (random 0 3) POS-ORIG-BOX))


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



; Character resting
; A resting-scene-char is a (make-character number pos number frame)
; Where
; Number is the position numbers of the character
; pos is the original position of the character.
; frame is the returnable image of supermario at his starting state.
; Interpretation: Game Character at his resting scene.
; Header: (define (resting-scene-char (make-character number pos number frame)
; Template:
; (define rest-scene-char (make-character number ORIGINAL-POS number SUPERMARIO1 (starting state)))

;Code:
(define REST-SCENE-CHAR (make-character 0 ORIGINAL-POSITION -1 SUPERMARIO1))  ;supermario1 is bound to change


;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;Random one
;A randome box is a (make-gamebox (random number number) final-pos)
;Where random are random coordinates of the random scene box
;pos is the position of the original box.
;Interpretation: the random box scene and its coordinates.
;Header: (define random-box (make-gamebox (random .. ..) final-pos)
;Template
;(define random-box (make-gamebox (random number number) final-box))

;Code:
(define RANDOM-BOX (make-MB (random 0 3) POS-NEXT-BOX))



;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


; Initial World

; Interpretation: the original world with nothing moved on it.
; An original-world is a (make-world rest-scene-char ORIGINAL-POS rest-scene box random box boolean) where
; rest-scene char is supermario at his initial state.
; original-pos is the original position of our character.
; rest-scene is the scenery that contains also the box at its initial position.
; random-box is the random box we have implemented somewhere in the world.
; boolean checks whether the world has changed or not.
; Header: (define original-wolrd (make-world ... ... ... ... boolean)
; Template
; (define ORIGINAL-WORLD (make-world REST-SCENE-CHAR INITIAL-POSN REST-SCENE-BOX RANDOM-BOX #boolean)) 

(define ORIGINAL-WORLD (make-world REST-SCENE-CHAR INITIAL-POSN REST-SCENE-BOX RANDOM-BOX #false))








;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;KEY HANDLERS
                            
;Given a current world state and a keyevent (in this case pressing w), return what will happen to the program aka the newly updated world.
;w-keyaction: World -> World
;Interpretation: the newly updated world function after having done a keyevent (pressed W)
;Header:
;(define (w-keyaction .. ..) (cond [( ........) ...]
;Template:
;(define (w-keyaction w key)
;(cond
;(key=? ..... ( ..... ) ....)

;Code
(define (w-keyaction w key)
  (cond
    [(and (key=? key " ") (not (= (character-state (world-char w)) 2))) ;what happens if we press space. Idea got from https://docs.racket-lang.org/teachpack/2htdpuniverse.html?q=space#%28form._world._%28%28lib._2htdp%2Funiverse..rkt%29._space%29%29
         (make-world
          (make-character (character-points (world-char w))
                                      (make-posn ;position of the char wrt the coordinates
                                      (posn-x (character-position (world-char w)))
                                      (posn-y (character-position (world-char w))))
                                      1 ;Character at state 1, getting ready to jump
                                      SUPERMARIO2) ; he will be at version 2 of supermario, which is when he is getting ready to jump.                            
                      (make-posn
                      (+ MOVE-X (posn-x (world-posn w)))   ;Update coordinates of the starting and ending boxes.
                      (+ MOVE-Y (posn-y (world-posn w))))
                     ;
                     (world-current-box w)  
                     (world-next-box w)
                     (world-fail? w))] ;no fail.
    [(or (key=? key "\r") (= (character-state (world-char w)) -1) (not (false? (world-fail? w))))
         (make-world (make-character (character-points (world-char w))
                                     (make-posn ;position of the char wrt the coordinates
                                      (posn-x (character-position (world-char w)))
                                      (posn-y (character-position (world-char w))))
                                     0 ;Character at state 0, doing nothing
                                     SUPERMARIO1) ; he will be at version 1 of supermario, which is when he is relaxing.
                     ORIGINAL-POSITION  ;return to starting box.
                     (world-current-box w)
                     (world-next-box w)
                     #false)] 
        [else w]))
    
 

         
;Tests/Examples

;1)
(check-expect (w-keyaction
               (make-world (make-character 10
                                           (make-posn 50 50) 0 SUPERMARIO1) ;supermario it his initial state, he does not do anything
                                       (make-posn 100 100);update position  of the initial and final boxes respectively.
                                       (make-MB 1
                                                (make-posn 100 100))
                                       (make-MB 2
                                                (make-posn 200 200))
                                       #false)
                           " ")
              (make-world (make-character 10 (make-posn 50 50) 1 SUPERMARIO2)
                          (make-posn 200 20)
                          (make-MB 1 (make-posn 100 100)) 
                          (make-MB 2 (make-posn 200 200))
                          #false)) 

;2)
(check-expect (w-keyaction
               (make-world (make-character 10
                                           (make-posn 50 50) -1 SUPERMARIO1) ;supermario it his initial state, he does not do anything
                                       (make-posn 100 100) ;update position  of the initial and final boxes respectively.
                                       (make-MB 1
                                                     (make-posn 100 100)) ;posns of the start-end boxes respectively.
                                       (make-MB 2
                                                     (make-posn 200 200)) ;posns of the start-end boxes respectively.
                                       #false) ;bool: you have not failed.
                           "\r") ;without this argument, code is not going to compile (test is not going to pass).
               ; then update the coordinates of the supermario while he is ready to jump, but REMEMBER, THE BOX COORDINATES  MUST NOT CHANGE. They will be the same.  
              (make-world (make-character 10
                                          (make-posn 50 50) 0 SUPERMARIO1) ;initial mario state
                          ORIGINAL-POSITION
                          (make-MB 1 
                                        (make-posn 100 100)) ;posns of the start-end boxes respectively.
                          (make-MB 2
                                        (make-posn 200 200)) ;posns of the start-end boxes respectively. 
                          #false))


;3)
(check-expect (w-keyaction (make-world (make-character 10 (make-posn 50 50) -1 SUPERMARIO1)
                                       (make-posn 100 100)
                                       (make-MB 1 (make-posn 100 100))
                                       (make-MB 2 (make-posn 200 200))
                                       #false)
                           "\r")
              (make-world (make-character 10 (make-posn 50 50) 0 SUPERMARIO1)
                          INITIAL-POSN
                          (make-MB 1 (make-posn 100 100))
                          (make-MB 2 (make-posn 200 200))
                          #false))

;4)
(check-expect (w-keyaction ;use tests to check the coordinates of the boxes, the chars, and to see whether you fail or not.
               (make-world (make-character 10 
                                           (make-posn 50 50) 0 SUPERMARIO1) ;supermario it his initial state, he does not do anything
                                       (make-posn 100 100) ;update position  of the initial and final boxes respectively.
                                       (make-MB 1
                                                     (make-posn 100 100))
                                       (make-MB 2
                                                     (make-posn 200 200))
                                       #false) ;bool: you have not failed.
                        " "  ) ;-FIXED-without this argument, code is not going to compile (test is not going to pass).
               ; then update the coordinates of the supermario while he is ready to jump, but REMEMBER, THE BOX COORDINATES  MUST NOT CHANGE. They will be the same.            
              (make-world (make-character 10 (make-posn 50 50) 1 SUPERMARIO2)
                          (make-posn 200 20)
                          (make-MB 1
                                        (make-posn 100 100)) ;posns of the start-end boxes respectively.
                          (make-MB 2
                                        (make-posn 200 200)) ; >>>>>>>
                          #false)) ; bool: failed





;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------






;What happens after we have stopped clicking w? The character will start jumping
;Given a keyevent like before, what will happen after we have clicked on it.
;Interpretation: world after having executed the keyhandler event.
;Header: (define (afterw ... ....)
;Template:
;(define (afterw keypressed  key) (cond .. (key =? ... (make-wolrd (make-char ...... ).... )... (make-posn (posn-x..... (posn y)))))
;Code:
(define (after-w w key) 
  (cond [(key=? key " ") (make-world (make-character (character-points (world-char w))
                                                     (make-posn (posn-x (character-position (world-char w)))
                                                                (posn-y (character-position (world-char w)))) ;coordinates of the supermario will be updated after having pressed the w key.
                                                     2  ;the state also will change
                                                     SUPERMARIO3)  ; and we will use the 3rd version of supermario (Jumping)
                                     (world-posn w) 
                                     (world-current-box w)
                                     (world-next-box w)
                                     (world-fail? w))]
        [else w]))



;Tests/Examples

(check-expect (after-w (make-world (make-character 50 (make-posn 40 40) 1 SUPERMARIO2)
                                       (make-posn 200 200)
                                       (make-MB 1 (make-posn 100 100))
                                       (make-MB 2 (make-posn 200 200))
                                       #false)
                           " ")
              (make-world (make-character 50 (make-posn 40 40) 2 SUPERMARIO3)
                          (make-posn 200 200)
                          (make-MB 1 (make-posn 100 100))
                          (make-MB 2 (make-posn 200 200))
                          #false))






 







;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 




;Given some parameters like points, etc, return the overall scenery of the game.
;Interpretation: Scenery of our game after pressing w.
;Header (define (scenery w) (local [ ...]]]
;Template (define (scenery w  (local [ (Define points ...) (define counter ...))
;Code:
(define (scenery w)
  (local [
          ; Given a string, return an image showing the points 
          ; scenery: string -> image
          ;interpretation: an image showing the points.
          ;Header (define points (text (... "points" ( ... (..) "color"))
          ;Template:
          ;(define points (text (string-append "points: " (number->string (character-points (world-char w)))) "color"))
          ;Code:
          (define points (text (string-append "Points: " (number->string (character-points (world-char w)))) 30 "red"))

         
          ;Next we design a counter in bottom of the page which  shows how much power you are applying to the key, and if you fail the game with a certain amount of push given,
          ;depending on if the attempt was low or more than it should, you see the counter all the times you attempt jumping, and act accordingly (use more or less power).
          ;AKA use the counter push button (w) accordingly to the move needs of the supermario.
          ;header (define (counter .. (shapetobeused - rectangle number color))
          ;template:
          ;(define (counter coun) (rectangle number "color"))
          ;Code:
          (define (counter c) (rectangle c 40 "solid" "red")) 
          ] 
  (cond  ;what screen is shown to the real user after having failed to comply with the game requirements?
    ; A FAIL SCENE.
    ;this will compile after creating the end screen (comment TBD SOON)
    [(not (false? (world-fail? w))) (place-image end 750 450 BG)]   ;teammates, please play with the image coordinates x and y and see which suit best.
    [(= (character-state (world-char w)) -1) (place-image start 750 450 BG)] ;This is the scene shown to the user after having received the FAIL Screen before.
    ;thus this returns the image back to the starting state to give the game user the chance to attempt jumping the supermario again.

    ;What happens if the game does not fail?
    ;Then simply we must update the supermario positions, the in-between position of boxes, the counter, the number of points accumulated.
    [else (place-image (counter (/ (posn-x (world-posn w)) 2)) (/ BG-WIDTH 2) 850
                       (place-image points 100 50
                                     (place-image
                                     (character-frame (world-char w)) 
                                               (posn-x (character-position (world-char w)))
                                               (posn-y (character-position (world-char w))) 
                                               (place-image (vector-ref boxes (MB-boxes-look (world-next-box w)))
                                                        (posn-x (MB-position-of-boxes (world-next-box w)))
                                                        (posn-y (MB-position-of-boxes (world-next-box w)))
                                                        (place-image (vector-ref boxes (MB-boxes-look (world-current-box w)))
                                                                (posn-x (MB-position-of-boxes (world-current-box w)))
                                                               (posn-y (MB-position-of-boxes (world-current-box w)))
                                                                BG)))))])))


(check-expect (scenery (make-world (make-character 20 (make-posn 60 70) 2 SUPERMARIO3)
                                      INITIAL-POSN 
                                      (make-MB 0
                                               (make-posn 10 10))
                                      (make-MB 1
                                               (make-posn 20 20)) 
                                      #false))
              (place-image (rectangle 150 40 "solid" "red") 750 850 
                           (place-image (text (string-append "Points: " "20") 30 "red") 100 50
                                        (place-image SUPERMARIO3 60 70
                                                     (place-image (vector-ref boxes 1) 20 20
                                                                  (place-image (vector-ref boxes 0) 10 10 BG))))))

 
 

 


;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



 



; new-world: World -> World
; New-world takes a current world, and returns a newly updated world after some events have occured on it.
; Header (define (new-world w) (... [ ....]...
; Template (define (new-world w (local [ (define (move-char w) (make-world ......] ..... ))
; Interpretation: the definition of the newly updated world
;Code:
(define (new-world w)  ;Hint: Teammates: Use (local [  and define the move char function inside it with the newly incremented world inside it. Also increment points on it,  fix parameters and define the state of supermario.
  (local [  ;Local will help us evaluate ALL of the following definitions in order, heading next to he body of the functions.
          ;Given a world, return a newly updated world.
          ;move-char: World-> World
          ;Interpretation: the newly updated world incremented.
          (define (move-char w) (make-world (make-character (character-points (world-char w))
                                                            (make-posn ;update posn of characters wrt the x,y coordinates.
                                                             (+ smallx (posn-x (character-position (world-char w))))
                                                             (+ smally (posn-y (character-position (world-char w)))))
                                                            2
                                                            SUPERMARIO3)  ; 4 parameters, posn, curr box, next box, boolean
                                            (world-posn w)
                                            (world-current-box w)
                                            (world-next-box w)
                                            (world-fail? w)))
          ; a MB is one of:
          ; (make-MB (gamebox-boxes-look b)
          ; where gamebox--boxes-look shows the box we're in right now.
          ; b the position-of-boxes 
          ; Given an MB, return the newly updated MB with the character on it.
          ; Interpretation: newly updated MB with char on top of it.
          ; header (define (MB g) (.... (.. ..) (make-posn (........) ......).....)
          ;Template: (define (move-box b) (make-MB (MB-boxes-look b)
          (define (move-box b) (make-MB (MB-boxes-look b)
                                             (make-posn (- (posn-x (MB-position-of-boxes b)) smallx)  ;Insert position of boxes taking into consideration the x and y coordinates.
                                                        (- (posn-y (MB-position-of-boxes b)) smally))))]
  ;RESET THE SCENERY
  (cond 
        ;; SUPERMARIO3
    ;the error might be in the following line,  we must fix it [(= (character-state (world-char w)) 2)          
        [(= (character-state (world-char w)) 2)  
         ; Conditions, if char manages to arrive ending box.
         (if (and (< (posn-x (character-position (world-char w))) (posn-x (world-posn w)))
                  (> (posn-y (character-position (world-char w))) (posn-y (world-posn w)))) ;Characted did not manage to arrive to the ending box,
             (move-char w) ;The following line checks whether the character reaches the ending state
             (if (and 
                   (< (posn-x (world-posn w)) ;next line moves the car to the left
                      (+ (posn-x (MB-position-of-boxes (world-next-box w))) BOX-WIDTH))
                   (> (posn-x (world-posn w)) ;Next Line moves the char to the right
                      (- (posn-x (MB-position-of-boxes (world-next-box w))) BOX-WIDTH)) 
                   (> (posn-y (world-posn w)) ;Next Line moves the char upwards
                      (- (posn-y (MB-position-of-boxes (world-next-box w))) BOX-HEIGHT)) 
                   (< (posn-y (world-posn w)) ;Next Line moves the char downwards
                      (+ (posn-y (MB-position-of-boxes (world-next-box w))) BOX-HEIGHT)))
                 (begin (sleep 1) (make-world (make-character (add1 (character-points (world-char w))) ;;https://docs.racket-lang.org/htdp-langs/advanced.html?q=sleep#%28def._htdp-advanced._%28%28lib._lang%2Fhtdp-advanced..rkt%29._sleep%29%29 |||||https://docs.racket-lang.org/htdp-langs/advanced.html?q=begin#%28form._%28%28lib._lang%2Fhtdp-advanced..rkt%29._begin%29%29
                                                              ORIGINAL-POSITION ;Move character back to original position
                                                              0         ;Character at state 0.
                                                              SUPERMARIO3) ;Character jumping.
                                              INITIAL-POSN ;Move boxes back to their  initial position
                                              (make-MB (MB-boxes-look (world-next-box w)) POS-ORIG-BOX) ;Original box will be replaced with the final box.
                                              (make-MB (random 0 3) POS-NEXT-BOX) ;Create a random final box.
                                              (world-fail? w)))  ;Teammate: use a helper method to delay the program for a couple of seconds.
                 (begin (sleep 5) (make-world (make-character 0  ;Begin is used for returning the last value of all the subexpressions given.
                                                              ORIGINAL-POSITION ;Move character back to original position. /// The helper method used is sleep
                                                              0
                                                              SUPERMARIO1) ;Reset Supermario to original relaxing state.
                                              INITIAL-POSN     ;Move boxes back to their initial positions
                                              (world-current-box w) ;4 params -> satisfied.
                                              (world-next-box w)
                                              #true))))]   ;Q: is there any difference between writing #t and #true? 
        [else w])))

 


;Tests/Examples

(check-expect (new-world (make-world
                          (make-character 10
                                          (make-posn 80 50)
                                          -2
                                          SUPERMARIO3) 
                               (make-posn 160 50)
                               (make-MB 2 
                                        (make-posn 250 750))
                               (make-MB 2
                                        (make-posn 1100 140))
                               #false))
              (make-world (make-character 11 ORIGINAL-POSITION 0 SUPERMARIO1)
                                              INITIAL-POSN 
                                              (make-MB 2 POS-ORIG-BOX)
                                              (make-MB (random 0 3) POS-NEXT-BOX)
                                              #false))

 

 




;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



 





; Nothing -> World
; Run the game with an initial world
;Add the  5 parameters required for the world function
; original-world, scenery, after-w, w-keyaction, new-world
(define (main )
  (big-bang ORIGINAL-WORLD
    [to-draw scenery]
    [on-key w-keyaction]
    [on-release after-w] 
    [on-tick new-world]))

(main )









;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;Errors that made our life hard:
;To be constantly updated:
;REST-SCENE-BOX is used here before its definition
;REST-SCENE-CHAR is used here before its definition
;RANDOM-BOX is used here before its definition
;MAJOR TIME CONSUMING ISSUES WITH SLOW RACKET RUNNING, HAD TO KILL APP AND RESTART LIKE 20 TIMES


                