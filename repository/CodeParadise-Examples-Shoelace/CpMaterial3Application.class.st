"
I am a simple WebApplication based on Model-View-Presenter pattern.
I only live in the ServerEnvironment.
"
Class {
	#name : #CpMaterial3Application,
	#superclass : #CpMvpWebApplication,
	#instVars : [
		'layout',
		'navActions',
		'pane1Model'
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
CpMaterial3Application class >> appName [
	"Answer name to be shown in TopAppBar headline"

	^ #'MD3 Example'
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

	pane1Model := nil.
	layout := CpMaterial3LayoutModel new.
	navActions := OrderedCollection new
		add: (SlmdNavAction id: #club iconName: 'suit-club' iconLabel: 'Club' arg1: 'Club Page');
		add: (SlmdNavAction id: #diamond iconName: 'suit-diamond' iconLabel: 'Diamond' arg1: 'Diamond Page');
		add: (SlmdNavAction id: #heart iconName: 'suit-heart' iconLabel: 'Heart' arg1: 'Heart Page');
		add: (SlmdNavAction id: #spade iconName: 'suit-spade' iconLabel: 'Spade' arg1: 'Spade Page');
		add: (SlmdNavAction id: #square1 iconName: '1-square' iconLabel: 'Square1' arg1: 'Square-1');
		add: (SlmdNavAction id: #square2 iconName: '2-square' iconLabel: 'Square2' arg1: 'Square-2');
		add: (SlmdNavAction id: #square3 iconName: '3-square' iconLabel: 'Square3' arg1: 'Square-3');
		yourself.

]

{ #category : #accessing }
CpMaterial3Application >> layout [

	^ layout
]

{ #category : #accessing }
CpMaterial3Application >> layout: anObject [

	layout := anObject
]

{ #category : #accessing }
CpMaterial3Application >> navActions [

	^ navActions
]

{ #category : #accessing }
CpMaterial3Application >> navActions: anObject [

	navActions := anObject
]

{ #category : #accessing }
CpMaterial3Application >> pane1Model [

	^ pane1Model
]

{ #category : #accessing }
CpMaterial3Application >> pane1Model: anObject [

	pane1Model := anObject
]
