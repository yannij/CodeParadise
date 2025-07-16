Class {
	#name : #SlmdResponsiveLayoutPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #view }
SlmdResponsiveLayoutPresenter >> handleActionEvent: anObject [
	| type |

	type := anObject parameterAt: #type.
	self logTrace: 'Layout>>handleActionEvent: ', anObject printString.

	type = 'update' ifTrue: [
		self logTrace5: 'update' method: 'handleActionEvent:'.
		self application pane2Model valueChanged.
		self view beEditablePane2 ].

	type = 'delete' ifTrue: [ | listDetail |
		self view primaryPaneOnly.
		listDetail := self application pane1Model paneContent.
		listDetail removeDetail.
		self application setDetailWithIndex: 1 ].

	type = 'create' ifTrue: [
		self logTrace5: 'create' method: 'handleActionEvent:'.
		self application setDetailAddNew.
		self application pane2Model valueChanged.
		self view beEditablePane2.
		self view secondaryPaneOnly ].

]

{ #category : #view }
SlmdResponsiveLayoutPresenter >> handleAspectSettings: anObject [
	| aspect aspectValue |

	self logTrace: anObject printString.
	aspect := anObject parameterAt: #aspect.
	aspectValue := anObject parameterAt: #value.

]

{ #category : #view }
SlmdResponsiveLayoutPresenter >> renderView [

	self model navRail ifNotNil: [ :value |
		"Render the navRail before the panes, so AppBar can find
		the modal navRail pane for menu button to open"
		self renderChildViewForModel: value atSlotNamed: #navRegion ].

	self model navBar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #navBar ].

	self model paneLayout ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #paneLayout ].

	self application sidesheetModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ].

	self model dockedToolbar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #dockedToolbar ].

	self model floatingToolbar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #floatingToolbar ].

	self model fab ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #fab ].

	self model layoutSettings ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: nil ].

]

{ #category : #view }
SlmdResponsiveLayoutPresenter >> viewCreated [

	super viewCreated.

	self view when: (SlmdNavActionRequest navParameterKeys: #(#to)) send: #handleNavTo: to: self.
	self view when: SlmdNavActionRequest actionRequest send: #handleActionEvent: to: self.

]

{ #category : #view }
SlmdResponsiveLayoutPresenter >> viewInitialized [
	| v |

	super viewInitialized.

	v := self view.

	self application navActions do: [ :eachNavAction |
		v addNavAction: eachNavAction asDictionary ].

	self application actionItems do: [ :each |
		each asDictionary keysAndValuesDo: [ :key :value |
			v addActionItemId: each id key: key value: value ] ].


]
