!classDefinition: #TicTacToeConsoleTest category: #TicTacToe!
TestCase subclass: #TicTacToeConsoleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'j a p 5/31/2018 20:12:39'!
test01NoActivityImpliesNoConsoleOutput

	| game console output|

	game _ TicTacToe new.
	console  _ ConsoleObserver new initializeWith: game.
	
		
	output _ console lines.	

	self assert: output isEmpty ! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'j a p 5/31/2018 20:13:17'!
test02ConsoleObserverPrintsXPlay

	| game console output|

	game _ TicTacToe new.
	console  _ ConsoleObserver new initializeWith: game.
	
	game markWithXAt: 2@2.
	
	output _ console lines.	

	self assert: (output at: 1) equals: 'X marc� en 2@2'.
	self assert: (output at: 2) equals: 'Estado: Jugando O'.! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'j a p 5/31/2018 20:17:19'!
test03ConsolePrintsTwoPlays

	| game console output |

	game _ TicTacToe new.
	console  _ ConsoleObserver new initializeWith: game.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.

	
	output _ console lines.	

	self assert: (output at: 1) equals: 'X marc� en 2@2'.
	self assert: (output at: 2) equals: 'Estado: Jugando O'.
	self assert: (output at: 3) equals: 'O marc� en 1@1'.
	self assert: (output at: 4) equals: 'Estado: Jugando X'.
! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'j a p 5/31/2018 20:18:57'!
test04ConsolePrintsThreePlays

	| game console output |

	game _ TicTacToe new.
	console  _ ConsoleObserver new initializeWith: game.
	
	game  markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.

	
	output _ console lines.	

	self assert: (output at: 1) equals: 'X marc� en 2@2'.
	self assert: (output at: 2) equals: 'Estado: Jugando O'.
	self assert: (output at: 3) equals: 'O marc� en 1@1'.
	self assert: (output at: 4) equals: 'Estado: Jugando X'.
	self assert: (output at: 5) equals: 'X marc� en 1@3'.
	self assert: (output at: 6) equals: 'Estado: Jugando O'.
! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'j a p 5/31/2018 20:28:58'!
test05ConsolePrintsFourPlayGameAndXWinning

	| game console output |

	game _ TicTacToe new.
	console  _ ConsoleObserver new initializeWith: game.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game  markWithXAt: 1@3.
	game markWithOAt: 1@2.
	game markWithXAt: 3@1.
	
	output _ console lines.	

	self assert: (output at: 1) equals: 'X marc� en 2@2'.
	self assert: (output at: 2) equals: 'Estado: Jugando O'.
	self assert: (output at: 3) equals: 'O marc� en 1@1'.
	self assert: (output at: 4) equals: 'Estado: Jugando X'.
	self assert: (output at: 5) equals: 'X marc� en 1@3'.
	self assert: (output at: 6) equals: 'Estado: Jugando O'.
	self assert: (output at: 7) equals: 'O marc� en 1@2'.
	self assert: (output at: 8) equals: 'Estado: Jugando X'.
	self assert: (output at: 9) equals: 'X marc� en 3@1'.
	self assert: (output at: 10) equals: 'Estado: Juego terminado - Gan� X!!'.
	! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'j a p 5/31/2018 20:31:18'!
test06ConsolePrintsFivePlayGameAndOWinning

	| game console output |

	game _ TicTacToe new.
	console  _ ConsoleObserver new initializeWith: game.
	
	game markWithXAt: 1@1.
	game markWithOAt: 3@1.
	game  markWithXAt: 1@2.
	game markWithOAt: 3@2.
	game markWithXAt: 2@2.
	game markWithOAt: 3@3.
	
	output _ console lines.	

	self assert: (output at: 1) equals: 'X marc� en 1@1'.
	self assert: (output at: 2) equals: 'Estado: Jugando O'.
	self assert: (output at: 3) equals: 'O marc� en 3@1'.
	self assert: (output at: 4) equals: 'Estado: Jugando X'.
	self assert: (output at: 5) equals: 'X marc� en 1@2'.
	self assert: (output at: 6) equals: 'Estado: Jugando O'.
	self assert: (output at: 7) equals: 'O marc� en 3@2'.
	self assert: (output at: 8) equals: 'Estado: Jugando X'.
	self assert: (output at: 9) equals: 'X marc� en 2@2'.
	self assert: (output at: 10) equals: 'Estado: Jugando O'.
	self assert: (output at: 11) equals: 'O marc� en 3@3'.
	self assert: (output at: 12) equals: 'Estado: Juego terminado - Gan� O!!'.
	! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'j a p 5/31/2018 20:47:06'!
