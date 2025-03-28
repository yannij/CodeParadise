Class {
	#name : #CpMaterial3ApplicationView,
	#superclass : #CpView,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #'web resources' }
CpMaterial3ApplicationView class >> globalStyle [

	<webResource: #css>

	^ '
body {
  margin: 0;
  padding: 0;
}
'
]

{ #category : #'web resources' }
CpMaterial3ApplicationView class >> style [

	<webResource: #css>

	^ '
:root,
:host,
.sl-theme-light {
--sl-color-primary-50: var(--sl-color-teal-50);
--sl-color-primary-100: var(--sl-color-teal-100);
--sl-color-primary-200: var(--sl-color-teal-200);
--sl-color-primary-300: var(--sl-color-teal-300);
--sl-color-primary-400: var(--sl-color-teal-400);
--sl-color-primary-500: var(--sl-color-teal-500);
--sl-color-primary-600: var(--sl-color-teal-600);
--sl-color-primary-700: var(--sl-color-teal-700);
--sl-color-primary-800: var(--sl-color-teal-800);
--sl-color-primary-900: var(--sl-color-teal-900);
--sl-color-primary-950: var(--sl-color-teal-950);
}
'
]

{ #category : #'web resources' }
CpMaterial3ApplicationView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <slot name="layout"></slot>
</div>
'
]
