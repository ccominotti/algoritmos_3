!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'cg 9/30/2022 19:04:57'!
test15EnteroDividesFraccionCorrectly
	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !

!Numero methodsFor: 'arithmetic operations' stamp: 'cg 9/30/2022 17:59:12'!
sumarConEntero: UnEntero
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'cg 9/30/2022 17:59:28'!
sumarConFraccion: UnaFraccion
	self subclassResponsibility ! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de N???mero Inv???lido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/1/2022 18:41:38'!
dividirAEntero: UnEntero
	^ UnEntero / self.
	! !

!Entero methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/1/2022 17:25:53'!
dividirAFraccion: UnaFraccion
	^ UnaFraccion dividirsePorEntero: self.
! !

!Entero methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/1/2022 19:36:05'!
generarFraccionIrreductible: UnNumerador
	^Fraccion with: UnNumerador over: self.! !

!Entero methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/1/2022 18:39:59'!
invertir
	(self isZero) ifTrue: [^self class canNotDivideByZeroErrorDescription].
	^(Entero with: 1) / self.! !

!Entero methodsFor: 'dd - arithmetic operations' stamp: 'cg 9/30/2022 18:56:34'!
multiplicarseConEntero: UnEntero
	^self class with: value * UnEntero integerValue.
! !

!Entero methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/1/2022 16:44:39'!
multiplicarseConFraccion: UnaFraccion
	^UnaFraccion multiplicarseConEntero: self.
! !

!Entero methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/1/2022 19:23:30'!
serDivididoPor: UnEntero
	^ Fraccion gcdwith: self over: UnEntero.! !

!Entero methodsFor: 'dd - arithmetic operations' stamp: 'cg 9/30/2022 17:55:47'!
sumarConEntero: UnEntero
	^Entero with: value + UnEntero integerValue! !

!Entero methodsFor: 'dd - arithmetic operations' stamp: 'cg 9/30/2022 18:31:17'!
sumarConFraccion: UnaFraccion
	^UnaFraccion sumarConEntero: self.! !


!Entero methodsFor: 'arithmetic operations' stamp: 'cg 10/1/2022 18:08:45'!
* aMultiplier 
	^aMultiplier multiplicarseConEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/30/2022 18:31:54'!
+ anAdder 
	^anAdder sumarConEntero: self.

	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 10/1/2022 18:08:51'!
- aSubtrahend 
	^(aSubtrahend * (Entero with: -1)) sumarConEntero: self.	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 10/1/2022 18:08:38'!
/ aDivisor 
	^aDivisor dividirAEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 10/1/2022 18:21:24'!
fibonacci
	self subclassResponsibility.
		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'cg 9/29/2022 19:46:32'!
integerValue
	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'cg 10/1/2022 17:41:47'!
contieneA: unNumero
	self subclassResponsibility.! !

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est??? definido aqu??? para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'cg 10/1/2022 18:23:24'!
with: aValue 	|claseAInstanciar|
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	

	claseAInstanciar := Entero subclasses detect: [:unaSubclase | unaSubclase contieneA: aValue].
	
	
	^claseAInstanciar new initializeWith: aValue! !


!classDefinition: #EnteroNegativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'cg 10/1/2022 18:44:56'!
dividirAEntero: UnEntero
	^ UnEntero negated/self negated.! !

!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'cg 10/1/2022 17:59:12'!
fibonacci
	 self error: Entero negativeFibonacciErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: 'Numeros-Parte2-Ejercicio'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'uso interno - dd' stamp: 'cg 10/1/2022 17:50:40'!
contieneA: unNumero
	^unNumero < 0.! !



!classDefinition: #EnteroPositivo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroPositivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroPositivo methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/1/2022 18:49:27'!
dividirAEntero: UnEntero
	^ UnEntero serDivididoPor: self.
! !


!EnteroPositivo methodsFor: 'arithmetic operations' stamp: 'cg 10/1/2022 18:21:32'!
fibonacci
	| one two |
	one := Entero with: 1.
	two := Entero with: 2.

	^ (self - one) fibonacci + (self - two) fibonacci! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroPositivo class' category: 'Numeros-Parte2-Ejercicio'!
EnteroPositivo class
	instanceVariableNames: ''!

!EnteroPositivo class methodsFor: 'uso interno - dd' stamp: 'cg 10/1/2022 18:22:04'!
contieneA: unNumero
	^unNumero > 1.! !


