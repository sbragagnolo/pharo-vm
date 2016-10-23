#!/usr/local/bin/scale


" Just ln -s "

self assert: system pwd basename = #scripts description: 'The script must be runned in its own folder.'.

system stdout << ' Linking android sources to build folder '; cr. 

(system pwd / #'..'  / #'..'/ #build / #src) exists ifTrue: [ 
	system stderr << ' Src link already exists! '; cr. 	
 ] ifFalse: [  
	system ln: (system pwd / #'..' / #src ) to: (system pwd / #'..'  / #'..'/ #build / #src).
]