test07ConsolePrintsTiedGame

	| game console output |

	game _ TicTacToe new.
	console  _ ConsoleObserver new initializeWith: game.
	
	game markWithXAt:1@1.
	game markWithOAt:1@2.
	game markWithXAt:1@3.
	game markWithOAt:2@1.
	game markWithXAt:2@3.
	game markWithOAt:2@2.
	game markWithXAt:3@1.
	game markWithOAt:3@3.
	game markWithXAt:3@2.
	
	output _ console lines.	

	self assert: (output last) equals: 'Estado: Juego terminado - Empate!!'.
! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'SS 6/3/2018 22:20:39'!
test08BoardViewPrintsEmptyGame

	| game board output |

	game _ TicTacToe new.
	board  _ BoardViewObserver new initializeWith: game.
		
	output _ board lines.	

	self assert: (output at:1) equals: ' | | '.
	self assert: (output at:2) equals: '-----' .
	self assert: (output at:3) equals:  ' | | '.
	self assert: (output at:4) equals:  '-----'.
	self assert: (output at:5) equals:  ' | | '.
	self assert: (output at:6) equals:  'Playing X'.
! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'SS 6/3/2018 22:20:48'!
test09BoardViewPrintsXPlay

	| game board output |

	game _ TicTacToe new.
	board  _ BoardViewObserver new initializeWith: game.
	
	game markWithXAt:2@2.
	
	output _ board lines.	

	self assert: (output at:1) equals: ' | | '.
	self assert: (output at:2) equals: '-----' .
	self assert: (output at:3) equals:  ' |X| '.
	self assert: (output at:4) equals:  '-----'.
	self assert: (output at:5) equals:  ' | | '.
	self assert: (output at:6) equals:  'Playing O'.
! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'SS 6/3/2018 22:21:10'!
test10BoardViewPrintsTwoPlays

	| game board output |

	game _ TicTacToe new.
	board  _ BoardViewObserver new initializeWith: game.
	
	game markWithXAt:2@2.
	game markWithOAt:1@1.

	output _ board lines.	

	self assert: (output at:1) equals: 'O| | '.
	self assert: (output at:2) equals: '-----' .
	self assert: (output at:3) equals:  ' |X| '.
	self assert: (output at:4) equals:  '-----'.
	self assert: (output at:5) equals:  ' | | '.
	self assert: (output at:6) equals:  'Playing X'.
! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'SS 6/3/2018 22:21:23'!
test11BoardViewPrintsXWon

	| game board output |

	game _ TicTacToe new.
	board  _ BoardViewObserver new initializeWith: game.
	
	game markWithXAt:2@2.
	game markWithOAt: 1@3.
	game markWithXAt:1@1.
	game markWithOAt: 1@2.
	game markWithXAt:3@3.

	output _ board lines.	

	self assert: (output at:1) equals: 'X|O|O'.
	self assert: (output at:2) equals: '-----' .
	self assert: (output at:3) equals:  ' |X| '.
	self assert: (output at:4) equals:  '-----'.
	self assert: (output at:5) equals:  ' | |X'.
	self assert: (output at:6) equals:  'X Won!!'.
! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'SS 6/3/2018 22:21:31'!
test12BoardViewPrintsTiedGame


	| game board output |

	game _ TicTacToe new.
	board  _ BoardViewObserver new initializeWith: game.
	
	game markWithXAt:1@1.
	game markWithOAt:1@2.
	game markWithXAt:1@3.
	game markWithOAt:2@1.
	game markWithXAt:2@3.
	game markWithOAt:2@2.
	game markWithXAt:3@1.
	game markWithOAt:3@3.
	game markWithXAt:3@2.
	

	output _ board lines.	

	self assert: (output at:1) equals: 'X|O|X'.
	self assert: (output at:2) equals: '-----' .
	self assert: (output at:3) equals:  'O|O|X'.
	self assert: (output at:4) equals:  '-----'.
	self assert: (output at:5) equals:  'X|X|O'.
	self assert: (output at:6) equals:  'Tied!!'.
! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'SS 6/3/2018 22:26:08'!
test13BoardViewPrintsOWon

	| game board output |

	game _ TicTacToe new.
	board  _ BoardViewObserver new initializeWith: game.
	
	game markWithXAt:2@2.
	game markWithOAt: 1@3.
	game markWithXAt:3@3.
	game markWithOAt: 1@2.
	game markWithXAt:2@3.
	game markWithOAt: 1@1.

	output _ board lines.	

	self assert: (output at:1) equals: 'O|O|O'.
	self assert: (output at:2) equals: '-----' .
	self assert: (output at:3) equals:  ' |X|X'.
	self assert: (output at:4) equals:  '-----'.
	self assert: (output at:5) equals:  ' | |X'.
	self assert: (output at:6) equals:  'O Won!!'.
! !


!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/27/2017 17:25:54'!
functionalException

	^Error - MessageNotUnderstood! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/26/2017 15:10:54'!
test01GameStartsWithAnEmptyBoarAndPlayingX

	"I initialize it on each test and not in the setUp to facilitate the restar of the test - Hernan"
	
	game _ TicTacToe new.

	self assertXIsMarkedOn: {} andOOn: {}.
	self assertIsPlayingX.
	
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:35'!
test02AfterMarkingWithXGameKeepsMarkAndNextPlayerIsO

	game _ TicTacToe new.
	
	game markAll: {1@1}.

	self assertXIsMarkedOn: {1@1} andOOn: {}.
	self assertIsPlayingO

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:31'!
test03AfterMarkingWithOGameKeepsMarkAndNextPlayerIsY

	game _ TicTacToe new.

	game markAll: { 1 @ 1. 2 @ 2 }.

	self assertXIsMarkedOn: {1@1} andOOn: {2@2}.
	self assertIsPlayingX.

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:28'!
test04CanNotMarkWithXWhenLastMarkWasX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:23'!
test05CanNotMarkWithOWhenLastMarkWasO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:19'!
test06CanNotMarkWithXAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:16'!
test07CanNotMarkWithXAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:12'!
test08CanNotMarkWithOAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.
	
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:08'!
test09CanNotMarkWithOAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2. 3@3 }.

	self
		should: [ game markWithOAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1. 3@3} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:04'!
