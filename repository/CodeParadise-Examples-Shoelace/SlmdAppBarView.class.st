Class {
	#name : #SlmdAppBarView,
	#superclass : #SlmdLayoutComponentView,
	#instVars : [
		'headline',
		'leadingAction',
		'trailingActions'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'web resources' }
SlmdAppBarView class >> style [

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

.smd-appBar {
  display: flex;
  flex-flow: row wrap;
  padding: 8px 4px 8px 4px;
}

.smd-appBar-leadingAction {
  margin-top: 4px;
  height: 48px;
  width: 48px;
  font-size: 24px;
}

.smd-appBar-headline {
  margin-top: 4px;
  padding-top: 8px;
  padding-left: 8px;
  height: 48px;
  font-size: 24px;
}

.smd-appBar-trailingActions {
  margin-left: auto;
  margin-top: 4px;
  height: 48px;
  font-size: 24px;
}
'
]

{ #category : #'web resources' }
SlmdAppBarView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div class="smd-appBar">
    <div class="smd-appBar-leadingAction">
      <slot name="leadingAction"></slot>
    </div>
    <div class="smd-appBar-headline">
      <slot name="headline"></slot>
    </div>
    <div class="smd-appBar-trailingActions">
      <slot name="trailingActions"></slot>
    </div>
  </div>
</div>
'
]

{ #category : #topAppBar }
SlmdAppBarView >> appBarMenuDisplay: aBoolean [
	| element |

	element := self appBarMenuFind.
	element ifNil: [ self error: '**** appBarMenuFind answered nil' ].
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]

{ #category : #topAppBar }
SlmdAppBarView >> appBarMenuFind [

	^ self shadowedFirstDescendantMatching: '.smd-appBar-leadingAction'
]

{ #category : #accessing }
SlmdAppBarView >> leadingAction [

	^ leadingAction
]

{ #category : #accessing }
SlmdAppBarView >> leadingAction: anObject [

	leadingAction := anObject
]

{ #category : #topAppBar }
SlmdAppBarView >> renderHeadline: aString [

	self
		replaceAllChildrenWith: (aString inHtmlTag: #span)
		atSlotNamed: 'headline'.

]

{ #category : #topAppBar }
SlmdAppBarView >> renderLeadingAction: aString [
	| drawer |

	leadingAction ifNil: [
		drawer := self modalNavElementOrNil.
		drawer ifNil: [ self traceCr: 'modal nav element is nil' ].
		leadingAction := (SlIconButton named: aString)
			when: CpClickEvent basicPrimary send: #show to: drawer;
			yourself ].

	self
		replaceAllChildrenWith: leadingAction
		atSlotNamed: 'leadingAction'.

]

{ #category : #topAppBar }
SlmdAppBarView >> renderTrailingActions [
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

{ #category : #accessing }
SlmdAppBarView >> trailingActions [

	^ trailingActions
]

{ #category : #accessing }
SlmdAppBarView >> trailingActions: anObject [

	trailingActions := anObject
]
