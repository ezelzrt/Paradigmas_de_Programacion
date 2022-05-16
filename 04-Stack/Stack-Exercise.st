!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'converting' stamp: 'e 5/15/2022 20:27:54'!
asOrderedCollection
	
	| aCollection |
	
	aCollection := OrderedCollection new.
	self size timesRepeat: [ aCollection add: self pop 	].
	
	aCollection reverseDo: [ :aSentence | self add: aSentence ].
	
	^aCollection ! !


!SentenceFinderByPrefix methodsFor: 'adding' stamp: 'e 5/15/2022 20:07:39'!
add: aSentence
	
	stack push: aSentence 

		! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'e 5/14/2022 09:50:53'!
initialize

	stack := OOStack new.! !


!SentenceFinderByPrefix methodsFor: 'validation' stamp: 'e 5/16/2022 17:07:19'!
isValid: aPrefix
	
	| aError | 
	aError := [ self error: self class invalidPrefixErrorDescription ].
	(aPrefix class = String) ifFalse: aError.
	((aPrefix findString: ' ') = 0) ifFalse: aError .
	(aPrefix = '') ifTrue: aError
	! !


!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'e 5/16/2022 16:04:48'!
find: aPrefix

	| aCollection |
	
	self isValid: aPrefix.
	
	aCollection := self asOrderedCollection.
	^aCollection select: [ :aSentence | aSentence beginsWith: aPrefix].! !

!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'e 5/14/2022 09:55:02'!
isEmpty
	
	^stack isEmpty.! !

!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'e 5/14/2022 10:50:52'!
size 

	^stack size! !


!SentenceFinderByPrefix methodsFor: 'removing' stamp: 'am 5/14/2022 12:10:01'!
pop
	
	^stack pop.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'e 5/16/2022 16:20:26'!
invalidPrefixErrorDescription

	^'Prefijo invalido'! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'sentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'e 5/15/2022 21:15:29'!
setUp

	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder add: 'winning is everything'.
	sentenceFinder add: 'The winds of Winter'.
	sentenceFinder add: 'Winter is here'.
	sentenceFinder add: 'win every day'.
	sentenceFinder add: 'work'.! !


!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'e 5/16/2022 16:49:43'!
assertFindFallaConElPrefijo: aPrefix
	
	self
		should: [ sentenceFinder find: aPrefix ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorDescription ].! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'e 5/16/2022 16:12:15'!
test01FindEncuentraLaUnicaOracionCorrecta

	| result |
	result := OrderedCollection with: 'The winds of Winter'.
	
	self assert: (sentenceFinder find: 'The') = result.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'e 5/16/2022 15:32:14'!
test02FindEncuentraLasOracionesCorrectas

	| result |

	result := OrderedCollection
		with: 'win every day'
		with: 'winning is everything'.
	
	self assert: (sentenceFinder find: 'win') = result.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'e 5/16/2022 15:32:07'!
test03FindSoloDetectaElPrefijoSiEstaAlInicioDeLaOracion

	self assert: (sentenceFinder find: 'every') isEmpty! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'e 5/16/2022 15:31:59'!
test04SiNoSeEncuentraElPrefijoFindDevuelveUnaCollectionVacia

	self assert: (sentenceFinder find: 'dog') isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'e 5/16/2022 15:31:51'!
test05FindEsCaseSensitive

	| upperCaseResult lowerCaseResult|

	upperCaseResult := OrderedCollection
		with: 'Winter is here'.
	lowerCaseResult := OrderedCollection
		with: 'win every day'
		with: 'winning is everything'.

	self assert: (sentenceFinder find: 'win') = lowerCaseResult .
	self assert: (sentenceFinder find: 'Win') = upperCaseResult .! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'e 5/16/2022 15:30:06'!
test06FindNoCambiaLosElementosDeLaPila

	| beforeFindResult afterFindResult |

	beforeFindResult := sentenceFinder asOrderedCollection.
	sentenceFinder find: 'win'.
	afterFindResult := sentenceFinder asOrderedCollection.
	
	self assert: beforeFindResult = afterFindResult.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'e 5/16/2022 15:31:33'!
test07SiLaOracionEsParteDelPrefijoNoLaAgrega

	self assert: (sentenceFinder find: 'worked') isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'e 5/15/2022 21:17:48'!
test08SiNoHayOracionesFindNoEncuentraNada

	| aSentenceFinder |
	
	aSentenceFinder := SentenceFinderByPrefix new.
	
	self assert: (aSentenceFinder find: 'win') isEmpty! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'e 5/16/2022 17:03:04'!
test09ElPrefijoNoPuedeContenerEspacios
	
	self assertFindFallaConElPrefijo: 'The '! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'e 5/16/2022 16:50:26'!
test10ElPrefijoNoPuedeSerVacio
	
	self assertFindFallaConElPrefijo: ''! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'e 5/16/2022 16:50:43'!
test11ElPrefijoTieneQueSerUnString
	
	self assertFindFallaConElPrefijo: 1! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'e 5/11/2022 15:54:54'!
initialize

	stack := OrderedCollection new.! !


!OOStack methodsFor: 'removing' stamp: 'e 5/16/2022 17:04:38'!
pop
	
	^self state pop: stack
	! !


!OOStack methodsFor: 'adding' stamp: 'e 5/16/2022 17:05:07'!
push: unElemento

	stack add: unElemento.! !


!OOStack methodsFor: 'accessing' stamp: 'e 5/16/2022 17:04:57'!
isEmpty

	^stack size = 0.! !

!OOStack methodsFor: 'accessing' stamp: 'e 5/11/2022 16:11:51'!
size

	^stack size! !

!OOStack methodsFor: 'accessing' stamp: 'e 5/16/2022 17:04:47'!
top

	^self state top: stack! !


!OOStack methodsFor: 'private' stamp: 'e 5/13/2022 20:53:08'!
state

	| aState |
	aState := self class subclasses detect: [ :aSubclass | aSubclass thisWorkForMe: stack].
	^aState new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: 'stack'!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #EmptyStack category: 'Stack-Exercise'!
OOStack subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'removing' stamp: 'e 5/13/2022 20:52:20'!
pop: aStack
	
	self error: 'Stack is empty'! !


!EmptyStack methodsFor: 'accessing' stamp: 'e 5/13/2022 20:52:11'!
top: aStack

	self error: 'Stack is empty'
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStack class' category: 'Stack-Exercise'!
EmptyStack class
	instanceVariableNames: ''!

!EmptyStack class methodsFor: 'as yet unclassified' stamp: 'e 5/14/2022 09:33:26'!
thisWorkForMe: aStack

	^aStack size = 0! !


!classDefinition: #NotEmptyStack category: 'Stack-Exercise'!
OOStack subclass: #NotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStack methodsFor: 'accessing' stamp: 'e 5/14/2022 09:32:10'!
top: aStack

	^aStack last! !


!NotEmptyStack methodsFor: 'removing' stamp: 'e 5/14/2022 09:31:22'!
pop: aStack
	
	^aStack removeLast! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStack class' category: 'Stack-Exercise'!
NotEmptyStack class
	instanceVariableNames: ''!

!NotEmptyStack class methodsFor: 'as yet unclassified' stamp: 'e 5/14/2022 09:34:17'!
thisWorkForMe: aStack

	^aStack size > 0! !
