"
I build a resultset with all possible candidates for an AST node, pre-sorted with a sorter.
"
Class {
	#name : #CoGlobalSorterResultSetBuilder,
	#superclass : #CoASTResultSetBuilder,
	#instVars : [
		'sorterClass'
	],
	#category : #'Complishon-SystemIntegration'
}

{ #category : #visiting }
CoGlobalSorterResultSetBuilder >> parseNode [

	| node |
	node := super parseNode.
	node methodNode doSemanticAnalysis.
	TypingVisitor new visitNode: node methodNode.
	^ node
]

{ #category : #accessing }
CoGlobalSorterResultSetBuilder >> sorterClass [
	
	^ sorterClass ifNil: [ complishonContext class sorterClass ]
]

{ #category : #accessing }
CoGlobalSorterResultSetBuilder >> sorterClass: anObject [
	sorterClass := anObject
]

{ #category : #visiting }
CoGlobalSorterResultSetBuilder >> visitNode: aNode [

	| fetcher entries sorter |
	entries := aNode completionEntries: complishonContext position.
	sorter := self sorterClass new context: complishonContext.
	entries := sorter sortCompletionList: entries asOrderedCollection.

	fetcher := (CoCollectionFetcher onCollection: entries).

	^ self
		configureFetcher: fetcher
		forNode: aNode
		narrowingWith: (aNode completionToken: complishonContext position)
]
