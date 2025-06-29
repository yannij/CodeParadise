Class {
	#name : #TBPostPresenter,
	#superclass : #SlmdObjectPresenter,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #rendering }
TBPostPresenter >> renderView [
	| post |

	post := self model.

	self view
		renderCardTitle: post title
		text: post text
		date: post date asString
		category: post category
		visible: post visible.

]
