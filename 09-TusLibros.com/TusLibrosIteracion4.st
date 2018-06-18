!classDefinition: #ApiRestInterfaceTest category: #TusLibros!
TestCase subclass: #ApiRestInterfaceTest
	instanceVariableNames: 'apiRestInterface testObjectsFactory timer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 21:39:15'!
debit: anAmout from: aCreditCard! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:37:57'!
defaultClientName
	^ testObjectsFactory defaultClientName ! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'SS 6/17/2018 21:03:34'!
defaultCreditCard
	^ '1324123412341324'! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 21:30:59'!
defaultExpiredDate
	^ testObjectsFactory expiredDate ! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 00:54:38'!
defaultInterface
	^ ApiRestInterface new
		initializeWithClients: (Dictionary new at: self validClientId put: self validClientPassword; yourself)
		withCatalog: testObjectsFactory defaultCatalog
		withSalesBook: OrderedCollection new
		withMerchantProcessor: self
		usingTimer: timer! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 21:29:55'!
defaultNotExpiredDate
	^ testObjectsFactory notExpiredDate ! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:39:57'!
invalidBook
	^ testObjectsFactory invalidBook! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 19:53:55'!
invalidCartId
	^ -1! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:40:22'!
invalidClientId
	^ testObjectsFactory invalidClientId! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 19:20:48'!
invalidClientPassword
	^ 'PassClienteInvalida'! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 00:14:05'!
otherValidBook
	^ 'otherValidBook'! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:03:54'!
setUp
	testObjectsFactory _ StoreTestObjectsFactory new.
	timer := Timer new initialize! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 19:29:45'!
test01ApiRestInterfaceCanCreateCartWithValidClientIDAndPassword
	| apiRestInterface | 
	
	apiRestInterface := self defaultInterface.
		
	self shouldnt: [ apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword] raise: Error! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'SS 6/17/2018 20:11:05'!
test02ApiRestInterfaceCanNotCreateCartWithInvalidClientIDAndPassword
	| apiRestInterface | 
	
	apiRestInterface := self defaultInterface.
	
	self should: [ apiRestInterface createCartWithClientId: self invalidClientId withPassword: self invalidClientPassword] 
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText = ApiRestInterface  invalidCredentialsError)]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'SS 6/17/2018 20:14:16'!
test03ApiRestInterfaceCanNotCreateCartWithValidClientIDAndInvalidPassword
	| apiRestInterface | 
	
	apiRestInterface := self defaultInterface.
	
	self should: [ apiRestInterface createCartWithClientId: self validClientId withPassword: self invalidClientPassword] 
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText = ApiRestInterface  invalidCredentialsError)]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'SS 6/17/2018 20:16:01'!
test04ApiRestInterfaceCanNotCreateCartWithInvalidClientIDAndValidPassword
	| apiRestInterface | 
	
	apiRestInterface := self defaultInterface.
	
	self should: [ apiRestInterface createCartWithClientId: self invalidClientId withPassword: self validClientPassword] 
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText = ApiRestInterface invalidCredentialsError )]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 20:00:58'!
test05ApiRestCanAddOneItemToCart
	| apiRestInterface cartId | 
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	self shouldnt: [ apiRestInterface addItem: self validBook toCartWithId: cartId withQuantity: 1] raise: Error! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'SS 6/17/2018 20:17:28'!
test06ApiRestCanNotAddItemToCartWithInvalidId
	| apiRestInterface | 
	
	apiRestInterface := self defaultInterface.
	
	self should: [ apiRestInterface addItem: self validBook toCartWithId: self invalidCartId  withQuantity: 1] 
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText = ApiRestInterface  InvalidCartIdError )]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:50:19'!
test07ApiRestCanNotAddItemNotInCatalog
	
	| cartId apiRestInterface | 
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	self should: [ apiRestInterface addItem: self invalidBook toCartWithId: cartId  withQuantity: 1] 
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText = Cart invalidItemErrorMessage)]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'SS 6/17/2018 20:43:03'!
test08ListOfEmptyCartIsEmpty
	
	| cartId apiRestInterface | 
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	self assert: (apiRestInterface listCartWithId: cartId) isEmpty.! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'SS 6/17/2018 20:47:07'!
test09CanNotMakeListOfInvalidCartId
	
	| apiRestInterface | 
	
	apiRestInterface := self defaultInterface.
		
	self should: [apiRestInterface listCartWithId: self invalidCartId]
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText = ApiRestInterface  InvalidCartIdError )]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 21:53:42'!
test10ListOfValidCartIdShowValidItems

	| cartId apiRestInterface cartItems| 
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	apiRestInterface addItem: self validBook toCartWithId: cartId withQuantity: 3.
	
	cartItems := Bag new.
	3 timesRepeat: [cartItems add: self validBook].
	
	self assert: (apiRestInterface listCartWithId: cartId) equals: cartItems.! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:36:01'!
