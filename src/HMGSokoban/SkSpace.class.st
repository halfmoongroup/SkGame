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
	| instance  |
	instance := self  new. 
	^ instance initializeWithId: anId andX: xpos  andY: ypos  
]

{ #category : #accessing }
SkSpace >> acceptsEntity [

	^ (self isWall not) & (self entity isNil).
]

{ #category : #testing }
SkSpace >> canMove [ 
	^ (self isWall not) & (self entity isNil)
	
]

{ #category : #accessing }
SkSpace >> entity [

	^ entity
]

{ #category : #accessing }
SkSpace >> entity: anObject [

	entity := anObject.
	anObject ifNotNil: [anObject position: self].
	^self
]

{ #category : #testing }
SkSpace >> hasPlayer [

	^ (self entity isNotNil) & ( self entity class = SkPlayer )
]

{ #category : #accessing }
SkSpace >> id [

	entity ifNotNil: [ ^entity id].
	^id
]

{ #category : #accessing }
SkSpace >> id: anObject [

	id := anObject
]

{ #category : #accessing }
SkSpace >> initializeWithId: anId andX: xvalue andY: yvalue [

	self
		id: anId;
		x: xvalue;
		y: yvalue.
	SkPlayer idString = anId ifTrue: [ 
		self id: Character space.
		^ self
			  entity: SkPlayer new;
			  yourself ].
	SkBox idString = anId ifFalse: [ ^ self ].
	self id: Character space.
	^ self
		  entity: SkBox new;
		  yourself
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
