Class {
	#name : #TBRootView,
	#superclass : #CpView,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #'web resources' }
TBRootView class >> globalStyle [

	<webResource: #css>

	^ '
body {
  margin: 0;
  padding: 0;
}
'
]

{ #category : #'web resources' }
TBRootView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <slot name="blog"></slot>
  <slot name="layout"></slot>
</div>
'
]
