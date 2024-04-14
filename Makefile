mock: 
	rm -f ./SharedModules/Sources/UseCase/MockResults.swift
	mint run mockolo mockolo --sourcedirs ./SharedModules/Sources/UseCase --destination ./SharedModules/Sources/UseCase/MockResults.swift