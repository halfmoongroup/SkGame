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

	aDirection = 'l' ifTrue: [ self movePlayerLeft ].
	aDirection = 'r' ifTrue: [ self movePlayerRight ].
	aDirection = 'u' ifTrue: [ self movePlayerUp ].
	aDirection = 'd' ifTrue: [ self movePlayerDown ].
	self display
]

{ #category : #accessing }
SkGame >> movePlayerDown [

	| newx newy |
	newx := self playerEntity position x + 1 .
	newy := self playerEntity position y. 
	(self playerCanMoveNewX:newx newY:newy) ifTrue:[ self movePlayerX: newx Y:newy].
	self display
]

{ #category : #accessing }
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
	(self playerCanMoveNewX: newX newY: newY) ifFalse: [ ^ self ].
	src := self playerEntity position. 
	dest := self entityAtX: newX andY: newY.
	dest entity: (self playerEntity) .
	src entity: nil. 
	^src
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