test11CanCheckOutCart

	| cartId apiRestInterface| 
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	apiRestInterface addItem: self validBook toCartWithId: cartId withQuantity: 1. 
	
	self shouldnt: [apiRestInterface checkOutCartWithId: cartId withCreditCard: self defaultCreditCard 
		withExpirationDate: self defaultNotExpiredDate
		withOwnerName: self defaultClientName]
	raise: Error! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:36:09'!
test12CanNotCheckOutEmptyCart

	| cartId apiRestInterface| 
	
	apiRestInterface := self defaultInterface.
	
	cartId := self invalidCartId .
		
	self should: [apiRestInterface checkOutCartWithId: cartId withCreditCard: self defaultCreditCard 
		withExpirationDate: self defaultNotExpiredDate
		withOwnerName: self defaultClientName]
	raise: Error
	withExceptionDo: [:anError | self assert: (anError messageText = ApiRestInterface  InvalidCartIdError )]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:36:14'!
test13CanNotCheckOutOfInvalidCart

	| cartId apiRestInterface| 
	
	apiRestInterface := self defaultInterface.
	
	cartId := self invalidCartId .
		
	self should: [apiRestInterface checkOutCartWithId: cartId withCreditCard: self defaultCreditCard 
		withExpirationDate: self defaultNotExpiredDate
		withOwnerName: self defaultClientName]
	raise: Error
	withExceptionDo: [:anError | self assert: (anError messageText = ApiRestInterface  InvalidCartIdError )]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:36:19'!
test14CanNotCheckOutWithExpiredCreditCard

	| cartId apiRestInterface| 
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	apiRestInterface addItem: self validBook toCartWithId: cartId withQuantity: 1. 
		
	self should: [apiRestInterface checkOutCartWithId: cartId withCreditCard: self defaultCreditCard 
		withExpirationDate: (self defaultExpiredDate)
		withOwnerName: self defaultClientName]
	raise: Error
	withExceptionDo: [:anError | self assert: (anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage )]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:36:24'!
test15CanMakeListOfOnePurchasedItem

	| cartId apiRestInterface |
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	apiRestInterface addItem: self validBook toCartWithId: cartId withQuantity: 1. 
	
	apiRestInterface
		checkOutCartWithId: cartId withCreditCard: self defaultCreditCard 
		withExpirationDate: (self defaultNotExpiredDate)
		withOwnerName: self defaultClientName.
		
	self shouldnt: [ apiRestInterface listPurchasesOfClientWithId: self validClientId withPassword: self validClientPassword ]
		raise: Error! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 00:04:13'!
test16CanMakeListOfOnePurchasedItemAndItsCorrect

	| cartId apiRestInterface items|
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	apiRestInterface addItem: self validBook toCartWithId: cartId withQuantity: 4. 
	
	apiRestInterface
		checkOutCartWithId: cartId withCreditCard: self defaultCreditCard 
		withExpirationDate: (self defaultNotExpiredDate)
		withOwnerName: self validClientId.
	
	items := apiRestInterface listPurchasesOfClientWithId: self validClientId withPassword: self validClientPassword.

	self assert: (items occurrencesOf: self validBook) equals: 4.! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 00:18:13'!
test17CanMakeListOfTwoPurchasedItemsAndItsCorrect

	| cartId apiRestInterface items|
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	apiRestInterface addItem: testObjectsFactory itemSellByTheStore toCartWithId: cartId withQuantity: 2. 
	apiRestInterface addItem: testObjectsFactory anotherItemSellByTheStore  toCartWithId: cartId withQuantity: 4. 


	apiRestInterface
		checkOutCartWithId: cartId withCreditCard: self defaultCreditCard 
		withExpirationDate: (self defaultNotExpiredDate)
		withOwnerName: self validClientId.
	
	items := apiRestInterface listPurchasesOfClientWithId: self validClientId withPassword: self validClientPassword.

	self assert: (items occurrencesOf: testObjectsFactory itemSellByTheStore ) equals: 2.
	self assert: (items occurrencesOf: testObjectsFactory anotherItemSellByTheStore ) equals: 4.! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 00:22:31'!
