Class {
	#name : #SlmdListItemView,
	#superclass : #SlmdView,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #'web resources' }
SlmdListItemView class >> globalStyle [
	<webResource: #css>

	^ '
.smd-item-font {
  line-height: var(--sl-line-height-normal);
  font-size: var(--sl-font-size-medium);
  font-weight: var(--sl-font-weight-normal);
}

.smd-item {
  display: flex;
  height: 40px;
  padding: 8px 15px;
  background: var(--sl-color-primary-200);
}

.smd-item-icon {
  padding: 0 16px;
  font-size: 24px;
}

.smd-item-labelText {
  line-height: 40px;
  font-size: 16px;
  text-align: left;
  overflow-x: clip;
}
'
]

{ #category : #'web resources' }
SlmdListItemView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <slot name="listItem"></slot>
</div>'
]

{ #category : #rendering }
SlmdListItemView >> renderTextSlot: slotName value: aString index: index [
	| div |

	div := #div asHtmlTag
		addClass: 'smd-item';
		"addClass: 'smd-item-font';"
		when: CpClickEvent basicPrimary do: [ self setDetail: index ] for: self;
		appendChild: (#div asHtmlTag
			addClass: 'smd-item-labelText';
			textContent: aString;
			yourself);
		yourself.

	self replaceAllChildrenWith: div atSlotNamed: 'listItem'.
]

{ #category : #rendering }
SlmdListItemView >> secondaryPaneOnly [

	self layoutViewFind secondaryPaneOnly.

]

{ #category : #rendering }
SlmdListItemView >> setDetail: index [

	self serverAnnounce: (CpActionRequested id: #detail parameters: { #index -> index } asDictionary).

]
