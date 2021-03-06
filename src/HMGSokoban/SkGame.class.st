Class {
	#name : #SkGame,
	#superclass : #Object,
	#instVars : [
		'rows',
		'playerEntity'
	],
	#category : #HMGSokoban
}

{ #category : #creating }
SkGame class >> createLevel: aLevel [

	| count newRows instance |
	instance := self new.
	count := 0.
	newRows := OrderedCollection new.
	(aLevel findTokens: Character cr) do: [ :line | 
		line isNotEmpty ifTrue: [ 
			newRows add:
				(SkRow rowFromString: line forId: (count := count + 1)) ] ].
	instance rows: newRows.
	self findPlayer: instance.
	^ instance
]

{ #category : #creating }
SkGame class >> findPlayer: instance [

	instance rows do: [ :row | 
		row elements do: [ :position | 
			position entity isNotNil & (position entity class = SkPlayer) 
				ifTrue: [ instance playerEntity: position entity ] ] ].
	^ instance playerEntity
]

{ #category : #api }
SkGame >> display [


	rows do: [ :row | Transcript show: row toString; cr.  ]
]

{ #category : #'as yet unclassified' }
SkGame >> entityAtX: x andY:y [

	(x <= rows size) ifTrue: [ 
		(y <= ((rows at: x) elements size)) ifTrue: [^(rows at: x) elements at: y]].
	^nil
	
]

{ #category : #accessing }
SkGame >> move: aDirection [

	| newPosition |
	newPosition :=  self moveInDirection:  aDirection. 
	 
	aDirection = 'l' ifTrue: [ self movePlayerLeft ].
	aDirection = 'r' ifTrue: [ self movePlayerRight ].
	aDirection = 'u' ifTrue: [ self movePlayerUp ].
	aDirection = 'd' ifTrue: [ self movePlayerDown ].
	self display
]

{ #category : #accessing }
SkGame >> moveInDirection: direction [
	|position |
	position := self playerEntity position. 
	( direction = 'u' ) ifTrue: [ ^ Point x: (1 + position x) y: (position y)].
	( direction = 'd' ) ifTrue: [ ^ Point x: (position x)- 1  y: (position y)].
	( direction = 'l' ) ifTrue: [ ^ Point x: (position x)     y: (1+position y)].
	( direction = 'r' ) ifTrue: [ ^ Point x: (position x)     y: (position y)-1].
	^(-1 @ -1)
]

{ #category : #accessing }
SkGame >> movePlayerDown [

	| newPosition |
	newPosition := SkGame
		               move: self playerEntity position
		               inDirection: 'd'.
	(self playerCanMoveNewX: newPosition x newY: newPosition y) ifTrue: [ 
		self movePlayerX: newPosition x Y: newPosition y ]
	ifFalse: [  ].
	self display
]

{ #category : #'as yet unclassified' }
SkGame >> movePlayerLeft [ 

	| newx newy |
	newx := self playerEntity position x .
	newy := self playerEntity position y - 1. 
	(self playerCanMoveNewX:newx newY:newy) ifTrue:[ self movePlayerX: newx Y:newy].
	self display
]

{ #category : #accessing }
SkGame >> movePlayerRight [

	| newx newy |
	newx := self playerEntity position x  .
	newy := self playerEntity position y +1. 
	(self playerCanMoveNewX:newx newY:newy) ifTrue:[ self movePlayerX: newx Y:newy].
	self display
]

{ #category : #accessing }
SkGame >> movePlayerUp [

	| newx newy |
	newx := self playerEntity position x - 1 .
	newy := self playerEntity position y. 
	(self playerCanMoveNewX:newx newY:newy) ifTrue:[ self movePlayerX: newx Y:newy].
	self display
]

{ #category : #accessing }
SkGame >> movePlayerX: newX Y: newY [

	| src dest |
	(self playerCanMoveNewX: newX newY: newY) ifTrue: [ 
		src := self playerEntity position.
		dest := self entityAtX: newX andY: newY.
		dest entity: self playerEntity.
		src entity: nil ]
	ifFalse: [
		(self playerCanPushNewX:newX newY:newY ) ifTrue: [
			]
	].
	^ src
]

{ #category : #'as yet unclassified' }
SkGame >> playerCanMoveNewX: aPoint [

	^ (self entityAtX: aPoint x andY: aPoint y) canMove
]

{ #category : #'as yet unclassified' }
SkGame >> playerCanMoveNewX: x newY: y [

	^ (self entityAtX: x andY:y) canMove
]

{ #category : #accessing }
SkGame >> playerEntity [

	^ playerEntity
]

{ #category : #accessing }
SkGame >> playerEntity: anObject [

	playerEntity := anObject
]

{ #category : #'as yet unclassified' }
SkGame >> put: entity atX: x andY: y [
	| temp | 
	
	entity x: x; y: y.	
	temp := (rows at: x) elements at: y. 
	(rows at: x) elements at: y put: entity.
	^temp
]

{ #category : #accessing }
SkGame >> rows [

	^ rows
]

{ #category : #accessing }
SkGame >> rows: anObject [

	rows := anObject
]
