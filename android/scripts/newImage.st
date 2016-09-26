#!/usr/bin/scale


| deploy repository image temp | 


system stdout << 'Running in ' << system pwd basename ; cr.
self assert: system pwd basename = #scripts description: 'The script must be runned in its own folder.'.

deploy := system pwd / #'..' / #'..' / #image.
deploy ensureCreateDirectory.
image := SCImageBundle new directory: deploy.
image exists ifTrue: [ image delete ].

temp := #/ asFileReference / #tmp / #newImage.
temp  exists ifTrue: [ temp recursiveDelete ].
temp ensureCreateDirectory.

deploy ensureCreateDirectory.
system stdout << ' Downloading Pharo 5.0  ' ; cr.
image := system loadPharo: 50 into: temp.
repository := 'filetree://' , (system pwd / #'..'/ #'..'/ #mc) fullName.  
system stdout << ' Loading Spur baseline from '<< repository ; cr.
system loadBaseline: 'Spur' from: repository  into: image andSaveItAt: deploy .
system stdout << ' Done! '  ; cr.

