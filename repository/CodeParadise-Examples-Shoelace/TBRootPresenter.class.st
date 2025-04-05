Class {
	#name : #TBRootPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #rendering }
TBRootPresenter >> renderView [

	"self
		renderChildViewForModel: self application pane1Model
		usingPresenter: TBBlogPresenter
		atSlotNamed: #blog."

	self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout
]
