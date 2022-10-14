!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 11:42:13'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := UnlimitedStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 11:42:19'!
test02PushAddElementsToTheStack

	| stack |
	stack := UnlimitedStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 11:42:22'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := UnlimitedStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 11:42:25'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := UnlimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 11:42:30'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := UnlimitedStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 11:42:34'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := UnlimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 11:42:55'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := UnlimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 11:42:45'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := UnlimitedStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 11:43:00'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := UnlimitedStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 11:43:03'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := UnlimitedStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 09:15:40'!
test11ALimitedStackShouldBeEmptyWhenCreate

	| stack  |
	
	stack := LimitedStack new initializeWithLimit: 5.
	self assert: stack isEmpty
! !

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 09:20:49'!
test12ALimitedStackShouldNotPushMoreThanLimitatedSize

	| stack  |
	
	stack := LimitedStack new initializeWithLimit: 3.	
	stack push: 'Greta'.
	stack push: 'Luke'.
	stack push: 'Rodolfo'.
	
	self deny: stack isEmpty.
	
	self
		should: [ stack push: 'Tito' ]
		raise: Error -  MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: LimitedStack MaxSizeReachedErrorDescription equals: anError messageText ]
	
! !

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 09:22:19'!
test13InALimitedStackTopReturnsLastPushedObject

	| stack |
	stack := LimitedStack new initializeWithLimit: 3.	
	stack push: 'something'.
	
	self assert: 'something' equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'cc 10/14/2022 09:24:23'!
test14InALimitedStackHasLIFOBehaviour
	| stack |
	stack := LimitedStack new initializeWithLimit: 3.	
	stack push: 'something'.
	stack push: 'Rodolfo'.
	stack push: 'Greta'.

	
	self assert: 'Greta' equals: stack pop.
	self assert: 'Rodolfo' equals: stack pop.
	! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cc 10/14/2022 11:30:27'!
finderForLimitedStackOf: aLimit With: aCollection  
	| aStack | 
	
	aStack := LimitedStack  new initializeWithLimit: aLimit.
	
	aCollection do: [:element | aStack push: element].
	
	^SentenceFinderByPrefix newWith: aStack.
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cc 10/14/2022 11:45:27'!
finderForStackWith: aCollection  
	| aStack | 
	
	aStack := UnlimitedStack new.
	
	aCollection do: [:element | aStack push: element].
	
	^SentenceFinderByPrefix newWith: aStack.
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cc 10/13/2022 19:59:27'!
test01SearchingInAnEmptyStackShouldReturnAnEmptyCollection
	|  finder result | 
		
	finder := self finderForStackWith: {}.
	
	result := finder find: 'Greta'.
	
	self assert: result isEmpty. ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cc 10/13/2022 20:00:25'!
test02SearchingOnePrefixInAStackOfTwo
	|  finder result | 
		
	finder := self finderForStackWith: {'Gret'. 'GretaLinda'}.
	
	result := finder find: 'Greta'.
	
	self deny: result isEmpty. 
	self assert: 1 equals: (result size). ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cc 10/13/2022 20:05:24'!
test03SearchingAnEmptyPrefixInAStack
	|  finder result collection| 
	
	collection := {'Greta'. 'GretaLinda'. 'Rodolfo'. 'Mirko'. 'Tito'. 'Pepe'. 'Luke'}.
	
	finder := self finderForStackWith: collection.
	
	result := finder find: ''.
	
	self deny: result isEmpty. 
	self assert: (collection size) equals: (result size). ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cc 10/13/2022 20:19:21'!
test04SearchingAPrefixIsCAPsSensitive
	|  finder result collection| 
	
	collection := {'greta'. 'Rodolfo'}.
	
	finder := self finderForStackWith: collection.
	
	result := finder find: 'rodolfo'.
	
	self assert: result isEmpty. 

	result := finder find: 'Greta'.
	self assert: result isEmpty. 
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cc 10/13/2022 20:16:53'!
test05SearchingInAStackWithRepeatedWord
	|  finder result collection| 
	
	collection := {'greta'. 'Rodolfo'. 'Rodolfo'. 'Luke'. 'Tito'. 'Pepe'. 'Rodolfo'. 'Mirko'}.
	
	finder := self finderForStackWith: collection.
	
	result := finder find: 'Rodolfo'.
	
	self deny: result isEmpty. 

	self assert: 3 equals: (result size).
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cc 10/13/2022 20:19:15'!
test06SearchingASpaceShouldWorkPropertly
	|  finder result collection| 
	
	collection := {'greta'. 'Rodolfo'}.
	
	finder := self finderForStackWith: collection.
	
	result := finder find: ' '.
	
	self assert: result isEmpty. 

	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cc 10/13/2022 20:19:12'!
test07SearchingASpacedPrefixShouldWorkPropertly
	|  finder result collection| 
	
	collection := {'greta'. 'Rodolfo'}.
	
	finder := self finderForStackWith: collection.
	
	result := finder find: ' Rodolfo'.
	
	self assert: result isEmpty. 

	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cc 10/13/2022 20:19:09'!
test08SearchingAPrefixIncludeInThePostfixShouldNotWork
	|  finder result collection| 
	
	collection := {'greta'. 'Rodolfo'}.
	
	finder := self finderForStackWith: collection.
	
	result := finder find: 'eta'.
	
	self assert: result isEmpty. 

	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cc 10/13/2022 20:19:04'!
