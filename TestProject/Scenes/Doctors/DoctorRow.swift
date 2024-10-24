//
//  DoctorRow.swift
//  TestProject
//
//  Created by Rinat Khaeritdinov on 23.10.2024.
//

import SwiftUI
import Kingfisher

struct DoctorRow: View {
	var doctor: Doctor
	@State private var isLiked = false
	
	var body: some View {
		VStack(alignment: .leading, spacing: 12) {
			HStack(alignment: .top) {
				KFImage(URL(string: doctor.avatar ?? ""))
					.resizable()
					.placeholder {
						ProgressView()
					}
					.onFailure { error in
						print("Ошибка загрузки изображения: \(error)")
					}
					.aspectRatio(contentMode: .fill)
					.frame(width: 50, height: 50)
					.clipShape(Circle())
				
				VStack(alignment: .leading, spacing: 8) {
					VStack(alignment: .leading) {
						Text(doctor.lastName)
							.font(.headline)
							.fontWeight(.bold)
							.foregroundColor(Colors.customDarkGray)
						Text("\(doctor.firstName) \(doctor.patronymic)")
							.font(.headline)
							.fontWeight(.bold)
							.foregroundColor(Colors.customDarkGray)
					}
					
					HStack(spacing: 2) {
						ForEach(0..<5) { index in
							Image(systemName: index < Int(doctor.ratingsRating) ? "star.fill" : "star")
								.resizable()
								.frame(width: 12, height: 12)
								.foregroundColor(Colors.customPink)
						}
					}
					
					HStack {
						Text(doctor.specialization)
							.font(.subheadline)
						Text("•")
							.font(.headline)
							.padding(.horizontal, 4)
						Text("Стаж: \(doctor.workExperience) \(FormatYears.getYearString(number: doctor.workExperience))")
							.font(.subheadline)
					}
					.foregroundColor(Colors.customMediumGray)
					
					Text("Цена: \(doctor.homePrice) ₽")
						.font(.subheadline)
						.fontWeight(.bold)
						.foregroundColor(Colors.customDarkGray)
				}
				.padding(.leading, 8)
				
				Spacer()
				
				Text("")
				Image(systemName: isLiked ? "heart.fill" : "heart")
					.resizable()
					.frame(width: 24, height: 20)
					.foregroundColor(isLiked ? Color.red : Colors.customSilver)
				
					.padding(.top, 4)
					.contentShape(Rectangle())
			}
			Text("Записаться")
				.font(.headline)
				.frame(maxWidth: .infinity)
				.padding(10)
				.background(Colors.customPink)
				.foregroundColor(Colors.customWhite)
				.cornerRadius(8)
		}
		.padding()
		.background(Color.white)
		.overlay(
			RoundedRectangle(cornerRadius: 15)
				.stroke(Colors.customSilver, lineWidth: 1)
		)
	}
}
