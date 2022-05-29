!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:46:45'!
test01UnRoverEmpiezaEnUnPuntoInicial

	| marsRover |
	marsRover _ MarsRover new.
	self assert: marsRover position equals: 0@0.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:48:10'!
test02UnRoverEmpiezaApuntandoAUnPuntoCardinal

	| marsRover norte |
	marsRover _ MarsRover new.
	norte _ Norte new.
	self assert: marsRover orientation = norte.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'am 5/29/2022 10:13:37'!
test03AlMoverseDejaDeEstarEnELPuntoInicial

	| marsRover |
	marsRover _ MarsRover new.
	marsRover command: 'f'.
	self deny: (marsRover position = (0@0)) ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:32:33'!
test04AlRotarCambiaElPuntoCardinalAlQueApunta

	| marsRover |
	marsRover _ MarsRover new.
	marsRover command: 'l'.
	self deny: (marsRover orientation = Norte new)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:31:49'!
test05RotaHaciaElLadoCorrecto

	| marsRover |
	marsRover _ MarsRover new.
	marsRover command: 'r'.
	self assert: (marsRover orientation = Este new).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'am 5/29/2022 10:58:40'!
test06EjecutaCorrectamenteVariosComandos

	| marsRover |
	marsRover _ MarsRover new.
	marsRover command: 'fflb'.
	self assert: (marsRover position = (1@2)).! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 11:42:17'!
command: commands

	| listOfCommands |
	listOfCommands _ commands asOrderedCollection.
	listOfCommands do: [ :command |
		 command = $f ifTrue:[ self moveForward ].
		 command = $b ifTrue:[			self moveBackwards			].
		 command = $r ifTrue:[			self rotate90DegreesToTheRight ].
		 command = $l ifTrue:[			self rotate90DegreesToTheLeft ]
		].
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 11:58:27'!
initialize

	position _ 0@0.
	orientation _ Norte new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:44:23'!
moveBackwards

	position _ position - (orientation direction)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:44:28'!
moveForward

	position _ orientation direction + position ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:20:39'!
orientation
	^ orientation.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'am 5/29/2022 10:08:00'!
position
	^ position.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:44:45'!
rotate90DegreesToTheLeft

	orientation _ orientation rotate90DegreesToTheLeft! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:44:49'!
rotate90DegreesToTheRight

	orientation _ orientation rotate90DegreesToTheRight ! !


!classDefinition: #PuntoCardinal category: 'MarsRover'!
Object subclass: #PuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:30:19'!
= unPuntoCardinal

	^ self class = unPuntoCardinal class! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:42:34'!
direction

	self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:15:41'!
rotate90DegreesToTheLeft

	self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:15:35'!
rotate90DegreesToTheRight

	self subclassResponsibility ! !


!classDefinition: #Este category: 'MarsRover'!
PuntoCardinal subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:39:55'!
direction

	^(1@0)! !

!Este methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:00:38'!
rotate90DegreesToTheLeft

	^ Norte new! !

!Este methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:04:13'!
rotate90DegreesToTheRight

	^ Sur new! !


!classDefinition: #Norte category: 'MarsRover'!
PuntoCardinal subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:40:42'!
direction

	^(0@1)! !

!Norte methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:00:11'!
rotate90DegreesToTheLeft
	
	^ Oeste new.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:03:53'!
rotate90DegreesToTheRight
	
	^ Este new.! !


!classDefinition: #Oeste category: 'MarsRover'!
PuntoCardinal subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:40:50'!
direction

	^(-1@0)! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:00:55'!
rotate90DegreesToTheLeft

	^ Sur new! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:04:32'!
rotate90DegreesToTheRight

	^ Norte new! !


!classDefinition: #Sur category: 'MarsRover'!
PuntoCardinal subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:41:08'!
direction

	^(0@-1)! !

!Sur methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:01:07'!
rotate90DegreesToTheLeft

	^ Este new! !

!Sur methodsFor: 'as yet unclassified' stamp: 'e 5/29/2022 12:04:46'!
rotate90DegreesToTheRight

	^ Oeste new! !
