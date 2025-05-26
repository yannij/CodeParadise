Class {
	#name : #SlmdWebApplication,
	#superclass : #CpMvpWebApplication,
	#instVars : [
		'navActions',
		'actionItems',
		'layout',
		'pane1Model',
		'pane2Model',
		'sidesheetModel'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdWebApplication >> actionItems [

	^ actionItems
]

{ #category : #accessing }
SlmdWebApplication >> actionItems: anObject [

	actionItems := anObject
]

{ #category : #accessing }
SlmdWebApplication >> applicationModel [

	"Answer the Model for the receiver, which is the receiver itself"

	^ self
]

{ #category : #initialization }
SlmdWebApplication >> initialize [

	super initialize.

	layout := SlmdLayoutModel new.
	navActions := OrderedCollection new.
	actionItems := OrderedCollection new.

]

{ #category : #accessing }
SlmdWebApplication >> layout [

	^ layout
]

{ #category : #accessing }
SlmdWebApplication >> layout: anObject [

	layout := anObject
]

{ #category : #accessing }
SlmdWebApplication >> navActions [

	^ navActions
]

{ #category : #accessing }
SlmdWebApplication >> navActions: anObject [

	navActions := anObject
]

{ #category : #accessing }
SlmdWebApplication >> pane1Model [

	^ pane1Model
]

{ #category : #accessing }
SlmdWebApplication >> pane1Model: anObject [

	pane1Model := anObject
]

{ #category : #accessing }
SlmdWebApplication >> pane2Model [

	^ pane2Model
]

{ #category : #accessing }
SlmdWebApplication >> pane2Model: anObject [

	pane2Model := anObject
]

{ #category : #accessing }
SlmdWebApplication >> sidesheetModel [

	^ sidesheetModel
]

{ #category : #accessing }
SlmdWebApplication >> sidesheetModel: anObject [

	sidesheetModel := anObject
]
