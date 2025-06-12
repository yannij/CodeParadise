Class {
	#name : #SlmdToolbarFloatingModel,
	#superclass : #SlmdToolbarModel,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #initialization }
SlmdToolbarFloatingModel >> initialize [

	super initialize.

	self
		iconButtons: {'1-circle'. '2-circle' . '3-circle'. '4-circle'};
		fab: 'plus'.

]