test18CanNotMakeListOfPurchasedItemsOfInvalidClient

	| cartId apiRestInterface|
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	apiRestInterface addItem: testObjectsFactory itemSellByTheStore toCartWithId: cartId withQuantity: 2. 
	apiRestInterface addItem: testObjectsFactory anotherItemSellByTheStore  toCartWithId: cartId withQuantity: 4. 


	apiRestInterface
		checkOutCartWithId: cartId withCreditCard: self defaultCreditCard 
		withExpirationDate: (self defaultNotExpiredDate)
		withOwnerName: self validClientId.
	
	self
		should: [apiRestInterface listPurchasesOfClientWithId: self invalidClientId withPassword: self validClientPassword.] 
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText = ApiRestInterface  invalidCredentialsError )]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 00:22:55'!
test19CanNotMakeListOfPurchasedItemsOfValidClientWithInvalidPassword

	| cartId apiRestInterface|
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	apiRestInterface addItem: testObjectsFactory itemSellByTheStore toCartWithId: cartId withQuantity: 2. 
	apiRestInterface addItem: testObjectsFactory anotherItemSellByTheStore  toCartWithId: cartId withQuantity: 4. 


	apiRestInterface
		checkOutCartWithId: cartId withCreditCard: self defaultCreditCard 
		withExpirationDate: (self defaultNotExpiredDate)
		withOwnerName: self validClientId.
	
	self
		should: [apiRestInterface listPurchasesOfClientWithId: self validClientId withPassword: self invalidClientPassword.] 
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText = ApiRestInterface  invalidCredentialsError )]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:21:50'!
test20CanNotAddItemToCartWithExpiredSession

	| cartId apiRestInterface |
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	timer moveForward: 31 minutes.
	
	self
		should: [apiRestInterface addItem: testObjectsFactory itemSellByTheStore toCartWithId: cartId withQuantity: 2. ] 
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText = ApiRestInterface  sessionExpiredError )]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:36:28'!
test21CanNotCheckoutCartWithExpiredSession

	| cartId apiRestInterface |
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	timer moveForward: 20 minutes.
	
	apiRestInterface addItem: testObjectsFactory itemSellByTheStore toCartWithId: cartId withQuantity: 2. 
	
	timer moveForward: ApiRestInterface sessionTimeout.
		
	self
		should: [apiRestInterface
			checkOutCartWithId: cartId
			withCreditCard: self defaultCreditCard 
			withExpirationDate: self defaultNotExpiredDate
			withOwnerName: self defaultClientName]
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText = ApiRestInterface  sessionExpiredError )]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:33:39'!
test22CanNotMakeListItemsOfCartWithExpiredSession

	| cartId apiRestInterface |
	
	apiRestInterface := self defaultInterface.
	
	cartId := apiRestInterface createCartWithClientId: self validClientId withPassword: self validClientPassword.
	
	timer moveForward: 20 minutes.
	
	apiRestInterface addItem: testObjectsFactory itemSellByTheStore toCartWithId: cartId withQuantity: 2. 
	
	timer moveForward: ApiRestInterface sessionTimeout.
	
	self
		should: [apiRestInterface listCartWithId: cartId]
		raise: Error
		withExceptionDo: [:anError | self assert: (anError messageText = ApiRestInterface  sessionExpiredError )]! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 19:39:21'!
validBook
	^ 'validBook'! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:43:06'!
validClientId
	^ self defaultClientName ! !

!ApiRestInterfaceTest methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 19:18:29'!
validClientPassword
	^ 'PassCliente'! !


!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'j a p 6/18/2018 01:39:11'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook
			withClient: testObjectsFactory defaultClientName ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'j a p 6/18/2018 01:39:16'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new
		withClient: testObjectsFactory defaultClientName .
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'j a p 6/18/2018 01:39:21'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook
				withClient: testObjectsFactory defaultClientName  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'j a p 6/18/2018 01:39:26'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook
		withClient: testObjectsFactory defaultClientName .
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'j a p 6/18/2018 01:39:30'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook
		withClient: testObjectsFactory defaultClientName .
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'j a p 6/18/2018 01:39:34'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook
		withClient: testObjectsFactory defaultClientName .
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #ApiRestInterface category: #TusLibros!
Object subclass: #ApiRestInterface
	instanceVariableNames: 'clients carts cartIndex catalog merchantProcessor salesBook timer sessions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ApiRestInterface methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 00:58:21'!
addItem: anItem toCartWithId: aCartId  withQuantity: aQuantity
	|cart|
	
	self assertValidCartId: aCartId.
	
	self assertValidSession: aCartId.

	cart _ carts at: aCartId.
	
	cart add: aQuantity of: anItem.! !

