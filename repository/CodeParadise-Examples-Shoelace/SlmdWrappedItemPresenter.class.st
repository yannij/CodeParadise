Class {
	#name : #SlmdWrappedItemPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #rendering }
SlmdWrappedItemPresenter >> renderView [

	self
		renderChildViewForModel: self model wrappedModel
		atSlotNamed: #wrapped
]
