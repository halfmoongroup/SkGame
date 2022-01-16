"
I am an abstract class representing all the pieces of the sokoban game.
"
Class {
	#name : #SkEntity,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'target'
	],
	#category : #HMGSokoban
}

{ #category : #'as yet unclassified' }
SkEntity class >> entityForId: anId [

	self subclassesDo: [ :subclass | anId = subclass idString ifTrue: [ ^subclass new] ].
	^nil
]

{ #category : #creating }
SkEntity class >> entityForId: anId atX: xpos andY: ypos [
	|instance | 
	self subclassesDo: [ :subclass | anId = subclass idString ifTrue: [ instance := subclass new.
			instance x:xpos; y: ypos] ].
	^instance
]

{ #category : #identity }
SkEntity class >> idString [

	^ self subclassResponsibility 
	
]

{ #category : #testing }
SkEntity >> canMove [ 
	^false.
]

{ #category : #initialization }
SkEntity >> initialize [ 
	target := false. 
]

{ #category : #identity }
SkEntity >> instanceId [

	^ self class idString
]

{ #category : #accessing }
SkEntity >> target [

	^ target
]

{ #category : #accessing }
SkEntity >> target: anObject [

	target := anObject
]

{ #category : #accessing }
SkEntity >> x [

	^ x
]

{ #category : #accessing }
SkEntity >> x: anObject [

	x := anObject
]

{ #category : #accessing }
SkEntity >> y [

	^ y
]

{ #category : #accessing }
SkEntity >> y: anObject [

	y := anObject
]
