Class {
	#name : #SlmdLayoutSettingsPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #view }
SlmdLayoutSettingsPresenter >> viewInitialized [
	| props |

	super viewInitialized.

	props := self model asProperties.
	self view
		modalDivSetUp: props;
		adaptToLayoutProperties: props;
		layoutInitialSetUp: self model asProperties.

]
