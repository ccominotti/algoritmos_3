!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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


!classDefinition: #ReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportTest methodsFor: 'tests Transfer Net' stamp: 'cc 11/15/2022 21:16:32'!
test10
	| destinationAccount originAccount transferNetDestinationAccount transferNetOriginAccount |
	destinationAccount := ReceptiveAccount new.
	originAccount:= ReceptiveAccount new.
	transferNetDestinationAccount := TransferNet for: destinationAccount.
	transferNetOriginAccount := TransferNet for: originAccount.
	
	self assert: transferNetDestinationAccount transferNetTotalBalance equals: destinationAccount balance.
	self assert: transferNetOriginAccount transferNetTotalBalance equals: originAccount balance.! !

!ReportTest methodsFor: 'tests Transfer Net' stamp: 'cc 11/15/2022 21:16:23'!
test11
	| destinationAccount originAccount transferNetDestinationAccount transferNetOriginAccount |
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	transferNetDestinationAccount := TransferNet for: destinationAccount.
	transferNetOriginAccount := TransferNet for: originAccount.
	
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	
	self assert: transferNetDestinationAccount transferNetTotalBalance equals: destinationAccount balance.
	self assert: transferNetOriginAccount transferNetTotalBalance equals: originAccount balance.! !

!ReportTest methodsFor: 'tests Transfer Net' stamp: 'cc 11/15/2022 21:17:26'!
test12
	| destinationAccount originAccount transferNetDestinationAccount transferNetOriginAccount |
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	Deposit register: 100 * peso on: destinationAccount.
	transferNetDestinationAccount := TransferNet for: destinationAccount.
	transferNetOriginAccount := TransferNet for: originAccount.
	
	self assert: transferNetOriginAccount transferNetTotalBalance equals: originAccount balance.
	self assert: transferNetDestinationAccount transferNetTotalBalance equals: 10 * peso.! !

!ReportTest methodsFor: 'tests Transfer Net' stamp: 'cc 11/15/2022 21:18:50'!
test13
	| destinationAccount originAccount portfolioWithOriginTransfer portfolioWithDestinationTransfer transferNetDestinationAccount transferNetOriginAccount|
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	portfolioWithOriginTransfer := Portfolio new.
	portfolioWithOriginTransfer add: originAccount.
	portfolioWithDestinationTransfer := Portfolio new.
	portfolioWithDestinationTransfer add: destinationAccount .
	transferNetDestinationAccount := TransferNet for: portfolioWithDestinationTransfer.
	transferNetOriginAccount := TransferNet for: portfolioWithOriginTransfer.
	
	Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	Transfer amount: 500 * peso from: destinationAccount to: originAccount.
	Deposit register: 50 * peso on: destinationAccount. 
	
	self assert: transferNetOriginAccount transferNetTotalBalance equals: originAccount balance.
	self assert: transferNetDestinationAccount transferNetTotalBalance equals: ((destinationAccount balance) - (50 * peso)).
! !


!ReportTest methodsFor: 'tests Detailed Tree Printer' stamp: 'gmor 11/17/2022 21:01:37'!
test17
	| account portfolio portfolioTreePrinter stringTree |
	
	account := ReceptiveAccount named: 'Cuenta'.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio named: 'Portfolio' with: account.
	portfolioTreePrinter := PortfolioDetailedTreePrinter for: portfolio.
	stringTree := 
'Portfolio
-Cuenta
--Depósito por 100 * pesos
--Balance = 100 * pesos
-Balance = 100 * pesos', String newLineString.
		
	self assert: portfolioTreePrinter portfolioTreePrinter equals: stringTree.! !


!ReportTest methodsFor: 'tests Tree Printer' stamp: 'gmor 11/17/2022 21:01:20'!
test14
	| portfolio portfolioTreePrinter|
	
	portfolio := Portfolio named: 'Portfolio'.
	portfolioTreePrinter := PortfolioTreePrinter for: portfolio.
	self assert:  portfolioTreePrinter portfolioTreePrinter equals: 'Portfolio', String newLineString.! !

!ReportTest methodsFor: 'tests Tree Printer' stamp: 'gmor 11/17/2022 21:01:12'!
test15
	| account portfolio portfolioTreePrinter stringTree |
	
	account := ReceptiveAccount named: 'Cuenta'.
	portfolio := Portfolio named: 'Portfolio' with: account.
	portfolioTreePrinter := PortfolioTreePrinter for: portfolio.
	stringTree := 'Portfolio
-Cuenta', String newLineString.
		
	self assert: portfolioTreePrinter portfolioTreePrinter equals: stringTree. ! !

