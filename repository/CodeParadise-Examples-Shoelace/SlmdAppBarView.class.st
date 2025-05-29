Class {
	#name : #SlmdAppBarView,
	#superclass : #SlmdToolbarView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'web resources' }
SlmdAppBarView class >> style [

	<webResource: #css>

	^ '
.smd-appBar {
  display: flex;
  flex-flow: row nowrap;
  height: 64px;
  padding: 0 4px;
  background: var(--sl-color-primary-200);
}

.smd-appBar-leadingAction {
  padding: 8px 0;
  height: 48px;
  width: 48px;
}

.smd-appBar-headline {
  padding-left: 8px;
  height: 48px;
  line-height: 64px;
  font-size: 24px;
}

.smd-appBar-trailingActions {
  margin-left: auto;
  display: flex;
  flex-flow: row nowrap;
  gap: 4px;
  height: 48px;
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

{ #category : #nav }
SlmdAppBarView >> actionItemsInitialize [
	| list actionItem |

	list := self layoutViewLazy actionItems.

	items ifNotEmpty: [
		items withIndexDo: [ :eachItem :index |
			actionItem := self iconButtonForAction: (list at: eachItem) css: 'smd-toolbar-item'.
			self appendChild: actionItem atSlotNamed: 'trailingActions' ] ].

	actionItem := self buildModalNavItem.
	self appendChild: actionItem atSlotNamed: 'leadingAction'.

]

{ #category : #topAppBar }
SlmdAppBarView >> appBarLeadingButtonDisplay: aBoolean [
	| element |

	element := self appBarMenuFind.
	element ifNil: [ self logError: '**** appBarMenuFind answered nil' ].
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]

{ #category : #topAppBar }
SlmdAppBarView >> appBarMenuFind [

	^ self shadowedFirstDescendantMatching: '.smd-appBar-leadingAction'
]

{ #category : #topAppBar }
SlmdAppBarView >> renderHeadline: aString [

	self
		replaceAllChildrenWith: (aString inHtmlTag: #span)
		atSlotNamed: 'headline'.

]
