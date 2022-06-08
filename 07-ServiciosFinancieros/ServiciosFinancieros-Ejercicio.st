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

!PortfolioTest methodsFor: 'tests' stamp: 'am 6/8/2022 19:32:10'!
test03PortfolioConoceSusTransaccionesRegistradas

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

!PortfolioTest methodsFor: 'tests' stamp: 'am 6/8/2022 19:30:28'!
test05PortfolioConoceTodasSusTransacciones

	| account accountTwo portfolio otherPortfolio withdraw deposit otherDeposit allTransactions |
	
	account := ReceptiveAccount new.
	accountTwo:= ReceptiveAccount new.
	
	otherPortfolio := Portfolio with: {accountTwo}.
	portfolio := Portfolio with: {account. otherPortfolio}.
	
	withdraw := Withdraw register: 100 * peso on: account.
	deposit := Deposit register: 100 * peso on: accountTwo.
	otherDeposit := Deposit register: 200 * peso on: accountTwo.	
	
	allTransactions := OrderedCollection with: withdraw with: deposit with: otherDeposit.
	self assert: (portfolio transactions) = allTransactions.! !


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


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'am 6/8/2022 19:15:36'!
test01transferirDeUnaCuentaAOtraCambiaSusBalances

	| account accountTwo |
	
	account := ReceptiveAccount new.
	accountTwo:= ReceptiveAccount new.

	Transference from: account to: accountTwo for: 100 * peso.
		
	self assert: -100 * peso equals: account balance.
	self assert: 100 * peso equals: accountTwo balance! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'am 6/8/2022 19:18:25'!
test02laTransferenciaConoceSuValor

	| account accountTwo transference |
	
	account := ReceptiveAccount new.
	accountTwo:= ReceptiveAccount new.

	transference := Transference from: account to: accountTwo for: 100 * peso.
		
	self assert: transference value equals: 100 * peso! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'am 6/8/2022 19:20:38'!
test03lasPatasDeUnaTransferenciaConocenSuContraparte

	| account accountTwo transference |
	
	account := ReceptiveAccount new.
	accountTwo:= ReceptiveAccount new.

	transference := Transference from: account to: accountTwo for: 100 * peso.

	self assert: (transference depositLeg) counterpart equals: transference withdrawLeg! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'am 6/8/2022 18:34:27'!
after: otherBalance

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'balance' stamp: 'am 6/8/2022 18:37:21'!
after: otherBalance
	
	^ self value + otherBalance.! !


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

!Deposit class methodsFor: 'instance creation' stamp: 'e 6/7/2022 16:49:30'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferenceDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferenceDeposit
	instanceVariableNames: 'transference value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceDeposit methodsFor: 'initialization' stamp: 'am 6/8/2022 19:00:38'!
initializeIn: aTranference for: aValue 
	
	transference := aTranference.
	value := aValue.! !


!TransferenceDeposit methodsFor: 'value' stamp: 'am 6/6/2022 16:23:10'!
value

	^ value! !


!TransferenceDeposit methodsFor: 'accessing' stamp: 'am 6/8/2022 19:11:03'!
counterpart

	^transference counterLegWhenTransferenceDeposit! !


!TransferenceDeposit methodsFor: 'balance' stamp: 'am 6/8/2022 18:37:55'!
after: otherBalance

	^ self value + otherBalance! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceDeposit class
	instanceVariableNames: ''!

!TransferenceDeposit class methodsFor: 'instance creation' stamp: 'e 6/7/2022 16:22:44'!
in: aTranference for: aValue 

	^self new initializeIn: aTranference for: aValue ! !

!TransferenceDeposit class methodsFor: 'instance creation' stamp: 'e 6/7/2022 16:19:32'!
in: aTranference register: aValue on: anAccount 
	
	| transferenceDeposit |
	
	transferenceDeposit := self in: aTranference for: aValue.
	anAccount register: transferenceDeposit.
		
	^ transferenceDeposit! !


