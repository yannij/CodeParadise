Class {
	#name : #MD3ExamplePagesView,
	#superclass : #CpView,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #'web resources' }
MD3ExamplePagesView class >> template [

	<webResource: #html>

	^ '
<div id="container">
Hello World!
</div>
'
]
