generate:
	xcrun --sdk macosx swift Tools/GenerateIconEnum.swift > Sources/FontAwesome/Icon.swift
	swiftlint lint --fix --strict Sources/FontAwesome/Icon.swift
