Class {
	#name : #SlmdAppBarModel,
	#superclass : #SlmdModel,
	#instVars : [
		'appBarMenuDisplay'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdAppBarModel >> appBarMenuDisplay [

	^ appBarMenuDisplay
]

{ #category : #accessing }
SlmdAppBarModel >> appBarMenuDisplay: anObject [

	appBarMenuDisplay := anObject
]

{ #category : #initialization }
SlmdAppBarModel >> initialize [

	super initialize.

	appBarMenuDisplay := true.

]
