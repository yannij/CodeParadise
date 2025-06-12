Class {
	#name : #SlmdItemWrapperModel,
	#superclass : #SlmdModel,
	#instVars : [
		'index',
		'wrappedModel'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3ListDetail'
}

{ #category : #'instance creation' }
SlmdItemWrapperModel class >> on: aModel atIndex: anIndex [

	^ self new
		wrappedModel: aModel;
		index: anIndex;
		yourself
]

{ #category : #accessing }
SlmdItemWrapperModel >> index [

	^ index
]

{ #category : #accessing }
SlmdItemWrapperModel >> index: anObject [

	index := anObject
]

{ #category : #accessing }
SlmdItemWrapperModel >> wrappedModel [

	^ wrappedModel
]

{ #category : #accessing }
SlmdItemWrapperModel >> wrappedModel: anObject [

	wrappedModel := anObject
]
