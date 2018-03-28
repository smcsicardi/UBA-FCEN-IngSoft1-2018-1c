!classDefinition: #I category: #'Quinta actividad'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Quinta actividad'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'as yet unclassified' stamp: 'asd 3/22/2018 21:52:44'!
* unNumeroDePeano
	^ unNumeroDePeano! !

!I class methodsFor: 'as yet unclassified' stamp: 'asd 3/22/2018 21:39:08'!
+ unNumeroDePeano
	^ unNumeroDePeano next! !

!I class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 16:26:16'!
- unNumeroDePeano
	^ Error signal: I descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:19:58'!
/ unNumeroDePeano
	(self < unNumeroDePeano) ifTrue: [^Error signal: II descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	^I.! !

!I class methodsFor: 'as yet unclassified' stamp: 'asd 3/26/2018 21:45:28'!
< unNumeroDePeano
	^ (unNumeroDePeano = I) not! !

!I class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 16:58:51'!
<= unNumeroDePeano
	^ true! !

!I class methodsFor: 'as yet unclassified' stamp: 'asd 3/26/2018 21:43:55'!
casoBaseResta
	^ [:unNumero :otroNumero | unNumero previous]! !

!I class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:14:34'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'! !

!I class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 16:23:24'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^ ' No existen negativos'! !

!I class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 16:11:28'!
next
	^ II! !

I instVarNamed: 'next' put: II!

!classDefinition: #II category: #'Quinta actividad'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Quinta actividad'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 16:06:48'!
* unNumeroDePeano
	^ unNumeroDePeano + (self previous * unNumeroDePeano)! !

!II class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 16:06:48'!
+ unNumeroDePeano 
	^ self previous + (unNumeroDePeano next)! !

!II class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 16:06:48'!
- unNumeroDePeano
	^ unNumeroDePeano casoBaseResta value: self value: unNumeroDePeano
! !

!II class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:19:36'!
/ unNumeroDePeano
	(self < unNumeroDePeano) ifTrue: [^Error signal: II descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	(unNumeroDePeano = self) ifTrue: [^I].
	(unNumeroDePeano = I) ifTrue: [^self].
	( (self - unNumeroDePeano) < unNumeroDePeano) ifTrue: [^I].	
	^(((self - unNumeroDePeano ) / unNumeroDePeano)next)! !

!II class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 16:58:28'!
< unNumeroDePeano
	(unNumeroDePeano = I) ifTrue: [^false].
	^(self previous < unNumeroDePeano previous).! !

!II class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 16:43:33'!
<= unNumeroDePeano
	^ ((self < unNumeroDePeano) or: (self = unNumeroDePeano))! !

!II class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 16:06:48'!
casoBaseResta
	^[:unNumero :otroNumero | (unNumero previous) - (otroNumero previous)]! !

!II class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:13:47'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'! !

!II class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 16:06:48'!
next
	next ifNil:
	[
		next := self cloneNamed: (self name, 'I').
		next previous: self.
	].
	^next

		! !

!II class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 16:06:48'!
previous
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 16:06:48'!
previous: anterior
	previous := anterior! !

II instVarNamed: 'next' put: III!
II instVarNamed: 'previous' put: I!

!classDefinition: #III category: #'Quinta actividad'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Quinta actividad'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
* unNumeroDePeano
	^ unNumeroDePeano + (self previous * unNumeroDePeano)! !

!III class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
+ unNumeroDePeano 
	^ self previous + (unNumeroDePeano next)! !

!III class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
- unNumeroDePeano
	^ unNumeroDePeano casoBaseResta value: self value: unNumeroDePeano
! !

!III class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:19:26'!
/ unNumeroDePeano
	(self < unNumeroDePeano) ifTrue: [^Error signal: II descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	(unNumeroDePeano = self) ifTrue: [^I].
	(unNumeroDePeano = I) ifTrue: [^self].
	( (self - unNumeroDePeano) < unNumeroDePeano) ifTrue: [^I].	
	^(((self - unNumeroDePeano ) / unNumeroDePeano)next)! !

!III class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
< unNumeroDePeano
	(unNumeroDePeano = I) ifTrue: [^false].
	^(self previous < unNumeroDePeano previous).! !

!III class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
<= unNumeroDePeano
	^ ((self < unNumeroDePeano) or: (self = unNumeroDePeano))! !

!III class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
casoBaseResta
	^[:unNumero :otroNumero | (unNumero previous) - (otroNumero previous)]! !

!III class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'! !

!III class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
next
	next ifNil:
	[
		next := self cloneNamed: (self name, 'I').
		next previous: self.
	].
	^next

		! !

!III class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
previous
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
previous: anterior
	previous := anterior! !

III instVarNamed: 'next' put: IIII!
III instVarNamed: 'previous' put: II!

!classDefinition: #IIII category: #'Quinta actividad'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Quinta actividad'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
* unNumeroDePeano
	^ unNumeroDePeano + (self previous * unNumeroDePeano)! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
+ unNumeroDePeano 
	^ self previous + (unNumeroDePeano next)! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
- unNumeroDePeano
	^ unNumeroDePeano casoBaseResta value: self value: unNumeroDePeano
! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:19:31'!
/ unNumeroDePeano
	(self < unNumeroDePeano) ifTrue: [^Error signal: II descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	(unNumeroDePeano = self) ifTrue: [^I].
	(unNumeroDePeano = I) ifTrue: [^self].
	( (self - unNumeroDePeano) < unNumeroDePeano) ifTrue: [^I].	
	^(((self - unNumeroDePeano ) / unNumeroDePeano)next)! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
< unNumeroDePeano
	(unNumeroDePeano = I) ifTrue: [^false].
	^(self previous < unNumeroDePeano previous).! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
<= unNumeroDePeano
	^ ((self < unNumeroDePeano) or: (self = unNumeroDePeano))! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
casoBaseResta
	^[:unNumero :otroNumero | (unNumero previous) - (otroNumero previous)]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
next
	next ifNil:
	[
		next := self cloneNamed: (self name, 'I').
		next previous: self.
	].
	^next

		! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
previous
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'asd 3/28/2018 17:17:41'!
previous: anterior
	previous := anterior! !

IIII instVarNamed: 'next' put: nil!
IIII instVarNamed: 'previous' put: III!