!ReportTest methodsFor: 'tests Tree Printer' stamp: 'gmor 11/17/2022 21:01:02'!
test16
	| accountA accountB accountC portfolio portfolioPadre portfolioHijo portfolioTreePrinter stringTree |
	
	accountA := ReceptiveAccount named: 'CuentaA'.
	accountB := ReceptiveAccount named: 'CuentaB'.
	accountC := ReceptiveAccount named: 'CuentaC'.
	portfolio := Portfolio named: 'PortfolioHijoA' with: accountA with: accountB.
	portfolioHijo := Portfolio named: 'PortfolioHijoB' with:accountC.
	portfolioPadre := Portfolio named: 'PortfolioPadre' with: portfolio with: portfolioHijo.
	portfolioTreePrinter := PortfolioTreePrinter for: portfolioPadre.
	stringTree := 'PortfolioPadre
-PortfolioHijoA
--CuentaA
--CuentaB
-PortfolioHijoB
--CuentaC', String newLineString.
		
	self assert: portfolioTreePrinter portfolioTreePrinter equals: stringTree. ! !


!ReportTest methodsFor: 'tests Account Summary' stamp: 'cc 11/15/2022 20:35:36'!
test01
	| account accountSummary |
	account := ReceptiveAccount new.
	accountSummary := AccountSummary for: account.
	self assert: accountSummary accountSummaryReport equals: 'balance', account balance asString.! !

!ReportTest methodsFor: 'tests Account Summary' stamp: 'cc 11/15/2022 20:39:39'!
test02
	| account deposit accountSummary |
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	accountSummary := AccountSummary for: account.
	self assert: accountSummary accountSummaryReport equals: ('Depósito por ', deposit value asString, 'balance', account balance asString).! !

!ReportTest methodsFor: 'tests Account Summary' stamp: 'cc 11/15/2022 20:41:09'!
test03
	| account withdraw accountSummary |
	account := ReceptiveAccount new.
	withdraw := Withdraw register: 100 * peso on: account.
	accountSummary := AccountSummary for: account.
	self assert: accountSummary accountSummaryReport equals: 'Extracción por ', withdraw value asString, 'balance', account balance asString.! !

!ReportTest methodsFor: 'tests Account Summary' stamp: 'cc 11/15/2022 20:44:01'!
test04
	| destinationAccount originAccount transfer accountSummaryOfDestination accountSummaryOfOrigin |
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	accountSummaryOfDestination := AccountSummary for: destinationAccount.
	accountSummaryOfOrigin := AccountSummary for: originAccount.
	transfer := Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	
	self assert: accountSummaryOfDestination accountSummaryReport equals: 'Entrada por transferencia de ', transfer value asString, 'balance', destinationAccount balance asString.
	self assert: accountSummaryOfOrigin accountSummaryReport equals: 'Salida por transferencia de ', transfer value asString , 'balance', originAccount balance asString.! !

!ReportTest methodsFor: 'tests Account Summary' stamp: 'cc 11/15/2022 20:44:45'!
test05
	| account withdraw deposit accountSummary|
	account := ReceptiveAccount new.
	withdraw := Withdraw register: 100 * peso on: account.
	deposit := Deposit register: 100 * peso on: account.
	accountSummary := AccountSummary for: account.
	
	self assert: 'Extracción por ', withdraw value asString,'Depósito por ', deposit value asString, 'balance', account balance asString equals: accountSummary accountSummaryReport .! !

!ReportTest methodsFor: 'tests Account Summary' stamp: 'cc 11/15/2022 20:46:32'!
test06
	| portfolio accountSummary|
	portfolio := Portfolio new.
	accountSummary := AccountSummary for: portfolio.
	
	self assert: accountSummary accountSummaryReport equals: 'balance', portfolio balance asString.! !

!ReportTest methodsFor: 'tests Account Summary' stamp: 'cc 11/15/2022 20:47:17'!
test07
	| account deposit portfolio accountSummary|
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio add: account.
	accountSummary := AccountSummary for: portfolio.
	
	self assert: accountSummary accountSummaryReport equals: 'Depósito por ', deposit value asString, 'balance', account balance asString.! !

!ReportTest methodsFor: 'tests Account Summary' stamp: 'cc 11/15/2022 20:47:35'!
test08
	| account deposit portfolio accountSummary|
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Withdraw register: 100 * peso on: account.
	portfolio add: account.
	accountSummary := AccountSummary for: portfolio.

	self assert: accountSummary accountSummaryReport equals: 'Extracción por ', deposit value asString, 'balance', account balance asString.! !

