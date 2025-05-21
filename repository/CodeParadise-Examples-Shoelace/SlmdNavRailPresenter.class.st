Class {
	#name : #SlmdNavRailPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #nav }
SlmdNavRailPresenter >> navSetUp [
	| v |

	v := self view.
	self application navActions do: [ :eachNavAction |
		eachNavAction asDictionary keysAndValuesDo: [ :key :value |
			v addNavActionId: eachNavAction id key: key value: value ].
		v addNavItem: eachNavAction id ]
]

{ #category : #nav }
SlmdNavRailPresenter >> navigateTo: anObject [

	self application pane1Model handleActionRequest: anObject; valueChanged.

]

{ #category : #view }
SlmdNavRailPresenter >> viewCreated [

	super viewCreated.

	self view when: (CpActionRequested id: #navigate parameterKeys: #(#to)) send: #navigateTo: to: self.

]

{ #category : #view }
SlmdNavRailPresenter >> viewInitialized [

	super viewInitialized.

	self navSetUp.

	self view
		"navRailExpanded: self model navRailExpanded;"
		navModalPaneSetUp;
		navSetUp;
		yourself.

]
