Class {
	#name : #SlmdPaneLayoutModel,
	#superclass : #SlmdModel,
	#instVars : [
		'useTwoPaneBody',
		'pane1Width',
		'appBarModel',
		'appBarDisplayed'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdPaneLayoutModel >> appBarDisplayed [

	^ appBarDisplayed
]

{ #category : #accessing }
SlmdPaneLayoutModel >> appBarDisplayed: anObject [

	appBarDisplayed := anObject
]

{ #category : #accessing }
SlmdPaneLayoutModel >> appBarModel [

	^ appBarModel
]

{ #category : #accessing }
SlmdPaneLayoutModel >> appBarModel: anObject [

	appBarModel := anObject
]

{ #category : #initialization }
SlmdPaneLayoutModel >> initialize [

	super initialize.

	appBarDisplayed := true.
	appBarModel := SlmdAppBarModel new.
	useTwoPaneBody := false.
	pane1Width := 500.

]

{ #category : #accessing }
SlmdPaneLayoutModel >> pane1Width [

	^ pane1Width
]

{ #category : #accessing }
SlmdPaneLayoutModel >> pane1Width: anObject [

	pane1Width := anObject
]

{ #category : #accessing }
SlmdPaneLayoutModel >> useTwoPaneBody [

	^ useTwoPaneBody
]

{ #category : #accessing }
SlmdPaneLayoutModel >> useTwoPaneBody: anObject [

	useTwoPaneBody := anObject
]

{ #category : #accessing }
SlmdPaneLayoutModel >> useTwoPaneBodySet: anObject [

	self useTwoPaneBody = anObject ifTrue: [
		^ self ].

	self useTwoPaneBody: anObject.
	self valueChanged.

]
