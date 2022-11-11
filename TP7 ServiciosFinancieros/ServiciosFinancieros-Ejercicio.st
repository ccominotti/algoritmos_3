!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/9/2022 17:34:48'!
test01PortfolioHaveZeroAsBalanceWhenCreated
	| portfolio |
	
	portfolio := Portfolio new. 
	 
	self assert: (portfolio balance) equals: (0 * peso).! !

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/9/2022 18:05:47'!
test02DepositIncreasesBalanceOnPortfolio
	| portfolio account |
	
	portfolio := Portfolio new. 
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
	
	portfolio addFinancialAsset: account.
	
	self assert: (portfolio balance) equals: (account balance).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/9/2022 18:05:47'!
test03PortfolioBalanceIsComposedtByBalanceOfTheAccountsIncluded
	| portfolio oneAccount otherAccount |
	
	portfolio := Portfolio new. 
	oneAccount := ReceptiveAccount  new.
	Deposit register: 100 * peso on: oneAccount.
	otherAccount := ReceptiveAccount  new.
	Deposit register: 100 * peso on: otherAccount.
	
	portfolio addFinancialAsset: oneAccount.
	portfolio addFinancialAsset: otherAccount.	
	
	self assert: (portfolio balance) equals: ((oneAccount balance)+ (otherAccount balance)).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/9/2022 18:05:47'!
test04PortfolioKnowsRegisteredTransactions
	| portfolio account deposit |
	
	portfolio := Portfolio new. 
	account := ReceptiveAccount  new.
	deposit :=Deposit register: 100 * peso on: account.

	
	portfolio addFinancialAsset: account.
	
	self assert: (portfolio hasRegistered: deposit).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/9/2022 18:05:47'!
test05PortfolioDoNotKnowNotRegisteredTransactions
	| portfolio oneAccount otherAccount deposit |
	
	portfolio := Portfolio new. 
	oneAccount := ReceptiveAccount  new.
	otherAccount := ReceptiveAccount  new.
	deposit := Deposit register: 100 * peso on: otherAccount.
	
	portfolio addFinancialAsset: oneAccount.	
		
	self deny: (portfolio hasRegistered: deposit).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/9/2022 18:05:47'!
test06PortfolioKnowsItsTransactions
	| portfolio account |
	
	portfolio := Portfolio new. 
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 100 * peso on: account.
	
	portfolio addFinancialAsset: account.	
		
	self assert: (portfolio transactions) equals: (account transactions).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/9/2022 18:05:47'!
test07PortfolioTransactionsAreComposedtByBalanceOfTheAccountsIncluded
	| portfolio account otherAccount|
	
	portfolio := Portfolio new. 
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 100 * peso on: account.
	otherAccount := ReceptiveAccount  new.
	Withdraw register: 100 * peso on: otherAccount.
	
	
	portfolio addFinancialAsset: account.	
	portfolio addFinancialAsset: otherAccount.	

	self assert: (portfolio transactions) equals: (account transactions, otherAccount transactions).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/9/2022 18:05:47'!
test08PortfolioBalanceIsComposedtByBalanceOfTheFinancialAssetsIncluded
	| portfolio account accountOfPortfolioInterno portfolioInterno|
	
	portfolio := Portfolio new. 

	portfolioInterno := Portfolio new. 
	accountOfPortfolioInterno := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountOfPortfolioInterno.
	
	account := ReceptiveAccount  new.
	Deposit register: 300 * peso on: account.
	
	portfolioInterno addFinancialAsset: accountOfPortfolioInterno.	
	portfolio addFinancialAsset: portfolioInterno.
	portfolio addFinancialAsset: account. 
	
	self assert: (portfolio balance) equals: ((portfolioInterno balance)+(account balance)).! !

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/9/2022 18:05:47'!
test09PortfolioTransactionAreComposedtByTransactionOfTheFinancialAssetsIncluded
	| portfolio account accountOfPortfolioInterno portfolioInterno|
	
	portfolio := Portfolio new. 

	portfolioInterno := Portfolio new. 
	accountOfPortfolioInterno := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountOfPortfolioInterno.
	
	account := ReceptiveAccount  new.
	Deposit register: 300 * peso on: account.
	
	portfolioInterno addFinancialAsset: accountOfPortfolioInterno.	
	portfolio addFinancialAsset: portfolioInterno.
	portfolio addFinancialAsset: account. 
	
	self assert: (portfolio transactions) equals: (portfolioInterno transactions, account transactions).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/11/2022 13:21:29'!
