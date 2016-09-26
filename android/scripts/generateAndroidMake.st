#!/usr/bin/scale



" This script executes the Android Stack generator and then it makes the building files executable "
	| generator |
	generator :=  SCImageBundle new directory: system pwd / #'..' / #'..' / #image .
	system execute: ' CogSpur32AndroidARMConfig new generate; generateSources. ' into: generator.
  system chmod: '+x' to: (system pwd / #'..' / #'..' / #build) fullName, '/*sh '.


	