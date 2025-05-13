Class {
	#name : #SlmdLayoutSettingsView,
	#superclass : #SlmdView,
	#instVars : [
		'drawer',
		'layoutView',
		'colorThemeName',
		'fontFamily'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'class initialization' }
SlmdLayoutSettingsView class >> beLoaded [

	SlDrawer beLoaded
]

{ #category : #'web resources' }
SlmdLayoutSettingsView class >> template [
	<webResource: #html>

	^ '
<div id="container">
  <slot name="content"></slot>
</div>
'
]

{ #category : #initalize }
SlmdLayoutSettingsView >> adaptToLayoutProperties: aDictionary [
	| component |

	component := self layoutView.

	(aDictionary includesKey: #colorThemeName) ifTrue: [
		self colorThemeNameSet: (aDictionary at: #colorThemeName) ].

	(aDictionary includesKey: #fontFamily) ifTrue: [
		self fontFamilySet: (aDictionary at: #fontFamily) ].

]

{ #category : #utilities }
SlmdLayoutSettingsView >> addAttributeContainerStyle: element [

	^ element styleAt: 'padding-bottom' put: '12px'; yourself
]

{ #category : #settings }
SlmdLayoutSettingsView >> colorThemeBuildChooser: selectedItem [
	| chooser |

	chooser := SlSelect new
		id: 'smdColorThemeChooser';
		labelText: 'Use color theme:';
		propertyAt: 'value' put: selectedItem asString;
		yourself.
	self colorThemeName: selectedItem.

	chooser when: SlChangeEvent do: [ self colorThemeNameSet: chooser value ] for: self.

	#(gray red orange amber yellow lime green emerald teal cyan sky blue indigo violet purple fuchsia pink rose)
		do: [ :each |
			chooser appendChild: (SlOption new value: each; textContent: each capitalized; yourself) ].

	^ chooser
]

{ #category : #accessing }
SlmdLayoutSettingsView >> colorThemeName [

	^ colorThemeName
]

{ #category : #accessing }
SlmdLayoutSettingsView >> colorThemeName: anObject [

	colorThemeName := anObject asString
]

{ #category : #accessing }
SlmdLayoutSettingsView >> colorThemeNameSet: anObject [

	self colorThemeName = anObject ifTrue: [
		^ self ].

	self colorThemeName: anObject.
	self layoutView colorThemeAdapt: anObject.

]

{ #category : #accessing }
SlmdLayoutSettingsView >> drawer [

	^ drawer
]

{ #category : #accessing }
SlmdLayoutSettingsView >> drawer: anObject [

	drawer := anObject
]

{ #category : #utilities }
SlmdLayoutSettingsView >> elementId: id [

	"^ drawer shadowedFirstDescendantMatching: '#', id"
	"^ drawer shadowedElementWithId: id"
	^ drawer firstDescendantMatching: '#', id
	"^ self findByIdInLightDom: id"
	"^ self findByIdInShadowDom: id"
	"^ CpHtmlElement documentBody firstDescendantMatching: '#', id"
]

{ #category : #utilities }
SlmdLayoutSettingsView >> elementId: id propertyAt: key ifNotFound: defaultValue [
	| element |

	element := self elementId: id.
	"element ifNil: [ ^ defaultValue ]."
	^ element propertyAt: key
]

{ #category : #utilities }
SlmdLayoutSettingsView >> elementId: id propertyAt: key put: value [
	| element |

	element := self elementId: id.
	"element ifNil: [ ^ self ]."
	element propertyAt: key put: value.

]

{ #category : #accessing }
SlmdLayoutSettingsView >> fontFamily [

	^ fontFamily
]

{ #category : #accessing }
SlmdLayoutSettingsView >> fontFamily: anObject [

	fontFamily := anObject
]

{ #category : #settings }
SlmdLayoutSettingsView >> fontFamilyChooser: selectedItem [
	| chooser |

	chooser := SlSelect new
		id: 'smdFontFamilyChooser';
		labelText: 'Use font family:';
		propertyAt: 'value' put: selectedItem asString;
		yourself.

	chooser when: SlChangeEvent do: [ self fontFamilySet: chooser value ] for: self.

	{
nil -> 'Default'.
#'var(--sl-font-sans)' -> 'Sans'.
#'var(--sl-font-serif)' -> 'Serif'.
#'var(--sl-font-mono)' -> 'Mono'
}
		do: [ :each |
			chooser appendChild: (SlOption new value: each key; textContent: each value capitalized; yourself) ].

	^ chooser
]

{ #category : #accessing }
SlmdLayoutSettingsView >> fontFamilySet: anObject [

	self fontFamily = anObject ifTrue: [
		^ self ].

	self fontFamily: anObject.
	self layoutView fontFamilyAdapt: anObject.

]

{ #category : #initalize }
SlmdLayoutSettingsView >> layoutInitialSetUp: props [

	self layoutView layoutInitialSetUp: props

]

{ #category : #settings }
SlmdLayoutSettingsView >> layoutType [

	^ self elementId: 'smdLayoutTypeChooser' propertyAt: #value ifNotFound: nil
]

{ #category : #settings }
SlmdLayoutSettingsView >> layoutType: aLayoutType [

	self elementId: 'smdLayoutTypeChooser' propertyAt: #value put: aLayoutType
]

{ #category : #settings }
SlmdLayoutSettingsView >> layoutTypeBuildChooser: selectedItem [
	| radioGroup |

	radioGroup := SlRadioGroup new
		id: 'smdLayoutTypeChooser';
		propertyAt: 'label' put: 'Use layout style:';
		propertyAt: 'value' put: selectedItem asString;
		yourself.

	radioGroup when: SlChangeEvent do: [ self layoutView layoutTypeChangeManual: radioGroup value ] for: self.

	radioGroup appendChild: (SlRadio new value: #compact; textContent: 'Compact'; yourself).
	radioGroup appendChild: (SlRadio new value: #medium; textContent: 'Medium'; yourself).
	radioGroup appendChild: (SlRadio new value: #expanded; textContent: 'Expanded'; yourself).
	radioGroup appendChild: (SlRadio new value: #large; textContent: 'Large'; yourself).
	radioGroup appendChild: (SlRadio new value: #'extra-large'; textContent: 'Extra-large'; yourself).

	^ radioGroup
]

{ #category : #accessing }
SlmdLayoutSettingsView >> layoutView [

	layoutView ifNil: [
		layoutView := self layoutViewFind ].

	^ layoutView
]

{ #category : #accessing }
SlmdLayoutSettingsView >> layoutView: anObject [

	layoutView := anObject
]

{ #category : #initalize }
SlmdLayoutSettingsView >> modalDivContentWith: aDictionary [
	| element |

	element := #div asHtmlTag
		addClass: 'smd-settings-pane';
		appendChild: (self addAttributeContainerStyle: self useAutoLayoutBuildToggle);
		appendChild: (self addAttributeContainerStyle: (self layoutTypeBuildChooser: (aDictionary at: #layoutType ifAbsent: [])));
		appendChild: (self addAttributeContainerStyle: (self navTypeBuildChooser: (aDictionary at: #navType ifAbsent: [])));
		appendChild: (self addAttributeContainerStyle: self useModalNavBuildToggle);
		appendChild: (self addAttributeContainerStyle: self useTwoPaneBodyBuildToggle);
		appendChild: (self addAttributeContainerStyle: self showTopAppBarBuildToggle);
		appendChild: (self addAttributeContainerStyle: self showBottomAppBarBuildToggle);
		appendChild: (self addAttributeContainerStyle: self showSidesheetBuildToggle);
		appendChild: (self addAttributeContainerStyle: (self colorThemeBuildChooser: (aDictionary at: #colorThemeName ifAbsent: [])));
		appendChild: (self addAttributeContainerStyle: (self fontFamilyChooser: (aDictionary at: #fontFamily ifAbsent: [])));
		yourself.

	^ element
]

{ #category : #initalize }
SlmdLayoutSettingsView >> modalDivSetUp: aDictionary [

	drawer := SlDrawer new
		id: 'smdSettings';
		label: 'Layout settings';
		"placement: 'top';"
		appendChild: (self modalDivContentWith: aDictionary);
		yourself.

	self modalDivFind
		appendChild: drawer
]

{ #category : #settings }
SlmdLayoutSettingsView >> navType [

	^ self elementId: 'smdNavTypeChooser' propertyAt: #value ifNotFound: nil
]

{ #category : #settings }
SlmdLayoutSettingsView >> navType: aNavType [

	^ self elementId: 'smdNavTypeChooser' propertyAt: #value put: aNavType
]

{ #category : #settings }
SlmdLayoutSettingsView >> navTypeBuildChooser: selectedItem [
	| radioGroup |

	radioGroup := SlRadioGroup new
		id: 'smdNavTypeChooser';
		propertyAt: 'label' put: 'Use navigation type:';
		propertyAt: 'value' put: selectedItem asString;
		yourself.

	radioGroup when: SlChangeEvent do: [ self layoutView navTypeSet: radioGroup value ] for: self.

	radioGroup appendChild: (SlRadio new value: #rail; textContent: 'Rail'; yourself).
	radioGroup appendChild: (SlRadio new value: #drawer; textContent: 'Drawer'; yourself).
	radioGroup appendChild: (SlRadio new value: #bar; textContent: 'Bar'; propertyAt: #disabled put: true; yourself).

	^ radioGroup
]

{ #category : #utilities }
SlmdLayoutSettingsView >> newToggleId: id label: label do: aBlock [
	| toggle |

	toggle := SlSwitch new
		id: id;
		label: label;
		checked: true;
		when: SlChangeEvent do: aBlock for: self;
		yourself.

	^ (CpHtmlElement newWithTag: #div) appendChild: toggle; yourself.

]

{ #category : #settings }
SlmdLayoutSettingsView >> showBottomAppBar [

	^ self elementId: 'showBottomAppBar' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
SlmdLayoutSettingsView >> showBottomAppBar: aBoolean [

	self elementId: 'showBottomAppBar' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
SlmdLayoutSettingsView >> showBottomAppBarBuildToggle [

	^ self
		newToggleId: 'showBottomAppBar'
		label: 'Show BottomAppBar'
		do: [
			self showBottomAppBar
				ifTrue: [ self layoutView bottomAppBarOn ]
				ifFalse: [ self layoutView bottomAppBarOff ].
			self useAutoLayout: false ].

]

{ #category : #settings }
SlmdLayoutSettingsView >> showSidesheet [

	^ self elementId: 'showSidesheet' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
SlmdLayoutSettingsView >> showSidesheet: aBoolean [

	self elementId: 'showSidesheet' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
SlmdLayoutSettingsView >> showSidesheetBuildToggle [

	^ self
		newToggleId: 'showSidesheet'
		label: 'Show Sidesheet'
		do: [
			self layoutView sidesheetDisplay: self showSidesheet.
			self useAutoLayout: false ].

]

{ #category : #settings }
SlmdLayoutSettingsView >> showTopAppBar [

	^ self elementId: 'showTopAppBar' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
SlmdLayoutSettingsView >> showTopAppBar: aBoolean [

	self elementId: 'showTopAppBar' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
SlmdLayoutSettingsView >> showTopAppBarBuildToggle [

	^ self
		newToggleId: 'showTopAppBar'
		label: 'Show TopAppBar'
		do: [
			self layoutView topAppBarDisplay: self showTopAppBar.
			self useAutoLayout: false ].

]

{ #category : #settings }
SlmdLayoutSettingsView >> useAutoLayout [

	^ self elementId: 'useAutoLayout' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
SlmdLayoutSettingsView >> useAutoLayout: aBoolean [

	self elementId: 'useAutoLayout' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
SlmdLayoutSettingsView >> useAutoLayoutBuildToggle [

	^ self
		newToggleId: 'useAutoLayout'
		label: 'Use auto layout'
		do: [ self layoutView layoutAdaptToWidth ].

]

{ #category : #settings }
SlmdLayoutSettingsView >> useModalNav [

	^ self elementId: 'useModalNav' propertyAt: #checked ifNotFound: false
]

{ #category : #settings }
SlmdLayoutSettingsView >> useModalNav: aBoolean [

	self elementId: 'useModalNav' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
SlmdLayoutSettingsView >> useModalNavBuildToggle [

	^ self
		newToggleId: 'useModalNav'
		label: 'Use modal navigation'
		do: [
			self useAutoLayout: false.
			self layoutView navModalSet: self useModalNav ].

]

{ #category : #settings }
SlmdLayoutSettingsView >> useTwoPaneBody [

	^ self elementId: 'useTwoPaneBody' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
SlmdLayoutSettingsView >> useTwoPaneBody: aBoolean [

	self elementId: 'useTwoPaneBody' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
SlmdLayoutSettingsView >> useTwoPaneBodyBuildToggle [

	^ self
		newToggleId: 'useTwoPaneBody'
		label: 'Use two pane layout'
		do: [
			self layoutView paneLayoutAdapt: self useTwoPaneBody ].

]
