Class {
	#name : #SlmdLayoutPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #view }
SlmdLayoutPresenter >> layoutSetUp [

	self navSetUp.
	self setTopAppBar.
	self setBottomAppBar.

]

{ #category : #rendering }
SlmdLayoutPresenter >> navSetUp [
	| v |

	v := self view.
	self application navActions do: [ :eachNavAction |
		eachNavAction asDictionary keysAndValuesDo: [ :key :value |
			v addNavActionId: eachNavAction id key: key value: value ].
		v addNavItem: eachNavAction id ]
]

{ #category : #view }
SlmdLayoutPresenter >> renderView [

	self view renderTopAppBar.

	self application pane1Model ifNotNil: [ :value |
		self
			renderChildViewForModel: value
			atSlotNamed: #pane1 ].

]

{ #category : #rendering }
SlmdLayoutPresenter >> setBottomAppBar [

	self view
		iconButtons: {'1-circle'. '2-circle' . '3-circle'. '4-circle'};
		fab: 'plus'.

]

{ #category : #rendering }
SlmdLayoutPresenter >> setTopAppBar [

	self view
		headline: self application class appName;
		trailingActions: { '1-square'. '2-square' . '3-square'. '4-square' }.

]

{ #category : #view }
SlmdLayoutPresenter >> viewInitialized [

	self layoutSetUp.
	self view layoutSetUp.
]
