Class {
	#name : #SlmdPaneLayoutModel,
	#superclass : #SlmdModel,
	#instVars : [
		'topAppBarModel',
		'topAppBarDisplayed',
		'useTwoPaneBody',
		'pane1Width'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #initialization }
SlmdPaneLayoutModel >> initialize [

	super initialize.

	topAppBarDisplayed := true.
	topAppBarModel := SlmdTopAppBarModel new.
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
SlmdPaneLayoutModel >> topAppBarDisplayed [

	^ topAppBarDisplayed
]

{ #category : #accessing }
SlmdPaneLayoutModel >> topAppBarDisplayed: anObject [

	topAppBarDisplayed := anObject
]

{ #category : #accessing }
SlmdPaneLayoutModel >> topAppBarModel [

	^ topAppBarModel
]

{ #category : #accessing }
SlmdPaneLayoutModel >> topAppBarModel: anObject [

	topAppBarModel := anObject
]

{ #category : #accessing }
SlmdPaneLayoutModel >> useTwoPaneBody [

	^ useTwoPaneBody
]

{ #category : #accessing }
SlmdPaneLayoutModel >> useTwoPaneBody: anObject [

	useTwoPaneBody := anObject
]
