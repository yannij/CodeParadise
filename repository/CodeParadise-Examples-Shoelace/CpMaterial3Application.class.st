"
I am a simple WebApplication based on Model-View-Presenter pattern.
I only live in the ServerEnvironment.
"
Class {
	#name : #CpMaterial3Application,
	#superclass : #CpMvpWebApplication,
	#instVars : [
		'layout'
	],
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #accessing }
CpMaterial3Application class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { SlElement package }
]

{ #category : #accessing }
CpMaterial3Application class >> app [
	"self register"

	^ #'Shoelace-MD3'
]

{ #category : #accessing }
CpMaterial3Application >> applicationModel [

	"Answer the Model for the receiver, which is the receiver itself"

	^ self
]

{ #category : #accessing }
CpMaterial3Application >> applicationPresenterClass [

	^ CpMaterial3ApplicationPresenter
]

{ #category : #initialization }
CpMaterial3Application >> initialize [

	super initialize.

	layout := CpMaterial3LayoutModel new.

]

{ #category : #accessing }
CpMaterial3Application >> layout [

	^ layout
]

{ #category : #accessing }
CpMaterial3Application >> layout: anObject [

	layout := anObject
]
