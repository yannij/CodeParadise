"
I am a simple WebApplication based on Model-View-Presenter pattern.
I only live in the ServerEnvironment.
"
Class {
	#name : #MD3ExampleApplication,
	#superclass : #CpMvpWebApplication,
	#instVars : [
		'layout',
		'navActions',
		'pane1Model',
		'pane2Model',
		'sidesheetModel'
	],
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #accessing }
MD3ExampleApplication class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { SlElement package }
]

{ #category : #accessing }
MD3ExampleApplication class >> app [
	"self register"

	^ #'Shoelace-MD3'
]

{ #category : #accessing }
MD3ExampleApplication class >> appName [
	"Answer name to be shown in TopAppBar headline"

	^ #'MD3 Example'
]

{ #category : #accessing }
MD3ExampleApplication >> applicationModel [

	"Answer the Model for the receiver, which is the receiver itself"

	^ self
]

{ #category : #accessing }
MD3ExampleApplication >> applicationPresenterClass [

	^ MD3ExampleApplicationPresenter
]

{ #category : #initialization }
MD3ExampleApplication >> initialize [

	super initialize.

	pane1Model := SlmdPaneModel id: 'zsmdPane1' content: 'Pane1...'.
	pane2Model := SlmdPaneModel id: 'zsmdPane2' content: 'Pane2...'.
	sidesheetModel := SlmdSidesheetModel new.
	layout := SlmdLayoutModel new.
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
MD3ExampleApplication >> layout [

	^ layout
]

{ #category : #accessing }
MD3ExampleApplication >> layout: anObject [

	layout := anObject
]

{ #category : #accessing }
MD3ExampleApplication >> navActions [

	^ navActions
]

{ #category : #accessing }
MD3ExampleApplication >> navActions: anObject [

	navActions := anObject
]

{ #category : #accessing }
MD3ExampleApplication >> pane1Model [

	^ pane1Model
]

{ #category : #accessing }
MD3ExampleApplication >> pane1Model: anObject [

	pane1Model := anObject
]

{ #category : #accessing }
MD3ExampleApplication >> pane2Model [

	^ pane2Model
]

{ #category : #accessing }
MD3ExampleApplication >> pane2Model: anObject [

	pane2Model := anObject
]

{ #category : #accessing }
MD3ExampleApplication >> sidesheetModel [

	^ sidesheetModel
]

{ #category : #accessing }
MD3ExampleApplication >> sidesheetModel: anObject [

	sidesheetModel := anObject
]
