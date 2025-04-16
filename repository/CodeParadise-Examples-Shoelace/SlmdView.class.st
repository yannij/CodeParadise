Class {
	#name : #SlmdView,
	#superclass : #CpView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #utilities }
SlmdView >> checkElementIsNil [

	^ true
]

{ #category : #utilities }
SlmdView >> findByIdInLightDom: anId [

	^ self
		findByIdInLightDom: anId
		ifNone: [ self error: '#findByIdInLightDom: ', anId asString, ' is nil' ].
]

{ #category : #utilities }
SlmdView >> findByIdInLightDom: anId ifNone: aBlock [
	| element |

	element := CpHtmlElement documentBody firstDescendantMatching: '#', anId.
	element ifNil: [ ^ aBlock value ].
	^ element

]

{ #category : #utilities }
SlmdView >> findByIdInShadowDom: anId [

	^ self
		findByIdInShadowDom: anId
		ifNone: [ self error: '#findByIdInShadowDom: ', anId asString, ' is nil' ].
]

{ #category : #utilities }
SlmdView >> findByIdInShadowDom: anId ifNone: aBlock [
	| element |

	element := self shadowedElementWithId: anId.
	element ifNil: [ ^ aBlock value ].
	^ element

]

{ #category : #nav }
SlmdView >> navModalPaneFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#smdNavModalPane'
]

{ #category : #layout }
SlmdView >> settingsFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#smdSettings'

]

{ #category : #layout }
SlmdView >> settingsOpen [

	self settingsFind beOpen

]
