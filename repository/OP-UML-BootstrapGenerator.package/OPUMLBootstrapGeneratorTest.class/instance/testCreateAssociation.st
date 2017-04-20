tests
testCreateAssociation
	| association element comment |
	association := self xmiAssociation containedItems
		detect: [ :each | each xmiType = 'uml:Association' ].
	element := generator ensureCreateClass: 'BUTElement' in: 'Wherever'.
	comment := generator ensureCreateClass: 'BUTComment' in: 'Wherever'.
	generator createAssociationFrom: association.
	self assert: element instanceVariables equals: #(comment).
	self assert: element selectors equals: #(comment comment:).
	self assert: comment instanceVariables equals: #(annotatedElement).
	self assert: comment selectors equals: #(annotatedElement annotatedElement:)