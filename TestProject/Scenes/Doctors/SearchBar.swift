//
//  SearchBar.swift
//  TestProject
//
//  Created by Rinat Khaeritdinov on 23.10.2024.
//

import SwiftUI

struct SearchBar: View {
	@Binding var text: String
	@State private var isEditing = false
	
	var body: some View {
		HStack {
			TextField("Поиск", text: $text)
				.padding(8)
				.padding(.horizontal, 25)
				.background(Color(Colors.customWhite))
				.cornerRadius(8)
				.foregroundColor(isEditing ? Colors.customDarkGray : Colors.customSilver)
				.overlay(
					HStack {
						Image(systemName: "magnifyingglass")
							.foregroundColor(Colors.customSilver)
							.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
							.padding(.leading, 8)
						
						if isEditing {
							Button(action: {
								self.text = ""
							}) {
								Image(systemName: "multiply.circle.fill")
									.foregroundColor(Colors.customMediumGray)
									.padding(.trailing, 8)
							}
						}
					}
				)
				.onTapGesture {
					self.isEditing = true
				}
				.animation(.easeInOut(duration: 0.3), value: isEditing)
				.overlay(
					RoundedRectangle(cornerRadius: 8)
						.stroke(Colors.customSilver, lineWidth: 1)
				)
			
			if isEditing {
				Button("Cancel") {
					self.isEditing = false
					self.text = ""
					UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
				}
				.padding(.trailing, 10)
				.transition(.move(edge: .trailing))
			}
		}
		.padding(.horizontal, 16)
		.frame(height: 36)
	}
}
