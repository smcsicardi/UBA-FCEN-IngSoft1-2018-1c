!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'supermarket'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'j a p 6/11/2018 14:22:33'!
test01NewCartsAreCreatedEmpty

	self assert: supermarket createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'j a p 6/11/2018 14:22:51'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := supermarket createCart.
	
	self 
		should: [ cart add: supermarket itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'j a p 6/11/2018 14:23:33'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := supermarket createCart.
	
	cart add: supermarket itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'j a p 6/11/2018 14:23:44'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := supermarket createCart.
	
	self 
		should: [cart add: 0 of: supermarket itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'j a p 6/11/2018 14:24:33'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := supermarket createCart.
	
	self 
		should: [cart add: 2 of: supermarket itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'j a p 6/11/2018 14:24:47'!
test06CartRemembersAddedItems

	| cart |
	
	cart := supermarket createCart.
	
	cart add: supermarket itemSellByTheStore.
	self assert: (cart includes: supermarket itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'j a p 6/11/2018 14:24:57'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := supermarket createCart.
	
	self deny: (cart includes: supermarket itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'j a p 6/11/2018 14:25:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := supermarket createCart.
	
	cart add: 2 of: supermarket itemSellByTheStore.
	self assert: (cart occurrencesOf: supermarket itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'j a p 6/11/2018 14:48:19'!
setUp
	supermarket _ SupermarketSetUp new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'supermarket'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'support' stamp: 'j a p 6/11/2018 15:02:04'!
setUp
	supermarket _ SupermarketSetUp new initializeWithDate: DateAndTime today.! !


!CashierTest methodsFor: 'testing' stamp: 'j a p 6/11/2018 15:35:41'!
test01CheckoutWithEmptyCartRaisesEmptyCartCheckoutError
	self
		should: [
			Cashier
				checkOutWithCart: supermarket createCart
				payingWithCard: supermarket defaultNotExpiredCreditCard
				atDate: supermarket today ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier emptyCartCheckoutError ].! !

!CashierTest methodsFor: 'testing' stamp: 'j a p 6/11/2018 15:35:41'!
test02CheckOutTotalWithOneElementIsRight
	| aCart aCashier |
	aCart _ supermarket createCart.
	aCart add: supermarket itemSellByTheStore.
	aCashier _ Cashier
		checkOutWithCart: aCart
		payingWithCard: supermarket defaultNotExpiredCreditCard
		atDate: supermarket today.
	self assert: aCashier checkOut = supermarket itemSellByTheStorePrice.! !

!CashierTest methodsFor: 'testing' stamp: 'j a p 6/11/2018 15:35:41'!
test03CheckOutTotalWithMoreThanOneElementIsRight
	| aCart aCashier |
	aCart _ supermarket createCart.
	aCart
		add: 10
		of: supermarket itemSellByTheStore.
	aCashier _ Cashier
		checkOutWithCart: aCart
		payingWithCard: supermarket defaultNotExpiredCreditCard
		atDate: supermarket today.
	self assert: aCashier checkOut = (supermarket itemSellByTheStorePrice * 10).! !

!CashierTest methodsFor: 'testing' stamp: 'j a p 6/11/2018 15:35:27'!
test04CheckOutWithExpiredCardRaisesExpiredCardError
	| aCart |
	aCart _ supermarket createCart.
	aCart add: supermarket itemSellByTheStore.
	self
		should: [
			Cashier
				checkOutWithCart: aCart
				payingWithCard: supermarket defaultExpiredCreditCard
				atDate: supermarket today ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier canNotPayWithExpiredCardError ].! !

!CashierTest methodsFor: 'testing' stamp: 'j a p 6/11/2018 15:35:41'!
test05CheckOutWithNotExpiredCardDoesNotRaiseError
	| aCart |
	aCart _ supermarket createCart.
	aCart add: supermarket itemSellByTheStore.
	Cashier
		checkOutWithCart: aCart
		payingWithCard: supermarket defaultNotExpiredCreditCard
		atDate: supermarket today.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'j a p 6/11/2018 14:00:40'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'j a p 6/11/2018 13:54:54'!
catalog
	^ catalog! !

!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'operations' stamp: 'j a p 6/11/2018 14:07:34'!
itemsDo: aBlockClosure 
	items do: aBlockClosure ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart card'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'operations' stamp: 'j a p 6/11/2018 13:54:11'!
checkOut

	| totalToPay prices |
	
	prices := cart catalog.
	
	totalToPay := 0.
	
	cart itemsDo: [ :aProductToPay | totalToPay := totalToPay + (prices at: aProductToPay ) ].
	
	^totalToPay.! !


!Cashier methodsFor: 'initialization' stamp: 'j a p 6/11/2018 14:45:37'!
initializeWithCart: aCart payingWithCard: aCard

	cart := aCart.
	
	card := aCard.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'j a p 6/11/2018 14:59:03'!
assertCardIsNotExpired: aCard atDate: aDate
	
	(aCard isExpiredAtDate: aDate) ifTrue: [ self error: self canNotPayWithExpiredCardError ]! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'j a p 6/11/2018 14:44:11'!
assertCartNotEmpty: aCart
	aCart isEmpty ifTrue: [ self error: self emptyCartCheckoutError]! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'j a p 6/11/2018 14:35:59'!
canNotPayWithExpiredCardError
	^ 'Is not possible to pay with an expired credit card'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'j a p 6/11/2018 15:00:54'!
checkOutWithCart: aCart payingWithCard: aCard atDate: aDate
	
	self assertCartNotEmpty: aCart.
	
	self assertCardIsNotExpired: aCard atDate: aDate.
	
	^ self new initializeWithCart: aCart payingWithCard: aCard
	
	! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'j a p 6/11/2018 13:38:35'!
emptyCartCheckoutError
	^ 'An empty cart can not be on checkout'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expirationMonth'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'j a p 6/11/2018 14:50:11'!
initializeWithExpirationMonth: aMonth

	expirationMonth := aMonth! !


!CreditCard methodsFor: 'expiration' stamp: 'j a p 6/11/2018 15:15:12'!
isExpiredAtDate: aDate

	^ expirationMonth start < aDate month start! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'j a p 6/11/2018 14:49:32'!
withExpirationMonth: aMonth
	^ self new initializeWithExpirationMonth: aMonth! !


!classDefinition: #SupermarketSetUp category: #TusLibros!
Object subclass: #SupermarketSetUp
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!SupermarketSetUp methodsFor: 'element creation' stamp: 'j a p 6/11/2018 15:42:18'!
createCart
	^Cart acceptingItemsOf: self defaultCatalog
	
" creamos esta clase SupermarketSetUp, para abstraer muchas cosas repetidas, la creacion de los elementos del supermercado por ejemplo "! !

!SupermarketSetUp methodsFor: 'element creation' stamp: 'j a p 6/11/2018 14:21:04'!
defaultCatalog
	| catalogDictionary |
	
	catalogDictionary := Dictionary new	at: self itemSellByTheStore put: self itemSellByTheStorePrice; yourself.
	
	^ catalogDictionary .! !

!SupermarketSetUp methodsFor: 'element creation' stamp: 'j a p 6/11/2018 15:35:27'!
defaultExpiredCreditCard
	^ CreditCard withExpirationMonth:
		(Month
			month: today monthIndex
			year: today yearNumber - 1).! !

!SupermarketSetUp methodsFor: 'element creation' stamp: 'j a p 6/11/2018 15:37:10'!
defaultNotExpiredCreditCard
	^ CreditCard withExpirationMonth:
		(Month
			month: today monthIndex + 3
			year: today yearNumber).! !

!SupermarketSetUp methodsFor: 'element creation' stamp: 'j a p 6/11/2018 15:43:09'!
itemNotSellByTheStore
	^'invalidBook'! !

!SupermarketSetUp methodsFor: 'element creation' stamp: 'j a p 6/11/2018 15:43:06'!
itemSellByTheStore
	^ 'validBook'! !

!SupermarketSetUp methodsFor: 'element creation' stamp: 'j a p 6/11/2018 15:43:01'!
itemSellByTheStorePrice	
	^ 1! !


!SupermarketSetUp methodsFor: 'initialization' stamp: 'j a p 6/11/2018 15:03:23'!
initializeWithDate: aDate
	today := aDate! !


!SupermarketSetUp methodsFor: 'accessing' stamp: 'j a p 6/11/2018 15:38:25'!
today
	^today 
	

" hicimos la variable today, ya que en clase se hablo de que ande para otras fechas que no sean especificamente la de la maquina en que se corra el test "! !
