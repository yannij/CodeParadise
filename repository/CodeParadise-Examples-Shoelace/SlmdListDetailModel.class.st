Class {
	#name : #SlmdListDetailModel,
	#superclass : #SlmdModel,
	#instVars : [
		'list',
		'detail'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3ListDetail'
}

{ #category : #accessing }
SlmdListDetailModel >> detail [

	^ detail
]

{ #category : #accessing }
SlmdListDetailModel >> detail: anObject [

	detail := anObject
]

{ #category : #actions }
SlmdListDetailModel >> handleActionRequest: aBasicEvent [

	self traceCr: (aBasicEvent parameterAt: #to).

]

{ #category : #accessing }
SlmdListDetailModel >> list [

	^ list
]

{ #category : #accessing }
SlmdListDetailModel >> list: anObject [

	list := anObject
]

{ #category : #accessing }
SlmdListDetailModel >> listSet: aCollection [
	| wrappedList |

	wrappedList := OrderedCollection new.
	aCollection withIndexDo: [ :each :index |
		wrappedList add: (SlmdItemWrapperModel on: each atIndex: index) ].

	self list: wrappedList.

]
