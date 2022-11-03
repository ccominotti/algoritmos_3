!classDefinition: #TestMarsRover category: 'MarsRoverExercise'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:10:57'!
test01ARoverWithEmptyCommandsStaysInTheSamePlace
	|rover|
	rover := MarsRover newAt: (0@0) facing: North new.
	rover runCommand: ''.
	
	self assert: (rover isAt: (0@0)).
	! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 15:27:30'!
test02ARoverWithFCommandDoesNotStaysInTheSamePlace
	|rover|
	rover := MarsRover newAt: (0@0) facing: North new.
	rover runCommand: 'f'.
	
	self deny: (rover isAt: (0@0)).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 15:27:52'!
test03ARoverWithBCommandDoesNotStaysInTheSamePlace
	|rover|
	rover := MarsRover newAt: (0@0) facing: North new.
	rover runCommand: 'b'.
	
	self deny: (rover isAt: (0@0)).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 15:28:51'!
test04ARoverThatReciveMoreThanOneCommandDoesAllOfTheActions
	|rover|
	rover := MarsRover newAt: (0@0) facing: North new.
	rover runCommand: 'bff'.
	
	self assert: (rover isAt: (0@1)).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:51:37'!
test05ARoverThatIsFacingNorthAndTurnsRight
	|rover|
	rover := MarsRover newAt: (0@0) facing: North new.
	rover runCommand: 'r'.
	
	self assert: (rover isFacingEast).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:51:43'!
test06ARoverThatIsFacingNorthAndTurnsLeft
	|rover|
	rover := MarsRover newAt: (0@0) facing: North new.
	rover runCommand: 'l'.
	
	self deny: (rover isFacingEast).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:50:30'!
test07ARoverThatIsFacingWestAndTurnsLeft
	|rover|
	rover := MarsRover newAt: (0@0) facing: West new.
	rover runCommand: 'l'.
	
	self assert: (rover isFacingSouth).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:51:49'!
test08ARoverThatIsFacingSouthAndTurnsLeft
	|rover|
	rover := MarsRover newAt: (0@0) facing: South new.
	rover runCommand: 'l'.
	
	self assert: (rover isFacingEast).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:52:09'!
test09ARoverThatIsFacingEastAndTurnsLeft
	|rover|
	rover := MarsRover newAt: (0@0) facing: East new.
	rover runCommand: 'l'.
	
	self assert: (rover isFacingNorth).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:50:30'!
test10ARoverThatIsFacingEastAndTurnsRight
	|rover|
	rover := MarsRover newAt: (0@0) facing: East new.
	rover runCommand: 'r'.
	
	self assert: (rover isFacingSouth).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:52:30'!
test11ARoverThatIsFacingWestAndTurnsRight
	|rover|
	rover := MarsRover newAt: (0@0) facing: West new.
	rover runCommand: 'r'.
	
	self assert: (rover isFacingNorth).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:51:09'!
test12ARoverThatIsFacingSouthAndTurnsRight
	|rover|
	rover := MarsRover newAt: (0@0) facing: South new.
	rover runCommand: 'r'.
	
	self assert: (rover isFacingWest).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:52:41'!
test13ARoverThatIsFacingEastAndTurnsLeftIsNotFacingSouthEastAndWest
	|rover|
	rover := MarsRover newAt: (0@0) facing: East new.
	rover runCommand: 'l'.
	
	self deny: (rover isFacingSouth).
	self deny: (rover isFacingEast).
	self deny: (rover isFacingWest).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:52:45'!
test14ARoverThatIsFacingNorthAndTurnsRightIsNotFacingSouthNorthAndWest
	|rover|
	rover := MarsRover newAt: (0@0) facing: North new.
	rover runCommand: 'r'.
	
	self deny: (rover isFacingSouth).
	self deny: (rover isFacingNorth).
	self deny: (rover isFacingWest).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:52:53'!
test15ARoverThatIsFacingNorthAndTurnsLeftIsNotFacingSouthEastAndNorth
	|rover|
	rover := MarsRover newAt: (0@0) facing: North new.
	rover runCommand: 'l'.
	
	self deny: (rover isFacingSouth).
	self deny: (rover isFacingEast).
	self deny: (rover isFacingNorth).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:52:59'!