!ReportTest methodsFor: 'tests Account Summary' stamp: 'cc 11/15/2022 20:48:48'!
test09
	| destinationAccount originAccount transfer portfolioWithDestinationAccount portfolioWithOriginAccount accountSummaryWithDestinationAccount accountSummaryWithOriginAccount|
	
	portfolioWithDestinationAccount := Portfolio new.
	portfolioWithOriginAccount := Portfolio new.
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	accountSummaryWithDestinationAccount  := AccountSummary for: portfolioWithDestinationAccount.
	accountSummaryWithOriginAccount := AccountSummary for: portfolioWithOriginAccount.

	portfolioWithDestinationAccount add: destinationAccount.
	portfolioWithOriginAccount add: originAccount.
	
	transfer := Transfer amount: 10 * peso from: originAccount to: destinationAccount.
	
	self assert: accountSummaryWithDestinationAccount accountSummaryReport equals: 'Entrada por transferencia de ', transfer value asString, 'balance', destinationAccount balance asString.
	self assert: accountSummaryWithOriginAccount accountSummaryReport equals: 'Salida por transferencia de ', transfer value asString , 'balance', originAccount balance asString.! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'balance' stamp: 'cc 11/14/2022 10:09:20'!
affectTransferNet: aBalance
	^aBalance! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

!Deposit methodsFor: 'balance' stamp: 'cc 11/17/2022 18:04:48'!
aplicateToReport: aReport
	aReport affectedByDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !

!TransferDepositLeg methodsFor: 'balance' stamp: 'cc 11/17/2022 18:04:43'!
aplicateToReport: aReport
	aReport affectedByTransferDepositLeg: self! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !

!TransferWithdrawLeg methodsFor: 'balance' stamp: 'cc 11/17/2022 18:04:39'!
aplicateToReport: aReport
	aReport affectedByTransferWithdrawLeg: self! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !

!Withdraw methodsFor: 'balance' stamp: 'cc 11/17/2022 18:04:34'!
aplicateToReport: aReport
	aReport affectedByWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #FinancialAsset category: 'ServiciosFinancieros-Solucion'!
Object subclass: #FinancialAsset
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!FinancialAsset methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!FinancialAsset methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!FinancialAsset methodsFor: 'main protocol' stamp: 'cc 11/17/2022 17:18:46'!
iterateTransactionsWith: aTransactionAction
	self transactions do: [:aTransaction | aTransactionAction value: aTransaction] ! !

!FinancialAsset methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !

!FinancialAsset methodsFor: 'main protocol' stamp: 'cc 11/14/2022 10:10:06'!
transferNet
	self subclassResponsibility.
 ! !


!FinancialAsset methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!FinancialAsset methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!FinancialAsset methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
FinancialAsset subclass: #Portfolio
	instanceVariableNames: 'accounts parents name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'cc 11/17/2022 18:32:45'!
named: aName 

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := aName.! !

!Portfolio methodsFor: 'initialization' stamp: 'cc 11/17/2022 18:27:25'!
named: aName with: anAccount

	accounts := OrderedCollection with: anAccount.
	parents := OrderedCollection new.
	name := aName.! !

!Portfolio methodsFor: 'initialization' stamp: 'cc 11/17/2022 19:54:41'!
named: aName with: anAccount with: otherAccount

	accounts := OrderedCollection with: anAccount with: otherAccount.
	parents := OrderedCollection new.
	name := aName.! !


!Portfolio methodsFor: 'main protocol' stamp: 'cc 11/15/2022 21:04:50'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 *peso]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'cc 11/17/2022 19:49:12'!
aplicateToReport: aReport
	aReport affectedByPortfolio: self.
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'cc 11/17/2022 18:56:33'!
iterateAccountsWith: anAccountAction
	accounts do: [ :anAccount | anAccountAction value: anAccount].! !

!Portfolio methodsFor: 'accounts management' stamp: 'cc 11/17/2022 18:37:53'!
name
	^name.! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'cc 11/17/2022 18:32:32'!
named: aName 

	^self new 
		named: aName;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'cc 11/17/2022 18:45:20'!
named: aName with: anAccount

	^self new 		named: aName 	with: anAccount
		! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'cc 11/17/2022 19:54:13'!
named: aName with: anAccount with: otherAccount

	^self new 		named: aName 	with: anAccount with: otherAccount.
		! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
FinancialAsset subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'cc 11/17/2022 18:28:56'!
named: aName

	super initialize.
	transactions := OrderedCollection new.
	name := aName.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'cc 11/11/2022 20:16:11'!
