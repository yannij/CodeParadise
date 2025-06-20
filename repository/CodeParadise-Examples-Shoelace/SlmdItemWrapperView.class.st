Class {
	#name : #SlmdItemWrapperView,
	#superclass : #SlmdView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3ListDetail'
}

{ #category : #'web resources' }
SlmdItemWrapperView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <slot name="wrapped"></slot>
</div>'
]

{ #category : #finding }
SlmdItemWrapperView >> wrappedView [

	^ self firstChildAtSlotNamed: #wrapped
]
