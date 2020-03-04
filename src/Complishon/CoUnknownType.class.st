Class {
	#name : #CoUnknownType,
	#superclass : #Object,
	#category : #'Complishon-InitializeInferenceHeuristic'
}

{ #category : #comparing }
CoUnknownType >> = aType [

	^ aType isKindOf: CoUnknownType
]

{ #category : #comparing }
CoUnknownType >> hash [

	^ self class hash
]

{ #category : #accessing }
CoUnknownType >> instanceSide [
	
	^ self
]

{ #category : #lookup }
CoUnknownType >> lookupSelector: aString [ 
	
	^ nil
]