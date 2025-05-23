Class {
	#name : #SlmdNavPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #nav }
SlmdNavPresenter >> navSetUp [
	| v |

	v := self view.
	self application navActions do: [ :eachNavAction |
		eachNavAction asDictionary keysAndValuesDo: [ :key :value |
			v addNavActionId: eachNavAction id key: key value: value ].
		v addNavItem: eachNavAction id ]
]

{ #category : #nav }
SlmdNavPresenter >> navigateTo: anObject [

	self application pane1Model handleActionRequest: anObject; valueChanged.

]
