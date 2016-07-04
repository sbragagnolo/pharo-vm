#!/usr/bin/scale

| deploy repository image temp | 

self assert: system pwd basename = #scripts description: 'The script must be runned in its own folder.'.

deploy := system pwd / #'..' / #'..' / #build / #assets / #SmalltalkRessources .
deploy exists ifTrue: [ deploy recursiveDelete ].
deploy ensureCreateDirectory.

temp := #/ asFileReference / #tmp / #newImage.
temp  exists ifTrue: [ temp recursiveDelete ].
temp ensureCreateDirectory.



image := system loadPharo: 40 into: temp.

system execute: 'Gofer it smalltalkhubUser: ''sbragagnolo'' project: ''Android''; configuration; loadStable.WorldMorph installNewWorld.AndroidInputEventSensor installEventSensorFramework.' into: image andSaveItAt: deploy.

system call: ' chmod +x ', (deploy / #'pharo-vm') fullName , '/*'.
system call: ' chmod +x ', (deploy / #'pharo-ui') fullName .
system call: ' chmod +x ', (deploy / #'pharo') fullName .