balance

	^transactions 
		inject: 0*peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'cc 11/17/2022 18:38:01'!
name
	^name.
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'cc 11/17/2022 19:02:02'!
aplicateToReport: aReport
	aReport affectedByReceptiveAccount: self.
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'cc 11/17/2022 18:28:28'!
named: aName
	^self new named: aName! !


!classDefinition: #PortfolioTreeReport category: 'ServiciosFinancieros-Solucion'!
Object subclass: #PortfolioTreeReport
	instanceVariableNames: 'portfolio treeString indentationLevel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreeReport methodsFor: 'initialization' stamp: 'gmor 11/17/2022 21:37:56'!
with: aPortfolio
	portfolio := aPortfolio.! !


!PortfolioTreeReport methodsFor: 'private' stamp: 'gmor 11/17/2022 21:22:00'!
appendToReportText: moreText
	treeString := treeString, indentationLevel, moreText, String newLineString.! !

!PortfolioTreeReport methodsFor: 'private' stamp: 'gmor 11/17/2022 21:14:17'!
indentationAdd
	indentationLevel := indentationLevel, '-'! !

!PortfolioTreeReport methodsFor: 'private' stamp: 'gmor 11/17/2022 21:16:57'!
indentationRemove
	indentationLevel := indentationLevel copyFrom:1 to: (indentationLevel size - 1).! !


!PortfolioTreeReport methodsFor: 'dd' stamp: 'cc 11/17/2022 20:33:02'!
affectedByPortfolio: aPortfolio
	self subclassResponsibility ! !

!PortfolioTreeReport methodsFor: 'dd' stamp: 'cc 11/17/2022 20:32:42'!
affectedByReceptiveAccount: aReceptiveAccount.
	self subclassResponsibility ! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
PortfolioTreeReport subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'dd - transactions' stamp: 'gmor 11/17/2022 21:35:29'!
affectedByDeposit: aDeposit
	self appendToReportText: 'Depósito por ', aDeposit value asString
	! !

!PortfolioDetailedTreePrinter methodsFor: 'dd - transactions' stamp: 'gmor 11/17/2022 21:35:34'!
affectedByTransferDepositLeg: aTranferDepositLeg
	self appendToReportText: 'Entrada por transferencia de ', aTranferDepositLeg value asString.! !

!PortfolioDetailedTreePrinter methodsFor: 'dd - transactions' stamp: 'gmor 11/17/2022 21:35:41'!
affectedByTransferWithdrawLeg: aTranferWithdrawLeg
	self appendToReportText: 'Salida por transferencia de ', aTranferWithdrawLeg value asString.! !

!PortfolioDetailedTreePrinter methodsFor: 'dd - transactions' stamp: 'gmor 11/17/2022 21:35:45'!
affectedByWithdraw: aDeposit
	self appendToReportText: 'Extracción por ', aDeposit value asString.! !


!PortfolioDetailedTreePrinter methodsFor: 'dd' stamp: 'gmor 11/17/2022 21:31:39'!
affectedByPortfolio: aPortfolio

	self appendToReportText: aPortfolio name.
	self indentationAdd.
	aPortfolio iterateAccountsWith: [:anAccount | anAccount aplicateToReport: self].
	self appendToReportText: 'Balance = ', aPortfolio balance asString.
	self indentationRemove.! !

!PortfolioDetailedTreePrinter methodsFor: 'dd' stamp: 'gmor 11/17/2022 21:37:01'!
affectedByReceptiveAccount: aReceptiveAccount

	self appendToReportText: aReceptiveAccount name.
	self indentationAdd.
	aReceptiveAccount iterateTransactionsWith: [:transaction | transaction aplicateToReport: self].
	self appendToReportText: 'Balance = ', aReceptiveAccount balance asString.
	self indentationRemove.! !


!PortfolioDetailedTreePrinter methodsFor: 'main protocol' stamp: 'gmor 11/17/2022 21:05:23'!
portfolioTreePrinter
	treeString := ''.
	indentationLevel := ''.
	portfolio aplicateToReport: self.
	^treeString! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioDetailedTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioDetailedTreePrinter class
	instanceVariableNames: ''!

!PortfolioDetailedTreePrinter class methodsFor: 'as yet unclassified' stamp: 'cc 11/17/2022 20:24:50'!
for: anAccount
	^self new with: anAccount! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
PortfolioTreeReport subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'main protocol' stamp: 'gmor 11/17/2022 21:04:13'!
portfolioTreePrinter
	treeString := ''.
	indentationLevel := ''.
	
	portfolio aplicateToReport: self.
	^treeString ! !