!ApiRestInterface methodsFor: 'as yet unclassified' stamp: 'SS 6/17/2018 20:12:20'!
assertValidCartId: aCartId
	carts at: aCartId ifAbsent: [self error: self class InvalidCartIdError]! !

!ApiRestInterface methodsFor: 'as yet unclassified' stamp: 'SS 6/17/2018 20:13:24'!
assertValidClientCredentialsWithId: aClientId withPassword: aPassword
	clients at: aClientId ifAbsent: [self error: self class invalidCredentialsError].
	(clients at: aClientId) = aPassword ifFalse: [self error: self class invalidCredentialsError]
	! !

!ApiRestInterface methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:18:37'!
assertValidSession: aCartId
	sessions at: aCartId ifAbsent: [self error: self class invalidCartIdSessionError].
	((sessions at: aCartId) hasExpiredOn: timer now) ifTrue: [self error: self class sessionExpiredError]! !

!ApiRestInterface methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:28:47'!
checkOutCartWithId: aCartId withCreditCard: aCreditCard withExpirationDate: anExpirationDate withOwnerName: anOwnerName
	| cashier |
	self assertValidCartId: aCartId.
	
	self assertValidSession: aCartId.
	
	cashier := (Cashier toCheckout: (carts at: aCartId)
				charging: (CreditCard expiringOn: anExpirationDate)
				throught: merchantProcessor
				on: self today
				registeringOn: salesBook
				withClient: anOwnerName).
	
	cashier checkOut.! !

!ApiRestInterface methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:19:33'!
createCartWithClientId: aClientId withPassword: aPassword
	| newCartId |
	self assertValidClientCredentialsWithId: aClientId withPassword: aPassword.
	
	newCartId := self createNewCartId.
	
	carts at: newCartId put: (Cart acceptingItemsOf: catalog).
	
	sessions at: newCartId put: (Session new initializeWithSessionTimeout: self class sessionTimeout andInitialTime: timer now).
	
	^ newCartId! !

!ApiRestInterface methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 19:45:37'!
createNewCartId
	cartIndex:= cartIndex + 1.
	^ cartIndex! !

!ApiRestInterface methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:05:56'!
initializeWithClients: aClientsGroup withCatalog: aCatalog withSalesBook: aSalesBook withMerchantProcessor: aMerchantProcessor usingTimer: aTimer
	catalog _ aCatalog.
	clients := aClientsGroup.
	carts := Dictionary new.
	cartIndex := 0.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook.
	timer _ aTimer.
	sessions _ Dictionary new.! !

!ApiRestInterface methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:29:02'!
listCartWithId: aCartId
	| elementsInCart |

	self assertValidCartId: aCartId .
	
	self assertValidSession: aCartId.
	
	"de OrderedCollection a Bag"
	elementsInCart := Bag new.
	(carts at: aCartId) items do: [:anItem |  elementsInCart add: anItem ].
	
	^  elementsInCart! !

!ApiRestInterface methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:25:45'!
listPurchasesOfClientWithId: aClientId withPassword: aClientPassword
	| salesByClient bagOfPurchases |

	self assertValidClientCredentialsWithId: aClientId withPassword: aClientPassword.
	

	salesByClient := salesBook select: [ :aSale |  aSale isOfClientId: aClientId ].
	
	bagOfPurchases  := Bag new.
	
	salesByClient do: [:aSale | 
			aSale itemsDo: [:anItem | bagOfPurchases add: anItem name withOccurrences: anItem quantity].
	].
	
	^ bagOfPurchases! !

!ApiRestInterface methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 21:19:28'!
today
	^ DateAndTime now! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ApiRestInterface class' category: #TusLibros!
ApiRestInterface class
	instanceVariableNames: ''!

!ApiRestInterface class methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 19:55:44'!
InvalidCartIdError
	^ 'Cart ID is invalid'! !

!ApiRestInterface class methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:00:57'!
invalidCartIdSessionError
	^ 'Cart has no session active'! !

!ApiRestInterface class methodsFor: 'as yet unclassified' stamp: 'j a p 6/17/2018 19:27:27'!
invalidCredentialsError
	^ 'Client ID and/or password was invalid'! !

!ApiRestInterface class methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:01:25'!
sessionExpiredError
	^ 'Session has expired'! !

!ApiRestInterface class methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:02:14'!
sessionTimeout
	^ 30 minutes! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'SS 6/17/2018 20:28:37'!
invalidItemErrorMessage
	
	^self class invalidItemErrorMessage ! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'SS 6/17/2018 23:12:45'!
catalog
	^ catalog ! !

