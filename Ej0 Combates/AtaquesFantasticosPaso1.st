!classDefinition: #CombatientesTest category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #CombatientesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'AtaquesFantasticosPaso1'!
CombatientesTest class
	instanceVariableNames: ''!

!CombatientesTest class methodsFor: 'para completar' stamp: 'gpm 9/4/2022 13:04:43'!
combatienteHumanoArthas
	|unHumano|
	unHumano := Humano.
	unHumano definirNombre: 'Arthas'.
	^unHumano! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'gpm 9/4/2022 14:56:43'!
combatienteOrcoMankrik
	^Mankrik! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'gpm 9/4/2022 14:56:33'!
combatienteOrcoOlgra
	^Olgra! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'gpm 9/4/2022 13:34:10'!
comenzarUnNuevoCombate
	self combatienteOrcoOlgra inicializarVidaEn20YArmaduraEn0.
	
	self combatienteOrcoMankrik inicializarVidaEn20YArmaduraEn0.
	
	self combatienteHumanoArthas inicializarPuñoEnemigosCriterio.! !


!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 05:58:49'!
test01UnCombatientePuedeAtacarAOtro
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:50'!
test02MultiplesAtaquesVanBajandoMasVida

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:42'!
test03UnHachaHace10DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarHacha.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 10.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:55'!
test04UnEspadaHace8DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:03'!
test05UnaArmaduraDeCueroAbsorbe2DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeCuero.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 14.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:10'!
test06UnaArmaduraDeMetalAbsorbe6DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:18'!
test07UnaArmaduraReduceElDañoInfligidoACero

	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.! !


!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:54:53'!
test08CuandoUnCombatienteNoTieneEnemigosNoAtacaANadie
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.
	Assert that: self combatienteOrcoMankrik puntosDeVida isEqualTo: 20.
	
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'SF 8/27/2022 06:07:34'!
test09CuandoUnCombatienteTieneEnemigosAtacaAUno
	| enemigo1Herido enemigo2Herido |
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	
	self combatienteHumanoArthas atacar.
	
	enemigo1Herido := self combatienteOrcoOlgra puntosDeVida < 20 and: [self combatienteOrcoMankrik puntosDeVida = 20].
	enemigo2Herido := self combatienteOrcoMankrik puntosDeVida < 20 and: [self combatienteOrcoOlgra puntosDeVida = 20].
	Assert isTrue: (enemigo1Herido or: [enemigo2Herido]).! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:55:22'!
test10UnCombatientePuedeTenerComoEstrategiaAtacarAlMasHerido
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self combatienteHumanoArthas focalizarEnElMasHerido.
	self combatienteHumanoArthas atacar.

	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:56:08'!
test11UnCombatientePuedeTenerComoEstrategiaAtacarAlMasSano
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas usarEspada .
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	self combatienteHumanoArthas focalizarEnElMasSano.
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !


!classDefinition: #Humano category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Humano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Humano class' category: 'AtaquesFantasticosPaso1'!
Humano class
	instanceVariableNames: 'dañoQueHace nombre enemigos criterio'!

!Humano class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:04:16'!
atacar
	|enemigoParaAtacar|.
	
	enemigos isEmpty ifFalse: [
	
	enemigoParaAtacar := (criterio value: enemigos).
	
	self atacarA: enemigoParaAtacar.
	
	]! !

!Humano class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 12:46:42'!
atacarA: unContrincante
	unContrincante recibirDaño: dañoQueHace! !

!Humano class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 12:59:33'!
definirNombre: nombreRecibido
	nombre := nombreRecibido.! !

!Humano class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 13:11:18'!
enemigos: conjuntoDado
	enemigos := conjuntoDado! !

!Humano class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:44:18'!
focalizarEnElMasHerido
	
	criterio := [ :unaColeccion | unaColeccion detectMin: [ :unOrco | unOrco puntosDeVida ] ].! !

!Humano class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 13:53:56'!
focalizarEnElMasSano
	
	criterio := [ :unaColeccion | unaColeccion detectMax: [ :unOrco | unOrco puntosDeVida ] ].! !

!Humano class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 13:35:17'!
inicializarPuñoEnemigosCriterio
	self usarPuño .
	enemigos := OrderedCollection new.
	criterio := [ :unaColeccion | unaColeccion anyOne ].! !

!Humano class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 12:46:42'!
usarEspada
	dañoQueHace := 8! !

!Humano class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 12:46:42'!
usarHacha
	dañoQueHace := 10! !

!Humano class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 12:46:42'!
usarPuño
	dañoQueHace := 2! !