test09SearchingANumberShouldWork
	|  finder result collection | 
	
	collection := {'Greta'. 'Rodolfo'. '7'. '5'. '3'. '53'. '500'. 'Pepe'}.
	
	finder := self finderForStackWith: collection.
	
	result := finder find: '5'.
	
	self assert: 3 equals: result size. 

	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'cc 10/14/2022 11:31:16'!
test10SearchingOnePrefixInALimitedStack
	|  finder result | 
		
	finder := self finderForLimitedStackOf: 3 With: {'Gret'. 'GretaLinda'}.
	
	result := finder find: 'Greta'.
	
	self deny: result isEmpty. 
	self assert: 1 equals: (result size). ! !


!classDefinition: #NameOfSubclass category: 'Stack-Exercise'!
Object subclass: #NameOfSubclass
	instanceVariableNames: 'elementsList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topNode size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'private' stamp: 'cc 10/11/2022 21:00:55'!
initialize
	topNode := Base new.
	
	size :=0.! !


!OOStack methodsFor: 'testing' stamp: 'cc 10/11/2022 21:01:10'!
isEmpty
	^size =0.
	
	! !


!OOStack methodsFor: 'operations' stamp: 'cc 10/11/2022 21:11:33'!
pop
	|elementToReturn|
	elementToReturn := topNode nodeValue.
	
	topNode := topNode previousNode.
	size := size - 1.
	^elementToReturn.
	
	! !

!OOStack methodsFor: 'operations' stamp: 'cc 10/14/2022 11:41:49'!
push: AnElement
	self subclassResponsibility.
	! !

!OOStack methodsFor: 'operations' stamp: 'cc 10/11/2022 20:58:10'!
size
	^size.
	
	
	
	! !

!OOStack methodsFor: 'operations' stamp: 'cc 10/11/2022 20:57:50'!
top
	^topNode nodeValue.
	
	
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'cc 10/11/2022 21:37:58'!
stackEmptyErrorDescription
	^ 'Stack is empty'! !


!classDefinition: #LimitedStack category: 'Stack-Exercise'!
OOStack subclass: #LimitedStack
	instanceVariableNames: 'maxSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!LimitedStack methodsFor: 'operations' stamp: 'cc 10/14/2022 09:10:41'!
push: AnElement
	(maxSize = size) ifTrue: [self error: self class MaxSizeReachedErrorDescription ].
	
	topNode := Element with: AnElement after: topNode.
	size  := size + 1.! !


!LimitedStack methodsFor: 'initialization' stamp: 'cc 10/14/2022 08:56:02'!
initializeWithLimit: limitedSize
	maxSize := limitedSize.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LimitedStack class' category: 'Stack-Exercise'!
LimitedStack class
	instanceVariableNames: ''!

!LimitedStack class methodsFor: 'error description' stamp: 'cc 10/14/2022 09:02:22'!
MaxSizeReachedErrorDescription
	^'Se alcanzo el maximo de elementos apilados'.! !


!classDefinition: #UnlimitedStack category: 'Stack-Exercise'!
OOStack subclass: #UnlimitedStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!UnlimitedStack methodsFor: 'operations' stamp: 'cc 10/14/2022 09:00:01'!
push: AnElement
	topNode := Element with: AnElement after: topNode.
	size  := size + 1.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'cc 10/14/2022 11:47:18'!
find: aPrefix 
	| resultList stackInverted |
	
	resultList := OrderedCollection new.
	stackInverted := UnlimitedStack new.
	
	[stack isEmpty] whileFalse: [
		| elementToCheck |
		elementToCheck := stack top.
		(elementToCheck beginsWith: aPrefix) ifTrue: [ resultList add: elementToCheck].
		stackInverted push: stack pop.
		].
	
	[stackInverted isEmpty] whileFalse: [
		stack push: stackInverted pop.
		].

	^resultList.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'cc 10/13/2022 19:55:43'!
setStack: aStack

	stack := aStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'cc 10/13/2022 19:55:53'!
newWith: aStack

	^self new setStack: aStack.! !


!classDefinition: #StackNode category: 'Stack-Exercise'!
Object subclass: #StackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackNode methodsFor: 'as yet unclassified' stamp: 'cc 10/11/2022 20:52:11'!
nodeValue
	^ self subclassResponsibility.! !


!classDefinition: #Base category: 'Stack-Exercise'!
StackNode subclass: #Base
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'private' stamp: 'cc 10/11/2022 21:39:12'!
nodeValue
	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #Element category: 'Stack-Exercise'!
StackNode subclass: #Element
	instanceVariableNames: 'content previousNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Element methodsFor: 'private' stamp: 'cc 10/11/2022 21:06:12'!
initializeWith: someContent after: aReference
	content := someContent.
	previousNode := aReference.! !

!Element methodsFor: 'private' stamp: 'cc 10/11/2022 20:44:31'!
nodeValue
	^ content.! !

!Element methodsFor: 'private' stamp: 'cc 10/11/2022 20:51:15'!
previousNode
	^previousNode.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Element class' category: 'Stack-Exercise'!
Element class
	instanceVariableNames: ''!

!Element class methodsFor: 'as yet unclassified' stamp: 'cc 10/11/2022 21:06:56'!
with: someContent after: aReference
	^Element new initializeWith: someContent after: aReference.! !