test16ARoverThatIsFacingEastAndTurnsRightIsNotFacingWestEastAndNorth
	|rover|
	rover := MarsRover newAt: (0@0) facing: East new.
	rover runCommand: 'r'.
	
	self deny: (rover isFacingWest).
	self deny: (rover isFacingEast).
	self deny: (rover isFacingNorth).! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 15:38:32'!
test17ARoverThatIsFacingWestAndRecivesFCommandMovesWest
	|rover|
	rover := MarsRover newAt: (0@0) facing: West new.
	rover runCommand: 'f'.
	
	self assert: (rover isAt: (-1@0)).
	! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 15:38:54'!
test18ARoverThatIsFacingSouthAndRecivesFCommandMovesSouth
	|rover|
	rover := MarsRover newAt: (0@0) facing: South new.
	rover runCommand: 'f'.
	
	self assert: (rover isAt: (0@-1)).
	! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 15:39:15'!
test19ARoverThatIsFacingSouthAndRecivesBCommandMovesNorth
	|rover|
	rover := MarsRover newAt: (0@0) facing: South new.
	rover runCommand: 'b'.
	
	self assert: (rover isAt: (0@1)).
	! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 15:39:33'!
test20ARoverThatIsFacingWestAndRecivesBCommandMovesEast
	|rover|
	rover := MarsRover newAt: (0@0) facing: West new.
	rover runCommand: 'b'.
	
	self assert: (rover isAt: (1@0)).
	! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 15:40:44'!
test21ARoverThatIsFacingEastAndRecivesBCommandMovesWest
	|rover|
	rover := MarsRover newAt: (0@0) facing: East new.
	rover runCommand: 'b'.
	
	self assert: (rover isAt: (-1@0)).
	! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:55:06'!
test22SendingAnUnknownCommandLineDoesNothing

	|rover|
	rover := MarsRover newAt: (0@0) facing: East new.
	
	self should: [rover runCommand: 'ñ'] raise: Error.

	self assert: (rover isAt: (0@0)). 
	
		! !

!TestMarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 19:17:58'!
test23SendingAnUnknownSymbolJustExecuteThePreviousCommandsNotTheRestOfThem
 
	|rover|
	rover := MarsRover newAt: (0@0) facing: East new.

	self should: [rover runCommand: 'fmf'] raise: Error.

	self assert: (rover isAt: (1@0)). 
	self deny: (rover isAt: (2@0)).
		! !


!classDefinition: #CardinalPoints category: 'MarsRoverExercise'!
Object subclass: #CardinalPoints
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!CardinalPoints methodsFor: 'directions' stamp: 'cc 11/3/2022 19:03:14'!
backwardDirection
	self subclassResponsibility ! !

!CardinalPoints methodsFor: 'directions' stamp: 'cc 11/3/2022 19:03:01'!
forwardDirection
	self subclassResponsibility ! !


!CardinalPoints methodsFor: 'rotation' stamp: 'cc 11/2/2022 15:23:09'!
leftShift
	self subclassResponsibility ! !

!CardinalPoints methodsFor: 'rotation' stamp: 'cc 11/2/2022 15:34:42'!
rightShift
	self subclassResponsibility ! !


!CardinalPoints methodsFor: 'testing' stamp: 'cc 11/3/2022 18:48:33'!
isEast
	self subclassResponsibility ! !

!CardinalPoints methodsFor: 'testing' stamp: 'cc 11/3/2022 18:48:45'!
isNorth
	self subclassResponsibility ! !

!CardinalPoints methodsFor: 'testing' stamp: 'cc 11/3/2022 18:49:13'!
isSouth
	self subclassResponsibility ! !

!CardinalPoints methodsFor: 'testing' stamp: 'cc 11/3/2022 18:49:00'!
isWest
	self subclassResponsibility ! !


!classDefinition: #East category: 'MarsRoverExercise'!
CardinalPoints subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!East methodsFor: 'testing' stamp: 'cc 11/3/2022 18:48:34'!
isEast
	^true.! !

!East methodsFor: 'testing' stamp: 'cc 11/3/2022 18:48:45'!
isNorth
	^false.! !

!East methodsFor: 'testing' stamp: 'cc 11/3/2022 18:49:13'!
isSouth
	^false.! !

!East methodsFor: 'testing' stamp: 'cc 11/3/2022 18:49:00'!
isWest
	^false.! !


!East methodsFor: 'rotation' stamp: 'cc 11/2/2022 15:30:58'!
leftShift
	^ North new.! !

