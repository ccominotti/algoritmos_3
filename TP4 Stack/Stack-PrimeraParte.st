!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'as yet unclassified' stamp: 'cg 10/6/2022 20:04:01'!
newStackWith: Elements
	
	|stack|
	
	stack:= Stack new.
	
	Elements do:[:AnElement | stack push: AnElement].
	
	^stack.
	
	! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'IL 10/1/2022 19:24:17'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'cg 10/6/2022 20:08:00'!
test02StackShouldAddAnElementCorrectly

	| stack |
	stack := self newStackWith: {'Greta'}.
	self deny: stack isEmpty.	! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'cg 10/6/2022 20:02:15'!
test03StackShouldRemoveAnElementCorrectly

	| stack |
	stack := self newStackWith: {'Greta'}.
	self assert: 'Greta' equals: stack pop.
	self assert: stack isEmpty.
	
	
	! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'cg 10/6/2022 20:05:13'!
test04StackShouldHaveACorrectBehavior

	| stack elementsListToTest|
	
	elementsListToTest := {'Greta'. 'Rodolfo'. 'Mirko'. 'Luke'. 'Tito'. 'Pepe'. 'Roberta'}.
	stack := self newStackWith: elementsListToTest.
	elementsListToTest reverseDo: [:AnElement | self assert: AnElement equals: stack pop].
	
	self assert: stack isEmpty.
	
	
	! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'cg 10/6/2022 20:07:39'!
test05StackShouldShowTheLastElementCorrectly

	| stack |
	stack := self newStackWith: {'Rodolfo'.'Mirko'.'Greta'}.
	self assert: 'Greta' equals: stack top.
	! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'listaDeElementos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'public use' stamp: 'cg 10/6/2022 19:19:47'!
isEmpty
	^listaDeElementos isEmpty. ! !

!Stack methodsFor: 'public use' stamp: 'cg 10/6/2022 19:46:17'!
pop
	^[listaDeElementos removeLast] on: Error do:[self error: self class emptyStackErrorDescription].! !

!Stack methodsFor: 'public use' stamp: 'cg 10/6/2022 19:21:37'!
push: AnElement
	listaDeElementos addLast: AnElement.! !

!Stack methodsFor: 'public use' stamp: 'cg 10/6/2022 19:46:12'!
top
	^[listaDeElementos last] on: Error do:[self error: self class emptyStackErrorDescription].! !


!Stack methodsFor: 'private' stamp: 'cg 10/6/2022 19:18:59'!
initialize
	listaDeElementos := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: 'listaDeElementos'!

!Stack class methodsFor: 'as yet unclassified' stamp: 'cg 10/6/2022 19:44:33'!
emptyStackErrorDescription
	^'Pila vacia'.! !