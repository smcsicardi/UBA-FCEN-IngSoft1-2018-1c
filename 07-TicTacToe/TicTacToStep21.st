!classDefinition: #TicTacToeTest category: #TicTacToStep21!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:34:46'!
test01NewGameCreatesEmptyGame

	|game|
	
	game := TicTacToe new.
	
	self assert: game isEmptyGame.
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:17:41'!
test02CanPutXAndOAndPlaysAre2
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		assert: 1
		equals: game Xs size.
	self assert: (game Xs includes: 1 @ 1).
	self
		assert: 1
		equals: game Os size.
	self assert: (game Os includes: 2 @ 2).! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:16:47'!
test03PlayerXCannotPlayTwiceInARow
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:18:31'!
test03_01PlayerXFillsThePosition1x1
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self assert: (game thereIsAnXAtPosition: 1@1)! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:24:00'!
test04PlayerXOnlyFillsThePosition1x1
	| game playsSet |
	game _ TicTacToe new.
	playsSet := Set new.
	playsSet add:1@1.
	game markWithXAt: 1 @ 1.
	self assert: (game Xs) equals: playsSet ! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:33:09'!
test05AfterXTurnPlayerOCantPlayTwice
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe notOTurnErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:03:36'!
test05PlayerOFillsThePosition2x2
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self assert: (game thereIsAnOAtPosition: 2@2)! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:33:35'!
test06PlayerOFillsThePosition2x2
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self assert: (game thereIsAnOAtPosition: 2@2)! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:35:43'!
test07PlayerXCantPutOnTakenPosition
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:35:30'!
test08PlayerOCantPutOnTakenPosition
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: game Os isEmpty ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:38:28'!
test10AnOngoingGameIsNotWon
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 3.
	self deny: game hasPlayerOWon.
	self deny: game hasPlayerXWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:40:03'!
test11PlayerXWinsOnFirstHorizontalLine
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 1 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:40:16'!
test12PlayerXWinsOnSecondHorizontalLine
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 2 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:40:25'!
test13PlayerXWinsOnThirdHorizontalLine
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 3 @ 2.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 3 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:40:45'!
test14PlayerXWinsOnFirstVerticalLine
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 3 @ 1.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:40:59'!
test15PlayerXWinsOnDownDiagonalLine
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 3 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:41:19'!
test16PlayerXWinsOnUpDiagonalLine
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 1 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:42:01'!
test17PlayerOWonOnFirstHorizontalLine
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 3.
	game markWithOAt: 1 @ 3.
	self assert: game hasPlayerOWon.
	self deny: game hasPlayerXWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:42:57'!
