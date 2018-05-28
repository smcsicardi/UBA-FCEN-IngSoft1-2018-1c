!classDefinition: #TicTacToeTest category: #TicTacToStep21!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 09:59:04'!
test01

	|game|
	
	game := TicTacToe new.
	
	self assert: game Xs isEmpty.
	self assert: game Os isEmpty.
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:20:33'!
test02

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	
	self assert: 1 equals: game Xs size.
	self assert: (game Xs includes: 1@1).
	self assert: game Os isEmpty.
	
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:50:55'!
test03

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	
	self assert: 1 equals: game Xs size.
	self assert: (game Xs includes: 1@1).
	self assert: 1 equals: game Os size.
	self assert: (game Os includes: 2@2).
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:01:26'!
test04

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	
	self
	should: [game putXAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: game Os isEmpty.
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:08:58'!
test05

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putOAt: 3@3]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:18:20'!
test06

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putXAt: 1@1]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:37:38'!
test07

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putXAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:45:04'!
test08

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	self
	should: [game putOAt: 1@1]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert:  game Os isEmpty.

		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:12:12'!
test09

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	game putXAt: 3@3.
	self
	should: [game putOAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 2 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: (game Xs includes: 3@3).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
test10
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 3.
	self deny: game OHasWon.
	self deny: game hasPlayerXWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
test11
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 3.
	game putXAt: 1 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
test12
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
test13
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 3 @ 2.
	game putOAt: 2 @ 1.
	game putXAt: 3 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
test14
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 3.
	game putXAt: 3 @ 1.
	self assert: game hasPlayerXWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
test15
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 2 @ 3.
	game putXAt: 3 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
test16
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 1 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
test17
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 3 @ 3.
	game putOAt: 1 @ 3.
	self assert: game OHasWon.
	self deny: game hasPlayerXWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:15:12'!
test18

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.	
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 3@1.	
	game putXAt: 1@3.

	self 
		should: [ game putOAt: 3@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 2 equals: game Os size.
			self assert: (game Os includes: 2@1).
			self assert: (game Os includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:22:51'!
test19

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 1@2.
	game putXAt: 3@1.	
	game putOAt: 1@3.

	self 
		should: [ game putXAt: 3@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 3 equals: game Xs size.
			self assert: (game Xs includes: 2@2).
			self assert: (game Xs includes: 2@1).
			self assert: (game Xs includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
test20
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 2 @ 3.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 2.
	game putXAt: 3 @ 3.
	self assert: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game OHasWon.
	self assert: game isTied.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
test21
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 2 @ 3.
	game putXAt: 3 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 3 @ 3.
	self assert: game isOver.
	self assert: game hasPlayerXWon.
	self deny: game OHasWon.
	self deny: game isTied.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:08:14'!
test22OCantPlayFirst

	|game|
	
	game := TicTacToe new.

	game putOAt: 1@1.
	self 
	should: [ game putOAt: 1@1. ]
	raise: Error 		! !


!classDefinition: #TicTacToe category: #TicTacToStep21!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs turn winner gameState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:21:33'!
OHasWon
	
	^winner = #o! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:01:34'!
Os

	^os copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:01:25'!
Xs

	^xs copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:19:23'!
addAnOPosition: anOPosition
	os add: anOPosition.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:19:10'!
addAnXPosition: anXPosition
	xs add: anXPosition.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:51:23'!
hasCompletedColumn: positions
	
	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:36:01'!
hasCompletedRow: positions

	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :posicion | posicion x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:56:21'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]
! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
hasPlayerXWon
	^ winner = #x.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:02:13'!
hasUpDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:01:53'!
hasWin: positions

	^(self hasCompletedRow: positions)
		or: [(self hasCompletedColumn: positions) 
				or: [(self hasDownDiagonal: positions)
					or: [(self hasUpDiagonal: positions)]]]


! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:22:35'!
initialize
	
	xs:= Set new.
	os:= Set new.
	
	turn:= #x.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:17:25'!
isGameOver
	
	^winner = #x or: [ winner = #o ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
isOver
	^ self hasPlayerXWon or: [
		self OHasWon or: [ self isTied ]].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
isTied
	^ xs size = 5 and: [
		os size = 4 and: [ self hasPlayerXWon not ]
		" and: [ self YHasWon not ]]]" ].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:18:30'!
positionTaken: aPosition
	(xs includes: aPosition) or: (os includes: aPosition).! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:16:00'!
putOAt: aPosition

	self isGameOver ifTrue: [ self error: self class canNotPlayWhenGameIsOverErrorMessage ].
	turn = #o ifFalse: [ self error: self class notXTurnErrorMessage ].
	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	os add: aPosition.
	(self hasWin: os) ifTrue: [ ^winner := #o ].
	turn := #x
! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:23:15'!
putXAt: aPosition

	self isGameOver ifTrue: [ self error: self class canNotPlayWhenGameIsOverErrorMessage ].
	turn = #x ifFalse: [ self error: self class notXTurnErrorMessage ].
	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	xs add: aPosition.
	(self hasWin: xs) ifTrue: [ ^winner := #x ].
	turn := #o
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToStep21!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:15:31'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:14:33'!
notOTurnErrorMessage

	^'Not O turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:26:38'!
notXTurnErrorMessage

	^'Not X turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:20:12'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeFinishedState category: #TicTacToStep21!
Object subclass: #TicTacToeFinishedState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:04:37'!
OHasWon
	self subclassResponsibility ! !

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
hasPlayerXWon
	self subclassResponsibility.! !

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:04:41'!
isTied
	self subclassResponsibility ! !

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:16:34'!
putOAt: aPosition
	self error: self class canNotPlayWhenGameIsOverErrorMessage! !

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:16:26'!
putXAt: aPosition
	self error: self class canNotPlayWhenGameIsOverErrorMessage! !


!classDefinition: #TicTacToeOWonState category: #TicTacToStep21!
TicTacToeFinishedState subclass: #TicTacToeOWonState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeOWonState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:02:45'!
OHasWon
	^ true! !

!TicTacToeOWonState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
hasPlayerXWon
	^ false.! !

!TicTacToeOWonState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:02:52'!
isTied
	^ false! !


!classDefinition: #TicTacToeTiedState category: #TicTacToStep21!
TicTacToeFinishedState subclass: #TicTacToeTiedState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeTiedState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:04:06'!
OHasWon
	^false! !

!TicTacToeTiedState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
hasPlayerXWon
	^ false.! !

!TicTacToeTiedState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:04:10'!
isTied
	^true! !


!classDefinition: #TicTacToeXWonState category: #TicTacToStep21!
TicTacToeFinishedState subclass: #TicTacToeXWonState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeXWonState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:03:45'!
OHasWon
	^false! !

!TicTacToeXWonState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
hasPlayerXWon
	^ true.! !

!TicTacToeXWonState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:03:48'!
isTied
	^false! !


!classDefinition: #TicTacToeTurnState category: #TicTacToStep21!
Object subclass: #TicTacToeTurnState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeTurnState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 17:59:15'!
IsGameOver
	^ false! !

!TicTacToeTurnState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 17:58:55'!
OHasWon
	^ false! !

!TicTacToeTurnState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
hasPlayerXWon
	^ false.! !


!classDefinition: #TicTacToeOTurnState category: #TicTacToStep21!
TicTacToeTurnState subclass: #TicTacToeOTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeOTurnState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:15:32'!
putXAt: aPosition
	self error: game class notXTurnErrorMessage! !


!classDefinition: #TicTacToeXTurnState category: #TicTacToStep21!
TicTacToeTurnState subclass: #TicTacToeXTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeXTurnState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:14:57'!
putOAt: aPosition
	self error: game class notOTurnErrorMessage! !

!TicTacToeXTurnState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:19:36'!
putXAt: aPosition
	(game positionTaken: aPosition )ifTrue: [ self error: self class positionTakenErrorMessage ].
	game addAnXPosition: aPosition.
	(self xHasWon)
		ifTrue: [game setState:TicTacToeXWonState new ]
		ifFalse:[ game isTied
							ifTrue: [game setState: TicTacToeTiedState]
							ifFalse: [game setState: TicTacToeOTurnState ]. ]! !
