Class {
	#name : #IonReorderGroup,
	#superclass : #IonElement,
	#category : #'CodeParadise-WebApplication-Ionic-Elements'
}

{ #category : #api }
IonReorderGroup >> complete [

	"Completes the reorder operation. Must be called by the 'ionItemReorder' event.  If a list of items is passed, the list will be reordered and returned in the proper order.  If no parameters are passed or if 'true' is passed in, the reorder will complete and the item will remain in the position it was dragged to. If 'false' is passed, the reorder will complete and the item will bounce back to its original position.
	@param listOrReorder A list of items to be sorted and returned in the new order or a boolean of whether or not the reorder should reposition the item.
	
	Type: (listOrReorder?: boolean | any[]) => Promise<any>"

	^ self apply: #complete resultAs: CpJavaScriptPromise
]

{ #category : #api }
IonReorderGroup >> complete: listOrReorder [

	"Completes the reorder operation. Must be called by the 'ionItemReorder' event.  If a list of items is passed, the list will be reordered and returned in the proper order.  If no parameters are passed or if 'true' is passed in, the reorder will complete and the item will remain in the position it was dragged to. If 'false' is passed, the reorder will complete and the item will bounce back to its original position.
	@param listOrReorder A list of items to be sorted and returned in the new order or a boolean of whether or not the reorder should reposition the item.
	
	Type: (listOrReorder?: boolean | any[]) => Promise<any>"

	^ self apply: #complete withArguments: { listOrReorder } resultAs: CpJavaScriptPromise
]

{ #category : #api }
IonReorderGroup >> disabled [

	"If 'true', the reorder will be hidden.
	
	Type: boolean"

	^ self propertyAt: #disabled
]

{ #category : #api }
IonReorderGroup >> disabled: aBoolean [

	"If 'true', the reorder will be hidden.
	
	Type: boolean"

	self propertyAt: #disabled put: aBoolean
]
