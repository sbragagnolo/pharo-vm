growing/shrinking memory
findEmptySegNearestInSizeTo: size
	| seg best delta |
	<var: #seg type: #'SpurSegmentInfo *'>
	<var: #best type: #'SpurSegmentInfo *'>
	best := nil.
	delta := size.
	0 to: numSegments - 1 do:
		[:i|
		seg := self addressOf: (segments at: i).
		(self isEmptySegment: seg) ifTrue:
			[best
				ifNil: [best := seg]
				ifNotNil:
					[(size >= (seg segSize * 0.75)
					 and: [(seg segSize - size) abs < delta]) ifTrue:
						[best := seg. delta := (seg segSize - size) abs]]]].
	^best