Class {
	#name : #TBBlogView,
	#superclass : #CpView,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #'web resources' }
TBBlogView class >> style [

	<webResource: #css>

	^'*, *:before, *:after {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}
	#container {
		display: flex;
		flex-flow: row wrap;
	}
'
]

{ #category : #'web resources' }
TBBlogView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <slot name="posts"></slot>
</div>'
]
