Class {
	#name : #SlmdTopAppBarView,
	#superclass : #SlmdView,
	#instVars : [
		'headline',
		'leadingAction',
		'trailingActions'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'web resources' }
SlmdTopAppBarView class >> style [

	<webResource: #css>

	^ '
.smd-header {
  border-radius: 16px;
  margin-bottom: 16px;
  flex: 0 0 64px;
  display: flex;  
  flex-direction: column;
  background: var(--sl-color-primary-200);
}

.smd-topAppBar {
  display: flex;
  flex-flow: row wrap;
  padding: 8px 4px 8px 4px;
}

.smd-topAppBar-leadingAction {
  margin-top: 4px;
  height: 48px;
  width: 48px;
  font-size: 24px;
}

.smd-topAppBar-headline {
  margin-top: 4px;
  padding-top: 8px;
  padding-left: 8px;
  height: 48px;
  font-size: 24px;
}

.smd-topAppBar-trailingActions {
  margin-left: auto;
  margin-top: 4px;
  height: 48px;
  font-size: 24px;
}
'
]

{ #category : #'web resources' }
SlmdTopAppBarView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div class="smd-topAppBar">
    <div class="smd-topAppBar-leadingAction">
      <slot name="leadingAction"></slot>
    </div>
    <div class="smd-topAppBar-headline">
      <slot name="headline"></slot>
    </div>
    <div class="smd-topAppBar-trailingActions">
      <slot name="trailingActions"></slot>
    </div>
  </div>
</div>
'
]

{ #category : #topAppBar }
SlmdTopAppBarView >> foobar [

	self traceCr: '>>>> menu icon clicked <<<<'
]

{ #category : #accessing }
SlmdTopAppBarView >> leadingAction [

	^ leadingAction
]

{ #category : #accessing }
SlmdTopAppBarView >> leadingAction: anObject [

	leadingAction := anObject
]

{ #category : #topAppBar }
SlmdTopAppBarView >> renderHeadline: aString [

	self
		replaceAllChildrenWith: (aString inHtmlTag: #span)
		atSlotNamed: 'headline'.

]

{ #category : #topAppBar }
SlmdTopAppBarView >> renderLeadingAction: aString [
	| drawer |

	leadingAction ifNil: [
		drawer := self modalNavElementOrNil.
		drawer ifNil: [ self error: 'nav model drawer is nil' ].
		leadingAction := (SlIconButton named: aString)
			when: CpClickEvent basicPrimary send: #show to: drawer;
			when: CpClickEvent basicPrimary send: #foobar to: self;
			yourself ].

	self
		replaceAllChildrenWith: leadingAction
		atSlotNamed: 'leadingAction'.

]

{ #category : #topAppBar }
SlmdTopAppBarView >> renderTrailingActions [
	| gear |

	gear := (SlIconButton named: 'gear')
		when: CpClickEvent basicPrimary send: #modalSettingsOpen to: self;
		yourself.

	self removeChildrenAtSlotNamed: 'trailingActions'.

	self
		appendChild: (SlIconButton named: trailingActions first) atSlotNamed: 'trailingActions';
		appendChild: gear atSlotNamed: 'trailingActions';
		appendChild: (SlIconButton named: trailingActions third) atSlotNamed: 'trailingActions';
		yourself.

]

{ #category : #topAppBar }
SlmdTopAppBarView >> topAppBarMenuDisplay: aBoolean [
	| element |

	element := self topAppBarMenuFind.
	element ifNil: [ self error: '**** topAppBarMenuFind answered nil' ].
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]

{ #category : #topAppBar }
SlmdTopAppBarView >> topAppBarMenuFind [

	^ self shadowedFirstDescendantMatching: '.smd-topAppBar-leadingAction'
]

{ #category : #accessing }
SlmdTopAppBarView >> trailingActions [

	^ trailingActions
]

{ #category : #accessing }
SlmdTopAppBarView >> trailingActions: anObject [

	trailingActions := anObject
]
