Class {
	#name : #SlmdObjectModel,
	#superclass : #SlmdModel,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #rendering }
SlmdObjectModel >> handleDelete: anObject [

	"self logTrace: anObject printString method: 'handleDelete:'."
	self traceCr: anObject printString.
	^ self.

]

{ #category : #rendering }
SlmdObjectModel >> handleSave: anObject [
	| changes |

	self traceCr: anObject printString.

	changes := anObject parameters at: #changes.
	self applyChanges: changes.

]
