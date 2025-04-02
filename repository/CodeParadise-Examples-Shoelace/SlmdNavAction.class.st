Class {
	#name : #SlmdNavAction,
	#superclass : #Object,
	#instVars : [
		'id',
		'iconName',
		'iconLabel',
		'arg1'
	],
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #'instance creation' }
SlmdNavAction class >> id: id iconName: iconName iconLabel: iconLabel arg1: arg1 [

	^ self new
		id: id;
		iconName: iconName;
		iconLabel: iconLabel;
		arg1: arg1;
		yourself
]

{ #category : #accessing }
SlmdNavAction >> arg1 [

	^ arg1
]

{ #category : #accessing }
SlmdNavAction >> arg1: anObject [

	arg1 := anObject
]

{ #category : #converting }
SlmdNavAction >> asDictionary [

	^ Dictionary new
		at: #id put: id;
		at: #iconName put: iconName;
		at: #iconLabel put: iconLabel;
		at: #arg1 put: arg1;
		yourself
]

{ #category : #accessing }
SlmdNavAction >> iconLabel [

	^ iconLabel
]

{ #category : #accessing }
SlmdNavAction >> iconLabel: anObject [

	iconLabel := anObject
]

{ #category : #accessing }
SlmdNavAction >> iconName [

	^ iconName
]

{ #category : #accessing }
SlmdNavAction >> iconName: anObject [

	iconName := anObject
]

{ #category : #accessing }
SlmdNavAction >> id [

	^ id
]

{ #category : #accessing }
SlmdNavAction >> id: anObject [

	id := anObject
]
