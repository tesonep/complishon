Class {
	#name : #SystemComplishonContext,
	#superclass : #Object,
	#instVars : [
		'engine',
		'complishonContext',
		'source',
		'position',
		'complishon',
		'complishonBuilder'
	],
	#category : #'Complishon-SystemIntegration'
}

{ #category : #'initialize-release' }
SystemComplishonContext class >> engine: aCompletionEngine class: aClass source: aString position: anInteger [

	^ self new
		complishonContext: (ComplishonContext new
			complishonClass: aClass;
			complishonEnvironment: ComplishonSystemEnvironment new;
			yourself);
		engine: aCompletionEngine;
		source: aString;
		yourself
]

{ #category : #activating }
SystemComplishonContext >> activateEntryAt: anIndex [

	(self entries at: anIndex) activateOn: self
]

{ #category : #accessing }
SystemComplishonContext >> completionAt: aNumber [
	| entry |
	
	entry := (self entries at: aNumber) contents asSymbol separateKeywords.
	^ NECPreferences spaceAfterCompletion 
		ifTrue: [ entry, ' ' ]
		ifFalse: [ entry ]
]

{ #category : #accessing }
SystemComplishonContext >> completionToken [

	^ self complishon completionToken
]

{ #category : #testing }
SystemComplishonContext >> complishon [

	complishon ifNotNil: [ ^ complishon ].
	^ complishon := complishonBuilder buildComplishon
]

{ #category : #accessing }
SystemComplishonContext >> complishonClass [
	
	^ complishonContext complishonClass
]

{ #category : #accessing }
SystemComplishonContext >> complishonContext [
	^ complishonContext
]

{ #category : #accessing }
SystemComplishonContext >> complishonContext: anObject [
	complishonContext := anObject
]

{ #category : #accessing }
SystemComplishonContext >> complishonEnvironment [
	
	^ complishonContext complishonEnvironment
]

{ #category : #accessing }
SystemComplishonContext >> engine [
	^ engine
]

{ #category : #accessing }
SystemComplishonContext >> engine: anObject [
	engine := anObject
]

{ #category : #accessing }
SystemComplishonContext >> entries [

	^ (self complishon first: 20) collect: [ :e | NECInstVarEntry contents: e node: nil ]
]

{ #category : #accessing }
SystemComplishonContext >> entryCount [
	^ self entries size
]

{ #category : #accessing }
SystemComplishonContext >> environmentAt: aString ifPresent: aBlockClosure [ 
	
	^ complishonContext environmentAt: aString ifPresent: aBlockClosure
]

{ #category : #testing }
SystemComplishonContext >> hasEntries [

	^ self complishon notEmpty
]

{ #category : #menu }
SystemComplishonContext >> hasMessage [
	
	^ false
]

{ #category : #initialization }
SystemComplishonContext >> initialize [

	super initialize.
	complishonBuilder := ComplishonASTHeuristicsBuilder initializeOnContext: self
]

{ #category : #testing }
SystemComplishonContext >> isWorkspace [
	
	^ engine notNil and: [ engine isScripting ]
]

{ #category : #narrowing }
SystemComplishonContext >> narrowWith: aString [ 
	
	self complishon filterWithString: aString
]

{ #category : #accessing }
SystemComplishonContext >> position [
	^ engine position
]

{ #category : #accessing }
SystemComplishonContext >> position: anObject [
	position := anObject
]

{ #category : #replacing }
SystemComplishonContext >> replaceTokenInEditorWith: aString [
	
	engine replaceTokenInEditorWith: aString
]

{ #category : #accessing }
SystemComplishonContext >> source [
	^ source
]

{ #category : #accessing }
SystemComplishonContext >> source: anObject [
	source := anObject
]

{ #category : #accessing }
SystemComplishonContext >> title [

	^ ''
]