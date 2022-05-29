!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'am 5/29/2022 10:10:07'!
test01UnRoverEmpiezaEnUnPuntoInicial

	| marsRover |
	marsRover _ MarsRover new.
	self assert: marsRover position equals: 0@0.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'am 5/29/2022 10:13:06'!
test02UnRoverEmpiezaApuntandoAUnPuntoCardinal

	| marsRover Norte |
	marsRover _ MarsRover new.
	Norte _ 'N'.
	self assert: marsRover orientation equals: Norte.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'am 5/29/2022 10:13:37'!
test03AlMoverseDejaDeEstarEnELPuntoInicial

	| marsRover |
	marsRover _ MarsRover new.
	marsRover command: 'f'.
	self deny: (marsRover position = (0@0)) ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'am 5/29/2022 10:40:33'!
test04AlRotarCambiaElPuntoCardinalAlQueApunta

	| marsRover |
	marsRover _ MarsRover new.
	marsRover command: 'l'.
	self deny: (marsRover orientation = 'N') ! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'am 5/29/2022 10:44:12'!
test05RotaHaciaElLadoCorrecto

	| marsRover |
	marsRover _ MarsRover new.
	marsRover command: 'r'.
	self assert: (marsRover orientation = 'E').! !

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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'am 5/29/2022 11:23:32'!
command: commands

	| listOfCommands newOrientation|
	listOfCommands _ commands asOrderedCollection.
	listOfCommands do: [ :command |
		newOrientation _ orientation.
		 command = $f ifTrue:[
			orientation = 'N' ifTrue: [position _ position + (0@1)].
			orientation = 'E' ifTrue: [position _ position + (1@0)].
			orientation = 'O' ifTrue: [position _ position + (-1@0)].
			orientation = 'S' ifTrue: [position _ position + (0@-1)].
			].
		 command = $b ifTrue:[
			orientation = 'N' ifTrue: [position _ position + (0@-1)].
			orientation = 'E' ifTrue: [position _ position + (-1@0)].
			orientation = 'O' ifTrue: [position _ position + (1@0)].
			orientation = 'S' ifTrue: [position _ position + (0@1)].
			].
		 command = $r ifTrue:[
			orientation = 'N' ifTrue: [newOrientation _ 'E'].
			orientation = 'E' ifTrue: [newOrientation _ 'S'].
			orientation = 'O' ifTrue: [newOrientation _ 'N'].
			orientation = 'S' ifTrue: [newOrientation _ 'O'].
			].
		 command = $l ifTrue:[
			orientation = 'N' ifTrue: [newOrientation _ 'O'].
			orientation = 'E' ifTrue: [newOrientation _ 'N'].
			orientation = 'O' ifTrue: [newOrientation _ 'S'].
			orientation = 'S' ifTrue: [newOrientation _ 'E'].
			].
		orientation _ newOrientation.
	].
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'am 5/29/2022 10:38:55'!
initialize

	position _ 0@0.
	orientation _ 'N'.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'am 5/29/2022 10:38:36'!
orientation
	^ orientation.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'am 5/29/2022 10:08:00'!
position
	^ position.! !
