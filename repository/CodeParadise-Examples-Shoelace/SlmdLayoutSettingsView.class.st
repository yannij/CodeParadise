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

{ #category : #'settings - choosers' }
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
SlmdLayoutSettingsView >> elementId: id propertyAt: key ifMissing: aBlock [
	| element |

	element := self elementId: id.
	element ifNil: [ ^ aBlock value ].
	^ element propertyAt: key
]

{ #category : #utilities }
SlmdLayoutSettingsView >> elementId: id propertyAt: key put: value ifMissing: aBlock [
	| element |

	element := self elementId: id.
	element ifNil: [ ^ aBlock value ].
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

{ #category : #'settings - choosers' }
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

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> isExpanded [

	^ self switchId: self navRailExpandedId ifMissing: false
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> isExpanded: aBoolean [

	^ self switchId: self navRailExpandedId put: aBoolean ifMissing: nil
]

{ #category : #initalize }
SlmdLayoutSettingsView >> layoutInitialSetUp: props [

	self layoutView layoutInitialSetUp: props.

]

{ #category : #'settings - choosers' }
SlmdLayoutSettingsView >> layoutType [

	^ self elementId: 'smdLayoutTypeChooser' propertyAt: #value ifMissing: nil
]

{ #category : #'settings - choosers' }
SlmdLayoutSettingsView >> layoutType: aLayoutType [

	self elementId: 'smdLayoutTypeChooser' propertyAt: #value put: aLayoutType ifMissing: nil
]

{ #category : #'settings - choosers' }
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
		appendChild: (self addAttributeContainerStyle: self useAutoLayoutNewSwitch);
		appendChild: (self addAttributeContainerStyle: (self layoutTypeBuildChooser: (aDictionary at: #layoutType ifAbsent: [])));
		appendChild: (self addAttributeContainerStyle: self navRailExpandedNewSwitch);
		appendChild: (self addAttributeContainerStyle: self useModalNavNewSwitch);
		appendChild: (self addAttributeContainerStyle: self useTwoPaneBodyNewSwitch);
		appendChild: (self addAttributeContainerStyle: self showAppBarNewSwitch);
		appendChild: (self addAttributeContainerStyle: self showNavBarNewSwitch);
		appendChild: (self addAttributeContainerStyle: self showToolbarNewSwitch);
		appendChild: (self addAttributeContainerStyle: self showSidesheetNewSwitch);
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

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> navRailExpandedId [

	^ 'navRailExpanded'
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> navRailExpandedNewSwitch [

	^ self
		switchNewWithId: self navRailExpandedId
		label: 'Nav Rail Expanded'
		do: [
			self layoutView navRailExpandedAdapt: self isExpanded.
			self useAutoLayout: false ].

]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showAppBar [

	^ self switchId: self showAppBarId ifMissing: true
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showAppBar: aBoolean [

	self switchId: self showAppBarId put: aBoolean ifMissing: nil
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showAppBarId [

	^ 'showAppBar'
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showAppBarNewSwitch [

	^ self
		switchNewWithId: self showAppBarId
		label: 'Show AppBar'
		do: [
			self layoutView appBarDisplay: self showAppBar.
			self useAutoLayout: false ].

]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showNavBar [

	^ self switchId: self showNavBarId ifMissing: false
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showNavBar: aBoolean [

	self switchId: self showNavBarId put: aBoolean ifMissing: false
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showNavBarId [

	^ 'showNavBar'
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showNavBarNewSwitch [

	^ self
		switchNewWithId: self showNavBarId
		label: 'Show Nav Bar'
		do: [
			self showNavBar
				ifTrue: [ self layoutView navBarOn ]
				ifFalse: [ self layoutView navBarOff ].
			self useAutoLayout: false ].

]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showSidesheet [

	^ self switchId: self showSidesheetId ifMissing: true
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showSidesheet: aBoolean [

	self switchId: self showSidesheetId put: aBoolean ifMissing: nil
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showSidesheetId [

	^ 'showSidesheet'
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showSidesheetNewSwitch [

	^ self
		switchNewWithId: self showSidesheetId
		label: 'Show Sidesheet'
		do: [
			self layoutView sidesheetDisplay: self showSidesheet.
			self useAutoLayout: false ].

]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showToolbar [

	^ self switchId: self showToolbarId ifMissing: false
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showToolbar: aBoolean [

	self switchId: self showToolbarId put: aBoolean ifMissing: nil
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showToolbarId [

	^ 'showToolbar'
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> showToolbarNewSwitch [

	^ self
		switchNewWithId: self showToolbarId
		label: 'Show Toolbar'
		do: [
			self showToolbar
				ifTrue: [ self layoutView toolbarOn ]
				ifFalse: [ self layoutView toolbarOff ].
			self useAutoLayout: false ].

]

{ #category : #utilities }
SlmdLayoutSettingsView >> switchId: id ifMissing: aBlock [

	^ self elementId: id propertyAt: #checked ifMissing: aBlock
]

{ #category : #utilities }
SlmdLayoutSettingsView >> switchId: id put: value ifMissing: aBlock [

	^ self elementId: id propertyAt: #checked put: value ifMissing: nil
]

{ #category : #utilities }
SlmdLayoutSettingsView >> switchNewWithId: id label: label do: aBlock [
	| toggle |

	toggle := SlSwitch new
		id: id;
		label: label;
		checked: true;
		when: SlChangeEvent do: aBlock for: self;
		yourself.

	^ (CpHtmlElement newWithTag: #div) appendChild: toggle; yourself.

]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> useAutoLayout [

	^ self switchId: self useAutoLayoutId ifMissing: true
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> useAutoLayout: aBoolean [

	self switchId: self useAutoLayoutId put: aBoolean ifMissing: nil
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> useAutoLayoutId [

	^ 'useAutoLayout'
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> useAutoLayoutNewSwitch [

	^ self
		switchNewWithId: self useAutoLayoutId
		label: 'Use auto layout'
		do: [ self layoutView layoutAdaptToWidth ].

]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> useModalNav [

	^ self switchId: self useModalNavId ifMissing: false
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> useModalNav: aBoolean [

	self switchId: self useModalNavId put: aBoolean ifMissing: nil
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> useModalNavId [

	^ 'useModalNav'
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> useModalNavNewSwitch [

	^ self
		switchNewWithId: self useModalNavId
		label: 'Use modal navigation'
		do: [
			self useAutoLayout: false.
			self layoutView navRailModalSet: self useModalNav ].

]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> useTwoPaneBody [

	^ self switchId: self useTwoPaneBodyId ifMissing: true
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> useTwoPaneBody: aBoolean [

	self switchId: self useTwoPaneBodyId put: aBoolean ifMissing: nil
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> useTwoPaneBodyId [

	^ 'useTwoPaneBody'
]

{ #category : #'settings - switches' }
SlmdLayoutSettingsView >> useTwoPaneBodyNewSwitch [

	^ self
		switchNewWithId: self useTwoPaneBodyId
		label: 'Use two pane layout'
		do: [
			self layoutView paneLayoutAdapt: self useTwoPaneBody ].

]
