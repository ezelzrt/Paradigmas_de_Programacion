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

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'e 5/15/2022 20:07:39'!
add: aSentence
	
	stack push: aSentence 

		! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'e 5/15/2022 20:09:50'!
asOrderedCollection
	
	| aCollection |
	
	aCollection := OrderedCollection new.
	self size timesRepeat: [ aCollection add: self pop 	].
	
	aCollection reverseDo: [ :otherSentence | self add: otherSentence ].
	
	^aCollection ! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'e 5/15/2022 20:16:52'!
find: aPrefix

"	| otherSentenceFinder result aSentence |
	
	otherSentenceFinder := SentenceFinderByPrefix new.
	result := OrderedCollection new.
	
	self size timesRepeat: [
			aSentence := self pop.
			otherSentenceFinder add: aSentence.
			(aSentence beginsWith: aPrefix) ifTrue: [ result add: aSentence ]
		].
	otherSentenceFinder transferTo: self.
	^result. 
"
	| aCollection |
	
	aCollection := self asOrderedCollection.
	^aCollection select: [ :aSentence | aSentence beginsWith: aPrefix].! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'e 5/14/2022 09:50:53'!
initialize

	stack := OOStack new.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'e 5/14/2022 09:55:02'!
isEmpty
	
	^stack isEmpty.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'am 5/14/2022 12:10:01'!
pop
	
	^stack pop.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'e 5/14/2022 10:50:52'!
size 

	^stack size! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'e 5/14/2022 21:09:09'!
test01FindEncuentraLaUnicaOracionCorrecta

	| sentenceFinder result|
	
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder add: 'winning is everything'.
	sentenceFinder add: 'The winds of Winter'.
	
	result := OrderedCollection
		with: 'The winds of Winter'.
	
	self assert: (sentenceFinder find: 'The') = result.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'e 5/14/2022 21:09:30'!
test02FindEncuentraLasOracionesCorrectas

	| sentenceFinder result|
	
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder add: 'winning is everything'.
	sentenceFinder add: 'The winds of Winter'.
	sentenceFinder add: 'winter is here'.
	
	result := OrderedCollection
		with:'winter is here'
		with: 'winning is everything'.
	
	self assert: (sentenceFinder find: 'win') = result.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'am 5/14/2022 11:45:23'!
test03FindSoloDetectaElPrefijoSiEstaAlInicioDeLaOracion

	| sentenceFinder result|
	
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder add: 'winning is everything'.
	sentenceFinder add: 'The winds of Winter'.
	sentenceFinder add: 'Winter is here'.
	
	result := OrderedCollection new.
	
	self assert: (sentenceFinder find: 'every') = result.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'am 5/14/2022 11:51:28'!
test04SiNoSeEncuentraElPrefijoFindDevuelveUnaCollectionVacia

	| sentenceFinder result|
	
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder add: 'winning is everything'.
	sentenceFinder add: 'The winds of Winter'.
	sentenceFinder add: 'Winter is here'.
	
	result := OrderedCollection new.
	
	self assert: (sentenceFinder find: 'dog') = result.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'am 5/14/2022 11:54:37'!
test05FindEsCaseSensitive

	| sentenceFinder upperCaseResult lowerCaseResult|
	
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder add: 'winning is everything'.
	sentenceFinder add: 'The winds of Winter'.
	sentenceFinder add: 'Winter is here'.
	
	upperCaseResult := OrderedCollection
		with:'Winter is here'.
	lowerCaseResult := OrderedCollection
		with:'winning is everything'.
		
	self assert: (sentenceFinder find: 'win') = lowerCaseResult .
	self assert: (sentenceFinder find: 'Win') = upperCaseResult .! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'am 5/14/2022 12:12:13'!
test06FindNoCambiaLosElementosDeLaPila

	| sentenceFinder result pila lista elem |
	
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder add: 'winning is everything'.
	sentenceFinder add: 'The winds of Winter'.
	sentenceFinder add: 'winter is here'.
	
	result := OrderedCollection
		with: 'winter is here'
		with: 'The winds of Winter'
		with: 'winning is everything'.
		
	sentenceFinder find: 'win'.
	
	pila := OOStack new.
	lista := OrderedCollection new.
	
	sentenceFinder size timesRepeat: [
		elem := sentenceFinder pop.
		pila push: elem.
		lista add: elem.
		].
	
	pila size timesRepeat: [
		elem := pila pop.
		sentenceFinder add: elem.
		].
	
	self assert: lista = result.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'am 5/14/2022 12:29:14'!
test07SiLaOracionEsParteDelPrefijoNoLaAgrega

	| sentenceFinder result|
	
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder add: 'The winds'.
	
	result := OrderedCollection new.
	
	self assert: (sentenceFinder find: 'The winds of') = result.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'am 5/14/2022 12:17:04'!
test08SiNoHayOracionesFindNoEncuentraNada

	| sentenceFinder result|
	
	sentenceFinder := SentenceFinderByPrefix new.
	
	result := OrderedCollection new.
	
	self assert: (sentenceFinder find: 'win') = result.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'e 5/11/2022 15:54:54'!
initialize

	stack := OrderedCollection new.! !


!OOStack methodsFor: 'removing' stamp: 'e 5/13/2022 20:21:13'!
pop
	
	"self isEmpty ifTrue: [ self error: 'Stack is empty'].
	
	^stack removeLast.
	"
	^self state pop: stack
	! !


!OOStack methodsFor: 'adding' stamp: 'e 5/13/2022 20:12:26'!
push: unElemento

	stack add: unElemento.
	
	"self state push: unElemento"! !


!OOStack methodsFor: 'accessing' stamp: 'e 5/13/2022 20:12:47'!
isEmpty

	^stack size = 0.
	
	"^self state isEmpty"! !

!OOStack methodsFor: 'accessing' stamp: 'e 5/11/2022 16:11:51'!
size

	^stack size! !

!OOStack methodsFor: 'accessing' stamp: 'e 5/13/2022 20:43:16'!
top

	"self isEmpty ifTrue: [ self error: 'Stack is empty'].
	
	^stack last
	"
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
