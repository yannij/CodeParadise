Class {
	#name : #SlmdFloatingToolbarModel,
	#superclass : #SlmdToolbarModel,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #initialization }
SlmdFloatingToolbarModel >> initialize [

	super initialize.

	self
		iconButtons: {'1-circle'. '2-circle' . '3-circle'. '4-circle'};
		fab: 'plus'.

]
