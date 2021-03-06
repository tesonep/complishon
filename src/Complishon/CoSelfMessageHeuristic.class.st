"
I implement an heuristic for self message sends.
I provide a fetcher for messages for the hierarchy of self class.

See my superclass for details.
"
Class {
	#name : #CoSelfMessageHeuristic,
	#superclass : #CoASTNodeFetcherHeuristic,
	#category : #'Complishon-Heuristics'
}

{ #category : #requests }
CoSelfMessageHeuristic >> appliesForNode: aNode inContext: aContext [

	^ aNode receiver isSelf
]

{ #category : #requests }
CoSelfMessageHeuristic >> buildFetcherFor: aNode inContext: complishonContext [
	| completionClass |
	
	"When in the playground, the complishon class is not available.
	But self is bound to nil"
	completionClass := complishonContext complishonClass ifNil: [ nil class ].
	^ self newMessageInHierarchyFetcherForClass: completionClass
]