!Humano class methodsFor: '--** private fileout/in **--' stamp: 'gpm 9/4/2022 15:02:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	dañoQueHace := 8.
	nombre := 'Arthas'.
	enemigos := ((OrderedCollection new)).
	criterio := ((SerializableBlockClosure basicNew instVarAt: 1 put: Humano; instVarAt: 2 put: '[ :argm2_1 |
	argm2_1 anyOne. ]'; instVarAt: 3 put: #(); yourself) asEvaluable).! !


!classDefinition: #Mankrik category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Mankrik
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Mankrik class' category: 'AtaquesFantasticosPaso1'!
Mankrik class
	instanceVariableNames: 'armaduraEquipada puntosDeVida'!

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:28'!
armaduraEnCero
	armaduraEquipada := 0! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:29'!
inicializarVidaEn20YArmaduraEn0
	self ponerVidaEn20.
	self armaduraEnCero.! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:29'!
ponerVidaEn20
	puntosDeVida := 20! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:29'!
puntosDeVida
	^puntosDeVida! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:29'!
recibirDaño: dañoRecibido

	|dañoEfectivo|.
	dañoEfectivo := dañoRecibido - armaduraEquipada.
	
	dañoEfectivo < 0 ifTrue: [dañoEfectivo := 0].

	puntosDeVida := puntosDeVida - dañoEfectivo.! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:29'!
usarArmaduraDeCuero
	armaduraEquipada := 2! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:29'!
usarArmaduraDeMetal
	armaduraEquipada := 6! !


!Mankrik class methodsFor: '--** private fileout/in **--' stamp: 'gpm 9/4/2022 15:02:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	armaduraEquipada := 0.
	puntosDeVida := 20.! !


!classDefinition: #Olgra category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Olgra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Olgra class' category: 'AtaquesFantasticosPaso1'!
Olgra class
	instanceVariableNames: 'armaduraEquipada puntosDeVida'!

!Olgra class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:07'!
armaduraEnCero
	armaduraEquipada := 0! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:07'!
inicializarVidaEn20YArmaduraEn0
	self ponerVidaEn20.
	self armaduraEnCero.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:07'!
ponerVidaEn20
	puntosDeVida := 20! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:08'!
puntosDeVida
	^puntosDeVida! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:08'!
recibirDaño: dañoRecibido

	|dañoEfectivo|.
	dañoEfectivo := dañoRecibido - armaduraEquipada.
	
	dañoEfectivo < 0 ifTrue: [dañoEfectivo := 0].

	puntosDeVida := puntosDeVida - dañoEfectivo.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:08'!
usarArmaduraDeCuero
	armaduraEquipada := 2! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 14:55:08'!
usarArmaduraDeMetal
	armaduraEquipada := 6! !


!Olgra class methodsFor: '--** private fileout/in **--' stamp: 'gpm 9/4/2022 15:02:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	armaduraEquipada := 6.
	puntosDeVida := 18.! !


!classDefinition: #Orco category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Orco
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Orco class' category: 'AtaquesFantasticosPaso1'!
Orco class
	instanceVariableNames: 'armaduraEquipada puntosDeVida nombre'!

!Orco class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 13:01:54'!
armaduraEnCero
	armaduraEquipada := 0! !

!Orco class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 13:02:29'!
definirNombre: nombreRecibido
	nombre := nombreRecibido.! !

!Orco class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 13:17:51'!
inicializarVidaEn20YArmaduraEn0
	self ponerVidaEn20.
	self armaduraEnCero.! !

!Orco class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 13:01:54'!
ponerVidaEn20
	puntosDeVida := 20! !

!Orco class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 13:01:55'!
puntosDeVida
	^puntosDeVida! !

!Orco class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 13:01:55'!
recibirDaño: dañoRecibido

	|dañoEfectivo|.
	dañoEfectivo := dañoRecibido - armaduraEquipada.
	
	dañoEfectivo < 0 ifTrue: [dañoEfectivo := 0].

	puntosDeVida := puntosDeVida - dañoEfectivo.! !

!Orco class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 13:01:55'!
usarArmaduraDeCuero
	armaduraEquipada := 2! !

!Orco class methodsFor: 'as yet unclassified' stamp: 'gpm 9/4/2022 13:01:55'!
usarArmaduraDeMetal
	armaduraEquipada := 6! !


!Orco class methodsFor: '--** private fileout/in **--' stamp: 'gpm 9/4/2022 15:02:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	armaduraEquipada := 0.
	puntosDeVida := 18.
	nombre := 'Olgra'.! !

Humano initializeAfterFileIn!
Mankrik initializeAfterFileIn!
Olgra initializeAfterFileIn!
Orco initializeAfterFileIn!