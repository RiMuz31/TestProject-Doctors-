//
//  Converts.swift
//  TestProject
//
//  Created by Rinat Khaeritdinov on 23.10.2024.
//

import Foundation

enum FormatYears {
	static func getYearString(number: Int) -> String {
		let digit = number % 10
		if number >= 11 && number <= 14 {
			return "лет"
		}
		switch digit {
		case 1:
			return "год"
		case 2, 3, 4:
			return "года"
		default:
			return "лет"
		}
	}
}
