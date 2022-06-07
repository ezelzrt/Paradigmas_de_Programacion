!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'am 6/6/2022 21:30:35'!
test01PortfolioConVariasCuentasSabeSuBalance

	| account accountTwo portfolio |
	
	account := ReceptiveAccount new.
	accountTwo:= ReceptiveAccount new.
	portfolio := Portfolio with: {account. accountTwo}.
	
	Deposit register: 100 * peso on: account.
	Deposit register: 200 * peso on: accountTwo.	
		
	self assert: 300 * peso equals: portfolio balance..! !

!PortfolioTest methodsFor: 'tests' stamp: 'am 6/6/2022 21:31:06'!
test02PortfolioConCuentasYOtroPorfolioSabeSuBalance

	| account accountTwo portfolio portfolioTwo accountThree |
	
	account := ReceptiveAccount new.
	accountTwo:= ReceptiveAccount new.
	accountThree:= ReceptiveAccount new.
	
	portfolio := Portfolio with: {account. accountTwo}.
	portfolioTwo := Portfolio with: {accountThree. portfolio}.
	
	Deposit register: 100 * peso on: account.
	Deposit register: 200 * peso on: accountTwo.	
	Deposit register: 300 * peso on: accountTwo.	
			
	self assert: 600 * peso equals: portfolioTwo balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'am 6/6/2022 21:30:13'!
test03PortfolioConoceSusTransacciones

	| account accountTwo portfolio deposit |
	
	account := ReceptiveAccount new.
	accountTwo:= ReceptiveAccount new.
		
	portfolio := Portfolio with: {account. accountTwo}.
	
	deposit := Withdraw register: 100 * peso on: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'am 6/6/2022 21:32:18'!
test04PortfolioNoConoceTransaccionesQueNoRegistro

	| account accountTwo portfolio deposit deposit2 |
	
	account := ReceptiveAccount new.
	accountTwo:= ReceptiveAccount new.
		
	portfolio := Portfolio with: {account. accountTwo}.
	
	deposit := Withdraw register: 100 * peso on: account.
	deposit2 := Deposit for: 100 * peso.
	
	self deny: (portfolio hasRegistered: deposit2)! !

!PortfolioTest methodsFor: 'tests' stamp: 'am 6/6/2022 21:33:25'!
test05PortfolioConoceTodasSusTransacciones

	| account accountTwo portfolio withdraw deposit2 otherPortfolio |
	
	account := ReceptiveAccount new.
	accountTwo:= ReceptiveAccount new.
	otherPortfolio := Portfolio with: {accountTwo}.
	
	portfolio := Portfolio with: {account. otherPortfolio}.
	
	withdraw := Withdraw register: 100 * peso on: account.
	deposit2 := Deposit register: 100 * peso on: accountTwo.
	
	self assert: (portfolio transactions) = (OrderedCollection with: withdraw with: deposit2).! !

!PortfolioTest methodsFor: 'tests' stamp: 'am 6/6/2022 21:28:39'!
test14

	| account accountTwo portfolio withdraw deposit otherPortfolio otherDeposit |
	
	account := ReceptiveAccount new.
	accountTwo:= ReceptiveAccount new.
	otherPortfolio := Portfolio with: {accountTwo}.
	
	portfolio := Portfolio with: {account. otherPortfolio}.
	
	withdraw := Withdraw register: 100 * peso on: account.
	deposit := Deposit register: 100 * peso on: accountTwo.
	otherDeposit := Deposit register: 200 * peso on: accountTwo.	
	
	self assert: (portfolio transactions) = (OrderedCollection with: withdraw with: deposit with: otherDeposit).! !


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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'am 6/6/2022 20:46:49'!
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'am 6/6/2022 20:15:52'!
test08TransferenceTerminar

	| account accountTwo |
	
	account := ReceptiveAccount new.
	accountTwo:= ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	Transference register: 100 * peso from: account to: accountTwo.
		
	self assert: 0 * peso equals: account balance.
	self assert: 100 * peso equals: accountTwo balance.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

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
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'am 6/2/2022 21:36:08'!
after: otroSaldo
	
	^ self value + otroSaldo.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transference
	instanceVariableNames: 'value extraccion deposito'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'am 6/6/2022 16:30:10'!