test10XWinsWhenCompletesRowNumber1

	game _ TicTacToe new.

	game markAll: {1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self assertXWon.
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:59'!
test11XWinsWhenCompletesRowNumber2

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 3@1. 2@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:54'!
test12XWinsWhenCompletesRowNumber3

	game _ TicTacToe new.

	game markAll: {3@1. 1@1. 3@2. 2@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:50'!
test13XWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 1@1. 2@2. 1@2. 3@3. 1@3}.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:45'!
test14XWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 1@1. 1@2. 2@2. 1@3. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:41'!
test15XWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: { 1@3. 1@2. 2@2. 2@1. 3@ 1 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:35'!
test16OWinsWhenCompletesARow

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 1@2. 3@1. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:31'!
test17OWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 3@3. 1@2. 2@3. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:25'!
test18OWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 3@2. 1@3. 1@2. 2@2. 1@1. 3@1 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:20'!
test19OWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: {1@2. 1@1. 1@3. 2@2. 2@1. 3@3 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:15'!
test20OCanNotPlayWhenXWon

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:12'!
test21XCanNotPlayWhenOWon

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 2@1. 1@2. 3@1. 1@3 }.

	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: { 2@2. 2@1. 3@1 } ]
		! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:08'!
test22GameCanEndUpTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self assertGameIsTied! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:01'!
test23XCanWinOnLastEmptyPosition

	game _ TicTacToe new.

	game markAll: { 2@2. 1@2. 1@1. 2@1. 1@3. 2@3. 3@2. 3@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:41:58'!
test24CanNotPlayWhenGameIsTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'JG 5/12/2018 13:23:11'!
test25CanNotMarkOutsideBoard

	game _ TicTacToe new.

	#(0 4) do: [ :aPositionComponent |
		self assertCanNotMarkAt: aPositionComponent @ 1.
		self assertCanNotMarkAt: 1 @ aPositionComponent ].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:49:43'!
test26OCanNotMarkWhenGameIsOver

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !


!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:06'!
assertCanNotMarkAt: aPosition

	self assertCanNotMarkUsing: [ game markWithXAt: aPosition ].
	self assertCanNotMarkUsing: [ game markWithOAt: aPosition ].
	
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:29'!
assertCanNotMarkUsing: aMarkingClosure

	self
		should: aMarkingClosure 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionOutsideBoardErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:14'!
assertGameIsNotOver

	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:48'!
assertGameIsOver
	
	self assert: game isOver.

	self deny: game isPlayingX.
	self deny: game isPlayingO.
		
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:40:41'!
assertGameIsTied

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:13:05'!
assertIsPlayingO
	
	self deny: game isPlayingX.
	self assert: game isPlayingO.
	self assertGameIsNotOver ! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:05'!
assertIsPlayingX
		
	self assert: game isPlayingX.
	self deny: game isPlayingO.
	self assertGameIsNotOver.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:38:07'!
assertOIsMarkedOn: oPositions
		
	self assert: oPositions size equals: game playerOPositions size.
	self assert: (game playerOPositions difference: oPositions) isEmpty.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:32:18'!
assertOWon

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.
	self deny: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:56'!
assertXIsMarkedOn: xPositions

	self assert: xPositions size equals: game playerXPositions size.
	self assert: (game playerXPositions difference: xPositions) isEmpty.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:44'!
assertXIsMarkedOn: xPositions andOOn: oPositions
 
	self assertXIsMarkedOn: xPositions.
	self assertOIsMarkedOn: oPositions.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:30'!
assertXWon
	
	self assertGameIsOver.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.
! !


!classDefinition: #Observer category: #TicTacToe!
Object subclass: #Observer
	instanceVariableNames: 'game lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!Observer methodsFor: 'initialization' stamp: 'j a p 5/31/2018 20:01:53'!
initializeWith: aTicTacToe
	lines := OrderedCollection new.
	game := aTicTacToe.
	game addObserver: self.! !


!Observer methodsFor: 'accessing' stamp: 'j a p 5/31/2018 19:57:15'!
lines
	^ lines copy.! !


!Observer methodsFor: 'observer triggers' stamp: 'SS 6/3/2018 22:27:31'!
oPlayed: aPosition
	self subclassResponsibility ! !

!Observer methodsFor: 'observer triggers' stamp: 'SS 6/3/2018 22:27:43'!
xPlayed: aPosition
	self subclassResponsibility ! !


!classDefinition: #BoardViewObserver category: #TicTacToe!
Observer subclass: #BoardViewObserver
	instanceVariableNames: 'rowString colString'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!BoardViewObserver methodsFor: 'printing' stamp: 'j a p 6/4/2018 12:53:12'!
printBoard
	lines _ OrderedCollection new.
	(1 to: 3) do: [:lineNumber | self printBoardLine: lineNumber	].
! !

!BoardViewObserver methodsFor: 'printing' stamp: 'j a p 6/4/2018 13:06:36'!
printBoardLine: aLineNumber
	rowString _ ''.
	(1 to: 3) do: [ : aColumnNumber | self printBoardPositionInLine: aLineNumber andColumn: aColumnNumber ].
	lines add: rowString .
	(aLineNumber = 3 ) ifFalse: [lines add: '-----'].! !

!BoardViewObserver methodsFor: 'printing' stamp: 'j a p 6/4/2018 12:58:02'!
printBoardPositionInLine: aLineNumber andColumn: aColumnNumber
	| charToAdd |

	(game playerXPositions includes: aLineNumber@aColumnNumber)
		ifTrue: [ charToAdd _ 'X']
		ifFalse: [ (game playerOPositions includes: aLineNumber@aColumnNumber)
							ifTrue: [ charToAdd _ 'O']
							ifFalse: [charToAdd  _ ' ']].

	(aColumnNumber = 3)
		ifTrue: [colString _ charToAdd]
		ifFalse:[colString _ (charToAdd ,'|')].
	rowString  _ (rowString, colString).
	
	
	
	"Esta solucion tiene ifs, debido a que no vimos alternativa viable que lo evite.
	Una forma de evitarlo era almacenar adicionalmente una matriz con las jugadas hechas, pero esto significaria repetir datos, tendriamos las dos listas de tuplas y la matriz con las jugadas
	Otra manera es directamente reemplazar las dos listas de tuplas por la matriz de jugadas hechas, pero requiere un refactor de todo el codigo, y en clase dijeron que no habia que modificar tanto la estructura original del TicTacToe"! !


!BoardViewObserver methodsFor: 'initialization' stamp: 'SS 6/3/2018 22:24:40'!
initializeWith: aTicTacToe
	super initializeWith: aTicTacToe.
	lines add: ' | | '.
	lines add: '-----' .
	lines add: ' | | '.
	lines add: '-----'.
	lines add: ' | | '.
	lines add: 'Playing X'.! !


!BoardViewObserver methodsFor: 'observer triggers' stamp: 'SS 6/3/2018 13:25:20'!
oPlayed: aPosition
	self printBoard.
	game hasPlayerOWon ifTrue: [ lines add: 'O Won!!' ]
		ifFalse: [ lines add: 'Playing X'. ]
	
! !

!BoardViewObserver methodsFor: 'observer triggers' stamp: 'SS 6/3/2018 22:19:23'!
xPlayed: aPosition
	self printBoard.
	game hasPlayerXWon ifTrue: [ lines add: 'X Won!!' ]
							  ifFalse: [ game isTied ifTrue: [lines add: 'Tied!!'] ifFalse:[ lines add: 'Playing O'.] ]
	
! !


!classDefinition: #ConsoleObserver category: #TicTacToe!
Observer subclass: #ConsoleObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!ConsoleObserver methodsFor: 'observer triggers' stamp: 'j a p 5/31/2018 20:31:59'!
oPlayed: aPosition
	lines add: 'O marc� en ', aPosition printString.
	game hasPlayerOWon ifTrue: [ lines add: 'Estado: Juego terminado - Gan� O!!' ]
							  ifFalse: [ lines add: 'Estado: Jugando X'. ]
	
! !

!ConsoleObserver methodsFor: 'observer triggers' stamp: 'j a p 5/31/2018 20:45:35'!
xPlayed: aPosition
	lines add: 'X marc� en ', aPosition printString.
	game hasPlayerXWon ifTrue: [ lines add: 'Estado: Juego terminado - Gan� X!!' ]
							  ifFalse: [ game isTied ifTrue: [lines add: 'Estado: Juego terminado - Empate!!'] ifFalse:[ lines add: 'Estado: Jugando O'. ] ]
	
! !


!classDefinition: #TicTacToe category: #TicTacToe!
Object subclass: #TicTacToe
	instanceVariableNames: 'state playerOPositions playerXPositions observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'initialization' stamp: 'j a p 5/31/2018 19:31:57'!
initialize
	playerXPositions _ OrderedCollection new.
	playerOPositions _ OrderedCollection new.
	state _ PlayingX for: self.
	observers _ OrderedCollection new.! !


!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:39'!
markAll: positions

	positions do: [ :aPosition | self markAt: aPosition ]! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:23'!
markAt: aPosition

	^state markAt: aPosition ! !

!TicTacToe methodsFor: 'marking board' stamp: 'j a p 5/31/2018 20:00:11'!
markWithOAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithOAt: aPosition.
	observers do: [:anObserver | anObserver oPlayed: aPosition].! !

!TicTacToe methodsFor: 'marking board' stamp: 'j a p 5/31/2018 20:00:02'!
markWithXAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithXAt: aPosition.
	observers do: [:anObserver | anObserver xPlayed: aPosition].! !


!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:41:25'!
add: aPosition to: positions nextPlayerState: nextPlayingState winnerState: winnerState

	positions add: aPosition.
	state := (self stateAfterAddingTo: positions with: nextPlayingState and: winnerState) for: self
	! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'j a p 6/4/2018 12:20:53'!
addAnXToBoardViewInRow: aRow andColumn: aColumn! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:35:08'!
assertIsFree: aPosition

	(self isTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/27/2017 10:26:10'!
assertIsInBoardBounds: aPosition

	(aPosition between: 1@1 and: 3@3) ifFalse: [ self error: self class positionOutsideBoardErrorMessage ]! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'JG 5/12/2018 12:34:04'!
markWithOWhenPlayingOAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerOPositions
		nextPlayerState: PlayingX
		winnerState: PlayerOWon.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOWhenPlayingXAt: aPosition
	self error: self class notOTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXWhenPlayingOAt: aPoint
	self error: self class notXTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXWhenPlayingXAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerXPositions
		nextPlayerState: PlayingO
		winnerState: PlayerXWon.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:44:57'!
stateAfterAddingTo: positions with: nextPlayingState and: winnerState

	(self hasWin: positions) ifTrue: [ ^ winnerState ].
	self shouldBeTiedWhenNoOneWon ifTrue: [ ^ GameTied ].

	^ nextPlayingState.! !


!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 13:32:14'!
isOver
	
	^state isOver! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:01'!
isTied
	
	^ state isTied! !


!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:38'!
isPlayingO
	
	^state isPlayingO! !

!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:14'!
isPlayingX
	
	^state isPlayingX ! !


!TicTacToe methodsFor: 'testing board positions' stamp: 'HAW 10/25/2017 15:50:52'!
isTaken: aPosition
	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].! !


!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:16'!
playerOPositions
	^ playerOPositions copy.! !

!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:32'!
playerXPositions
	^ playerXPositions copy.! !


!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:22:42'!
has: positions threeOf: aPositionComponent

	^(positions collect: aPositionComponent) asBag contents values includes: 3 
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:09:34'!
hasCompletedColumn: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition x ]
	
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:25:55'!
hasCompletedDiagonal: positions 
	
	^(self hasUpDiagonal: positions) or: [self hasDownDiagonal: positions]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:10:47'!
