Class {
	#name : #SlmdItemWrapperPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3ListDetail'
}

{ #category : #rendering }
SlmdItemWrapperPresenter >> renderView [

	self
		renderChildViewForModel: self model wrappedModel
		atSlotNamed: #wrapped
]
