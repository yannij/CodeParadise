Class {
	#name : #SlmdListDetailView,
	#superclass : #SlmdView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3ListDetail'
}

{ #category : #'web resources' }
SlmdListDetailView class >> style [

	<webResource: #css>

	^'*, *:before, *:after {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}
	#container {
		display: flex;
		flex-flow: column wrap;
	}
'
]

{ #category : #'web resources' }
SlmdListDetailView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <slot name="posts"></slot>
</div>'
]
