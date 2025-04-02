Class {
	#name : #CpMaterial3LayoutPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #view }
CpMaterial3LayoutPresenter >> layoutSetUp [

	self navSetUp.
	self setTopAppBar.
	self setBottomAppBar.

]

{ #category : #rendering }
CpMaterial3LayoutPresenter >> navSetUp [
	| v |

	v := self view.
	self application navActions do: [ :eachNavAction |
		eachNavAction asDictionary keysAndValuesDo: [ :key :value |
			v addNavActionId: eachNavAction id key: key value: value ].
		v addNavItem: eachNavAction id ]
]

{ #category : #rendering }
CpMaterial3LayoutPresenter >> setBottomAppBar [

	self view
		iconButtons: {'1-circle'. '2-circle' . '3-circle'. '4-circle'};
		fab: 'plus'.

]

{ #category : #rendering }
CpMaterial3LayoutPresenter >> setTopAppBar [

	self view
		headline: self application class appName;
		trailingActions: { '1-square'. '2-square' . '3-square'. '4-square' }.

]

{ #category : #view }
CpMaterial3LayoutPresenter >> viewInitialized [

	self layoutSetUp.
	self view layoutSetUp.
]
