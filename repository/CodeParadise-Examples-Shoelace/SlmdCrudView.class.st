Class {
	#name : #SlmdCrudView,
	#superclass : #SlmdView,
	#instVars : [
		'card'
	],
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #rendering }
SlmdCrudView >> changeMap [
	| map |

	map := Dictionary new.
	card children do: [ :each |
		map at: each name put: each value.
		each class = SlSwitch ifTrue: [
			map at: each name put: each isChecked ] ].
	^ map
]

{ #category : #rendering }
SlmdCrudView >> fieldAt: key label: aLabel switch: aBoolean [

	^ SlSwitch new
		name: key;
		addClass: 'slmd-switch';
		checked: aBoolean;
		replaceAllChildrenWith: aLabel asHtmlElement atSlotNamed: nil;
		replaceAllChildrenWith: ('Help text...', aLabel) asHtmlElement atSlotNamed: #'help-text';
		"attributeAdd: #readonly;"
		disabled: true;
		yourself.


]

{ #category : #rendering }
SlmdCrudView >> fieldAt: key label: aLabel text: aText [

	^ SlInput new
		name: key;
		addClass: 'slmd-input';
		labelText: aLabel;
		value: aText;
		helpText: 'Help text...', aLabel;
		"attributeAdd: #readonly;"
		disabled: true;
		attributeAdd: #filled;
		yourself.

]

{ #category : #rendering }
SlmdCrudView >> fieldAt: key label: aLabel textarea: aText [

	^ SlTextarea new
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

]

{ #category : #rendering }
SlmdCrudView >> setEditable: aBoolean [

	card children do: [ :each |
		"each removeAttributeAt: #readonly"
		each disabled: aBoolean not ]
]