!Cart methodsFor: 'queries' stamp: 'SS 6/17/2018 20:45:04'!
items

	^ items copy! !

!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!Cart class methodsFor: 'error messages' stamp: 'SS 6/17/2018 20:27:58'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total client'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'j a p 6/18/2018 00:13:36'!
createSale

	| itemsWithPrice itemsInCart |
	
	itemsInCart _ Bag new.
	cart items do: [:anItem | itemsInCart add: anItem].
	
	itemsWithPrice _ OrderedCollection new.
	
	itemsInCart asSet do: [:anItem | itemsWithPrice add: (Item new initializeWithName: anItem withQuantity: (itemsInCart occurrencesOf: anItem) andPrice: (cart catalog at: anItem))].
	
	
	^ Sale new initializeWithItems: itemsWithPrice andClient: client . ! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

!Cashier methodsFor: 'initialization' stamp: 'SS 6/17/2018 23:23:18'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook withClient: aClient

	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook.
	client := aClient.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'SS 6/17/2018 23:25:27'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook withClient: aClient
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook withClient: aClient! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #Item category: #TusLibros!
Object subclass: #Item
	instanceVariableNames: 'itemName quantity itemCost'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Item methodsFor: 'as yet unclassified' stamp: 'SS 6/17/2018 22:15:05'!
initializeWithName: aName withQuantity: aQuantity andPrice: itemPrice

	itemName _ aName .
	quantity _ aQuantity .
	itemCost _ itemPrice .! !

!Item methodsFor: 'as yet unclassified' stamp: 'SS 6/17/2018 22:13:05'!
name
	^itemName ! !

!Item methodsFor: 'as yet unclassified' stamp: 'SS 6/17/2018 23:41:49'!
quantity
	^quantity ! !

!Item methodsFor: 'as yet unclassified' stamp: 'SS 6/17/2018 22:13:20'!
totalCost
	^ quantity * itemCost ! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'items clientId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'SS 6/17/2018 23:55:59'!
isOfClientId: aClientId
	^clientId = aClientId ! !

!Sale methodsFor: 'total' stamp: 'SS 6/17/2018 23:30:07'!
total
	
	^ items inject: 0 into: [:aTotal :anItem | aTotal + anItem totalCost ] ! !


!Sale methodsFor: 'initialization' stamp: 'SS 6/17/2018 23:28:37'!
initializeWithItems: aCollectionOfItems andClient: aClientId

	items := aCollectionOfItems.
	clientId := aClientId. ! !


!Sale methodsFor: 'accessing' stamp: 'SS 6/18/2018 00:00:58'!
itemsDo: aBlockClosure 
	items do: aBlockClosure.! !


!classDefinition: #Session category: #TusLibros!
Object subclass: #Session
	instanceVariableNames: 'lastTime sessionTimeout'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Session methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:17:27'!
hasExpiredOn: aTime
	^ aTime > (self sessionTimeout + lastTime)! !

!Session methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:15:04'!
initializeWithSessionTimeout: anAmountOfTime andInitialTime: initialTime
	sessionTimeout := anAmountOfTime.
	lastTime := initialTime.! !

!Session methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:13:12'!
sessionTimeout
	^ sessionTimeout! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'j a p 6/18/2018 00:15:30'!
anotherItemSellByTheStore
	
	^ 'anotherValidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'j a p 6/18/2018 00:19:02'!
anotherItemSellByTheStorePrice
	
	^11! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'j a p 6/18/2018 00:18:53'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		at: self anotherItemSellByTheStore put: self anotherItemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'SS 6/17/2018 23:23:43'!
defaultClient
	^'client'! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'j a p 6/18/2018 01:38:50'!
defaultClientName
	^'client'! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'j a p 6/17/2018 21:41:23'!
expiredDate
	^Month month: today monthIndex year: today yearNumber - 1! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'j a p 6/18/2018 01:50:05'!
invalidBook
	^ 'This book is invalid'! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'j a p 6/18/2018 01:41:12'!
invalidClientId
	^'IDclienteInvalido'! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'SS 6/17/2018 21:05:40'!
notExpiredDate
	^(Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!classDefinition: #Timer category: #TusLibros!
Object subclass: #Timer
	instanceVariableNames: 'time'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Timer methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:03:08'!
initialize
	time := 0 minutes! !

!Timer methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 00:53:22'!
moveForward: anAmountOfTime
	time := time + anAmountOfTime ! !

!Timer methodsFor: 'as yet unclassified' stamp: 'j a p 6/18/2018 01:18:57'!
now
	^ time! !
