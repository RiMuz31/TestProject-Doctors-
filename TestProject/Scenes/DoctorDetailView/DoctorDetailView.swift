//
//  DoctorDetailView.swift
//  TestOnSwiftUI
//
//  Created by Rinat Khaeritdinov on 18.10.2024.
//

import SwiftUI
import Kingfisher

struct DoctorDetailView: View {
	let doctor: Doctor
	@Environment(\.presentationMode) var presentationMode
	
	var body: some View {
		VStack {
			HStack {
				Button(action: {
					presentationMode.wrappedValue.dismiss()
				}) {
					Image("back_arrow")
				}
				.padding(.leading)
				
				Spacer()
			}
			.padding(10)
			.overlay(
				Text("Педиатр")
					.font(.system(size: 24))
					.foregroundColor(Colors.customDarkGray)
					.frame(maxWidth: .infinity, alignment: .center)
				)
			HStack {
				KFImage(URL(string: doctor.avatar ?? ""))
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 50, height: 50)
					.clipShape(Circle())
					.padding(.top, 10)
				
				VStack(alignment: .leading, spacing: 10) {
					Text(doctor.lastName)
						.font(.headline)
						.fontWeight(.bold)
						.foregroundColor(Colors.customDarkGray)
					Text("\(doctor.firstName) \(doctor.patronymic)")
						.font(.headline)
						.fontWeight(.bold)
						.foregroundColor(Colors.customDarkGray)
				}
				.padding(.top, 10)
				
				Spacer()
			}
			
			HStack {
				VStack(alignment: .leading) {
					Label("Опыт работы: \(doctor.workExperience) \(FormatYears.getYearString(number: doctor.workExperience))", systemImage: "clock")
						.font(.system(size: 16))
						.padding(.bottom, 10)
					Label("Врач высшей категории", systemImage: "cross.case")
						.font(.system(size: 16))
						.padding(.bottom, 10)
					Label("1-й ММИ им. И.М.Сеченова", systemImage: "graduationcap")
						.font(.system(size: 16))
						.padding(.bottom, 10)
					Label("Детская клиника \"РебёнОК\"", systemImage: "mappin.and.ellipse")
						.font(.system(size: 16))
						.padding(.bottom, 10)
				}
				.foregroundColor(Colors.customMediumGray)
				Spacer()
			}
			.padding(.top, 10)
			HStack {
				Text("Стоимость услуг")
				Spacer()
				Text("от \(doctor.homePrice) ₽")
			}
			.frame(maxWidth: .infinity)
			.frame(height: 30)
			.bold()
			.padding()
			.background(Colors.customWhite)
			.cornerRadius(8)
			.overlay(
				RoundedRectangle(cornerRadius: 8)
					.stroke(Colors.customSilver, lineWidth: 1)
			)

			Spacer()
			
			Button(action: {
				
			}) {
				Text("Записаться")
					.frame(maxWidth: .infinity)
					.bold()
					.padding()
					.background(Colors.customPink)
					.foregroundColor(Colors.customWhite)
					.cornerRadius(10)
			}
			.padding(.bottom, 20)
			.frame(maxWidth: .infinity, alignment: .center)
		}
		.padding()
		.background(Colors.customLightGray)
		.navigationBarBackButtonHidden(true)
	}
}
