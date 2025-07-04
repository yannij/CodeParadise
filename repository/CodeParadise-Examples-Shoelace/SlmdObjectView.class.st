Class {
	#name : #SlmdObjectView,
	#superclass : #SlmdLayoutComponentView,
	#instVars : [
		'fieldElements'
	],
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #rendering }
SlmdObjectView >> changeMap [
	| map |

	map := Dictionary new.
	self fieldElements valuesDo: [ :each |
		map at: each name put: each value.
		each class = SlSwitch ifTrue: [
			map at: each name put: each isChecked ] ].
	^ map
]

{ #category : #rendering }
SlmdObjectView >> fieldAt: key label: aLabel switch: aBoolean [
	| element |

	element := SlSwitch new
		name: key;
		addClass: 'slmd-switch';
		checked: aBoolean;
		replaceAllChildrenWith: aLabel asHtmlElement atSlotNamed: nil;
		replaceAllChildrenWith: ('Help text...' , aLabel) asHtmlElement atSlotNamed: #'help-text';
		"attributeAdd: #readonly;"
		disabled: true;
		yourself.

	^ self fieldElementsAt: key put: element
]

{ #category : #rendering }
SlmdObjectView >> fieldAt: key label: aLabel text: aText [
	| element |

	element := SlInput new
		name: key;
		addClass: 'slmd-input';
		labelText: aLabel;
		value: aText;
		helpText: 'Help text...', aLabel;
		"attributeAdd: #readonly;"
		disabled: true;
		attributeAdd: #filled;
		yourself.

	^ self fieldElementsAt: key put: element

]

{ #category : #rendering }
SlmdObjectView >> fieldAt: key label: aLabel textarea: aText [
	| element |

	element := SlTextarea new
		name: key;
		addClass: 'slmd-textarea';
		rows: 4;
		labelText: aLabel;
		value: aText;
		helpText: 'Help text...', aLabel;
		"attributeAdd: #readonly;"
		disabled: true;
		attributeAdd: #filled;
		yourself.

	^ self fieldElementsAt: key put: element

]

{ #category : #accessing }
SlmdObjectView >> fieldElements [

	^ fieldElements
]

{ #category : #accessing }
SlmdObjectView >> fieldElements: anObject [

	fieldElements := anObject
]

{ #category : #accessing }
SlmdObjectView >> fieldElementsAt: key put: element [

	^ self fieldElements at: key put: element
]

{ #category : #initialization }
SlmdObjectView >> initialize [

	super initialize.

	fieldElements := OrderedDictionary new.

]

{ #category : #rendering }
SlmdObjectView >> setEditable: aBoolean [
	| first index |

	index := 1.
	first := true.
	self fieldElements valuesDo: [ :each |
		self logTrace: each name asString.
		"(first and: [ aBoolean ])" index = 2 ifTrue: [
			self logTrace: 'focus() - ', each printString.
			each focus.
			first := false ].
		"each removeAttributeAt: #readonly"
		index := index + 1.
		each disabled: aBoolean not ].

]
