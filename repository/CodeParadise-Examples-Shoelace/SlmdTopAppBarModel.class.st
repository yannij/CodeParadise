Class {
	#name : #SlmdTopAppBarModel,
	#superclass : #SlmdModel,
	#instVars : [
		'topAppBarMenuDisplay'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #initialization }
SlmdTopAppBarModel >> initialize [

	super initialize.

	topAppBarMenuDisplay := true.

]

{ #category : #accessing }
SlmdTopAppBarModel >> topAppBarMenuDisplay [

	^ topAppBarMenuDisplay
]

{ #category : #accessing }
SlmdTopAppBarModel >> topAppBarMenuDisplay: anObject [

	topAppBarMenuDisplay := anObject
]
