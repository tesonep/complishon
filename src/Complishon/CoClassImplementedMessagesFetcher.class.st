"
I am a fetcher looking for the messages implemented in a class.
"
Class {
	#name : #CoClassImplementedMessagesFetcher,
	#superclass : #CoClassBasedFetcher,
	#category : #'Complishon-Fetchers'
}

{ #category : #accessing }
CoClassImplementedMessagesFetcher >> entriesDo: aBlock [
	
	self completionClass selectorsDo: [ :e | 
		aBlock value: (NECSelectorEntry contents: e node: self)]
]
