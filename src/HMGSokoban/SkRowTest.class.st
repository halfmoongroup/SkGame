Class {
	#name : #SkRowTest,
	#superclass : #TestCase,
	#category : #'HMGSokoban-test'
}

{ #category : #'as yet unclassified' }
SkRowTest >> testCreateRow [

	| row |
	row := SkRow rowFromString: '#' forId:1. 
	self assert: (row elements at: 1) isWall equals: true. 
	
	row := SkRow rowFromString: '# ' forId:1. 
	self assert: (row elements at: 2) isSpace equals: true. 
	self assert: (row elements size) equals: 2. 
	
	row := SkRow rowFromString: '# .' forId:1. 
	self assert: (row elements at: 3) isTarget equals: true. 
	self assert: (row elements size) equals:3. 
	
	row := SkRow rowFromString: '# o .' forId:1. 
	self assert: (row elements at: 5) isTarget equals: true. 
	self assert: (row elements size) equals:5. 
	
	self assert: (row elements at: 3) entity class equals: SkPlayer.
	self assert: (row elements at: 3) entity position x equals: 1. 
	self assert: (row elements at: 3) entity position y equals: 3. 
		
]

{ #category : #tests }
SkRowTest >> testToString [

	| row  rowStr level|
	level := '# .'. 
	row := SkRow rowFromString: level forId: 1.
	rowStr :=  row toString.
	self assert: rowStr equals:level
]
