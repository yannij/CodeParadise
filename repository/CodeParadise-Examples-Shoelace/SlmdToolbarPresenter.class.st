Class {
	#name : #SlmdToolbarPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Base'
}

{ #category : #initialization }
SlmdToolbarPresenter >> actionGroupToUse [

	self subclassResponsibility
]

{ #category : #view }
SlmdToolbarPresenter >> actionItemFabOrNil [
	| list |

	list := self application actionItems.
	^ list detect: [ :each | each actionGroup = #fab ] ifNone: []
]

{ #category : #view }
SlmdToolbarPresenter >> actionItemsToUse [
	| list groupName |

	list := self application actionItems.
	groupName := self actionGroupToUse.
	^ list select: [ :each | each actionGroup = groupName ]
]

{ #category : #view }
SlmdToolbarPresenter >> viewCreated [

	super viewCreated.

	self subscribeToActionRequest.
	self subscribeToNavRequest.

]
