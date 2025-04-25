Class {
	#name : #SlmdListItemView,
	#superclass : #CpView,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

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
		addClass: 'smd-navdrawer-item';
		addClass: 'smd-nav-font';
		when: CpClickEvent basicPrimary do: [ self setDetail: index ] for: self;
		appendChild: (#div asHtmlTag
			addClass: 'smd-navdrawer-labelText';
			textContent: aString;
			yourself);
		yourself.

	self replaceAllChildrenWith: div atSlotNamed: 'listItem'.
]

{ #category : #rendering }
SlmdListItemView >> setDetail: index [

	self serverAnnounce: (CpActionRequested id: #detail parameters: { #index -> index } asDictionary).

]
