Class {
	#name : #SlmdFloatingToolbarView,
	#superclass : #SlmdToolbarView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'web resources' }
SlmdFloatingToolbarView class >> globalStyle [

	<webResource: #css>

	^ '
.smd-toolbar-item {
  padding: 8px 0;
  height: 48px;
  width: 48px;
}

.smd-toolbar-icon {
  font-size: 32px;
}
'
]

{ #category : #'web resources' }
SlmdFloatingToolbarView class >> style [

	<webResource: #css>

	^ '
.smd-toolbar {
  z-index: 10;
  display: flex;
  flex-flow: row wrap;

  position: fixed;
  left: 50%; transform: translate(-50%, 0);
  bottom: 16px;
}

.smd-toolbar-buttons {
  display: flex;
  flex-flow: row wrap;
  gap: 4px;
  padding: 0 8px;
  border-radius: 32px;
  height: 64px;
  background: var(--sl-color-primary-300);
}

.smd-toolbar-fab {
  margin-left: 8px;
  padding: 8px;
  height: 48px;
  width: 48px;
  border-radius: 16px;
  background: var(--sl-color-primary-400);
}
'
]

{ #category : #'web resources' }
SlmdFloatingToolbarView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div class="smd-toolbar">
    <div class="smd-toolbar-buttons">
      <slot name="toolbar"></slot>
    </div>
    <div class="smd-toolbar-fab">
      <slot name="fab"></slot>
    </div>
  </div>
</div>
'
]
