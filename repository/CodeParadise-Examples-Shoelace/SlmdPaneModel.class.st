Class {
	#name : #SlmdPaneModel,
	#superclass : #SlmdModel,
	#instVars : [
		'id',
		'content',
		'paneContent',
		'appBarModel',
		'appBarDisplayed'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'instance creation' }
SlmdPaneModel class >> id: id content: content [

	^ self new
		id: id;
		content: content;
		yourself
]

{ #category : #accessing }
SlmdPaneModel >> appBarDisplayed [

	^ appBarDisplayed
]

{ #category : #accessing }
SlmdPaneModel >> appBarDisplayed: anObject [

	appBarDisplayed := anObject
]

{ #category : #accessing }
SlmdPaneModel >> appBarModel [

	^ appBarModel
]

{ #category : #accessing }
SlmdPaneModel >> appBarModel: anObject [

	appBarModel := anObject
]

{ #category : #accessing }
SlmdPaneModel >> content [

	^ content
]

{ #category : #accessing }
SlmdPaneModel >> content: anObject [

	content := anObject
]

{ #category : #actions }
SlmdPaneModel >> handleActionRequest: aBasicEvent [

	self content: (aBasicEvent parameterAt: #to).

]

{ #category : #accessing }
SlmdPaneModel >> id [

	^ id
]

{ #category : #accessing }
SlmdPaneModel >> id: anObject [

	id := anObject
]

{ #category : #initialization }
SlmdPaneModel >> initialize [

	super initialize.

	"id := nil."
	content := ''.
	appBarDisplayed := true.
	appBarModel := SlmdAppBarModel new.

]

{ #category : #accessing }
SlmdPaneModel >> paneContent [

	^ paneContent
]

{ #category : #accessing }
SlmdPaneModel >> paneContent: anObject [

	paneContent := anObject
]
