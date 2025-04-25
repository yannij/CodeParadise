Class {
	#name : #SlmdWrappedItemPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #rendering }
SlmdWrappedItemPresenter >> renderView [

	self
		renderChildViewForModel: self model wrappedModel
		atSlotNamed: #wrapped
]
