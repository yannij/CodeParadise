Class {
	#name : #CpMaterial3LayoutPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #rendering }
CpMaterial3LayoutPresenter >> renderView [

	self setTopAppBar.
	self setBottomAppBar.

	self view
		"pane2Hidden: true;"
		renderLeftDrawer;
		renderNav;
		renderTopAppBar;
		renderBottomeAppBar;
		renderPage.

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
		headline: 'Responsive App';
		leadingAction: 'Start';
		trailingActions: { '1-square'. '2-square' . '3-square'. '4-square' }.

]
