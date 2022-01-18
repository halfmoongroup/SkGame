Class {
	#name : #SkSpaceTest,
	#superclass : #TestCase,
	#category : #'HMGSokoban-test'
}

{ #category : #'as yet unclassified' }
SkSpaceTest >> testAcceptsPlayer [


	| space | 
	space := SkSpace initializeWithId: $# atX:1  andY:1. 
	self assert: space isWall. 
	self assert: space acceptsEntity equals: false. 
	
	space := SkSpace initializeWithId:  $.  atX:1  andY:1. 
	self assert: space isTarget.
	self assert: space acceptsEntity.
	
	space := SkSpace initializeWithId:  $o  atX:1  andY:1. 
	self assert: space class equals: SkSpace.
	self assert: space entity class equals: SkPlayer.
	self assert: space hasPlayer equals: true.
	self assert: space acceptsEntity equals: false. 
	space entity: nil. 
	self assert: space id equals: Character space. 
	
	space := SkSpace initializeWithId:  Character space  atX:1  andY:1. 
	self assert: space isSpace.
	self assert: space acceptsEntity.
]