test10PortfolioCanNotAddAnAccountTwice
	| portfolio account |
	
	portfolio := Portfolio new. 	
	account := ReceptiveAccount  new.
	Deposit register: 300 * peso on: account.
	
	portfolio addFinancialAsset: account. 
	
	self should: [portfolio addFinancialAsset: account] 
	raise: Error
	withExceptionDo: [:anError | self assert: Portfolio CanNotAddAFinancialAssetTwice equals: anError messageText ].
	
	self assert: (portfolio transactions) equals: (account transactions).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/11/2022 13:21:29'!
test11PortfolioCanNotAddAnAccountAddedInAnInternalPortfolio
	| portfolio account portfolioInterno|
	
	portfolio := Portfolio new.
	portfolioInterno :=  	Portfolio new.
	account := ReceptiveAccount  new.
	Deposit register: 300 * peso on: account.
	
	portfolioInterno addFinancialAsset: account.
	portfolio addFinancialAsset: portfolioInterno.
	
	self should: [portfolio addFinancialAsset: account] 
	raise: Error
	withExceptionDo: [ :anError | self assert: Portfolio CanNotAddAFinancialAssetTwice equals: anError messageText ].
	
	self assert: (portfolio transactions) equals: (account transactions).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/11/2022 13:21:29'!
test12PortfolioCanNotAddAPortfolioThatHasASameAccount
	| portfolio account portfolioInterno|
	
	portfolio := Portfolio new.
	portfolioInterno :=  	Portfolio new.
	account := ReceptiveAccount  new.
	Deposit register: 300 * peso on: account.
	
	portfolio addFinancialAsset: account. 
	portfolioInterno addFinancialAsset: account.
	
	self should: [portfolio addFinancialAsset: portfolioInterno] 
	raise: Error
	withExceptionDo: [ :anError | self assert: Portfolio CanNotAddAFinancialAssetTwice equals: anError messageText ]
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/11/2022 13:21:29'!
test13PortfolioCanNotAddAnAccountRegisterInAnInternalPortfolio
	| portfolio account portfolioInterno|
	
	portfolio := Portfolio new.
	portfolioInterno :=  	Portfolio new.
	account := ReceptiveAccount  new.
	Deposit register: 300 * peso on: account.
	
	portfolio addFinancialAsset: account. 
	portfolio addFinancialAsset: portfolioInterno.
	
	self should: [portfolioInterno addFinancialAsset: account] 
	raise: Error
	withExceptionDo: [ :anError | self assert: Portfolio CanNotAddAFinancialAssetTwice equals: anError messageText ]
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'cc 11/11/2022 14:15:07'!
test14PortfolioCanNotBeAddInACloseCicle
	| portfolio otroPortfolio portfolioInterno|
	
	portfolio := Portfolio new.
	portfolioInterno :=  	Portfolio new.
	otroPortfolio := 	Portfolio new.
	
	portfolio addFinancialAsset: portfolioInterno. 
	portfolioInterno addFinancialAsset: otroPortfolio.
	
	self should: [otroPortfolio addFinancialAsset: portfolio] 
	raise: Error
	withExceptionDo: [ :anError | self assert: Portfolio CanNotAddAFinancialAssetTwice equals: anError messageText ]
	
	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferencesTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferencesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferencesTest methodsFor: 'tests' stamp: 'cc 11/9/2022 17:57:00'!
