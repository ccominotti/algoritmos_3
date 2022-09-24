!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 11:41:12'!
assertDoing: aClosure shouldNotTakeMoreThan: aTime

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (aTime)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 12:04:16'!
assertTheCustomerBook: aCustomerBook HasACustomer: aCustomer
	self assert: (aCustomerBook includesCustomerNamed: aCustomer).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 12:55:19'!
assertTheCustomerBookHasOnlyJohnLennon: aCustomerBook  
	self assert: aCustomerBook numberOfCustomers = 1.
	self assert: (aCustomerBook includesCustomerNamed: 'John Lennon')
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 12:07:43'!
assertThisCustomerBook: aCustomerBook HasATotalOf: aNumberOfCustomers andActive: aNumberOfActiveCustomers andSuspended: aNumberOfSuspendedCustomers

    self assert: aNumberOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
    self assert: aNumberOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
    self assert: aNumberOfCustomers equals: aCustomerBook numberOfCustomers.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 12:38:27'!
createACustomerBookWith: aCustomer
	^CustomerBook new addCustomerNamed: aCustomer.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 12:09:38'!
denyTheCustomerBook: aCustomerBook HasACustomer: aCustomer
	self deny: (aCustomerBook includesCustomerNamed: aCustomer).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 13:30:48'!
failing:  aBlockThatFails onTheError: anErrorType do: assertionBlock

	[ aBlockThatFails.
	self fail ]
		on: anErrorType 
		do: assertionBlock! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 11:46:57'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook anAction |
	
	customerBook := CustomerBook new.
	anAction := [customerBook addCustomerNamed: 'John Lennon'].
	
	self assertDoing: anAction shouldNotTakeMoreThan: 50 * millisecond.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 12:38:55'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook anAction |
	
	customerBook :=self createACustomerBookWith: 'Paul McCartney'.
	
	anAction := [customerBook removeCustomerNamed: 'Paul McCartney'].
	
	self assertDoing: anAction shouldNotTakeMoreThan: 100 * millisecond.
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 13:31:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook addEmptyNameBlock |
			
	customerBook := CustomerBook new.
	addEmptyNameBlock := [customerBook addCustomerNamed: ''.].
	
	self failing: addEmptyNameBlock onTheError: Error do: 'assertionBlock'.


'
	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]
		'! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 13:31:07'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook removeInvalidCustomerBlock |
	
	customerBook :=self createACustomerBookWith:  'John Lennon'.
	removeInvalidCustomerBlock := [customerBook removeCustomerNamed: 'Paul McCartney'].
	self failing: removeInvalidCustomerBlock onTheError: NotFound do: [self assertTheCustomerBookHasOnlyJohnLennon: customerBook].

"
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ self assertTheCustomerBookHasOnlyJohnLennon: customerBook] 
		"
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 12:42:03'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	
	paulMcCartney := 'Paul McCartney'.
	customerBook:= self createACustomerBookWith:  paulMcCartney. 
	customerBook suspendCustomerNamed: paulMcCartney.
	
	
	self assertThisCustomerBook: customerBook HasATotalOf: 1 andActive: 0 andSuspended: 1.
	
	self assertTheCustomerBook: customerBook HasACustomer: paulMcCartney.
	
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 12:43:16'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney:= 'Paul McCartney'.
	customerBook := self createACustomerBookWith:  paulMcCartney. 

	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	
	self assertThisCustomerBook: customerBook HasATotalOf: 0 andActive: 0 andSuspended: 0.
	
	self denyTheCustomerBook: customerBook HasACustomer: paulMcCartney.
	


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 12:59:44'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self createACustomerBookWith:  johnLennon. 
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ self assertTheCustomerBookHasOnlyJohnLennon: customerBook]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 12:59:28'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self createACustomerBookWith:  johnLennon. 	customerBook suspendCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ 	self assertTheCustomerBookHasOnlyJohnLennon: customerBook]
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'cg 9/24/2022 12:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'cg 9/24/2022 12:25:16'!
removeCustomerNamed: aName 
 
	active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^ NotFound signal]].
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
