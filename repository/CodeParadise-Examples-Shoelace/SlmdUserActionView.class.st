Class {
	#name : #SlmdUserActionView,
	#superclass : #SlmdLayoutComponentView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #'web resources' }
SlmdUserActionView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <slot name="action"></slot>
</div>
'
]

{ #category : #rendering }
SlmdUserActionView >> renderNavActionId: id [
	| b navAction |

	navAction := self actionItemAt: id.
	navAction ifNil: [
		^ self logError: 'navAction not found: ', id printString ].

	b := (SlIconButton named: (navAction at: 'iconName'))
		when: CpClickEvent primary do: [ :event | self executeNavAction: navAction ] for: self;
		addClass: 'cssClass';
		yourself.

	self replaceAllChildrenWith: b atSlotNamed: 'action'

]
