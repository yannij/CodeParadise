Class {
	#name : #SlmdListDetailPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3ListDetail'
}

{ #category : #rendering }
SlmdListDetailPresenter >> renderView [

	self
		renderAllChildViewsForModels: self model list
		usingPresenter: SlmdListDetailListPresenter
		atSlotNamed: #posts
]