!PortfolioTreePrinter methodsFor: 'dd' stamp: 'gmor 11/17/2022 21:24:42'!
affectedByPortfolio: aPortfolio
	self appendToReportText: aPortfolio name.
	self indentationAdd.
	aPortfolio iterateAccountsWith: [:anAccount | anAccount aplicateToReport: self].
	self indentationRemove.! !

!PortfolioTreePrinter methodsFor: 'dd' stamp: 'gmor 11/17/2022 21:39:54'!
affectedByReceptiveAccount: aReceptiveAccount.
	self appendToReportText: aReceptiveAccount name! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'as yet unclassified' stamp: 'cc 11/17/2022 18:35:38'!
for: anAccount
	^self new with: anAccount! !


!classDefinition: #Report category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Report
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Report methodsFor: 'initialization' stamp: 'gmor 11/17/2022 21:43:44'!
with: anAccount
	account := anAccount.! !


!Report methodsFor: 'dd' stamp: 'cc 11/17/2022 17:44:35'!
affectedByDeposit: aDeposit
	self subclassResponsibility 
! !

!Report methodsFor: 'dd' stamp: 'cc 11/17/2022 17:45:17'!
affectedByTransferDepositLeg: aTrasnferDepositLeg
	self subclassResponsibility 
! !

!Report methodsFor: 'dd' stamp: 'cc 11/17/2022 17:45:03'!
affectedByTransferWithdrawLeg: aTransferWithdrawLeg
	self subclassResponsibility 
! !

!Report methodsFor: 'dd' stamp: 'cc 11/17/2022 17:44:50'!
affectedByWithdraw: aWithdraw
	self subclassResponsibility 
! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Report subclass: #AccountSummary
	instanceVariableNames: 'summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'main protocol' stamp: 'gmor 11/17/2022 21:03:14'!
accountSummaryReport
	summary := ''.
	account iterateTransactionsWith: [:transaction | transaction aplicateToReport: self].
	summary := summary, 'balance', account balance asString.
	^summary.
	! !


!AccountSummary methodsFor: 'dd' stamp: 'gmor 11/17/2022 21:29:57'!
affectedByDeposit: aDeposit
	self summaryAdd: 'Depósito por ', aDeposit value asString! !

!AccountSummary methodsFor: 'dd' stamp: 'gmor 11/17/2022 21:29:48'!
affectedByTransferDepositLeg: aTranferDepositLeg
	self summaryAdd: 'Entrada por transferencia de ', aTranferDepositLeg value asString! !

!AccountSummary methodsFor: 'dd' stamp: 'gmor 11/17/2022 21:29:40'!
affectedByTransferWithdrawLeg: aTranferWithdrawLeg
	self summaryAdd: 'Salida por transferencia de ', aTranferWithdrawLeg value asString! !

!AccountSummary methodsFor: 'dd' stamp: 'gmor 11/17/2022 21:29:23'!
affectedByWithdraw: aDeposit
	self summaryAdd: 'Extracción por ', aDeposit value asString! !

!AccountSummary methodsFor: 'dd' stamp: 'gmor 11/17/2022 21:29:09'!
summaryAdd: moreText
	summary := summary, moreText! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'cc 11/15/2022 20:32:05'!
for: anAccount
	^self new with: anAccount! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
Report subclass: #TransferNet
	instanceVariableNames: 'balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'main protocol' stamp: 'gmor 11/17/2022 21:02:38'!
transferNetTotalBalance	balance := 0.
	account iterateTransactionsWith: [:transaction | transaction aplicateToReport: self].
	^balance! !


!TransferNet methodsFor: 'dd' stamp: 'cc 11/17/2022 17:37:42'!
affectedByDeposit: aDeposit
! !

!TransferNet methodsFor: 'dd' stamp: 'cc 11/17/2022 17:37:19'!
affectedByTransferDepositLeg: aTransferDepositLeg
	balance := balance + aTransferDepositLeg value.! !

!TransferNet methodsFor: 'dd' stamp: 'cc 11/17/2022 17:37:24'!
affectedByTransferWithdrawLeg: aTranferWithdrawLeg
	balance := balance - aTranferWithdrawLeg value.! !

!TransferNet methodsFor: 'dd' stamp: 'cc 11/17/2022 17:37:36'!
affectedByWithdraw: aWithdraw
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'ServiciosFinancieros-Solucion'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'as yet unclassified' stamp: 'cc 11/15/2022 21:06:47'!
for: anAccount
	^self new with: anAccount! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
