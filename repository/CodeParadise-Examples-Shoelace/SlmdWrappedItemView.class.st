Class {
	#name : #SlmdWrappedItemView,
	#superclass : #CpView,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #'web resources' }
SlmdWrappedItemView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <slot name="wrapped"></slot>
</div>'
]