!classDefinition: #One category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #One
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!One methodsFor: 'arithmetic operations' stamp: 'cg 10/1/2022 18:01:04'!
fibonacci
	^Entero with: 1.! !


!One methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/1/2022 18:43:36'!
dividirAEntero: UnEntero
	^ UnEntero.
	! !

!One methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/1/2022 19:36:05'!
generarFraccionIrreductible: UnNumerador
	^UnNumerador.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'One class' category: 'Numeros-Parte2-Ejercicio'!
One class
	instanceVariableNames: ''!

!One class methodsFor: 'uso interno - dd' stamp: 'cg 10/1/2022 17:50:49'!
contieneA: unNumero
	^unNumero = 1.! !


!classDefinition: #Zero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Zero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Zero methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/1/2022 18:44:21'!
dividirAEntero: UnEntero
	self error: Entero canNotDivideByZeroErrorDescription.
	! !

!Zero methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/1/2022 18:50:25'!
serDivididoPor: UnEntero
	^ self.! !


!Zero methodsFor: 'arithmetic operations' stamp: 'cg 10/1/2022 18:01:12'!
fibonacci
	^Entero with: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Zero class' category: 'Numeros-Parte2-Ejercicio'!
Zero class
	instanceVariableNames: ''!

!Zero class methodsFor: 'uso interno - dd' stamp: 'cg 10/1/2022 17:51:00'!
contieneA: unNumero
	^unNumero = 0.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'dd - arithmetic operations' stamp: 'cg 9/30/2022 19:13:45'!
dividirAEntero: UnEntero
	^self invertir * UnEntero.
! !

!Fraccion methodsFor: 'dd - arithmetic operations' stamp: 'cg 9/30/2022 19:19:29'!
dividirAFraccion: UnaFracion
	^(denominator * UnaFracion numerator)/(numerator * UnaFracion denominator).
	! !

!Fraccion methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/1/2022 17:26:36'!
dividirsePorEntero: UnEntero
	^ (self numerator )/ (self denominator * UnEntero).
	! !

!Fraccion methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/2/2022 09:51:05'!
invertir
	^denominator / numerator.
	! !

!Fraccion methodsFor: 'dd - arithmetic operations' stamp: 'cg 9/30/2022 18:55:03'!
multiplicarseConEntero: UnEntero
	^(numerator * UnEntero) / (denominator).
	! !

!Fraccion methodsFor: 'dd - arithmetic operations' stamp: 'cg 9/30/2022 18:54:30'!
multiplicarseConFraccion: UnaFraccion
	^(numerator * UnaFraccion numerator) / (denominator * UnaFraccion denominator).
	! !

!Fraccion methodsFor: 'dd - arithmetic operations' stamp: 'cg 10/2/2022 09:52:12'!
sumarConEntero: UnEntero
	|NumeradorConFactorComun|
	NumeradorConFactorComun := UnEntero * denominator.
	^((NumeradorConFactorComun + numerator)/denominator).
	! !

!Fraccion methodsFor: 'dd - arithmetic operations' stamp: 'cg 9/30/2022 17:51:02'!
sumarConFraccion: UnaFraccion 	
	| newNumerator newDenominator |
	
	newNumerator := (numerator * UnaFraccion denominator) + (denominator * UnaFraccion numerator).
	newDenominator := denominator * UnaFraccion denominator.

	^newNumerator / newDenominator 
	! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 10/1/2022 18:09:00'!
* aMultiplier
	^aMultiplier multiplicarseConFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/30/2022 18:32:02'!
+ anAdder

	^anAdder sumarConFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 10/1/2022 18:09:18'!
- aSubtrahend 
	^(aSubtrahend * (Entero with: -1)) sumarConFraccion: self.
	
	

! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/30/2022 19:05:30'!
/ aDivisor 
	^aDivisor dividirAFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'cg 10/2/2022 09:43:03'!
= anObject	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'cg 10/2/2022 09:44:10'!
denominator	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'cg 9/29/2022 19:46:45'!
numerator
	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'cg 10/1/2022 19:36:05'!
gcdwith: aDividend over: aDivisor
	| greatestCommonDivisor numerator denominator |
	

	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	^denominator generarFraccionIrreductible: numerator.! !

!Fraccion class methodsFor: 'intance creation' stamp: 'cg 10/1/2022 19:08:16'!
with: aDividend over: aDivisor 
	^self new initializeWith: aDividend over: aDivisor.! !