hasCompletedLine: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition y ]
! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:25:48'!
hasCompletedStraightLine: positions
	
	^(self hasCompletedColumn: positions) or: [self hasCompletedLine: positions ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasUpDiagonal: positions
	
	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:26:17'!
hasWin: positions

	^positions size >= 3 and: [ (self hasCompletedStraightLine: positions) or: [ self hasCompletedDiagonal: positions ]].
		
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:44:42'!
shouldBeTiedWhenNoOneWon

	^ playerXPositions size = 5 and: [ playerOPositions size = 4 ].! !


!TicTacToe methodsFor: 'observer messages' stamp: 'j a p 5/31/2018 20:02:13'!
addObserver: anObserver
	observers add: anObserver .! !

!TicTacToe methodsFor: 'observer messages' stamp: 'j a p 5/31/2018 19:46:17'!
notify: aMessageName
	observers do: [:anObserver | (Message new initializeWith: aMessageName ) sendTo: anObserver ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToe!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notOTurnErrorMessage
	
	^'Not O''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notXTurnErrorMessage
	
	^'Not X''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/27/2017 10:26:31'!
positionOutsideBoardErrorMessage
	
	^'Position is outside board'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeState category: #TicTacToe!
Object subclass: #TicTacToeState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerOWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerXWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isOver
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isTied
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingO
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingX
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:31'!
markAt: aPosition

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	self subclassResponsibility.! !


!TicTacToeState methodsFor: 'initialization' stamp: 'HAW 10/25/2017 13:05:13'!
initializeFor: aGame

	game := aGame ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToe!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:05:29'!
for: aTicTacToe 
	
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #GameOverState category: #TicTacToe!
TicTacToeState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameOverState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 11:53:57'!
isOver
	
	^true! !


!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:23'!
isPlayingO
	
	^false! !

!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:27'!
isPlayingX
	
	^false! !


!GameOverState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:09'!
markAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #GameTied category: #TicTacToe!
GameOverState subclass: #GameTied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:49'!
isTied
	
	^true! !


!classDefinition: #PlayerOWon category: #TicTacToe!
GameOverState subclass: #PlayerOWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ true.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:06:24'!
isTied
	
	^false! !


!classDefinition: #PlayerXWon category: #TicTacToe!
GameOverState subclass: #PlayerXWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ true.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:25:44'!
isTied
	
	^false! !


!classDefinition: #PlayingState category: #TicTacToe!
TicTacToeState subclass: #PlayingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:10'!
hasPlayerOWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:17'!
hasPlayerXWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:26'!
isOver
	
	^false! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:52'!
isTied
	
	^false! !


!classDefinition: #PlayingO category: #TicTacToe!
PlayingState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:36'!
isPlayingO
	
	^true! !

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:27'!
isPlayingX
	
	^false! !


!PlayingO methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:13'!
markAt: aPosition

	^game markWithOAt: aPosition ! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:45'!
markWithOAt: aPosition
	game markWithOWhenPlayingOAt: aPosition.! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXAt: aPosition
	game markWithXWhenPlayingOAt: aPosition.! !


!classDefinition: #PlayingX category: #TicTacToe!
PlayingState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:50'!
isPlayingO
	
	^false! !

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:23'!
isPlayingX
	
	^true! !


!PlayingX methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:17'!
markAt: aPosition

	^game markWithXAt: aPosition ! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOAt: aPosition
	game markWithOWhenPlayingXAt: aPosition.! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXAt: aPosition
	game markWithXWhenPlayingXAt: aPosition.! !
