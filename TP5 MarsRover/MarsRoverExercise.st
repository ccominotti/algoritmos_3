!classDefinition: #MarsRoverTest category: 'MarsRoverExercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:58:58'!
test01
	| rover |
	
	rover := MarsRover newAt: (0@0) facing: North new.
	
	rover runCommand: ''.
	
	self assert: (rover isAt: (0@0)).
	self assert: rover isFacingNorth.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:58:51'!
test02
	| rover |
	
	rover := MarsRover newAt: (0@0) facing: North new.
	
	rover runCommand: 'f'.
	
	self assert: (rover isAt: (0@1)).
	self assert: rover isFacingNorth.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:59:04'!
test03
	| rover |
	
	rover := MarsRover newAt: (0@0) facing: North new.
	
	rover runCommand: 'b'.
	
	self assert: (rover isAt: (0@-1)).
	self assert: rover isFacingNorth.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:59:08'!
test04
	| rover |
	
	rover := MarsRover newAt: (0@0) facing: North new.
	rover runCommand: 'l'.
	
	self assert: (rover isAt: (0@0)).
	self assert: rover isFacingWest.
	self deny: rover isFacingNorth.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:59:12'!
test05
	| rover |
	
	rover := MarsRover newAt: (0@0) facing: North new.
	
	rover runCommand: 'r'.
	
	self assert: rover isFacingEast.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:06:49'!
test06
	| rover |
	
	rover := MarsRover newAt: (0@0) facing: East new.
	
	rover runCommand: 'f'.
	
	self assert: (rover isAt: (1@0)).
	self assert: rover isFacingEast.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:10:01'!
test07
	| rover |
	
	rover := MarsRover newAt: (0@0) facing: East new.
	
	rover runCommand: 'b'.
	
	self assert: (rover isAt: (-1@0)).
! !


!classDefinition: #CardinalPoints category: 'MarsRoverExercise'!
Object subclass: #CardinalPoints
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!CardinalPoints methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:52:37'!
isEast
	self subclassResponsibility.! !

!CardinalPoints methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:52:40'!
isNorth
	self subclassResponsibility.! !

!CardinalPoints methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:52:46'!
isSouth
	self subclassResponsibility.! !

!CardinalPoints methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:52:43'!
isWest
	self subclassResponsibility.! !

!CardinalPoints methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:52:56'!
left
	self subclassResponsibility.! !

!CardinalPoints methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:53:49'!
right
	self subclassResponsibility.! !


!classDefinition: #East category: 'MarsRoverExercise'!
CardinalPoints subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!East methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:23:45'!
backwardDirection
	^(-1@0).! !

!East methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:23:30'!
forwardDirection
	^(1@0).! !

!East methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:47:06'!
isEast
	^true.! !

!East methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:54:23'!
isNorth
	^false.! !

!East methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:54:26'!
isSouth
	^false.! !

!East methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:54:29'!
isWest
	^false.! !

!East methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:54:16'!
left
	^South new.! !

!East methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:54:09'!
right
	^North new.! !


!classDefinition: #North category: 'MarsRoverExercise'!
CardinalPoints subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!North methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:23:45'!
backwardDirection
	^(0@-1).! !

!North methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:23:30'!
forwardDirection
	^(0@1).! !

!North methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:52:14'!
isEast
	^false.! !

!North methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:44:10'!
isNorth
	^true.! !

!North methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:52:17'!
isSouth
	^false.! !

!North methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:44:44'!
isWest
	^false.! !

!North methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:43:43'!
left
	^West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:53:49'!
right
	^East new.! !


!classDefinition: #South category: 'MarsRoverExercise'!
CardinalPoints subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!South methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:23:45'!
backwardDirection
	^(0@1).! !

!South methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:23:30'!
forwardDirection
	^(0@-1).! !

!South methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:50:56'!
isEast
	^false.! !

!South methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:50:51'!
isNorth
	^false.! !

!South methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:50:37'!
isSouth
	^true.! !

!South methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:51:03'!
isWest
	^false.! !

!South methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:51:21'!
left
	^East new.! !

!South methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:53:49'!
right
	^West new.! !


!classDefinition: #West category: 'MarsRoverExercise'!
CardinalPoints subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!West methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:23:45'!
backwardDirection
	^(1@0).! !

!West methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:23:30'!
forwardDirection
	^(-1@0).! !

!West methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:50:20'!
isEast
	^false.! !

!West methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:44:22'!
isNorth
	^false.! !

!West methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:50:24'!
isSouth
	^false.! !

!West methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:44:33'!
isWest
	^true.! !

!West methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:52:04'!
left
	^South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 17:53:49'!
right
	^North new.! !


!classDefinition: #MarsRover category: 'MarsRoverExercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRover methodsFor: 'initialization' stamp: 'cc 10/30/2022 17:57:30'!
initializeNewAt: aPosition facing: atEast 
	position := aPosition.
	orientation := atEast.! !

!MarsRover methodsFor: 'initialization' stamp: 'cc 10/30/2022 17:49:06'!
initializeNewFacingNorthAt: aPosition 
	position := aPosition.
	orientation := North new.! !

!MarsRover methodsFor: 'initialization' stamp: 'cc 10/30/2022 17:25:15'!
isAt: aPosition
	^aPosition = position.! !


