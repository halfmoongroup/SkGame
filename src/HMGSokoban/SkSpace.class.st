Class {
	#name : #SkSpace,
	#superclass : #Object,
	#instVars : [
		'id',
		'x',
		'y',
		'entity'
	],
	#category : #HMGSokoban
}

{ #category : #'as yet unclassified' }
SkSpace class >> ids [

	^ Set newFrom: #($ $. $# $x)
]

{ #category : #initialization }
SkSpace class >> initializeWithId: anId atX: xpos andY: ypos [
	| instance |
	instance := self  new. 
	^ instance initializeWithId: anId andX: xpos  andY: ypos.  
]

{ #category : #accessing }
SkSpace >> acceptsEntity [

	^ self isWall = false.
]

{ #category : #accessing }
SkSpace >> entity [

	^ entity
]

{ #category : #accessing }
SkSpace >> entity: anObject [

	entity := anObject
]

{ #category : #accessing }
SkSpace >> id [

	^ id
]

{ #category : #accessing }
SkSpace >> id: anObject [

	id := anObject
]

{ #category : #initialization }
SkSpace >> initializeWithId: anId andX: xvalue andY: yvalue [

	self id: anId; x: xvalue; y: yvalue. 
	($+ = id ) ifTrue: [ ^self entity: (SkPlayer new);yourself].
	($X = id ) ifTrue: [ ^self entity: (SkBox new);yourself]
]

{ #category : #testing }
SkSpace >> isSpace [ 
	
	^id = Character space. 
]

{ #category : #testing }
SkSpace >> isTarget [

	^id = $..
]

{ #category : #testing }
SkSpace >> isWall [

	^id = $#
]

{ #category : #accessing }
SkSpace >> x [

	^ x
]

{ #category : #accessing }
SkSpace >> x: anObject [

	x := anObject
]

{ #category : #accessing }
SkSpace >> y [

	^ y
]

{ #category : #accessing }
SkSpace >> y: anObject [

	y := anObject
]
