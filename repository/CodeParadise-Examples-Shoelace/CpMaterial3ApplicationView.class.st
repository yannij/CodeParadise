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
--sl-color-primary-50: rgb(254 248 246);
--sl-color-primary-100: rgb(251 233 224);
--sl-color-primary-200: rgb(248 215 200);
--sl-color-primary-300: rgb(245 196 173);
--sl-color-primary-400: rgb(241 169 137);
--sl-color-primary-500: rgb(235 133 86);
--sl-color-primary-600: rgb(198 107 66);
--sl-color-primary-700: rgb(162 88 54);
--sl-color-primary-800: rgb(134 73 45);
--sl-color-primary-900: rgb(95 52 32);
--sl-color-primary-950: rgb(59 32 20);
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
