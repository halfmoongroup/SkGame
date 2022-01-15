Class {
	#name : #SkRow,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #HMGSokoban
}

{ #category : #'as yet unclassified' }
SkRow class >> rowFromString: aString [ 
	| instance | 
	instance := self new. 
	instance elements:  (aString asOrderedCollection collect: [ :aChar | SkEntity entityForId: aChar ]).
	^instance
]

{ #category : #'as yet unclassified' }
SkRow class >> rowFromString: aString forId: anIndex [
	| instance count | 
	count := 0.
	instance := self new. 
	instance elements:  (aString asOrderedCollection collect: [ :aChar | SkEntity entityForId: aChar atX: anIndex andY: (count := count+1)]).
	^instance
]

{ #category : #accessing }
SkRow >> elements [

	^ elements
]

{ #category : #accessing }
SkRow >> elements: anObject [

	elements := anObject
]

{ #category : #printing }
SkRow >> toString [

	^String newFrom: (self elements collect: [ :item | item instanceId ])
]
