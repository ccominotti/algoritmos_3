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

!CustomerBookTest methodsFor: 'testing' stamp: 'gmor 9/25/2022 11:24:59'!
assertTheCustomerBook: aCustomerBook HasACustomer: aCustomer

	self assert: (aCustomerBook includesCustomerNamed: aCustomer).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 12:55:19'!
assertTheCustomerBookHasOnlyJohnLennon: aCustomerBook  
	self assert: aCustomerBook numberOfCustomers = 1.
	self assert: (aCustomerBook includesCustomerNamed: 'John Lennon')
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 12:38:27'!
createACustomerBookWith: aCustomer
	^CustomerBook new addCustomerNamed: aCustomer.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 12:09:38'!
denyTheCustomerBook: aCustomerBook HasACustomer: aCustomer
	self deny: (aCustomerBook includesCustomerNamed: aCustomer).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 14:06:24'!
failing:  aBlockThatFails onTheError: anErrorType do: assertionBlock

	[ aBlockThatFails value.
	self fail ]
		on: anErrorType 
		do: assertionBlock! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmor 9/25/2022 11:29:23'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook anAction |
	
	customerBook := CustomerBook new.
	anAction := [customerBook addCustomerNamed: 'John Lennon'].
	
	self should: anAction notTakeMoreThan: 50 milliSeconds .
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmor 9/25/2022 11:29:40'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook anAction |
	
	customerBook :=self createACustomerBookWith: 'Paul McCartney'.
	
	anAction := [customerBook removeCustomerNamed: 'Paul McCartney'].
	
	self should: anAction notTakeMoreThan: 100 milliSeconds.
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 13:54:32'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook addEmptyNameBlock assertionEmptyCustomerBlock |
			
	customerBook := CustomerBook new.
	addEmptyNameBlock := [customerBook addCustomerNamed: ''.].
	
	assertionEmptyCustomerBlock :=[ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].
		
	self failing: addEmptyNameBlock onTheError: Error do: assertionEmptyCustomerBlock.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 14:11:36'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook removeInvalidCustomerBlock |
	
	customerBook :=self createACustomerBookWith:  'John Lennon'.
	removeInvalidCustomerBlock := [customerBook removeCustomerNamed: 'Paul McCartney'].
	self failing: removeInvalidCustomerBlock onTheError: NotFound do: [self assertTheCustomerBookHasOnlyJohnLennon: customerBook].

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 14:30:15'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook:= self createACustomerBookWith:  paulMcCartney. 
	customerBook suspendCustomerNamed: paulMcCartney.
	
	
	self assert: (customerBook hasATotalOf: 1 active: 0 suspended: 1).
	
	self assertTheCustomerBook: customerBook HasACustomer: paulMcCartney.
	
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 14:30:48'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney:= 'Paul McCartney'.
	
	customerBook := self createACustomerBookWith:  paulMcCartney. 

	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: (customerBook hasATotalOf: 0 active: 0 suspended: 0).
	
	self denyTheCustomerBook: customerBook HasACustomer: paulMcCartney.
	


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 14:16:42'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon suspendInvalidCustomerBlock |
			
	johnLennon := 'John Lennon'.
	
	customerBook := self createACustomerBookWith:  johnLennon. 
	suspendInvalidCustomerBlock := [customerBook suspendCustomerNamed: 'Ringo Starr'].
	self failing: suspendInvalidCustomerBlock onTheError: CantSuspend do: [self assertTheCustomerBookHasOnlyJohnLennon: customerBook].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/24/2022 14:15:20'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon suspendInvalidCustomerBlock|
			
	johnLennon := 'John Lennon'.
	customerBook := self createACustomerBookWith:  johnLennon. 	customerBook suspendCustomerNamed: johnLennon.
	 suspendInvalidCustomerBlock := [customerBook suspendCustomerNamed: johnLennon].
	
	self failing: suspendInvalidCustomerBlock onTheError: CantSuspend do: [self assertTheCustomerBookHasOnlyJohnLennon: customerBook].
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

!CustomerBook methodsFor: 'customer management' stamp: 'cg 9/24/2022 14:25:35'!
hasATotalOf: aNumberOfCustomers active: aNumberOfActiveCustomers suspended: aNumberOfSuspendedCustomers

   ^((aNumberOfActiveCustomers = self numberOfActiveCustomers) and:
    (aNumberOfSuspendedCustomers = self numberOfSuspendedCustomers) and:
    (aNumberOfCustomers = self numberOfCustomers))
	! !

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
