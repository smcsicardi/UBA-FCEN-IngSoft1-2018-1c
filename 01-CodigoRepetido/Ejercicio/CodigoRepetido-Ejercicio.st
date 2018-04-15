!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #IdiomTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #IdiomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!IdiomTest methodsFor: 'testing' stamp: 'JP 4/12/2018 21:31:17'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook |
	
	customerBook := CustomerBook  new.
	
	self theOperation: [customerBook addCustomerNamed: 'John Lennon'.]  shouldNotTakeMoreThanAumountOfMilliseconds: 50 
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'JP 4/12/2018 21:31:28'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	customerBook  addCustomerNamed: paulMcCartney .
	
	self theOperation: [customerBook removeCustomerNamed: paulMcCartney.] shouldNotTakeMoreThanAumountOfMilliseconds: 100

! !

!IdiomTest methodsFor: 'testing' stamp: 'JP 4/12/2018 21:22:04'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
		
	self whenAction: [customerBook addCustomerNamed: ''.] 
		  expectError: Error 
		  withOutcome: [:anError | self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage. 
			self assert: customerBook isEmpty]! !

!IdiomTest methodsFor: 'testing' stamp: 'JP 4/12/2018 21:24:29'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	self whenAction: [ customerBook removeCustomerNamed: 'Paul McCartney'.]
	       expectError: NotFound
	       withOutcome: [ self assert: customerBook numberOfCustomers = 1.
						 self assert: (customerBook includesCustomerNamed: johnLennon).]
! !


!IdiomTest methodsFor: 'as yet unclassified' stamp: 'JP 4/12/2018 21:34:06'!
theOperation: anOperation shouldNotTakeMoreThanAumountOfMilliseconds: anAmountOfMilliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue.
	anOperation value.
	millisecondsAfterRunning := Time millisecondClockValue.
	
	self assert: millisecondsAfterRunning-millisecondsBeforeRunning < anAmountOfMilliseconds 
	
! !

!IdiomTest methodsFor: 'as yet unclassified' stamp: 'JP 4/12/2018 21:20:37'!
whenAction: anAction expectError: anError withOutcome: anOutcome

	[ anAction value.
	self fail ]
		on: anError 
		do: anOutcome 
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!
removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
