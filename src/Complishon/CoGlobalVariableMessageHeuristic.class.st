"
I implement an heuristic for messages sent to globals.
If the global object is available in the environment, 
 - if it is a class complete messages in it class side
 - if it is a global object complete messages in the global object's class

See my superclass for details.
"
Class {
	#name : #CoGlobalVariableMessageHeuristic,
	#superclass : #CoVariableMessageHeuristic,
	#category : #'Complishon-Heuristics'
}

{ #category : #requests }
CoGlobalVariableMessageHeuristic >> buildFetcherFor: aRBMessageNode inContext: complishonContext [

	complishonContext
		environmentAt: aRBMessageNode receiver name
		ifPresent: [ :global | ^ self newFetcherForGlobal: global ].

	^ self next fetcherFor: aRBMessageNode inContext: complishonContext
]

{ #category : #requests }
CoGlobalVariableMessageHeuristic >> newFetcherForGlobal: aGlobal [

	"This is a class or trait. Autocomplete class-side messages" 
	aGlobal isClassOrTrait ifTrue: [
		^ ClassImplementedMessagesComplishonFetcher new
			completionClass: aGlobal classSide;
			forHierarchy ].

	"This is not a class binding but a global object. Autocomplete based on its class"
	^ ClassImplementedMessagesComplishonFetcher new
		completionClass: aGlobal class;
		forHierarchy
]