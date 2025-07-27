Class {
	#name : #CpShoelaceCatalogWebClientBehavior,
	#superclass : #CpWebClientBehavior,
	#category : #'CodeParadise-Examples-Shoelace'
}

{ #category : #'code generation' }
CpShoelaceCatalogWebClientBehavior class >> allShoelaceComponentNames [
	"List of Shoelace component names for code generation"

	^ #(
'Alert'
'Animated Image'
'Animation'
'Avatar'
'Badge'
'Breadcrumb'
'Breadcrumb Item'
'Button'
'Button Group'
'Card'
'Carousel'
'Carousel Item'
'Checkbox'
'Color Picker'
'Copy Button'
'Details'
'Dialog'
'Divider'
'Drawer'
'Dropdown'
'Format Bytes'
'Format Date'
'Format Number'
'Icon'
'Icon Button'
'Image Comparer'
'Include'
'Input'
'Menu'
'Menu Item'
'Menu Label'
'Mutation Observer'
'Option'
'Popup'
'Progress Bar'
'Progress Ring'
'QR Code'
'Radio'
'Radio Button'
'Radio Group'
'Range'
'Rating'
'Relative Time'
'Resize Observer'
'Select'
'Skeleton'
'Spinner'
'Split Panel'
'Switch'
'Tab'
'Tab Group'
'Tab Panel'
'Tag'
'Textarea'
'Tooltip'
'Tree'
'Tree Item'
'Visually Hidden'
)
]

