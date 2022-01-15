Class {
	#name : #SkPlayer,
	#superclass : #SkEntity,
	#category : #HMGSokoban
}

{ #category : #'as yet unclassified' }
SkPlayer class >> idString [

	^ $o.
	
]

{ #category : #testing }
SkPlayer >> canMove [
	^true
]
