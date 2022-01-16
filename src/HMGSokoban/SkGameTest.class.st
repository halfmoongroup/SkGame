Class {
	#name : #SkGameTest,
	#superclass : #TestCase,
	#category : #HMGSokoban
}

{ #category : #tests }
SkGameTest >> testCreateLevel [ 

	| level levelA levelB game displayStr |
	levelA := '#####'.
	levelB  := '# o #'.
	game := SkGame createLevel: levelB. 
	displayStr := (game rows at: 1) toString.
	self assert: levelB equals: displayStr. 
	                                           
	level := '#####',(String with: Character cr) , levelA,(String with: Character cr),  '#####'..
	game := SkGame createLevel: level. 
	displayStr := (game rows at: 1) toString.
	self assert: levelA equals: displayStr. 

]

{ #category : #'as yet unclassified' }
SkGameTest >> testEntityAtXandY [

	|  levelB game entity |
	levelB  := '# o #'.
	game := SkGame createLevel: levelB. 
	entity := game entityAtX: 1 andY:1.
	self assert: entity class equals: SkSpace. 
	
	entity := game entityAtX: 7 andY:5.
	self assert: entity isNil.  

]

{ #category : #tests }
SkGameTest >> testFindPlayer [

	| levelB game result |
	levelB := '# o #'.
	game := SkGame createLevel: levelB.
	result := SkGame findPlayer: game. 
	self assert: result class equals: SkPlayer.
	self assert: result position  x equals: 1.
	self assert: result position y equals: 3.
]

{ #category : #tests }
SkGameTest >> testMovePlayerXY [

	| levelB game position |
	levelB := '# o #'.
	game := SkGame createLevel: levelB.
	SkGame findPlayer: game. 
	self assert: game playerEntity position x equals: 1.
	self assert: game playerEntity position y equals: 3.
	game movePlayerX: 1 Y: 2.
	self assert: game playerEntity position x equals: 1.
	self assert: game playerEntity position y equals: 2.
	
	self assert: (game entityAtX: 1 andY: 3) entity equals: nil. 
	self assert: (game entityAtX: 1 andY: 2) entity equals: game playerEntity . 

]

{ #category : #tests }
SkGameTest >> testPlayerCanMoveNewXnewY [

	| levelB game result |
	levelB := '# o #'.
	game := SkGame createLevel: levelB.
	result := game playerCanMoveNewX: 1 newY: 1.
	self assert: result equals: false
]
