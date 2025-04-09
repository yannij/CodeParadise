Class {
	#name : #TBRootPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #rendering }
TBRootPresenter >> renderView [

	self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout
]
