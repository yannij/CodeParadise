Class {
	#name : #MD3ExampleApplicationPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #view }
MD3ExampleApplicationPresenter >> renderView [

	self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout
]
