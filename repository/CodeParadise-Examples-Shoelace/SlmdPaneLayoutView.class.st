Class {
	#name : #SlmdPaneLayoutView,
	#superclass : #SlmdView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'web resources' }
SlmdPaneLayoutView class >> style [

	<webResource: #css>

	^ '
.smd-pane-layout {
  overflow-y: auto;
}

.smd-pane {
  flex: 100%;
  display: flex;  
  flex-direction: column;
  padding: 8px;
  margin: 0;
  text-align: left;
  overflow-x: auto;
  overflow-y: auto;
}

.smd-body-split-panel {
  height: 100%;
}

.smd-pane-layout sl-split-panel::part(divider) {
  background-color: var(--sl-color-primary-50);
}
'
]

{ #category : #topAppBar }
SlmdPaneLayoutView >> topAppBarDisplay: aBoolean [
	| element |

	element := self findByIdInShadowDom: 'smdTopAppBar' ifNone: [ nil ].
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]
