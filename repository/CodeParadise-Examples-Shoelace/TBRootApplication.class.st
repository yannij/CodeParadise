Class {
	#name : #TBRootApplication,
	#superclass : #SlmdWebApplication,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #accessing }
TBRootApplication class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { SlElement package }
]

{ #category : #accessing }
TBRootApplication class >> app [
	"self register"

	^ #'tinyblog'
]

{ #category : #accessing }
TBRootApplication class >> appName [
	"Answer name to be shown in AppBar headline"

	^ #'Tiny Blog'
]

{ #category : #accessing }
TBRootApplication >> applicationPresenterClass [

	^ TBRootPresenter
]

{ #category : #initialization }
TBRootApplication >> initialize [
	| pane1Model pane2Model pane1Content |

	super initialize.

	pane1Content := SlmdListDetailModel new.
	pane1Content listSet: TBBlogModel current allBlogPosts.
	pane1Model := SlmdPaneModel id: 'smdPane1Content' content: 'Initial content 1'.
	pane1Model paneContent: pane1Content.
	pane2Model := SlmdPaneModel id: 'smdPane2Content' content: 'Initial content 2'.
	pane2Model appBarModel beSecondary.
	sidesheetModel := SlmdSidesheetModel new.
	layout := SlmdResponsiveLayoutModel new.
	layout paneLayout pane1: pane1Model.
	layout paneLayout pane2: pane2Model.
	layout layoutSettings colorThemeName: #cyan; fontFamily: #'var(--sl-font-serif)'.
	navActions := OrderedCollection new
		add: (SlmdNavAction id: #settings iconName: 'gear' iconLabel: 'Settings' arg1: 'Settings');
		add: (SlmdNavAction id: #home iconName: 'house' iconLabel: 'Home' arg1: 'Home Page');
		yourself.
	actionItems := OrderedCollection new
		add: (SlmdNavAction id: #refresh iconName: 'arrow-clockwise' iconLabel: 'Refresh' actionName: #action actionGroup: #primary arg1: 'pane');
		add: (SlmdNavAction id: #crudRead iconName: 'file-ruled' iconLabel: 'View' actionName: #action actionGroup: #secondary arg1: 'read');
		add: (SlmdNavAction id: #crudDelete iconName: 'trash' iconLabel: 'Delete' actionName: #action actionGroup: #secondary arg1: 'delete');
		add: (SlmdNavAction id: #crudUpdate iconName: 'pencil' iconLabel: 'Edit' actionName: #action actionGroup: #secondary arg1: 'update');
		add: (SlmdNavAction id: #crudSave iconName: 'check-lg' iconLabel: 'Save' actionName: #action actionGroup: #secondary arg1: 'save');
		add: (SlmdNavAction id: #crudCreate iconName: 'plus-lg' iconLabel: 'Add' actionName: #action actionGroup: #secondary arg1: 'create');
		yourself.
	self setDetailWithIndex: 1.

]

{ #category : #accessing }
TBRootApplication >> setDetailWithIndex: index [
	| list detail |

	list := self pane1Model paneContent list.
	detail := list at: index.
	"detail := list at: (list size atRandom \\ list size) + 1."

	self pane1Model paneContent detail: detail.
	self pane2Model paneContent: detail.

]
