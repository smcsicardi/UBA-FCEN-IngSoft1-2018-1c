!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #BaseDeLaPila category: #'Stack-Exercise'!
Object subclass: #BaseDeLaPila
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BaseDeLaPila methodsFor: 'adding' stamp: 'SS 4/24/2018 17:04:26'!
insertarElemento: unValor
	
	^ ElementoDeLaPila inicializarCon: unValor ySiguiente: self! !


!BaseDeLaPila methodsFor: 'removing' stamp: 'SS 4/24/2018 17:02:05'!
sacarElemento
	^ self error: OOStack stackEmptyErrorDescription ! !


!BaseDeLaPila methodsFor: 'testing' stamp: 'SS 4/24/2018 16:52:41'!
isEmpty
	^true! !


!BaseDeLaPila methodsFor: 'accessing' stamp: 'SS 4/24/2018 16:52:49'!
size
	^0! !

!BaseDeLaPila methodsFor: 'accessing' stamp: 'SS 4/24/2018 16:56:26'!
top
	^ self error: OOStack stackEmptyErrorDescription ! !


!classDefinition: #ElementoDeLaPila category: #'Stack-Exercise'!
Object subclass: #ElementoDeLaPila
	instanceVariableNames: 'valor siguienteElementoDeLaPila'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ElementoDeLaPila methodsFor: 'initialization' stamp: 'SS 4/24/2018 16:58:16'!
inicializarCon: unValor ySiguiente: unElemento
	valor := unValor.
	siguienteElementoDeLaPila  := unElemento ! !


!ElementoDeLaPila methodsFor: 'adding' stamp: 'SS 4/24/2018 17:07:08'!
insertarElemento: unValor
	
	^ ElementoDeLaPila inicializarCon: unValor ySiguiente: self! !


!ElementoDeLaPila methodsFor: 'removing' stamp: 'SS 4/24/2018 17:06:32'!
sacarElemento
	^ siguienteElementoDeLaPila ! !


!ElementoDeLaPila methodsFor: 'testing' stamp: 'SS 4/24/2018 17:05:30'!
isEmpty
	^ false! !


!ElementoDeLaPila methodsFor: 'accessing' stamp: 'SS 4/24/2018 17:05:16'!
size
	^ 1+siguienteElementoDeLaPila size! !

!ElementoDeLaPila methodsFor: 'accessing' stamp: 'SS 4/24/2018 17:05:47'!
top
	^ valor! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElementoDeLaPila class' category: #'Stack-Exercise'!
ElementoDeLaPila class
	instanceVariableNames: ''!

!ElementoDeLaPila class methodsFor: 'as yet unclassified' stamp: 'SS 4/24/2018 17:14:38'!
inicializarCon: unValor ySiguiente: unElemento
	^ self basicNew inicializarCon: unValor ySiguiente: unElemento ! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topeDeLaPila'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'SS 4/24/2018 17:10:41'!
inicializarCon: unTopeDeLaPIla
	topeDeLaPila  := unTopeDeLaPIla .! !


!OOStack methodsFor: 'adding' stamp: 'SS 4/24/2018 17:04:05'!
push: unValor
	topeDeLaPila := topeDeLaPila insertarElemento: unValor. ! !


!OOStack methodsFor: 'removing' stamp: 'SS 4/24/2018 17:02:58'!
pop
	
	|elementoQueSaco|
	
	elementoQueSaco := topeDeLaPila top.
	
	topeDeLaPila := topeDeLaPila sacarElemento.
	
	^elementoQueSaco ! !


!OOStack methodsFor: 'testing' stamp: 'SS 4/24/2018 17:00:03'!
isEmpty
	^ topeDeLaPila isEmpty ! !


!OOStack methodsFor: 'accessing' stamp: 'SS 4/24/2018 16:59:49'!
size
	^ topeDeLaPila size! !

!OOStack methodsFor: 'accessing' stamp: 'SS 4/24/2018 17:15:17'!
top
	^ topeDeLaPila top! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'as yet unclassified' stamp: 'SS 4/24/2018 17:11:06'!
new
	^ self basicNew inicializarCon: BaseDeLaPila new.! !
