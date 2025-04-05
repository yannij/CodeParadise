Class {
	#name : #TBBlogPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #rendering }
TBBlogPresenter >> renderView [

	self
		renderAllChildViewsForModels: self model allBlogPosts
		atSlotNamed: #posts
]
