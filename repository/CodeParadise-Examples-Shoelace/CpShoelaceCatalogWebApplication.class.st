Class {
	#name : #CpShoelaceCatalogWebApplication,
	#superclass : #CpWebApplication,
	#category : #'CodeParadise-Examples-Shoelace'
}

{ #category : #accessing }
CpShoelaceCatalogWebApplication class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { SlElement package }
]

{ #category : #accessing }
CpShoelaceCatalogWebApplication class >> app [

	"Answer the unique identifier (a Symbol) for the receiver"

	^ #'Shoelace-Catalog'
]

{ #category : #installing }
CpShoelaceCatalogWebApplication >> extensionMethodCategories [

	"Answer the collection of extension method categories needed for the receiver"

	^ super extensionMethodCategories,
		#(webApplicationShoelaceExtension)
]