!MarsRover methodsFor: 'utilization' stamp: 'cc 10/30/2022 18:20:00'!
runCommand: aCommandLine 
	
	aCommandLine do: [:aCharacter |
		self move: aCharacter
			]! !


!MarsRover methodsFor: 'dd' stamp: 'cc 10/30/2022 18:55:45'!
moveBackwards
	position:= position + (orientation backwardDirection)! !

!MarsRover methodsFor: 'dd' stamp: 'cc 10/30/2022 18:55:32'!
moveForward
	position:= position + (orientation forwardDirection)! !

!MarsRover methodsFor: 'dd' stamp: 'cc 10/30/2022 18:56:05'!
moveLeft
	orientation := orientation left! !

!MarsRover methodsFor: 'dd' stamp: 'cc 10/30/2022 18:56:17'!
moveRight
	orientation := orientation right! !


!MarsRover methodsFor: 'private' stamp: 'cc 10/30/2022 18:27:18'!
move: aCommand
	(aCommand = $f) ifTrue: [position:= position + (orientation forwardDirection)].
	(aCommand = $b) ifTrue: [position:= position + (orientation backwardDirection)].
	(aCommand = $l) ifTrue: [orientation := orientation left].
	(aCommand = $r) ifTrue: [orientation := orientation right].
	! !


!MarsRover methodsFor: 'testing' stamp: 'cc 10/30/2022 17:55:11'!
isFacingEast
	^orientation isEast.! !

!MarsRover methodsFor: 'testing' stamp: 'cc 10/30/2022 17:54:55'!
isFacingNorth
	^orientation isNorth.! !

!MarsRover methodsFor: 'testing' stamp: 'cc 10/30/2022 17:55:21'!
isFacingSouth
	^orientation isSouth.! !

!MarsRover methodsFor: 'testing' stamp: 'cc 10/30/2022 17:55:01'!
isFacingWest
	^orientation isWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverExercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'cc 10/30/2022 17:57:10'!
newAt: aPosition facing: atEast 
	^self new initializeNewAt: aPosition facing: atEast ! !

!MarsRover class methodsFor: 'instance creation' stamp: 'cc 10/30/2022 17:17:48'!
newFacingNorthAt: aPoint 
	^self new initializeNewFacingNorthAt: aPoint ! !


!classDefinition: #RoverCommand category: 'MarsRoverExercise'!
Object subclass: #RoverCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RoverCommand class' category: 'MarsRoverExercise'!
RoverCommand class
	instanceVariableNames: ''!

!RoverCommand class methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:52:52'!
executeBehaviour: aMarsRover
	self subclassResponsibility ! !

!RoverCommand class methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:36:09'!
isFor: aSymbol
	self subclassResponsibility ! !

!RoverCommand class methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:47:01'!
to: aSymbol
	| commandType |
	
	commandType := self subclasses detect: [:aCommand | aCommand isFor: aSymbol ] ifNone: [^UnknownCommand].
	
	^commandType behaviour.! !


!classDefinition: #BackwardCommand category: 'MarsRoverExercise'!
RoverCommand subclass: #BackwardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BackwardCommand class' category: 'MarsRoverExercise'!
BackwardCommand class
	instanceVariableNames: ''!

!BackwardCommand class methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:55:17'!
executeBehaviour: aMarsRover
	^ aMarsRover moveBackwards! !

!BackwardCommand class methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:37:36'!
isFor: aSymbol
	aSymbol = $b ! !


!classDefinition: #ForwardCommand category: 'MarsRoverExercise'!
RoverCommand subclass: #ForwardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ForwardCommand class' category: 'MarsRoverExercise'!
ForwardCommand class
	instanceVariableNames: ''!

!ForwardCommand class methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:52:52'!
executeBehaviour: aMarsRover
	^ aMarsRover moveForward! !

!ForwardCommand class methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:37:46'!
isFor: aSymbol
	aSymbol = $f! !


!classDefinition: #LeftCommand category: 'MarsRoverExercise'!
RoverCommand subclass: #LeftCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LeftCommand class' category: 'MarsRoverExercise'!
LeftCommand class
	instanceVariableNames: ''!

!LeftCommand class methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:52:52'!
executeBehaviour: aMarsRover
	^ aMarsRover moveLeft.! !

!LeftCommand class methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:37:54'!
isFor: aSymbol
	aSymbol = $l! !


!classDefinition: #RightCommand category: 'MarsRoverExercise'!
RoverCommand subclass: #RightCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RightCommand class' category: 'MarsRoverExercise'!
RightCommand class
	instanceVariableNames: ''!

!RightCommand class methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:52:52'!
executeBehaviour: aMarsRover
	^ aMarsRover moveRight! !

!RightCommand class methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:38:01'!
isFor: aSymbol
	aSymbol = $r! !


!classDefinition: #UnknownCommand category: 'MarsRoverExercise'!
RoverCommand subclass: #UnknownCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnknownCommand class' category: 'MarsRoverExercise'!
UnknownCommand class
	instanceVariableNames: ''!

!UnknownCommand class methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:58:51'!
executeBehaviour: aMarsRover
	^ aMarsRover ! !

!UnknownCommand class methodsFor: 'as yet unclassified' stamp: 'cc 10/30/2022 18:41:27'!
isFor: aSymbol
	^false.! !
