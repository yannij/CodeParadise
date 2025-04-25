Class {
	#name : #SlmdWrappedItemModel,
	#superclass : #SlmdModel,
	#instVars : [
		'index',
		'wrappedModel'
	],
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #'instance creation' }
SlmdWrappedItemModel class >> on: aModel atIndex: anIndex [

	^ self new
		wrappedModel: aModel;
		index: anIndex;
		yourself
]

{ #category : #accessing }
SlmdWrappedItemModel >> index [

	^ index
]

{ #category : #accessing }
SlmdWrappedItemModel >> index: anObject [

	index := anObject
]

{ #category : #accessing }
SlmdWrappedItemModel >> wrappedModel [

	^ wrappedModel
]

{ #category : #accessing }
SlmdWrappedItemModel >> wrappedModel: anObject [

	wrappedModel := anObject
]
