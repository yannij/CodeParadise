Class {
	#name : #CpIonicComponentsWebApplication,
	#superclass : #CpWebApplication,
	#category : #'CodeParadise-Examples-Ionic-ComponentsApp'
}

{ #category : #accessing }
CpIonicComponentsWebApplication class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { IonElement package }
]

{ #category : #accessing }
CpIonicComponentsWebApplication class >> app [

	"Answer the unique identifier (a Symbol) for the receiver"

	^ #'Ionic-UIComponents'
]

{ #category : #installing }
CpIonicComponentsWebApplication >> extensionMethodCategories [

	"Answer the collection of extension method categories needed for the receiver"

	^ super extensionMethodCategories,
		#(webApplicationIonicExtension)
]
