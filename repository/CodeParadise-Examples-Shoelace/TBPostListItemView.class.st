Class {
	#name : #TBPostListItemView,
	#superclass : #CpView,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #'web resources' }
TBPostListItemView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <slot name="card"></slot>
</div>'
]

{ #category : #rendering }
TBPostListItemView >> renderTextSlot: slotName value: aString index: index [
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

	"(self firstChildAtSlotNamed: slotName)
		textContent: aString"
	self replaceAllChildrenWith: div atSlotNamed: 'card'.
]

{ #category : #rendering }
TBPostListItemView >> setDetail: index [

	self serverAnnounce: (CpActionRequested id: #detail parameters: { #index -> index } asDictionary).

]
