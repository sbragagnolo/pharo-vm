#!/usr/bin/scale



| deploy  image  | 


system stdout << 'Running in ' << system pwd basename ; cr.
self assert: system pwd basename = #scripts description: 'The script must be runned in its own folder.'.

deploy := system pwd / #'..' / #'..' / #image.
deploy ensureCreateDirectory.
image := SCImageBundle new directory: deploy.
image exists ifTrue: [ image delete; deleteCompanionFolders ].


