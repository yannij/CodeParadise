Class {
	#name : #SlmdListDetailPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #rendering }
SlmdListDetailPresenter >> renderView [

	self
		renderAllChildViewsForModels: self model list
		usingPresenter: SlmdListItemPresenter
		atSlotNamed: #posts
]
