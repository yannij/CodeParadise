Class {
	#name : #MdexTodoApplication,
	#superclass : #CpMvpWebApplication,
	#instVars : [
		'layout',
		'navActions'
	],
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #accessing }
MdexTodoApplication class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { SlElement package }
]

{ #category : #accessing }
MdexTodoApplication class >> app [
	"self register"

	^ #'Shoelace-ToDo'
]

{ #category : #accessing }
MdexTodoApplication class >> appName [
	"Answer name to be shown in TopAppBar headline"

	^ #'ToDo Example'
]

{ #category : #accessing }
MdexTodoApplication >> applicationModel [

	"Answer the Model for the receiver, which is the receiver itself"

	^ self
]

{ #category : #accessing }
MdexTodoApplication >> applicationPresenterClass [

	^ CpMaterial3ApplicationPresenter
]

{ #category : #initialization }
MdexTodoApplication >> initialize [

	super initialize.

	layout := CpMaterial3LayoutModel new.
	navActions := OrderedCollection new
		add: (SlmdNavAction id: #home iconName: 'house' iconLabel: 'Home' arg1: 'Home Page');
		yourself.

]

{ #category : #accessing }
MdexTodoApplication >> layout [

	^ layout
]

{ #category : #accessing }
MdexTodoApplication >> layout: anObject [

	layout := anObject
]

{ #category : #accessing }
MdexTodoApplication >> navActions [

	^ navActions
]

{ #category : #accessing }
MdexTodoApplication >> navActions: anObject [

	navActions := anObject
]
