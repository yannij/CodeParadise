Class {
	#name : #CpMaterial3ApplicationView,
	#superclass : #CpView,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #'web resources' }
CpMaterial3ApplicationView class >> globalStyle [

	<webResource: #css>

	^ '
body {
  margin: 0;
  padding: 0;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
}
'
]

{ #category : #'web resources' }
CpMaterial3ApplicationView class >> style [

	<webResource: #css>

	^ ''
]

{ #category : #'web resources' }
CpMaterial3ApplicationView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <slot name="layout"></slot>
</div>
'
]