initializeFor: aValue extraccion: withdraw deposito: deposit

	value := aValue.
	extraccion := withdraw.
	deposito := deposit.
	deposit contrapart: withdraw.
	withdraw contrapart: deposit.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'am 6/6/2022 16:26:09'!
register: aValue from: cuentaDeExtraccion to: cuentaDeDeposito

	|transference withdraw deposit|	
	
	withdraw := TransferenceWithdraw register: aValue on: cuentaDeExtraccion .
	deposit := TransferenceDeposit  register: aValue on: cuentaDeDeposito .
	transference := self new initializeFor: aValue extraccion: withdraw deposito: deposit.
	
	^ transference.! !


!classDefinition: #TransferenceDeposit category: 'ServiciosFinancieros-Ejercicio'!
Transference subclass: #TransferenceDeposit
	instanceVariableNames: 'contrapart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceDeposit methodsFor: 'initialization' stamp: 'am 6/6/2022 16:23:10'!
initializeFor: aValue

	value := aValue ! !


!TransferenceDeposit methodsFor: 'value' stamp: 'am 6/6/2022 16:23:10'!
after: otroSaldo
	
	^ self value + otroSaldo.! !

!TransferenceDeposit methodsFor: 'value' stamp: 'am 6/6/2022 16:31:01'!
contrapart: aContrapart

	contrapart := aContrapart ! !

!TransferenceDeposit methodsFor: 'value' stamp: 'am 6/6/2022 16:23:10'!
value

	^ value! !


!TransferenceDeposit methodsFor: 'as yet unclassified' stamp: 'am 6/6/2022 19:41:40'!
contrapart

	^contrapart ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceDeposit class
	instanceVariableNames: ''!

!TransferenceDeposit class methodsFor: 'instance creation' stamp: 'am 6/6/2022 16:23:10'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferenceWithdraw category: 'ServiciosFinancieros-Ejercicio'!
Transference subclass: #TransferenceWithdraw
	instanceVariableNames: 'contrapart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceWithdraw methodsFor: 'initialization' stamp: 'am 6/6/2022 16:24:09'!
initializeFor: aValue

	value := aValue ! !


!TransferenceWithdraw methodsFor: 'value' stamp: 'am 6/6/2022 16:24:09'!
after: otroSaldo

	^ otroSaldo - self value.! !

!TransferenceWithdraw methodsFor: 'value' stamp: 'am 6/6/2022 16:25:15'!
contrapart

	^contrapart ! !

!TransferenceWithdraw methodsFor: 'value' stamp: 'am 6/6/2022 16:31:38'!
contrapart: aContrapart

	contrapart := aContrapart ! !

!TransferenceWithdraw methodsFor: 'value' stamp: 'am 6/6/2022 16:24:09'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceWithdraw class
	instanceVariableNames: ''!

!TransferenceWithdraw class methodsFor: 'instance creation' stamp: 'am 6/6/2022 16:24:09'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'am 6/2/2022 21:36:08'!
after: otroSaldo

	^ otroSaldo - self value.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'array cuentas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'am 6/6/2022 20:23:30'!
initializeWith: anArray 

	cuentas := anArray.! !


!Portfolio methodsFor: 'as yet unclassified' stamp: 'am 6/6/2022 20:26:00'!
balance
	
	^ cuentas sum: [:cuenta | cuenta balance].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'am 6/6/2022 21:02:46'!
hasRegistered: aTransaccion 
	
	^cuentas anySatisfy: [ :cuenta | cuenta hasRegistered: aTransaccion ] ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'am 6/6/2022 21:22:00'!
transactions
	
	| resultado |
	resultado := OrderedCollection new.
	cuentas do: [ :cuenta | resultado addAll: cuenta transactions].
	^resultado! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'am 6/6/2022 20:22:56'!
with: anArray 
	^self new initializeWith: anArray ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'am 6/6/2022 16:19:00'!
balance

	|balance|
	balance _ 0.
	transactions do: [:aTransaction | balance _ aTransaction after: balance].
	^ balance! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !
