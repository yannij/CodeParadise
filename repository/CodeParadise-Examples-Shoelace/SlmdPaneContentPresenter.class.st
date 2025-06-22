Class {
	#name : #SlmdPaneContentPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #rendering }
SlmdPaneContentPresenter >> renderView [

	self view renderContent: self model content

]