test18PlayerOCantPlayWhenGameIsOver
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 1 @ 3.
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 2
				equals: game Os size.
			self assert: (game Os includes: 2 @ 1).
			self assert: (game Os includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:43:19'!
test19PlayerXCantPlayWhenGameIsOver
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 3.
	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 3
				equals: game Xs size.
			self assert: (game Xs includes: 2 @ 2).
			self assert: (game Xs includes: 2 @ 1).
			self assert: (game Xs includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:44:55'!
test20TiedGameIsTied
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 2.
	game markWithXAt: 3 @ 3.
	self assert: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:50:31'!
test20TiedGameIsTiedAndOver
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 2.
	game markWithXAt: 3 @ 3.
	self assert: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:50:54'!
test22OCantPlayFirst
	| game |
	game _ TicTacToe new.
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: (TicTacToe notOTurnErrorMessage) equals: anError messageText.].! !


!classDefinition: #TicTacToe category: #TicTacToStep21!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs gameState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

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

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:18:30'!
checkIfIsTied
	^ xs size = 5 and: [
		os size = 4 and: [ self hasPlayerXWon not ]
		" and: [ self YHasWon not ]]]" ].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:57:46'!
checkIfPlayerOWon
	^ self checkIfPlayerWon: os! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:57:34'!
checkIfPlayerWon: positions
	^ (self hasCompletedRow: positions) or: [
		(self hasCompletedColumn: positions) or: [
			(self hasDownDiagonal: positions) or: [ self hasUpDiagonal: positions ]]].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:56:08'!
checkIfPlayerXWon
	^ self checkIfPlayerWon: xs! !

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

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:54:45'!
hasPlayerOWon
	^ gameState hasPlayerOWon ! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:54:40'!
hasPlayerXWon
	^ gameState hasPlayerXWon ! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:02:13'!
hasUpDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:27:50'!
initialize
	gameState := TicTacToeXTurnState new initializeWith: self.
	xs:= Set new.
	os:= Set new.
	! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:36:09'!
isEmptyGame
	^os isEmpty and: [xs isEmpty].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:10:35'!
isOver
	^ gameState isOver.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:53:58'!
isPlayingO
	^gameState isPlayingO! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:53:48'!
isPlayingX
	^gameState isPlayingX ! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:18:42'!
isTied
	^ gameState isTied .! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:17:34'!
markWithOAt: aPosition
	gameState markWithOAt: aPosition ! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:17:22'!
markWithXAt: aPosition	
	gameState markWithXAt: aPosition 
	! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:28:48'!
positionTaken: aPosition
	^(xs includes: aPosition) or: (os includes: aPosition).! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:24:48'!
setState: aGameState
	gameState := aGameState.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:58:16'!
thereIsAnOAtPosition: aPosition
	 ^ (os includes: aPosition )! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:58:03'!
thereIsAnXAtPosition: aPosition
	 ^ (xs includes: aPosition )! !

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
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:46:33'!
hasPlayerOWon
	self subclassResponsibility.! !

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
hasPlayerXWon
	self subclassResponsibility.! !

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:27:00'!
initializeWith: aGame
	game := aGame.! !

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:11:18'!
isOver
	^true! !

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:52:43'!
isPlayingO
	^false! !

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:52:21'!
isPlayingX
	^false! !

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:04:41'!
isTied
	self subclassResponsibility ! !

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:12:42'!
markWithOAt: aPosition
	self error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!TicTacToeFinishedState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:12:33'!
markWithXAt: aPosition
	self error: game class canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #TicTacToeOWonState category: #TicTacToStep21!
TicTacToeFinishedState subclass: #TicTacToeOWonState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeOWonState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:46:33'!
hasPlayerOWon
	^ true.! !

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

!TicTacToeTiedState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:46:33'!
hasPlayerOWon
	^ false.! !

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

!TicTacToeXWonState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:46:33'!
hasPlayerOWon
	^ false.! !

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

!TicTacToeTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:46:33'!
hasPlayerOWon
	^ false.! !

!TicTacToeTurnState methodsFor: 'as yet unclassified' stamp: 'j a p 5/28/2018 18:25:32'!
hasPlayerXWon
	^ false.! !

!TicTacToeTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:22:19'!
initializeWith: aGame
	game := aGame ! !

!TicTacToeTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:13:47'!
isOver
	^ false.! !

!TicTacToeTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:53:11'!
isPlayingO
	self subclassResponsibility ! !

!TicTacToeTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:53:08'!
isPlayingX
	self subclassResponsibility ! !

!TicTacToeTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:13:58'!
isTied
	^ false.! !


!classDefinition: #TicTacToeOTurnState category: #TicTacToStep21!
TicTacToeTurnState subclass: #TicTacToeOTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeOTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:51:33'!
isPlayingO
	^true! !

!TicTacToeOTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:51:29'!
isPlayingX
	^false! !

!TicTacToeOTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:30:01'!
markWithOAt: aPosition
	(game positionTaken: aPosition) ifTrue: [ self error: game class positionTakenErrorMessage ].
	game addAnOPosition: aPosition.
	game checkIfPlayerOWon 
		ifTrue: [ game setState: (TicTacToeOWonState new initializeWith: game) ]
		ifFalse: [game setState: (TicTacToeXTurnState new initializeWith: game)].! !

!TicTacToeOTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:32:09'!
markWithXAt: aPosition
	self error: game class notXTurnErrorMessage.
! !


!classDefinition: #TicTacToeXTurnState category: #TicTacToStep21!
TicTacToeTurnState subclass: #TicTacToeXTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeXTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:52:03'!
isPlayingO
	^false! !

!TicTacToeXTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 18:51:56'!
isPlayingX
	^true! !

!TicTacToeXTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 20:27:02'!
markWithOAt: aPosition
	self error: game class notOTurnErrorMessage.! !

!TicTacToeXTurnState methodsFor: 'as yet unclassified' stamp: 'SS 5/28/2018 19:29:40'!
markWithXAt: aPosition
	(game positionTaken: aPosition) ifTrue: [ self error: game class positionTakenErrorMessage ].
	game addAnXPosition: aPosition.
	game checkIfPlayerXWon 
		ifTrue: [ game setState: (TicTacToeXWonState new initializeWith: game) ]
		ifFalse: [game checkIfIsTied ifTrue: [ game setState: (TicTacToeTiedState new initializeWith: game)]
				ifFalse: [ game setState: (TicTacToeOTurnState new initializeWith: game) ]].! !
