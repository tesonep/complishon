Class {
	#name : #CoHierarchyClassVariableFetcherTest,
	#superclass : #CoClassVariableFetcherTest,
	#category : #'Complishon-Tests'
}

{ #category : #tests }
CoHierarchyClassVariableFetcherTest >> setUp [

	super setUp.
	fetcher := CoClassVariableFetcher new
		completionClass: self completionClass;
		forHierarchy.
	expectedElements := { 
		NECClassVarEntry contents: 'Ca' node: nil. 
		NECClassVarEntry contents: 'Cb' node: nil.
		NECClassVarEntry contents: 'Cc' node: nil.
		NECClassVarEntry contents: 'SuperCa' node: nil. 
		NECClassVarEntry contents: 'SuperCb' node: nil.
		NECClassVarEntry contents: 'SuperCc' node: nil.}
]
