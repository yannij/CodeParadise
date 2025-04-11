Class {
	#name : #TBPostView,
	#superclass : #CpView,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #'web resources' }
TBPostView class >> globalStyle [

	<webResource: #css>

	^ '
sl-card.tblog-post::part(base) {
  background: var(--sl-color-neutral-100);
}
'
]

{ #category : #'web resources' }
TBPostView class >> style [

	<webResource: #css>

	^ '
#container {
  width: 300px;
}
'
]

{ #category : #'web resources' }
TBPostView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <slot name="card"></slot>
</div>'
]

{ #category : #rendering }
TBPostView >> renderCardTitle: title text: text date: date category: category visible: visible [
	| card |

	card := SlCard new
		addClass: 'tblog-post';
		appendChild: (text inHtmlTag: #p);
		appendChild: (date inHtmlTag: #p);
		appendChild: (category inHtmlTag: #p);
		appendChild: (visible asString inHtmlTag: #p);
		yourself.

	card replaceAllChildrenWith: (title inHtmlTag: #span) atSlotNamed: #header.

	self replaceAllChildrenWith: card atSlotNamed: 'card'.

]
