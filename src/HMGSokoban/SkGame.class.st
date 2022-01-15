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
		row elements do: [ :entity | 
			entity class = SkPlayer ifTrue: [ instance playerEntity: entity ] ] ]
]

{ #category : #accessing }
SkGame >> move: aDirection [

	(aDirection = 'l') ifTrue: [ self movePlayerLeft ].
]

{ #category : #accessing }
SkGame >> movePlayerLeft [ 

	| newx newy |
	newx := self playerEntity x - 1.
	newy := self playerEntity y. 
	(self playerCanMoveNewX:newx newY:newy) ifTrue:[ self movePlayerX: newx Y:newy].
]

{ #category : #'as yet unclassified' }
SkGame >> movePlayerX: x Y: y [
]

{ #category : #'as yet unclassified' }
SkGame >> playerCanMoveNewX: x newY: y [
]

{ #category : #accessing }
SkGame >> playerEntity [

	^ playerEntity
]

{ #category : #accessing }
SkGame >> playerEntity: anObject [

	playerEntity := anObject
]

{ #category : #accessing }
SkGame >> rows [

	^ rows
]

{ #category : #accessing }
SkGame >> rows: anObject [

	rows := anObject
]
