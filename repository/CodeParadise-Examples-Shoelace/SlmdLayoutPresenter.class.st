Class {
	#name : #SlmdLayoutPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #view }
SlmdLayoutPresenter >> handleAdapt: anObject [
	| aspect aspectValue |

	anObject printString crTrace.

	aspect := anObject parameterAt: #aspect.
	aspectValue := anObject parameterAt: #value.

	aspect = #bodyPanes ifTrue: [
		'aspect = #bodyPanes' crTrace.
		^ self model useTwoPaneBody: aspectValue; valueChanged ].

	aspect = #twoPaneSplitPosition ifTrue: [
		'aspect = #twoPaneSplitPosition' crTrace.
		"^ self model twoPaneSplitPosition: aspectValue; valueChanged" ].

	aspect = #topAppBarMenuDisplay ifTrue: [
		'aspect = #topAppBarMenuDisplay' crTrace.
		^ self model paneLayout topAppBarModel topAppBarMenuDisplay: aspectValue; valueChanged ].

	aspect = #topAppBarDisplay ifTrue: [
		'aspect = #topAppBarDisplay' crTrace.
		^ self model paneLayout topAppBarDisplayed: aspectValue; valueChanged ].

]

{ #category : #view }
SlmdLayoutPresenter >> layoutSetUp [

	self navSetUp.
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

	self model paneLayout ifNotNil: [ :value |
		self
			renderChildViewForModel: value
			usingPresenter: (
				self model useTwoPaneBody
					ifTrue: [ SlmdTwoPanePresenter ]
					ifFalse: [ SlmdOnePanePresenter ])
			atSlotNamed: #paneLayout ].

	self application sidesheetModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ].

]

{ #category : #rendering }
SlmdLayoutPresenter >> setBottomAppBar [

	self view
		iconButtons: {'1-circle'. '2-circle' . '3-circle'. '4-circle'};
		fab: 'plus'.

]

{ #category : #view }
SlmdLayoutPresenter >> viewCreated [

	self view when: (CpActionRequested id: #adapt) send: #handleAdapt: to: self.

	self view when: (CpActionRequested id: #navigate parameterKeys: #(#to)) send: #navigateTo: to: self.

]

{ #category : #view }
SlmdLayoutPresenter >> viewInitialized [

	self layoutSetUp.
	self view layoutSetUp.
	self view adjustBodyHeight.

]
