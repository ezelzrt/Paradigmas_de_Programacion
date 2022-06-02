!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'test' stamp: 'e 6/2/2022 09:23:22'!
test01UnRoverEmpiezaEnUnPuntoInicial

	| marsRover |
	marsRover _ MarsRover new.
	self assert: marsRover position equals: 0@0.! !

!MarsRoverTest methodsFor: 'test' stamp: 'e 6/2/2022 11:03:17'!
test02UnRoverEmpiezaConUnaOrientacionInicial

	| marsRover |
	marsRover _ MarsRover new.
	self assert: marsRover haveNorthOrientation! !

!MarsRoverTest methodsFor: 'test' stamp: 'e 6/2/2022 11:21:57'!
test03AlRecibirElComandoFAvanza

	| marsRover |
	marsRover _ MarsRover new.
	marsRover command: 'f'.
	self assert: marsRover position = (0@1)! !

!MarsRoverTest methodsFor: 'test' stamp: 'e 6/2/2022 11:21:40'!
test04AlRecibirElComandoBRetrocede

	| marsRover |
	marsRover _ MarsRover new.
	marsRover command: 'b'.
	self assert: marsRover position = (0@-1)! !

!MarsRoverTest methodsFor: 'test' stamp: 'e 6/2/2022 11:21:17'!
test05AlRecibirElComandoRRotaHaciaLaDerecha

	| marsRover |
	marsRover _ MarsRover new.
	marsRover command: 'r'.
	self assert: marsRover haveEastOrientation! !

!MarsRoverTest methodsFor: 'test' stamp: 'e 6/2/2022 11:20:56'!
test06AlRecibirElComandoLRotaHaciaLaIzquierda

	| marsRover |
	marsRover _ MarsRover new.
	marsRover command: 'l'.
	self assert: marsRover haveWestOrientation ! !

!MarsRoverTest methodsFor: 'test' stamp: 'e 6/2/2022 11:20:24'!
test07AlRecibirUnaCadenaDeComandosValidosSeEjecutanCorrectamente

	| marsRover |
	marsRover _ MarsRover new.
	marsRover command: 'fflb'.
	self assert: (marsRover position = (1@2)).! !

!MarsRoverTest methodsFor: 'test' stamp: 'e 6/2/2022 11:25:04'!
test08AlRecibirUnComandoInvalidoFalla

	| marsRover |
	marsRover _ MarsRover new.
	
	self 
		should: [ marsRover command: 'x' ]
		raise: Error
		withExceptionDo: [ :anException |
			 self assert: anException messageText = MarsRover invalidCommandErrorDescription]! !

!MarsRoverTest methodsFor: 'test' stamp: 'e 6/2/2022 11:23:41'!
test09AlRecibirUnaCadenaDeComandosConUnoInvalidoNoSigueProcesandoLosRestantes

	| marsRover |
	marsRover _ MarsRover new.
	
	self 
		should: [ marsRover command: 'ffxlf' ]
		raise: Error.
		
	self assert: marsRover position = (0@2)! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'movement' stamp: 'e 6/2/2022 10:10:25'!
command: commands

	| listOfCommands validCommands |
	listOfCommands _ commands asOrderedCollection.
	validCommands _ Set  new.
	validCommands add: $f; add: $b; add: $r; add: $l.
	
	listOfCommands do: [ :command |
		 (validCommands includes: command) ifFalse: [ self error: self class invalidCommandErrorDescription ].
		 command = $f ifTrue:[ self moveForward ].
		 command = $b ifTrue:[			self moveBackwards			].
		 command = $r ifTrue:[			self rotate90DegreesToTheRight ].
		 command = $l ifTrue:[			self rotate90DegreesToTheLeft ]
		].
	! !

!MarsRover methodsFor: 'movement' stamp: 'e 5/29/2022 12:44:23'!
moveBackwards

	position _ position - (orientation direction)! !

!MarsRover methodsFor: 'movement' stamp: 'e 5/29/2022 12:44:28'!
moveForward

	position _ orientation direction + position ! !

!MarsRover methodsFor: 'movement' stamp: 'e 5/29/2022 12:44:45'!
rotate90DegreesToTheLeft

	orientation _ orientation rotate90DegreesToTheLeft! !

!MarsRover methodsFor: 'movement' stamp: 'e 5/29/2022 12:44:49'!
rotate90DegreesToTheRight

	orientation _ orientation rotate90DegreesToTheRight ! !


!MarsRover methodsFor: 'accessing' stamp: 'am 5/29/2022 10:08:00'!
position
	^ position.! !


!MarsRover methodsFor: 'testing' stamp: 'e 6/2/2022 10:56:00'!
haveEastOrientation
	
	^orientation isEast ! !

!MarsRover methodsFor: 'testing' stamp: 'e 6/2/2022 10:55:25'!
haveNorthOrientation
	
	^orientation isNorth! !

!MarsRover methodsFor: 'testing' stamp: 'e 6/2/2022 10:55:38'!
haveSouthOrientation
	
	^orientation isSouth! !

!MarsRover methodsFor: 'testing' stamp: 'e 6/2/2022 10:54:04'!
haveWestOrientation
	
	^orientation isWest! !


