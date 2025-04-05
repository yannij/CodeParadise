Class {
	#name : #TBPostPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
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
