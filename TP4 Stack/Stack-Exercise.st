!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'cc 10/11/2022 21:43:06'!
test01SearchingInAnStackShouldReturnAnCollectionWithACorrectSize
	| stack finder result| 
	
	stack := OOStack new.
	
	finder := SentenceFinderByPrefix new.
	stack push: 'Gret'.
	stack push: 'GretaLinda'.
	
	result := finder find: 'Greta' in: stack.
	
	self deny: result isEmpty. 
	self assert: 1 equals: (result size). ! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'cc 10/11/2022 21:31:39'!
test02SearchingInAnEmptyStackShouldReturnAnEmptyCollection
	| stack finder result| 
	
	stack := OOStack new.
	
	finder := SentenceFinderByPrefix new.
	
	result := finder find: 'Greta' in: stack.
	
	self assert: result isEmpty. ! !


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

!OOStack methodsFor: 'operations' stamp: 'cc 10/11/2022 21:11:17'!
push: AnElement
	topNode := Element with: AnElement after: topNode.
	size  := size + 1.
	

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


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'cc 10/11/2022 21:26:40'!
find: aPrefix in: aStack
	| resultList stackInverted|
	
	resultList := OrderedCollection new.
	stackInverted := OOStack new.
	
	[aStack isEmpty] whileFalse: [
		| elementToCheck |
		elementToCheck := aStack top.
		(elementToCheck beginsWith: aPrefix) ifTrue: [ resultList add: elementToCheck].
		stackInverted push: aStack pop.
		].
	
	[stackInverted isEmpty] whileFalse: [
		aStack push: stackInverted pop.
		].

	^resultList.! !


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