!MarsRover methodsFor: 'initialization' stamp: 'e 6/2/2022 10:44:41'!
initialize

	position _ 0@0.
	orientation _ MarsRoverNorthOrientation new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'e 6/2/2022 10:09:49'!
invalidCommandErrorDescription

	^'invalid command'! !


!classDefinition: #MarsRoverOrientation category: 'MarsRover'!
Object subclass: #MarsRoverOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientation methodsFor: 'comparing' stamp: 'e 5/29/2022 12:30:19'!
= unPuntoCardinal

	^ self class = unPuntoCardinal class! !


!MarsRoverOrientation methodsFor: 'accessing' stamp: 'e 5/29/2022 12:42:34'!
direction

	self subclassResponsibility ! !


!MarsRoverOrientation methodsFor: 'rotate' stamp: 'e 5/29/2022 12:15:41'!
rotate90DegreesToTheLeft

	self subclassResponsibility ! !

!MarsRoverOrientation methodsFor: 'rotate' stamp: 'e 5/29/2022 12:15:35'!
rotate90DegreesToTheRight

	self subclassResponsibility ! !


!MarsRoverOrientation methodsFor: 'testing' stamp: 'e 6/2/2022 10:46:30'!
IsEast

	^false! !

!MarsRoverOrientation methodsFor: 'testing' stamp: 'e 6/2/2022 10:44:03'!
IsNorth

	^false! !

!MarsRoverOrientation methodsFor: 'testing' stamp: 'e 6/2/2022 10:46:19'!
IsSouth

	^false! !

!MarsRoverOrientation methodsFor: 'testing' stamp: 'e 6/2/2022 10:46:25'!
IsWest

	^false! !


!classDefinition: #MarsRoverEastOrientation category: 'MarsRover'!
MarsRoverOrientation subclass: #MarsRoverEastOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverEastOrientation methodsFor: 'accessing' stamp: 'e 6/2/2022 09:44:34'!
direction

	^(1@0)! !


!MarsRoverEastOrientation methodsFor: 'rotate' stamp: 'e 6/2/2022 10:44:41'!
rotate90DegreesToTheLeft

	^ MarsRoverNorthOrientation new! !

!MarsRoverEastOrientation methodsFor: 'rotate' stamp: 'e 6/2/2022 10:45:36'!
rotate90DegreesToTheRight

	^ MarsRoverSouthOrientation new! !


!MarsRoverEastOrientation methodsFor: 'testing' stamp: 'e 6/2/2022 10:46:52'!
isEast

	^true! !


!classDefinition: #MarsRoverNorthOrientation category: 'MarsRover'!
MarsRoverOrientation subclass: #MarsRoverNorthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverNorthOrientation methodsFor: 'testing' stamp: 'e 6/2/2022 10:47:08'!
isNorth

	^true! !


!MarsRoverNorthOrientation methodsFor: 'accessing' stamp: 'e 5/29/2022 12:40:42'!
direction

	^(0@1)! !


!MarsRoverNorthOrientation methodsFor: 'rotate' stamp: 'e 6/2/2022 10:45:15'!
rotate90DegreesToTheLeft
	
	^ MarsRoverWestOrientation new.! !

!MarsRoverNorthOrientation methodsFor: 'rotate' stamp: 'e 6/2/2022 10:44:19'!
rotate90DegreesToTheRight
	
	^ MarsRoverEastOrientation new.! !


!classDefinition: #MarsRoverSouthOrientation category: 'MarsRover'!
MarsRoverOrientation subclass: #MarsRoverSouthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverSouthOrientation methodsFor: 'accessing' stamp: 'e 5/29/2022 12:41:08'!
direction

	^(0@-1)! !


!MarsRoverSouthOrientation methodsFor: 'testing' stamp: 'e 6/2/2022 10:47:28'!
isSouth

	^true! !


!MarsRoverSouthOrientation methodsFor: 'rotate' stamp: 'e 6/2/2022 10:44:19'!
rotate90DegreesToTheLeft

	^ MarsRoverEastOrientation new! !

!MarsRoverSouthOrientation methodsFor: 'rotate' stamp: 'e 6/2/2022 10:45:15'!
rotate90DegreesToTheRight

	^ MarsRoverWestOrientation new! !


!classDefinition: #MarsRoverWestOrientation category: 'MarsRover'!
MarsRoverOrientation subclass: #MarsRoverWestOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverWestOrientation methodsFor: 'testing' stamp: 'e 6/2/2022 10:47:40'!
isWest

	^true! !


!MarsRoverWestOrientation methodsFor: 'accessing' stamp: 'e 5/29/2022 12:40:50'!
direction

	^(-1@0)! !


!MarsRoverWestOrientation methodsFor: 'rotate' stamp: 'e 6/2/2022 10:45:36'!
rotate90DegreesToTheLeft

	^ MarsRoverSouthOrientation new! !

!MarsRoverWestOrientation methodsFor: 'rotate' stamp: 'e 6/2/2022 10:44:41'!
rotate90DegreesToTheRight

	^ MarsRoverNorthOrientation new! !