test01TransferMadesDiferentTransactionsInTheAccountsInvolved

	|source receiver|
	
	source := ReceptiveAccount new.
	receiver := ReceptiveAccount new.
	
	Transfer register: (100 * peso) from: source to: receiver.
	
	self assert: (-100 * peso) equals: source balance.
	self assert: (100 * peso) equals: receiver balance.! !

!TransferencesTest methodsFor: 'tests' stamp: 'cc 11/9/2022 17:57:08'!
test02TransferValueCanNotBeNegative

	|source receiver|
	
	source := ReceptiveAccount new.
	receiver := ReceptiveAccount new.
	
	self should: [	Transfer register: (-100 * peso) from: source to: receiver]
	raise: Error description: (Transfer invalidAmountErrorMessage).
	
	self assert: (0 * peso) equals: source balance.
	self assert: (0 * peso) equals: receiver balance.! !

!TransferencesTest methodsFor: 'tests' stamp: 'cc 11/9/2022 17:57:24'!
test03TransferValueIsAPossitiveNumberAndEqualsToTheTrasnactionValue

	|source receiver transferencia|
	
	source := ReceptiveAccount new.
	receiver := ReceptiveAccount new.
	
	transferencia := 	Transfer register: (100 * peso) from: source to: receiver.

	
	self assert: (-100 * peso) equals: source balance.
	self assert: (100 * peso) equals: receiver balance.
	self assert: (transferencia value) equals: (100 * peso).
	! !

!TransferencesTest methodsFor: 'tests' stamp: 'cc 11/9/2022 17:56:52'!
test04TransferenceHasBeenProperlyReRegisteredOnTheAccoounts

	|source receiver transferencia|
	
	source := ReceptiveAccount new.
	receiver := ReceptiveAccount new.
	
	transferencia := 	Transfer register: (100 * peso) from: source to: receiver.
	
	self assert: (receiver hasRegistered: (transferencia deposit)).	
	self assert: (source hasRegistered: (transferencia withdraw)).	! !

!TransferencesTest methodsFor: 'tests' stamp: 'cc 11/9/2022 17:57:44'!
test05TransferenceContrapartOfDepositIsOriginAccountTransaction

	| source receiver transferencia contrapart |
	
	source := ReceptiveAccount new.
	receiver := ReceptiveAccount new.
	
	transferencia := 	Transfer register: (100 * peso) from: source to: receiver.
	
	contrapart := OrderedCollection new.
	contrapart add: (transferencia depositContrapart).
	self assert:  (source transactions) equals: contrapart.	
! !

!TransferencesTest methodsFor: 'tests' stamp: 'cc 11/9/2022 17:58:07'!
test06TransferenceContrapartOfWithdrawIsReceiverAccountTransaction

	| source receiver transferencia contrapart |
	
	source := ReceptiveAccount new.
	receiver := ReceptiveAccount new.
	
	transferencia := 	Transfer register: (100 * peso) from: source to: receiver.
	
	contrapart := OrderedCollection new.
	contrapart add: (transferencia withdrawContrapart).
	self assert:  (receiver transactions) equals: contrapart.	
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'cc 11/9/2022 16:36:24'!
value 
	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'gmor 11/4/2022 19:30:18'!
valueForBalance
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'operations' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

!Deposit methodsFor: 'operations' stamp: 'cc 11/9/2022 17:17:48'!
valueForBalance: account
	^account balanceOfDeposit: value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'cc 11/9/2022 16:27:43'!
for: aValue
	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'private' stamp: 'cc 11/9/2022 16:26:49'!
addTransferSource: aTransfer
	transfer := aTransfer ! !

!TransferDeposit methodsFor: 'private' stamp: 'cc 11/9/2022 16:51:43'!
contrapart
	^transfer withdraw! !


