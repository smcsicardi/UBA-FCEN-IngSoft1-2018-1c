!classDefinition: #CarritoTest category: #TusLibros!
TestCase subclass: #CarritoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CarritoTest methodsFor: 'tests' stamp: 'SS 6/7/2018 10:59:27'!
test01CarritoVacioEsVacio

	| carr |
	
	carr := Carrito new initializeWithCatalog: #().
	
	self assert: carr isEmpty.! !

!CarritoTest methodsFor: 'tests' stamp: 'SS 6/7/2018 11:09:47'!
test02PuedoAgregarItemsDelCatalogo
	| carr |
	
	carr := Carrito new initializeWithCatalog: #('unLibro').
	
	carr add: 2 of: 'unLibro'.
	
	self deny: carr isEmpty ! !

!CarritoTest methodsFor: 'tests' stamp: 'SS 6/7/2018 11:11:30'!
test03NoPuedoAgregarItemsQueNoSonDelCatalogo
	| carr |
	
	carr := Carrito new initializeWithCatalog: #('unLibro').
	
	self 
		should: [ 	carr add: 1 of: 'unChorizo'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Carrito itemNotInCatalog .
			self assert: carr isEmpty ]! !

!CarritoTest methodsFor: 'tests' stamp: 'SS 6/7/2018 11:12:01'!
test04NoPuedoAgregarItemsNegativos
	| carr |
	
	carr := Carrito new initializeWithCatalog: #('unLibro').
	
	self 
		should: [ 	carr add: -1 of: 'unLibro'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Carrito itemQuantityNotPositive .
			self assert: carr isEmpty ]! !

!CarritoTest methodsFor: 'tests' stamp: 'SS 6/7/2018 11:23:44'!
test05PuedoVerCantidadDeUnItem
	| carr |
	
	carr := Carrito new initializeWithCatalog: #('unLibro').
	
	carr add: 2 of: 'unLibro'.
	
	self assert: (carr quantityOf: 'unLibro') equals: 2.! !

!CarritoTest methodsFor: 'tests' stamp: 'SS 6/7/2018 11:20:50'!
test05PuedoVerItemsDelCarrito
	| carr |
	
	carr := Carrito new initializeWithCatalog: #('unLibro').
	
	carr add: 2 of: 'unLibro'.
	
	self assert: (carr has: 'unLibro')! !


!classDefinition: #Carrito category: #TusLibros!
Object subclass: #Carrito
	instanceVariableNames: 'catalogo items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Carrito methodsFor: 'initializing ' stamp: 'SS 6/7/2018 10:55:31'!
initializeWithCatalog: aCatalog
	catalogo := aCatalog.
	items _ OrderedCollection new.! !


!Carrito methodsFor: 'adding' stamp: 'j a p 6/7/2018 16:03:02'!
add: aQuantity of: anItem

	(aQuantity > 0) ifFalse: [self error: self class itemQuantityNotPositive].
	(catalogo includes: anItem ) ifFalse: [self error: self class itemNotInCatalog].
	
	aQuantity timesRepeat: [ items add: anItem ]. 
	! !


!Carrito methodsFor: 'accessing' stamp: 'SS 6/7/2018 11:20:40'!
has: unItem

	^items includes: unItem .! !

!Carrito methodsFor: 'accessing' stamp: 'SS 6/7/2018 10:56:25'!
isEmpty
	^ items isEmpty .! !

!Carrito methodsFor: 'accessing' stamp: 'SS 6/7/2018 11:24:50'!
quantityOf: anItem
	^ items count: [:anElementOfItems | anElementOfItems = anItem ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Carrito class' category: #TusLibros!
Carrito class
	instanceVariableNames: ''!

!Carrito class methodsFor: 'as yet unclassified' stamp: 'SS 6/7/2018 11:06:36'!
itemNotInCatalog

	^'El item debe ser del catalogo'! !

!Carrito class methodsFor: 'as yet unclassified' stamp: 'SS 6/7/2018 11:06:14'!
itemQuantityNotPositive

	^ 'La cantidad tiene que ser mayor a cero'! !

!Carrito class methodsFor: 'as yet unclassified' stamp: 'SS 6/7/2018 10:56:05'!
withCatalog: aCatalog
	^ self new initializeWithCatalog: aCatalog.! !
