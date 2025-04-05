Class {
	#name : #TBRootApplication,
	#superclass : #CpMvpWebApplication,
	#instVars : [
		'layout',
		'navActions',
		'pane1Model'
	],
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #accessing }
TBRootApplication class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { SlElement package }
]

{ #category : #accessing }
TBRootApplication class >> app [
	"self register"

	^ #'tinyblog'
]

{ #category : #accessing }
TBRootApplication class >> appName [
	"Answer name to be shown in TopAppBar headline"

	^ #'Tiny Blog'
]

{ #category : #accessing }
TBRootApplication >> applicationModel [

	"Answer the Model for the receiver, which is the receiver itself"

	^ self
]

{ #category : #accessing }
TBRootApplication >> applicationPresenterClass [

	^ TBRootPresenter
]

{ #category : #initialization }
TBRootApplication >> initialize [

	super initialize.

	pane1Model := TBBlogModel current.
	layout := SlmdLayoutModel new.
	navActions := OrderedCollection new
		add: (SlmdNavAction id: #home iconName: 'house' iconLabel: 'Home' arg1: 'Home Page');
		yourself.

]

{ #category : #accessing }
TBRootApplication >> layout [

	^ layout
]

{ #category : #accessing }
TBRootApplication >> layout: anObject [

	layout := anObject
]

{ #category : #accessing }
TBRootApplication >> navActions [

	^ navActions
]

{ #category : #accessing }
TBRootApplication >> navActions: anObject [

	navActions := anObject
]

{ #category : #accessing }
TBRootApplication >> pane1Model [

	^ pane1Model
]

{ #category : #accessing }
TBRootApplication >> pane1Model: anObject [

	pane1Model := anObject
]