!TransferDeposit methodsFor: 'operations' stamp: 'cc 11/9/2022 17:19:55'!
valueForBalance: account
	^account balanceOfDeposit: value.! !


!TransferDeposit methodsFor: 'initialization' stamp: 'cc 11/9/2022 16:25:30'!
initializeFor: aValue

	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'cc 11/9/2022 16:38:29'!
for: aValue
	^ self new initializeFor: aValue ! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'private' stamp: 'cc 11/9/2022 16:27:18'!
addTransferSource: aTransfer
	transfer := aTransfer! !

!TransferWithdraw methodsFor: 'private' stamp: 'cc 11/9/2022 16:55:09'!
contrapart
	^transfer deposit! !


!TransferWithdraw methodsFor: 'operations' stamp: 'cc 11/9/2022 17:19:18'!
valueForBalance: account
	^account balanceOfWithdraw: value.
	! !


!TransferWithdraw methodsFor: 'initialization' stamp: 'cc 11/9/2022 16:27:35'!
initializeFor: aValue
	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'cc 11/9/2022 16:27:57'!
for: aValue
	^ self new initializeFor: aValue! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'operations' stamp: 'cc 11/9/2022 17:14:35'!
value
	^ value! !

!Withdraw methodsFor: 'operations' stamp: 'cc 11/9/2022 17:17:30'!
valueForBalance: account
	^account balanceOfWithdraw: value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #FinancialAsset category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #FinancialAsset
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!FinancialAsset methodsFor: 'main protocol' stamp: 'cc 11/9/2022 17:27:13'!
balance
	self subclassResponsibility ! !

!FinancialAsset methodsFor: 'main protocol' stamp: 'cc 11/9/2022 17:31:44'!
hasRegistered: aTransaction
	self subclassResponsibility ! !

!FinancialAsset methodsFor: 'main protocol' stamp: 'cc 11/9/2022 17:27:28'!
transactions 
	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
FinancialAsset subclass: #Portfolio
	instanceVariableNames: 'accounts fathers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'cc 11/11/2022 15:22:00'!
addFinancialAsset: aReceptiveAccount 
	(aReceptiveAccount isRegister: self) ifTrue: [self error: self class CanNotAddAFinancialAssetTwice]. 

	accounts add: aReceptiveAccount.
	aReceptiveAccount addAsFatherIfApply: self.! !

!Portfolio methodsFor: 'main protocol' stamp: 'cc 11/8/2022 20:37:14'!
balance
	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [^0 * peso].! !

!Portfolio methodsFor: 'main protocol' stamp: 'cc 11/11/2022 15:07:43'!
fatherList
	^fathers! !

!Portfolio methodsFor: 'main protocol' stamp: 'cc 11/9/2022 17:31:03'!
hasRegistered: aTransaction 
	^accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction]. ! !

!Portfolio methodsFor: 'main protocol' stamp: 'cc 11/11/2022 13:40:27'!
is: anAccount
	^((self members) anySatisfy: [:aFinancialAsset  | aFinancialAsset is: anAccount]) or: [self = anAccount]! !

!Portfolio methodsFor: 'main protocol' stamp: 'cc 11/11/2022 15:22:07'!
isRegister: aPortfolio
	(self = aPortfolio ) ifTrue: [^true].
	((self members) anySatisfy: [:member | (member = aPortfolio) or: [member isRegister: aPortfolio] ]) ifTrue: [^true].
	((fathers) anySatisfy: [:member | (member = aPortfolio) or: [member isRegister: aPortfolio] ]) ifTrue: [^true].
	((aPortfolio members) anySatisfy: [:member |  (member = self) ]) ifTrue: [^true].
	((aPortfolio fatherList) anySatisfy: [:member |  (member = self) ]) ifTrue: [^true].
	^false
! !

