Class {
	#name : #TBBlogPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #rendering }
TBBlogPresenter >> renderView [

	self
		renderAllChildViewsForModels: self model allBlogPosts
		usingPresenter: TBPostListItemPresenter
		atSlotNamed: #posts
]