!classDefinition: #TransferenceWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferenceWithdraw
	instanceVariableNames: 'transference value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceWithdraw methodsFor: 'initialization' stamp: 'am 6/8/2022 19:00:46'!
initializeIn: aTranference for: aValue 
	
	transference := aTranference.
	value := aValue.! !


!TransferenceWithdraw methodsFor: 'balance' stamp: 'am 6/8/2022 18:40:12'!
after: otherBalance

	^ otherBalance - self value.! !


!TransferenceWithdraw methodsFor: 'accessing' stamp: 'am 6/8/2022 19:11:20'!
counterpart

	^transference counterLegWhenTransferenceWithdraw! !


!TransferenceWithdraw methodsFor: 'value' stamp: 'am 6/6/2022 16:24:09'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceWithdraw class
	instanceVariableNames: ''!

!TransferenceWithdraw class methodsFor: 'instance creation' stamp: 'e 6/7/2022 16:21:52'!
in: aTranference for: aValue 

	^self new initializeIn: aTranference for: aValue ! !

!TransferenceWithdraw class methodsFor: 'instance creation' stamp: 'e 6/7/2022 16:20:49'!
in: aTranference register: aValue on: anAccount 

	| transferenceWithdraw |
	
	transferenceWithdraw := self in: aTranference for: aValue.
	anAccount register: transferenceWithdraw.
		
	^ transferenceWithdraw! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'am 6/8/2022 18:42:41'!
after: otherBalance

	^ otherBalance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'e 6/7/2022 16:49:55'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'am 6/8/2022 18:49:36'!
initializeWith: aAccounts 

	accounts := aAccounts! !


!Portfolio methodsFor: 'accessing' stamp: 'am 6/8/2022 18:48:13'!
hasRegistered: aTransaccion 
	
	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaccion ] ! !

!Portfolio methodsFor: 'accessing' stamp: 'am 6/8/2022 19:51:33'!
transactions

	| transactions |
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | transactions addAll: anAccount transactions].
	^transactions
! !


!Portfolio methodsFor: 'balance' stamp: 'am 6/8/2022 18:47:58'!
balance
	
	^ accounts sum: [:anAccount | anAccount balance].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'am 6/8/2022 18:46:42'!
with: anAcounts

	^self new initializeWith: anAcounts ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'am 6/8/2022 18:55:18'!
balance

	^transactions inject: 0 into: [:aBalance :aTransaction | aTransaction after: aBalance]! !

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


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value withdraw deposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'e 6/7/2022 16:44:15'!
initializeFor: aValue 
	
	value := aValue.! !

!Transference methodsFor: 'initialization' stamp: 'am 6/8/2022 18:58:30'!
withdraw: aTransferenceWithdraw andDeposit: aTransferenceDeposit

	withdraw := aTransferenceWithdraw.
	deposit  := aTransferenceDeposit ! !


!Transference methodsFor: 'accessing' stamp: 'am 6/8/2022 19:11:03'!
counterLegWhenTransferenceDeposit

	^ self withdrawLeg! !

!Transference methodsFor: 'accessing' stamp: 'am 6/8/2022 19:11:20'!
counterLegWhenTransferenceWithdraw

	^ self depositLeg! !

!Transference methodsFor: 'accessing' stamp: 'am 6/8/2022 19:10:06'!
depositLeg

	^ deposit! !

!Transference methodsFor: 'accessing' stamp: 'e 6/7/2022 15:50:09'!
value

	^value ! !

!Transference methodsFor: 'accessing' stamp: 'am 6/8/2022 19:09:34'!
withdrawLeg

	^ withdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'am 6/8/2022 18:59:09'!
from: withdrawAccount to: depositAccount for: aValue

	|withdraw deposit transference |	
	
	transference := self new initializeFor: aValue.
	withdraw := TransferenceWithdraw in: transference register: aValue on: withdrawAccount.
	deposit := TransferenceDeposit in: transference register: aValue on: depositAccount.
	transference withdraw: withdraw andDeposit: deposit.
	
	^transference! !
