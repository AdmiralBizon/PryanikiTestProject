//
//  RulesList.swift
//  PryanikiTestProject
//
//  Created by Ilya on 29.05.2022.
//

import Foundation

// MARK: - RulesList
struct RulesList: Codable {
    let data: [Element]
    let view: [String]
}

// MARK: - Element
struct Element: Codable {
    let name: String
    let data: ElementData
}

// MARK: - ElementData
struct ElementData: Codable {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variant]?
}

// MARK: - Variant
struct Variant: Codable {
    let id: Int
    let text: String
}
