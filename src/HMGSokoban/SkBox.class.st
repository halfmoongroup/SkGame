Class {
	#name : #SkBox,
	#superclass : #SkEntity,
	#category : #HMGSokoban
}

{ #category : #identity }
SkBox class >> idString [

	^ $x.
	
]

{ #category : #testing }
SkBox >> isBox [ 

	^ true
]
