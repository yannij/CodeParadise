Class {
	#name : #SlmdLayoutPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
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
SlmdLayoutPresenter >> navigateTo: anObject [

	self application pane1Model handleActionRequest: anObject; valueChanged.

]

{ #category : #view }
SlmdLayoutPresenter >> renderView [

	self view renderTopAppBar.

	self application pane1Model ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #pane1 ].

	self application pane2Model ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #pane2 ].

	self application sidesheetModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ].

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
SlmdLayoutPresenter >> viewCreated [

	self view when: (CpActionRequested id: #navigate parameterKeys: #(#to)) send: #navigateTo: to: self.

]

{ #category : #view }
SlmdLayoutPresenter >> viewInitialized [

	self layoutSetUp.
	self view layoutSetUp.
]