{ #category : #'code generation' }
CpShoelaceCatalogWebClientBehavior class >> generateCode [
	"Cannot be run in browser. Only generate code in Pharo."

	self generateMethodAllShoelaceElementClasses.
	self generateMethodNavData.
	self allShoelaceComponentNames do: [ :eachName | self generateExample: eachName ].

]

{ #category : #'code generation' }
CpShoelaceCatalogWebClientBehavior class >> generateExample: aName [
	"
	self generateExample: 'Alert'.
	"
	| methodSource slName slClass methodName summaryMethod markupMethod |

	slName := self makeSlName: aName.
	slClass := SmalltalkImage current classNamed: slName.
	methodName := self makeExampleName: aName.
	summaryMethod := methodName, 'Summary'.
	(self canUnderstand: summaryMethod asSymbol) ifFalse: [ summaryMethod := 'sDefaultSummary' ].
	markupMethod := methodName, 'Markup'.
	(self canUnderstand: markupMethod asSymbol) ifFalse: [ markupMethod := 'sDefaultMarkup' ].
	methodSource:= String streamContents: [:stream | | slTag |
		slTag := 'sl-', (aName asLowercase copyReplaceAll: ' ' with: '-').
		stream
			nextPutAll: methodName; cr;
			tab; nextPutAll: '| out |'; cr; cr;
			tab; nextPutAll: 'out := self outputElement.'; cr;
			tab; nextPutAll: 'out textContent: ''''.'; cr; cr;
			yourself.
		slClass ifNil: [
			stream tab; nextPutAll: 'out appendChild: (self missing: ', slName surroundedBySingleQuotes, ').'; cr ].
		stream
			tab; nextPutAll: 'self';
				nextPutAll: ' header: ', aName surroundedBySingleQuotes;
				nextPutAll: ' tag: ', slTag surroundedBySingleQuotes;
				nextPutAll: ' element: ', slName surroundedBySingleQuotes;
				nextPutAll: ' on: out.'; cr;
			yourself.	
		stream tab; nextPutAll: 'out appendChild: (self summary: self ', summaryMethod, ').'; cr.
		stream tab; nextPutAll: 'out appendChild: (self codePreview: self ', markupMethod,').'; cr.
		stream contents ].
	self compile: methodSource classified: 'examples'.
	^ methodSource
]

{ #category : #'code generation' }
CpShoelaceCatalogWebClientBehavior class >> generateMethodAllShoelaceElementClasses [
	| methodSource |

	methodSource := String streamContents: [ :stream |
		stream
			nextPutAll: 'allShoelaceElementClasses'; cr; cr;
			tab; nextPutAll: '^ {'; cr.
		self allShoelaceComponentNames do: [ :eachName | | slName slClass |
			slName := self makeSlName: eachName.
			slClass := SmalltalkImage current classNamed: slName.
			slClass ifNil: [ stream nextPut: $" ].
			stream nextPutAll: slName; nextPut: $..
			slClass ifNil: [ stream nextPut: $" ].
			stream cr.
		].
		stream nextPutAll: '}'.
		stream contents ].
	self compile: methodSource classified: 'catalog'.
	^ methodSource
]

{ #category : #'code generation' }
CpShoelaceCatalogWebClientBehavior class >> generateMethodNavData [
	| methodSource |

	methodSource := String streamContents: [ :stream |
		stream
			nextPutAll: 'navData'; cr; cr;
			tab; nextPutAll: '^ {'; cr.
		self allShoelaceComponentNames do: [ :eachName | | slName exName label |
			slName := self makeSlName: eachName.
			exName := self makeExampleName: eachName.
			label := (SmalltalkImage current classNamed: slName) ifNil: [ '- ', slName ] ifNotNil: [ slName ].
			stream
				nextPutAll: label surroundedBySingleQuotes;
				nextPutAll: ' -> ';
				nextPutAll: '#', exName;
				nextPutAll: '.'; cr;
			yourself ].
		stream nextPutAll: '}'.
		stream contents ].
	self compile: methodSource classified: 'catalog'.
	^ methodSource
]

{ #category : #'code generation' }
CpShoelaceCatalogWebClientBehavior class >> makeExampleName: aName [

	^ 'ex', aName asCamelCase
]

{ #category : #'code generation' }
CpShoelaceCatalogWebClientBehavior class >> makeSlName: aName [

	^ 'Sl', aName asCamelCase
]

{ #category : #catalog }
CpShoelaceCatalogWebClientBehavior >> allShoelaceElementClasses [

	^ {
SlAlert.
"SlAnimatedImage."
"SlAnimation."
SlAvatar.
SlBadge.
"SlBreadcrumb."
"SlBreadcrumbItem."
SlButton.
SlButtonGroup.
SlCard.
"SlCarousel."
"SlCarouselItem."
SlCheckbox.
"SlColorPicker."
"SlCopyButton."
"SlDetails."
SlDialog.
SlDivider.
SlDrawer.
SlDropdown.
"SlFormatBytes."
SlFormatDate.
"SlFormatNumber."
SlIcon.
SlIconButton.
"SlImageComparer."
"SlInclude."
SlInput.
SlMenu.
SlMenuItem.
SlMenuLabel.
"SlMutationObserver."
SlOption.
SlPopup.
"SlProgressBar."
SlProgressRing.
"SlQRCode."
"SlRadio."
SlRadioButton.
SlRadioGroup.
SlRange.
"SlRating."
SlRelativeTime.
"SlResizeObserver."
SlSelect.
SlSkeleton.
SlSpinner.
SlSplitPanel.
SlSwitch.
SlTab.
SlTabGroup.
SlTabPanel.
SlTag.
SlTextarea.
SlTooltip.
SlTree.
SlTreeItem.
"SlVisuallyHidden."
}
]

{ #category : #catalog }
CpShoelaceCatalogWebClientBehavior >> allShoelaceElementClassesREADME [
	"#allShoelaceElementClasses lists all Shoelace element classes,
	so they will be lazy-loaded to browser.
	
	The method is generated, hence this README method.

	Reasoning:
		The SlTree example uses SlTreeItem (via markupContent:),
		but it must be referenced somewhere for lazy-load.
		Initially, the SlTreeItem example was not present,
		so the SlTree example did not work."
]

{ #category : #catalog }
CpShoelaceCatalogWebClientBehavior >> bodyCss [

	^ '
		#menu {
			display: inline-block;
			width: 20em;
			height: calc(100vh - 6em);
			border-right: 1px solid #999;
			overflow-y: auto;
		}
		#menu ul {
			list-style: none;
		}
		#menu li { 
			cursor: pointer;
			margin-bottom: .6em;
		}
		#result {
			position: absolute;
			display: inline-block;
			width: calc(100% - 24em);
			height: calc(100vh - 10em);
			padding: 2em;
		}
		#output {
			position: relative;
			width: 100%;
			height: 100%;
		}
		#output div {
			padding-top: 1em;
		}
		div.separator {
			height: 1em;
		}'
]

{ #category : #catalog }
CpShoelaceCatalogWebClientBehavior >> bodyHtml [

	^ '
<h1>Shoelace Catalog</h1>
<div style="width: 100%; margin: 0; padding: 0;">
  <div id="menu">
    <ul><div id="list"></div></ul>
  </div>
  <div id="result">
    <div id="output"></div>
  </div>
</div>
'
]

{ #category : #catalog }
CpShoelaceCatalogWebClientBehavior >> codePreview: markupContnet [

	^ (CpHtmlElement newWithTag: #div)
		classed: 'code-preview' if: true;
		markupContent: markupContnet;
		yourself
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exAlert [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Alert' tag: 'sl-alert' element: 'SlAlert' on: out.
	out appendChild: (self summary: self exAlertSummary).
	out appendChild: (self codePreview: self exAlertMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exAlertMarkup [

	^ '
<sl-alert open>
  <sl-icon slot="icon" name="info-circle"></sl-icon>
  This is a standard alert. You can customize its content and even the icon.
</sl-alert>
'
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exAlertSummary [

	^ 'A component for displaying animated GIFs and WEBPs that play and pause on interaction.'
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exAnimatedImage [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlAnimatedImage').
	self header: 'Animated Image' tag: 'sl-animated-image' element: 'SlAnimatedImage' on: out.
	out appendChild: (self summary: self exAnimatedImageSummary).
	out appendChild: (self codePreview: self exAnimatedImageMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exAnimatedImageMarkup [

	^ '
<sl-animated-image
  src="https://shoelace.style/assets/images/walk.gif"
  alt="Animation of untied shoes walking on pavement"
></sl-animated-image>
'
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exAnimatedImageSummary [

	^ 'A component for displaying animated GIFs and WEBPs that play and pause on interaction.'
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exAnimation [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlAnimation').
	self header: 'Animation' tag: 'sl-animation' element: 'SlAnimation' on: out.
	out appendChild: (self summary: self exAnimationSummary).
	out appendChild: (self codePreview: self exAnimationMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exAnimationMarkup [

	^ '
<div class="animation-overview">
  <sl-animation name="bounce" duration="2000" play><div class="box"></div></sl-animation>
  <sl-animation name="jello" duration="2000" play><div class="box"></div></sl-animation>
  <sl-animation name="heartBeat" duration="2000" play><div class="box"></div></sl-animation>
  <sl-animation name="flip" duration="2000" play><div class="box"></div></sl-animation>
</div>

<style>
  .animation-overview .box {
    display: inline-block;
    width: 100px;
    height: 100px;
    background-color: var(--sl-color-primary-600);
    margin: 1.5rem;
  }
</style>
'
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exAnimationSummary [

	^ #(
'Animate elements declaratively with nearly 100 baked-in presets, or roll your own with custom keyframes.'
'Powered by the <a href="https://developer.mozilla.org/en-US/docs/Web/API/Web_Animations_API" class="external-link" rel="noopener noreferrer" target="_blank">Web Animations API</a>.
')
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exAvatar [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Avatar' tag: 'sl-avatar' element: 'SlAvatar' on: out.
	out appendChild: (self summary: self exAvatarSummary).
	out appendChild: (self codePreview: self exAvatarMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exAvatarMarkup [

	^ '
<sl-avatar label="User avatar"></sl-avatar>
'
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exAvatarSummary [

	^ #(
'Avatars are used to represent a person or object.'
'By default, a generic icon will be shown. You can personalize avatars by adding custom icons, initials, and images. You should always provide a label for assistive devices.'
)
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exBadge [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Badge' tag: 'sl-badge' element: 'SlBadge' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exBreadcrumb [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlBreadcrumb').
	self header: 'Breadcrumb' tag: 'sl-breadcrumb' element: 'SlBreadcrumb' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exBreadcrumbItem [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlBreadcrumbItem').
	self header: 'Breadcrumb Item' tag: 'sl-breadcrumb-item' element: 'SlBreadcrumbItem' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exButton [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Button' tag: 'sl-button' element: 'SlButton' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exButtonGroup [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Button Group' tag: 'sl-button-group' element: 'SlButtonGroup' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exCard [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Card' tag: 'sl-card' element: 'SlCard' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exCarousel [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlCarousel').
	self header: 'Carousel' tag: 'sl-carousel' element: 'SlCarousel' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exCarouselItem [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlCarouselItem').
	self header: 'Carousel Item' tag: 'sl-carousel-item' element: 'SlCarouselItem' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exCheckbox [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Checkbox' tag: 'sl-checkbox' element: 'SlCheckbox' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exColorPicker [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlColorPicker').
	self header: 'Color Picker' tag: 'sl-color-picker' element: 'SlColorPicker' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exCopyButton [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlCopyButton').
	self header: 'Copy Button' tag: 'sl-copy-button' element: 'SlCopyButton' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exDetails [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlDetails').
	self header: 'Details' tag: 'sl-details' element: 'SlDetails' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exDialog [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Dialog' tag: 'sl-dialog' element: 'SlDialog' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exDivider [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Divider' tag: 'sl-divider' element: 'SlDivider' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exDrawer [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Drawer' tag: 'sl-drawer' element: 'SlDrawer' on: out.
	out appendChild: (self summary: self exDrawerSummary).
	"out appendChild: (self codePreview: self exDrawerMarkup)."
	self exDrawerSummaryElementOn: out.

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exDrawerMarkup [

	^ '
<sl-drawer label="Drawer" class="drawer-overview">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  <sl-button slot="footer" variant="primary">Close</sl-button>
</sl-drawer>

<sl-button>Open Drawer</sl-button>

<script>
  const drawer = document.querySelector(''.drawer-overview'');
  const openButton = drawer.nextElementSibling;
  const closeButton = drawer.querySelector(''sl-button[variant="primary"]'');

  openButton.addEventListener(''click'', () => drawer.show());
  closeButton.addEventListener(''click'', () => drawer.hide());
</script>
<script>
  const drawer = document.querySelector(''.drawer-overview'');
  drawer.show();
</script>
'
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exDrawerSummary [

	^ 'Drawers slide in from a container to expose additional options and information.'
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exDrawerSummaryElementOn: out [
	| drawer |

	drawer := SlDrawer new
		labelText: 'Drawer';
		addClass: 'drawer-overview';
		contentText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';
		yourself.
	
	drawer footer: (
		(SlButton label: 'Close')
			when: CpClickEvent basicPrimary send: #hide to: drawer;
			yourself).

	out appendChild: drawer.
	out appendChild: (
		(SlButton label: 'Open Drawer')
			when: CpClickEvent basicPrimary send: #show to: drawer;
			yourself).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exDropdown [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Dropdown' tag: 'sl-dropdown' element: 'SlDropdown' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exFormatBytes [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlFormatBytes').
	self header: 'Format Bytes' tag: 'sl-format-bytes' element: 'SlFormatBytes' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exFormatDate [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Format Date' tag: 'sl-format-date' element: 'SlFormatDate' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exFormatNumber [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlFormatNumber').
	self header: 'Format Number' tag: 'sl-format-number' element: 'SlFormatNumber' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exIcon [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Icon' tag: 'sl-icon' element: 'SlIcon' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exIconButton [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Icon Button' tag: 'sl-icon-button' element: 'SlIconButton' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exImageComparer [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlImageComparer').
	self header: 'Image Comparer' tag: 'sl-image-comparer' element: 'SlImageComparer' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exInclude [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlInclude').
	self header: 'Include' tag: 'sl-include' element: 'SlInclude' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exInput [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Input' tag: 'sl-input' element: 'SlInput' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exMenu [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Menu' tag: 'sl-menu' element: 'SlMenu' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exMenuItem [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Menu Item' tag: 'sl-menu-item' element: 'SlMenuItem' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exMenuLabel [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Menu Label' tag: 'sl-menu-label' element: 'SlMenuLabel' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exMutationObserver [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlMutationObserver').
	self header: 'Mutation Observer' tag: 'sl-mutation-observer' element: 'SlMutationObserver' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exOption [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Option' tag: 'sl-option' element: 'SlOption' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exPopup [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Popup' tag: 'sl-popup' element: 'SlPopup' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exProgressBar [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlProgressBar').
	self header: 'Progress Bar' tag: 'sl-progress-bar' element: 'SlProgressBar' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exProgressRing [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Progress Ring' tag: 'sl-progress-ring' element: 'SlProgressRing' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exQRCode [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlQRCode').
	self header: 'QR Code' tag: 'sl-qr-code' element: 'SlQRCode' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exRadio [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlRadio').
	self header: 'Radio' tag: 'sl-radio' element: 'SlRadio' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exRadioButton [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Radio Button' tag: 'sl-radio-button' element: 'SlRadioButton' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exRadioGroup [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Radio Group' tag: 'sl-radio-group' element: 'SlRadioGroup' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exRange [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Range' tag: 'sl-range' element: 'SlRange' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exRating [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlRating').
	self header: 'Rating' tag: 'sl-rating' element: 'SlRating' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exRelativeTime [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Relative Time' tag: 'sl-relative-time' element: 'SlRelativeTime' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exResizeObserver [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlResizeObserver').
	self header: 'Resize Observer' tag: 'sl-resize-observer' element: 'SlResizeObserver' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exSelect [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Select' tag: 'sl-select' element: 'SlSelect' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exSkeleton [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Skeleton' tag: 'sl-skeleton' element: 'SlSkeleton' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exSpinner [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Spinner' tag: 'sl-spinner' element: 'SlSpinner' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exSplitPanel [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Split Panel' tag: 'sl-split-panel' element: 'SlSplitPanel' on: out.
	out appendChild: (self summary: self exSplitPanelSummary).
	out appendChild: (self codePreview: self exSplitPanelMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exSplitPanelMarkup [

	^ '
<sl-split-panel>
  <div
    slot="start"
    style="height: 200px; background: var(--sl-color-neutral-50); display: flex; align-items: center; justify-content: center; overflow: hidden;"
  >
    Start
  </div>
  <div
    slot="end"
    style="height: 200px; background: var(--sl-color-neutral-50); display: flex; align-items: center; justify-content: center; overflow: hidden;"
  >
    End
  </div>
</sl-split-panel>
'
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exSplitPanelSummary [

	^ 'Split panels display two adjacent panels, allowing the user to reposition them.'
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exSwitch [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Switch' tag: 'sl-switch' element: 'SlSwitch' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exTab [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Tab' tag: 'sl-tab' element: 'SlTab' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exTabGroup [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Tab Group' tag: 'sl-tab-group' element: 'SlTabGroup' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exTabPanel [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Tab Panel' tag: 'sl-tab-panel' element: 'SlTabPanel' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exTag [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Tag' tag: 'sl-tag' element: 'SlTag' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exTextarea [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Textarea' tag: 'sl-textarea' element: 'SlTextarea' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exTooltip [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Tooltip' tag: 'sl-tooltip' element: 'SlTooltip' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exTree [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Tree' tag: 'sl-tree' element: 'SlTree' on: out.
	out appendChild: (self summary: self exTreeSummary).
	out appendChild: (self codePreview: self exTreeMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exTreeItem [
	| out |

	out := self outputElement.
	out textContent: ''.

	self header: 'Tree Item' tag: 'sl-tree-item' element: 'SlTreeItem' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exTreeMarkup [

	^ '
<sl-tree>
  <sl-tree-item>
    Deciduous
    <sl-tree-item>Birch</sl-tree-item>
    <sl-tree-item>
      Maple
      <sl-tree-item>Field maple</sl-tree-item>
      <sl-tree-item>Red maple</sl-tree-item>
      <sl-tree-item>Sugar maple</sl-tree-item>
    </sl-tree-item>
    <sl-tree-item>Oak</sl-tree-item>
  </sl-tree-item>

  <sl-tree-item>
    Coniferous
    <sl-tree-item>Cedar</sl-tree-item>
    <sl-tree-item>Pine</sl-tree-item>
    <sl-tree-item>Spruce</sl-tree-item>
  </sl-tree-item>

  <sl-tree-item>
    Non-trees
    <sl-tree-item>Bamboo</sl-tree-item>
    <sl-tree-item>Cactus</sl-tree-item>
    <sl-tree-item>Fern</sl-tree-item>
  </sl-tree-item>
</sl-tree>
'
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exTreeSummary [

	^ 'Trees allow you to display a hierarchical list of selectable tree items. Items with children can be expanded and collapsed as desired by the user.'
]

{ #category : #examples }
CpShoelaceCatalogWebClientBehavior >> exVisuallyHidden [
	| out |

	out := self outputElement.
	out textContent: ''.

	out appendChild: (self missing: 'SlVisuallyHidden').
	self header: 'Visually Hidden' tag: 'sl-visually-hidden' element: 'SlVisuallyHidden' on: out.
	out appendChild: (self summary: self sDefaultSummary).
	out appendChild: (self codePreview: self sDefaultMarkup).

]

{ #category : #catalog }
CpShoelaceCatalogWebClientBehavior >> header: aName tag: tagName element: elementName on: outputElement [

	outputElement
		appendChild: ((CpHtmlElement newWithTag: #h1) textContent: aName; yourself);
		appendChild: ((CpHtmlElement newWithTag: #code) textContent: '<', tagName, '> | ', elementName; yourself)
]

{ #category : #initialization }
CpShoelaceCatalogWebClientBehavior >> initialize [

	super initialize.

	self showIndex
]

{ #category : #catalog }
CpShoelaceCatalogWebClientBehavior >> missing: aName [

	^ (CpHtmlElement newWithTag: #h1) textContent: self sMissingSupport, aName; yourself
]

{ #category : #catalog }
CpShoelaceCatalogWebClientBehavior >> navData [

	^ {
'SlAlert' -> #exAlert.
'- SlAnimatedImage' -> #exAnimatedImage.
'- SlAnimation' -> #exAnimation.
'SlAvatar' -> #exAvatar.
'SlBadge' -> #exBadge.
'- SlBreadcrumb' -> #exBreadcrumb.
'- SlBreadcrumbItem' -> #exBreadcrumbItem.
'SlButton' -> #exButton.
'SlButtonGroup' -> #exButtonGroup.
'SlCard' -> #exCard.
'- SlCarousel' -> #exCarousel.
'- SlCarouselItem' -> #exCarouselItem.
'SlCheckbox' -> #exCheckbox.
'- SlColorPicker' -> #exColorPicker.
'- SlCopyButton' -> #exCopyButton.
'- SlDetails' -> #exDetails.
'SlDialog' -> #exDialog.
'SlDivider' -> #exDivider.
'SlDrawer' -> #exDrawer.
'SlDropdown' -> #exDropdown.
'- SlFormatBytes' -> #exFormatBytes.
'SlFormatDate' -> #exFormatDate.
'- SlFormatNumber' -> #exFormatNumber.
'SlIcon' -> #exIcon.
'SlIconButton' -> #exIconButton.
'- SlImageComparer' -> #exImageComparer.
'- SlInclude' -> #exInclude.
'SlInput' -> #exInput.
'SlMenu' -> #exMenu.
'SlMenuItem' -> #exMenuItem.
'SlMenuLabel' -> #exMenuLabel.
'- SlMutationObserver' -> #exMutationObserver.
'SlOption' -> #exOption.
'SlPopup' -> #exPopup.
'- SlProgressBar' -> #exProgressBar.
'SlProgressRing' -> #exProgressRing.
'- SlQRCode' -> #exQRCode.
'- SlRadio' -> #exRadio.
'SlRadioButton' -> #exRadioButton.
'SlRadioGroup' -> #exRadioGroup.
'SlRange' -> #exRange.
'- SlRating' -> #exRating.
'SlRelativeTime' -> #exRelativeTime.
'- SlResizeObserver' -> #exResizeObserver.
'SlSelect' -> #exSelect.
'SlSkeleton' -> #exSkeleton.
'SlSpinner' -> #exSpinner.
'SlSplitPanel' -> #exSplitPanel.
'SlSwitch' -> #exSwitch.
'SlTab' -> #exTab.
'SlTabGroup' -> #exTabGroup.
'SlTabPanel' -> #exTabPanel.
'SlTag' -> #exTag.
'SlTextarea' -> #exTextarea.
'SlTooltip' -> #exTooltip.
'SlTree' -> #exTree.
'SlTreeItem' -> #exTreeItem.
'- SlVisuallyHidden' -> #exVisuallyHidden.
}
]

{ #category : #accessing }
CpShoelaceCatalogWebClientBehavior >> outputElement [

	^ CpHtmlElement documentBody firstDescendantMatching: '#output'
]

{ #category : #catalog }
CpShoelaceCatalogWebClientBehavior >> sDefaultMarkup [

	^ 'TODO... default markup content'
]

{ #category : #catalog }
CpShoelaceCatalogWebClientBehavior >> sDefaultSummary [

	^ 'TODO... default summary'
]

{ #category : #catalog }
CpShoelaceCatalogWebClientBehavior >> sMissingSupport [

	^ 'CodeParadise missing support: '
]

{ #category : #catalog }
CpShoelaceCatalogWebClientBehavior >> showIndex [
	| body list |

	CpHtmlElement documentAddStyle: self bodyCss.
	body := CpHtmlElement documentBody.
	body markupContent: self bodyHtml.

	list := body firstDescendantMatching: '#list'.

	self navData do: [ :item | | example |
		example := (CpHtmlElement newWithTag: #li) textContent: item key; yourself.
		list appendChild: example.
		example when: CpClickEvent basicPrimary send: item value to: self ]
]

{ #category : #catalog }
CpShoelaceCatalogWebClientBehavior >> summary: summary [

	^ summary isString
		ifTrue: [
			(CpHtmlElement newWithTag: #p) textContent: summary; yourself ]
		ifFalse: [ | div |
			div := CpHtmlElement newWithTag: #div.
			summary do: [ :eachText |
				div appendChild: ((CpHtmlElement newWithTag: #p) textContent: eachText; yourself) ].
			div ].
]
