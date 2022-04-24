!classDefinition: #AvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLara class' category: 'AvispasYAbejasParte2'!
AvispaLara class
	instanceVariableNames: 'habitat'!

!AvispaLara class methodsFor: 'as yet unclassified' stamp: 'am 4/23/2022 12:15:17'!
intentarReproducirse
	habitat hayHuevos ifTrue: [
		habitat ponerHuevo. 
		habitat sacarHuevo.
		habitat sacarHuevoConFirmaGenetica.
		habitat ponerHuevoEnFirmaGeneticaDe: self verFirmaGenetica.]! !

!AvispaLara class methodsFor: 'as yet unclassified' stamp: 'am 4/23/2022 11:38:26'!
verFirmaGenetica
	^ 'lara'.! !


!AvispaLara class methodsFor: '--** private fileout/in **--' stamp: 'am 4/23/2022 12:45:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	habitat := HabitatAvispas.! !


!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: 'habitat'!

!AvispaOriana class methodsFor: 'publica' stamp: 'am 4/23/2022 11:22:25'!
intentarReproducirse
	habitat hayOrugas ifTrue: [ 
		habitat ponerHuevo. 
		habitat sacarOruga.
		habitat ponerHuevoEnFirmaGeneticaDe: self verFirmaGenetica .]! !

!AvispaOriana class methodsFor: 'publica' stamp: 'am 4/23/2022 11:05:46'!
verFirmaGenetica
	^ 'orianaOrnella'.! !


!AvispaOriana class methodsFor: '--** private fileout/in **--' stamp: 'am 4/23/2022 12:45:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	habitat := HabitatAvispas.! !


!classDefinition: #AvispaOrnella category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOrnella class' category: 'AvispasYAbejasParte2'!
AvispaOrnella class
	instanceVariableNames: 'habitat'!

!AvispaOrnella class methodsFor: 'as yet unclassified' stamp: 'am 4/23/2022 11:31:32'!
intentarReproducirse
	habitat hayOrugas ifTrue: [
		habitat ponerHuevo. 
		habitat sacarOruga.
		habitat ponerHuevoEnFirmaGeneticaDe: self verFirmaGenetica.]! !

!AvispaOrnella class methodsFor: 'as yet unclassified' stamp: 'am 4/23/2022 11:06:40'!
verFirmaGenetica
	^ 'orianaOrnella'.! !


!AvispaOrnella class methodsFor: '--** private fileout/in **--' stamp: 'am 4/23/2022 12:45:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	habitat := HabitatAvispas.! !


!classDefinition: #AvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaPolly class' category: 'AvispasYAbejasParte2'!
AvispaPolly class
	instanceVariableNames: 'habitat'!

!AvispaPolly class methodsFor: 'as yet unclassified' stamp: 'am 4/23/2022 11:30:02'!
intentarReproducirse
	habitat hayPolillas ifTrue: [
		habitat ponerHuevo. 
		habitat sacarPolilla.
		habitat ponerHuevoEnFirmaGeneticaDe: self verFirmaGenetica.]! !

!AvispaPolly class methodsFor: 'as yet unclassified' stamp: 'am 4/23/2022 11:07:23'!
verFirmaGenetica
	^ 'polly'.! !


!AvispaPolly class methodsFor: '--** private fileout/in **--' stamp: 'am 4/23/2022 12:45:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	habitat := HabitatAvispas.! !


!classDefinition: #HabitatAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #HabitatAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatAvispas class' category: 'AvispasYAbejasParte2'!
HabitatAvispas class
	instanceVariableNames: 'huevos orugas polillas firmasGeneticas'!

!HabitatAvispas class methodsFor: 'publico' stamp: 'am 4/23/2022 11:39:34'!
hayHuevos
	^ huevos > 0.! !

!HabitatAvispas class methodsFor: 'publico' stamp: 'am 4/23/2022 10:31:59'!
hayOrugas
	^ orugas > 0.! !

!HabitatAvispas class methodsFor: 'publico' stamp: 'am 4/23/2022 10:31:28'!
hayPolillas
	^ polillas > 0.! !

!HabitatAvispas class methodsFor: 'publico' stamp: 'am 4/21/2022 19:53:18'!
ponerHuevo
	huevos := huevos + 1! !

!HabitatAvispas class methodsFor: 'publico' stamp: 'am 4/23/2022 11:22:25'!
ponerHuevoEnFirmaGeneticaDe: unaFirmaGenetica
	
	|huevosConUnaFirmaGenetica|
	huevosConUnaFirmaGenetica := firmasGeneticas at: unaFirmaGenetica ifAbsent: [0].
	
	firmasGeneticas at: unaFirmaGenetica put: huevosConUnaFirmaGenetica + 1.! !

!HabitatAvispas class methodsFor: 'publico' stamp: 'am 4/21/2022 20:24:50'!
ponerOruga
	orugas := orugas + 1.! !

