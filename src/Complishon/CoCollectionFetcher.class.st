"
I'm a fetcher simply enumerating a collection of items defined using the collection: message.
Mainly used for testing.
"
Class {
	#name : #CoCollectionFetcher,
	#superclass : #CoFetcher,
	#instVars : [
		'collection'
	],
	#category : #'Complishon-Core'
}

{ #category : #'instance creation' }
CoCollectionFetcher class >> onCollection: aCollection [ 
	
	^ self new
		collection: aCollection;
		yourself
]

{ #category : #accessing }
CoCollectionFetcher >> collection: aCollection [ 
	collection := aCollection
]

{ #category : #accessing }
CoCollectionFetcher >> entriesDo: aBlock [

	collection do: aBlock
]
