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

!CustomerBookTest methodsFor: 'testing' stamp: 'e 5/1/2022 16:28:31'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| tiempoQueTardo customerBook|
	
	customerBook := CustomerBook new.
	
	tiempoQueTardo := self medirTiempoDe: [ :unaPersona | customerBook addCustomerNamed: unaPersona ] conElCliente: 'John Lennon'.
	
	self assertTiempoTardado: tiempoQueTardo menorA: 50.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'e 5/1/2022 16:28:54'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	
	| tiempoQueTardo customerBook |
	
	customerBook := CustomerBook new.
	
	customerBook addCustomerNamed: 'paulMcCartney'.
	
	tiempoQueTardo := self medirTiempoDe: [ :unaPersona | customerBook removeCustomerNamed: unaPersona ] conElCliente: 'paulMcCartney'.
	
	self assertTiempoTardado: tiempoQueTardo menorA: 100.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'e 5/1/2022 18:11:22'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook unCliente |
			
	customerBook := CustomerBook new.
	unCliente := 'JohnLennon'.
	customerBook addCustomerNamed: unCliente .
		
	self assertEjecutar: [:unCustomerBook :Cliente | unCustomerBook removeCustomerNamed: Cliente ]
		con: 'Paul McCartney' en: customerBook lanzaLaExcepcion: NotFound .! !

!CustomerBookTest methodsFor: 'testing' stamp: 'e 5/1/2022 17:09:53'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook unCliente|
	
	unCliente := 'Paul McCartney'.
	customerBook  := self enUnLibroNuevoAgregarYSuspenderA: unCliente .
	
	self assertCantidadActivos: 0 cantidadSuspendidos: 1 YCantidadTotalEn: customerBook.
	self assert: (customerBook includesCustomerNamed: unCliente ).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'e 5/1/2022 17:09:59'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook unCliente|
	
	unCliente := 'Paul McCartney'.
	customerBook := self enUnLibroNuevoAgregarYSuspenderA: unCliente.
	customerBook removeCustomerNamed: unCliente.
	
	self assertCantidadActivos: 0 cantidadSuspendidos: 0 YCantidadTotalEn: customerBook.
	self deny: (customerBook includesCustomerNamed: unCliente ).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'e 5/1/2022 18:10:41'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook unCliente |
			
	customerBook := CustomerBook new.
	unCliente := 'JohnLennon'.
	customerBook addCustomerNamed: unCliente.
	
	self assertEjecutar: [:unCustomerBook :Cliente | unCustomerBook suspendCustomerNamed: Cliente ]
		con: 'Ringo Starr' en: customerBook 		lanzaLaExcepcion: CantSuspend.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'e 5/1/2022 18:11:04'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook unCliente |
			
	customerBook := CustomerBook new.
	unCliente := 'JohnLennon'.
	customerBook addCustomerNamed: unCliente .
	customerBook suspendCustomerNamed: 	unCliente.
	
	self assertEjecutar: [:unCustomerBook :Cliente | unCustomerBook suspendCustomerNamed: Cliente ]
		con: 'JohnLennon' en: customerBook 	lanzaLaExcepcion: CantSuspend.
! !


!CustomerBookTest methodsFor: 'privado' stamp: 'e 5/1/2022 17:10:07'!
assertCantidadActivos: valorUno cantidadSuspendidos: valorDos YCantidadTotalEn: unCustomerBook 
	
	self assert: valorUno equals: unCustomerBook numberOfActiveCustomers.
	self assert: valorDos equals: unCustomerBook numberOfSuspendedCustomers.
	self assert: (valorUno + valorDos) equals: unCustomerBook numberOfCustomers.
	
! !

!CustomerBookTest methodsFor: 'privado' stamp: 'e 5/1/2022 17:55:33'!
assertEjecutar: unBloque con: unCliente en: unCustomerBook lanzaLaExcepcion: unaExcepcion

	[ (unBloque value: unCustomerBook value: unCliente) .
	self fail ]
		on: unaExcepcion 
		do: [ :anError | 
			self assert: unCustomerBook numberOfCustomers equals: 1.
			self assert: (unCustomerBook includesCustomerNamed: 'JohnLennon') ]
	
	
	
	
	
! !

!CustomerBookTest methodsFor: 'privado' stamp: 'e 5/1/2022 17:44:11'!
assertTiempoTardado: unTiempoQueTardo menorA: unTiempo
	
	^self assert: (unTiempoQueTardo ) < (unTiempo * millisecond)
	
! !

!CustomerBookTest methodsFor: 'privado' stamp: 'e 5/1/2022 16:50:22'!
enUnLibroNuevoAgregarYSuspenderA: unCliente

	| customerBook |
	
	customerBook := CustomerBook new.
	
	customerBook addCustomerNamed: unCliente.
	customerBook suspendCustomerNamed: unCliente.
	^customerBook 
	
! !

!CustomerBookTest methodsFor: 'privado' stamp: 'e 5/1/2022 16:19:47'!
medirTiempoDe: unBloque conElCliente: unCliente

	|  millisecondsBeforeRunning millisecondsAfterRunning |

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	unBloque value: unCliente.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^millisecondsAfterRunning-millisecondsBeforeRunning
	
	
	
	
	
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


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
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

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
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
