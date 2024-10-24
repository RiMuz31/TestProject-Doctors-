//
//  SortElements.swift
//  TestProject
//
//  Created by Rinat Khaeritdinov on 23.10.2024.
//

import SwiftUI

enum SortOption: Equatable {
	case price(isAscending: Bool)
	case experience(isAscending: Bool)
	case rating(isAscending: Bool)
	
	func toggleDirection() -> SortOption {
		switch self {
		case .price(let isAscending):
			return .price(isAscending: !isAscending)
		case .experience(let isAscending):
			return .experience(isAscending: !isAscending)
		case .rating(let isAscending):
			return .rating(isAscending: !isAscending)
		}
	}
	
	var isAscending: Bool {
		switch self {
		case .price(let isAscending), .experience(let isAscending), .rating(let isAscending):
			return isAscending
		}
	}
	
	static func ==(lhs: SortOption, rhs: SortOption) -> Bool {
		switch (lhs, rhs) {
		case (.price(let lhsAscending), .price(let rhsAscending)):
			return lhsAscending == rhsAscending case (.experience(let lhsAscending), .experience(let rhsAscending)):
			return lhsAscending == rhsAscending case (.rating(let lhsAscending), .rating(let rhsAscending)):
			return lhsAscending == rhsAscending default:
			return false }
	}
}

struct SortButtonsView: View {
	@Binding var selectedSortOption: SortOption?
	
	var body: some View {
		HStack(spacing: 0) {
			SortButton(title: "По цене", option: .price(isAscending: selectedSortOption?.isAscending ?? true), selectedSortOption: $selectedSortOption)
			SortButton(title: "По стажу", option: .experience(isAscending: selectedSortOption?.isAscending ?? true), selectedSortOption: $selectedSortOption)
			SortButton(title: "По рейтингу", option: .rating(isAscending: selectedSortOption?.isAscending ?? true), selectedSortOption: $selectedSortOption)
		}
		.background(Colors.customWhite)
		.cornerRadius(8)
		.overlay(
			RoundedRectangle(cornerRadius: 8)
				.stroke(Colors.customSilver, lineWidth: 1)
		)
	}
}

struct SortButton: View {
	let title: String
	let option: SortOption
	@Binding var selectedSortOption: SortOption?
	
	var body: some View {
		Button(action: {
			if selectedSortOption == option {
				selectedSortOption = option.toggleDirection()
			} else {
				selectedSortOption = option
			}
			
		}) {
			HStack {
				Text(title)
					.font(.system(size: 14))
					.frame(maxWidth: .infinity)
				
				if selectedSortOption == option {
					let imageName = selectedSortOption?.isAscending == true ? "sort_arrow" : "sort_arrow"
					let rotationAngle: Angle = selectedSortOption?.isAscending == true ? .zero : .degrees(180)
					
					Image(imageName)
						.rotationEffect(rotationAngle)
				}

				else {
					Spacer()
						.frame(width: 0)
				}
			}
			.padding()
			.background(selectedSortOption == option ? Colors.customPink : Color.clear)
			.foregroundColor(selectedSortOption == option ? Colors.customWhite : Colors.customDarkGray)
		}
		.frame(height: 36)
	}
}
