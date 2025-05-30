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

	super initialize.

	pane1Model := SlmdListDetailModel new.
	pane1Model listSet: TBBlogModel current allBlogPosts.
	sidesheetModel := SlmdSidesheetModel new.
	self setDetailWithIndex: 1.
	layout := SlmdLayoutModel new.
	layout layoutSettings colorThemeName: #cyan; fontFamily: #'var(--sl-font-serif)'.
	navActions := OrderedCollection new
		add: (SlmdNavAction id: #settings iconName: 'gear' iconLabel: 'Settings' arg1: 'Settings');
		add: (SlmdNavAction id: #home iconName: 'house' iconLabel: 'Home' arg1: 'Home Page');
		yourself.

]

{ #category : #accessing }
TBRootApplication >> setDetailWithIndex: index [
	| list detail |

	list := self pane1Model list.
	detail := list at: index.
	"detail := list at: (list size atRandom \\ list size) + 1."

	self pane1Model detail: detail.
	self pane2Model: detail.

]