!Portfolio methodsFor: 'main protocol' stamp: 'cc 11/8/2022 21:22:04'!
transactions
	| transactions |
	transactions := OrderedCollection new.
	accounts do: [:anAccount | transactions addAllLast: anAccount transactions].
	^transactions ! !


!Portfolio methodsFor: 'initialization' stamp: 'cc 11/11/2022 14:05:56'!
initialize
	accounts := OrderedCollection new.
	fathers := OrderedCollection new.! !


!Portfolio methodsFor: 'privated' stamp: 'cc 11/11/2022 14:07:34'!
addAsFatherIfApply: Portfoliofathers
	fathers add: Portfoliofathers.
! !

!Portfolio methodsFor: 'privated' stamp: 'cc 11/11/2022 12:59:28'!
members 
	^accounts! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'cc 11/11/2022 13:21:29'!
CanNotAddAFinancialAssetTwice
	'No se puede agregar dos veces el mismo activo financiero'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
FinancialAsset subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'privated' stamp: 'cc 11/11/2022 11:51:36'!
addAsFatherIfApply: Portfoliofathers
	^self! !

!ReceptiveAccount methodsFor: 'privated' stamp: 'cc 11/11/2022 13:15:35'!
members 
	^ self
! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'cc 11/9/2022 17:18:37'!
balance
	^transactions sum: [ :aTransaction | aTransaction valueForBalance: self ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'cc 11/9/2022 17:18:16'!
balanceOfDeposit: aValue
	^aValue! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'cc 11/9/2022 17:18:27'!
balanceOfWithdraw: aValue
	^aValue negated! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'cc 11/9/2022 16:37:22'!
hasRegistered: aTransaction
	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'cc 11/11/2022 13:35:36'!
is: aFinancialAsset
	^ self = aFinancialAsset
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'cc 11/11/2022 15:07:50'!
isRegister: aPortfolio
	^((aPortfolio members) anySatisfy: [:aFinancialAsset  | aFinancialAsset is: self] ) or: [(aPortfolio fatherList) anySatisfy: [:aFinancialAsset  | aFinancialAsset is: self] ].
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'cc 11/9/2022 16:37:18'!
register: aTransaction
	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'cc 11/6/2022 20:47:53'!
transactions 
	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'deposit withdraw value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'main protocol' stamp: 'cc 11/6/2022 20:04:18'!
deposit
	^deposit
	! !

!Transfer methodsFor: 'main protocol' stamp: 'cc 11/9/2022 16:51:20'!
depositContrapart
	^deposit contrapart
	! !

!Transfer methodsFor: 'main protocol' stamp: 'cc 11/6/2022 19:50:37'!
value
	^value
	! !

!Transfer methodsFor: 'main protocol' stamp: 'cc 11/6/2022 20:05:06'!
withdraw
	^withdraw
	! !

!Transfer methodsFor: 'main protocol' stamp: 'cc 11/9/2022 16:55:30'!
withdrawContrapart
	^withdraw contrapart
	! !


!Transfer methodsFor: 'initialization' stamp: 'cc 11/6/2022 20:42:42'!
initializeFor: aValue withdraw: aWithdraw deposit: aDeposit
	value := aValue.
	deposit := aDeposit.
	withdraw := aWithdraw.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'cc 11/6/2022 20:39:39'!
invalidAmountErrorMessage
	^'La cantidad a transferir es invalida'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'cc 11/9/2022 16:46:38'!
register: aValue from: oringinAccount to: destinationAccount
	| deposit withdraw transfer|
	(aValue > (0 * peso)) ifFalse: [^self error: self invalidAmountErrorMessage].
	deposit := TransferDeposit register: aValue on: destinationAccount.
	withdraw := TransferWithdraw register: aValue on: oringinAccount.
	transfer := Transfer new initializeFor: aValue withdraw: withdraw deposit: deposit.
	deposit addTransferSource: transfer.
	withdraw addTransferSource: transfer.
	^transfer! !
