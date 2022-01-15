Class {
	#name : #SkSpace,
	#superclass : #SkEntity,
	#category : #HMGSokoban
}

{ #category : #'as yet unclassified' }
SkSpace class >> idString [

	^ $ .
]

{ #category : #testing }
SkSpace >> canMove [ 
	^true
]
