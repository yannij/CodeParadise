Class {
	#name : #CpMaterial3LayoutModel,
	#superclass : #CpModel,
	#instVars : [
		'viewWidth'
	],
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #initialization }
CpMaterial3LayoutModel >> initialize [

	super initialize.

	viewWidth := CpCounterModel new.

]

{ #category : #accessing }
CpMaterial3LayoutModel >> viewWidth [

	^ viewWidth
]

{ #category : #accessing }
CpMaterial3LayoutModel >> viewWidth: anObject [

	viewWidth := anObject
]
