Class {
	#name : #SlmdPaneLayoutView,
	#superclass : #SlmdLayoutComponentView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'class initialization' }
SlmdPaneLayoutView class >> beLoaded [

	SlIcon beLoaded.
	SlSplitPanel beLoaded
]

{ #category : #'web resources' }
SlmdPaneLayoutView class >> style [

	<webResource: #css>
	^ '
.smd-pane-layout {
  height: 100%;
  overflow-y: auto;
}

.smd-pane {
  flex: 100%;
  display: flex;  
  flex-direction: column;
  padding: 0;
  margin: 0;
}

.smd-body-split-panel {
  height: 100%;
}

.smd-pane-layout sl-split-panel::part(divider) {
  background-color: var(--sl-color-primary-50);
}
'
]

{ #category : #'web resources' }
SlmdPaneLayoutView class >> template [

	<webResource: #html>
	^ '
<div id="container" class="smd-pane-layout">
  <div id="smdOnePaneLayout">
    <div id="smdOnePaneLayoutX1" class="smd-pane">
      <slot name="pane1"></slot>
    </div>
    <div id="smdOnePaneLayoutX2" class="smd-pane">
      <slot name="pane2"></slot>
    </div>
  </div>
  <div id="smdTwoPaneLayout">
    <sl-split-panel
        id="smdBodySplitPanel" class="smd-body-split-panel"
        primary="start" style="--min: 300px; --divider-width: 24px;">
      <sl-icon slot="divider" name="grip-vertical"></sl-icon>
      <div slot="start">
        <div id="smdTwoPaneLayoutX1" class="smd-pane">
          <slot name="pane1P2"></slot>
        </div>
      </div>
      <div slot="end">
        <div id="smdTwoPaneLayoutX2" class="smd-pane">
          <slot name="pane2P2"></slot>
        </div>
      </div>
    </sl-split-panel>
  </div>
</div>
'
]

{ #category : #actions }
SlmdPaneLayoutView >> pane1WidthSet: anInteger [
	| split |

	split := self findByIdInShadowDom: 'smdBodySplitPanel'.
	split ifNotNil: [
		split attributeAt: 'position-in-pixels' put: anInteger printString ].

]

{ #category : #actions }
SlmdPaneLayoutView >> pane2Refresh [
	| paneContent |

	self traceCr: 'pane2Refresh'.
	paneContent := nil.
	paneContent ifNotNil: [ paneContent valueChanged ].

]

{ #category : #actions }
SlmdPaneLayoutView >> primaryPaneDisplay: aBoolean [

	self shadowElementId: 'smdOnePaneLayoutX1' show: aBoolean.
	self shadowElementId: 'smdTwoPaneLayoutX1' show: aBoolean.

]

{ #category : #actions }
SlmdPaneLayoutView >> primaryPaneOnly [

	self primaryPaneDisplay: true.
	self secondaryPaneDisplay: false.

]

{ #category : #actions }
SlmdPaneLayoutView >> secondaryPaneDisplay: aBoolean [

	self shadowElementId: 'smdOnePaneLayoutX2' show: aBoolean.
	self shadowElementId: 'smdTwoPaneLayoutX2' show: aBoolean.

]

{ #category : #actions }
SlmdPaneLayoutView >> secondaryPaneOnly [

	self primaryPaneDisplay: false.
	self secondaryPaneDisplay: true.

]

{ #category : #actions }
SlmdPaneLayoutView >> useOnePaneLayout [

	"self traceCr: 'View: useOnePaneLayout'."
	self shadowElementId: 'smdTwoPaneLayout' show: false.
	self shadowElementId: 'smdOnePaneLayout' show: true.
	self shadowElementId: 'smdOnePaneLayoutX1' show: true.
	self shadowElementId: 'smdOnePaneLayoutX2' show: false.

]

{ #category : #actions }
SlmdPaneLayoutView >> useTwoPaneLayout [

	"self traceCr: 'View: useTwoPaneLayout'."
	self shadowElementId: 'smdOnePaneLayout' show: false.
	self shadowElementId: 'smdTwoPaneLayout' show: true.

]