!East methodsFor: 'rotation' stamp: 'cc 11/2/2022 15:38:16'!
rightShift
	^ South new.! !


!East methodsFor: 'directions' stamp: 'cc 11/3/2022 19:04:00'!
backwardDirection
	^self forwardDirection negated ! !

!East methodsFor: 'directions' stamp: 'cc 11/3/2022 19:03:01'!
forwardDirection
	^(1@0) ! !


!classDefinition: #North category: 'MarsRoverExercise'!
CardinalPoints subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!North methodsFor: 'testing' stamp: 'cc 11/3/2022 18:48:34'!
isEast
	^false.! !

!North methodsFor: 'testing' stamp: 'cc 11/3/2022 18:48:45'!
isNorth
	^true.! !

!North methodsFor: 'testing' stamp: 'cc 11/3/2022 18:49:13'!
isSouth
	^false.! !

!North methodsFor: 'testing' stamp: 'cc 11/3/2022 18:49:00'!
isWest
	^false.! !


!North methodsFor: 'rotation' stamp: 'cc 11/2/2022 15:30:53'!
leftShift
	^ West new.! !

!North methodsFor: 'rotation' stamp: 'cc 11/2/2022 15:36:41'!
rightShift
	^ East new.! !


!North methodsFor: 'directions' stamp: 'cc 11/3/2022 19:04:04'!
backwardDirection
	^self forwardDirection negated ! !

!North methodsFor: 'directions' stamp: 'cc 11/3/2022 19:03:01'!
forwardDirection
	^(0@1) ! !


!classDefinition: #South category: 'MarsRoverExercise'!
CardinalPoints subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!South methodsFor: 'testing' stamp: 'cc 11/3/2022 18:48:34'!
isEast
	^ false.! !

!South methodsFor: 'testing' stamp: 'cc 11/3/2022 18:48:45'!
isNorth
	^ false.! !

!South methodsFor: 'testing' stamp: 'cc 11/3/2022 18:49:13'!
isSouth
	^ true.! !

!South methodsFor: 'testing' stamp: 'cc 11/3/2022 18:49:00'!
isWest
	^ false.! !


!South methodsFor: 'directions' stamp: 'cc 11/3/2022 19:03:51'!
backwardDirection
	^self forwardDirection negated ! !

!South methodsFor: 'directions' stamp: 'cc 11/3/2022 19:03:01'!
forwardDirection
	^(0@-1) ! !


!South methodsFor: 'rotation' stamp: 'cc 11/2/2022 15:30:50'!
leftShift
	^ East new.! !

!South methodsFor: 'rotation' stamp: 'cc 11/2/2022 15:40:54'!
rightShift
	^ West new.! !


!classDefinition: #West category: 'MarsRoverExercise'!
CardinalPoints subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!West methodsFor: 'testing' stamp: 'cc 11/3/2022 18:48:34'!
isEast
	^false.! !

!West methodsFor: 'testing' stamp: 'cc 11/3/2022 18:48:45'!
isNorth
	^false.! !

!West methodsFor: 'testing' stamp: 'cc 11/3/2022 18:49:13'!
isSouth
	^false.! !

!West methodsFor: 'testing' stamp: 'cc 11/3/2022 18:49:00'!
isWest
	^true.! !


!West methodsFor: 'directions' stamp: 'cc 11/3/2022 19:04:11'!
backwardDirection
	^self forwardDirection negated ! !

!West methodsFor: 'directions' stamp: 'cc 11/3/2022 19:03:01'!
forwardDirection
	^(-1@0) ! !


!West methodsFor: 'rotation' stamp: 'cc 11/2/2022 15:30:46'!
leftShift
	^ South new.! !

!West methodsFor: 'rotation' stamp: 'cc 11/2/2022 15:38:54'!
rightShift
	^ North new.! !


!classDefinition: #MarsRover category: 'MarsRoverExercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRover methodsFor: 'initialize' stamp: 'cc 11/2/2022 14:38:07'!
initializeAt: aPosition facing: aCardinalPoint 
	position := aPosition.
	cardinalPoint := aCardinalPoint.! !


!MarsRover methodsFor: 'testing' stamp: 'cc 11/2/2022 14:42:36'!
isAt: aPosition
	^(position = aPosition).! !

!MarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:49:30'!
isFacingEast
	^ cardinalPoint isEast.! !

!MarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:50:04'!
isFacingNorth
	^ cardinalPoint isNorth.! !

!MarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:50:30'!
isFacingSouth
	^ cardinalPoint isSouth.! !

!MarsRover methodsFor: 'testing' stamp: 'cc 11/3/2022 18:51:09'!
isFacingWest
	^ cardinalPoint isWest.! !

!MarsRover methodsFor: 'testing' stamp: 'cc 11/2/2022 15:08:09'!
isfacing: aCardinalPoint
	^(cardinalPoint = aCardinalPoint).! !


!MarsRover methodsFor: 'dd - utilization' stamp: 'cc 11/3/2022 19:02:41'!
moveBackward
	position := position + (cardinalPoint backwardDirection)! !

!MarsRover methodsFor: 'dd - utilization' stamp: 'cc 11/3/2022 19:03:01'!
moveForward
	position := position + (cardinalPoint forwardDirection)! !

!MarsRover methodsFor: 'dd - utilization' stamp: 'cc 11/2/2022 16:49:16'!
moveLeft
	cardinalPoint := cardinalPoint leftShift! !

!MarsRover methodsFor: 'dd - utilization' stamp: 'cc 11/2/2022 16:50:06'!
moveRight
	cardinalPoint := cardinalPoint rightShift! !

!MarsRover methodsFor: 'dd - utilization' stamp: 'cc 11/3/2022 18:05:52'!
stopWithError
	self error: self class ErrorUnknownCommand.! !


!MarsRover methodsFor: 'utilization' stamp: 'cc 11/3/2022 19:00:16'!
runCommand: command 
	command do: [:aChar | |aCommand|
		aCommand := RoverCommand for: aChar.
		aCommand executeActionTo: self.
	]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverExercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'cc 11/2/2022 14:38:07'!
newAt: aPosition facing: aCardinalPoint 
	^self new initializeAt: aPosition facing: aCardinalPoint ! !


!MarsRover class methodsFor: 'error messages' stamp: 'cc 11/3/2022 18:05:52'!
ErrorUnknownCommand
	^'Comando no valida'! !


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

!RoverCommand class methodsFor: 'private' stamp: 'cc 11/3/2022 19:00:15'!
for: aSymbol

	|commandType|

	commandType := self subclasses detect: [:aCommand | aCommand isFor: aSymbol] ifNone: [ UnknownCommand].
	
	^commandType ! !

!RoverCommand class methodsFor: 'private' stamp: 'cc 11/3/2022 18:02:58'!
isFor: aCommand 
	^false.! !


!RoverCommand class methodsFor: 'dd - utilization' stamp: 'cc 11/2/2022 16:46:57'!
executeActionTo: aRover
	self subclassResponsibility ! !


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

!BackwardCommand class methodsFor: 'dd - utilization' stamp: 'cc 11/2/2022 16:47:19'!
executeActionTo: aRover
	aRover moveBackward! !


!BackwardCommand class methodsFor: 'private' stamp: 'cc 11/2/2022 16:44:33'!
isFor: aCommand
	^(aCommand = $b)! !


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

!ForwardCommand class methodsFor: 'dd - utilization' stamp: 'cc 11/2/2022 16:48:14'!
executeActionTo: aRover
	aRover moveForward
	! !


!ForwardCommand class methodsFor: 'private' stamp: 'cc 11/2/2022 16:44:59'!
isFor: aCommand
	^(aCommand = $f)
	! !


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

!LeftCommand class methodsFor: 'dd - utilization' stamp: 'cc 11/2/2022 16:48:55'!
executeActionTo: aRover
	aRover moveLeft! !


!LeftCommand class methodsFor: 'private' stamp: 'cc 11/2/2022 16:45:08'!
isFor: aCommand
	^(aCommand = $l)! !


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

!RightCommand class methodsFor: 'dd - utilization' stamp: 'cc 11/2/2022 16:49:46'!
executeActionTo: aRover
	aRover moveRight! !


!RightCommand class methodsFor: 'private' stamp: 'cc 11/2/2022 16:45:25'!
isFor: aCommand
	^(aCommand = $r)! !


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

!UnknownCommand class methodsFor: 'as yet unclassified' stamp: 'cc 11/2/2022 16:45:46'!
ifFor: aCommand
	^false.! !


!UnknownCommand class methodsFor: 'dd - utilization' stamp: 'cc 11/3/2022 18:04:46'!
executeActionTo: aRover
	aRover stopWithError.! !