!HabitatAvispas class methodsFor: 'publico' stamp: 'am 4/23/2022 10:38:26'!
ponerPolilla
	polillas := polillas + 1.! !

!HabitatAvispas class methodsFor: 'publico' stamp: 'am 4/23/2022 11:41:37'!
sacarHuevo
	huevos := huevos - 1.! !

!HabitatAvispas class methodsFor: 'publico' stamp: 'am 4/23/2022 12:20:30'!
sacarHuevoConFirmaGenetica
	|cantidadHuevos|
	(firmasGeneticas keys) do: [
		:key |cantidadHuevos := (firmasGeneticas at: key ifAbsent: [0]).
		cantidadHuevos > 0 ifTrue: [ firmasGeneticas at: key put: cantidadHuevos - 1.]
		]
	! !

!HabitatAvispas class methodsFor: 'publico' stamp: 'am 4/21/2022 20:04:33'!
sacarOruga
	orugas := orugas - 1.! !

!HabitatAvispas class methodsFor: 'publico' stamp: 'am 4/23/2022 10:39:01'!
sacarPolilla
	polillas := polillas - 1.! !


!HabitatAvispas class methodsFor: 'privado' stamp: 'am 4/23/2022 11:21:20'!
cantidadDeHuevosConFirmaGeneticaDe: unaFirmaGenetica
	
	^ firmasGeneticas at: unaFirmaGenetica ifAbsent: [0].
	
	! !

!HabitatAvispas class methodsFor: 'privado' stamp: 'am 4/21/2022 19:47:17'!
cantidadDeHuevosDeAvispas
	^ huevos! !

!HabitatAvispas class methodsFor: 'privado' stamp: 'am 4/21/2022 20:00:13'!
cantidadDeOrugas
	^ orugas! !

!HabitatAvispas class methodsFor: 'privado' stamp: 'am 4/23/2022 10:40:53'!
cantidadDePolillas
	^ polillas.! !

!HabitatAvispas class methodsFor: 'privado' stamp: 'am 4/23/2022 10:57:20'!
reiniciarFirmasGeneticas
	firmasGeneticas := Dictionary new.! !

!HabitatAvispas class methodsFor: 'privado' stamp: 'am 4/21/2022 19:51:16'!
reiniciarHuevos
	huevos := 0! !

!HabitatAvispas class methodsFor: 'privado' stamp: 'am 4/21/2022 20:05:57'!
reiniciarOrugas
	orugas := 0.! !

!HabitatAvispas class methodsFor: 'privado' stamp: 'am 4/23/2022 10:35:54'!
reiniciarPolillas
	polillas := 0.! !


!HabitatAvispas class methodsFor: '--** private fileout/in **--' stamp: 'am 4/23/2022 12:45:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	huevos := 0.
	orugas := 0.
	polillas := 0.
	firmasGeneticas := ((Dictionary new)).! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'am 4/21/2022 19:59:01'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/23/2022 11:43:07'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^ self habitat cantidadDeHuevosConFirmaGeneticaDe: (self laAvispaLara verFirmaGenetica).! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/23/2022 11:25:55'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^ self habitat cantidadDeHuevosConFirmaGeneticaDe: (self laAvispaOriana verFirmaGenetica).! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/23/2022 11:32:42'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^ self habitat cantidadDeHuevosConFirmaGeneticaDe: (self laAvispaOrnella verFirmaGenetica).! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/23/2022 11:28:56'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^ self habitat cantidadDeHuevosConFirmaGeneticaDe: (self laAvispaPolly verFirmaGenetica).! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/21/2022 19:43:58'!
habitat
	^HabitatAvispas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/23/2022 10:37:35'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self habitat ponerOruga.
	self habitat ponerOruga.
	self habitat ponerPolilla.
	self habitat ponerPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/23/2022 11:42:10'!
laAvispaLara
	^ AvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/21/2022 19:44:20'!
laAvispaOriana
	^AvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/21/2022 20:28:55'!
laAvispaOrnella
	^AvispaOrnella! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/23/2022 10:33:41'!
laAvispaPolly
	^ AvispaPolly! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/21/2022 20:24:51'!
queElHabitatTengaDosOrugasMas
	self habitat ponerOruga.
	self habitat ponerOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/23/2022 10:42:11'!
queElHabitatTengaDosPolillasMas
	self habitat ponerPolilla.
	self habitat ponerPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/21/2022 20:24:51'!
queElHabitatTengaUnaOrugaMas
	self habitat ponerOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/23/2022 10:40:35'!
queElHabitatTengaUnaPolillaMas
	self habitat ponerPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'am 4/23/2022 10:57:42'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat reiniciarHuevos.
	self habitat reiniciarOrugas.
	self habitat reiniciarPolillas.
	self habitat reiniciarFirmasGeneticas.! !

AvispaLara initializeAfterFileIn!
AvispaOriana initializeAfterFileIn!
AvispaOrnella initializeAfterFileIn!
AvispaPolly initializeAfterFileIn!
HabitatAvispas initializeAfterFileIn!