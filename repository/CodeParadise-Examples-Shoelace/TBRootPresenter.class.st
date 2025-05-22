Class {
	#name : #TBRootPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #rendering }
TBRootPresenter >> renderView [

	self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout
]
