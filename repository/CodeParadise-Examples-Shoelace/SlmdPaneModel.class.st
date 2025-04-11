Class {
	#name : #SlmdPaneModel,
	#superclass : #CpModel,
	#instVars : [
		'id',
		'content'
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

]
