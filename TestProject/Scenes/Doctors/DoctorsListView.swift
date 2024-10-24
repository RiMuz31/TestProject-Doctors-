//
//  ContentView.swift
//  TestProject
//
//  Created by Rinat Khaeritdinov on 18.10.2024.
//

import SwiftUI
import Kingfisher

struct DoctorsListView: View {
	@ObservedObject var viewModel = DoctorsViewModel()
	@State private var searchText: String = ""
	@State private var selectedSortOption: SortOption? = nil
	@State private var selectedTab: Tab = .home
	@State private var navigationPath = NavigationPath()
	
	var body: some View {
		NavigationStack(path: $navigationPath) {
			ZStack(alignment: .bottom) {
				VStack {
					Text("Педиатры")
						.font(.system(size: 24))
						.foregroundColor(Colors.customDarkGray)
						.padding(.top, 20)
						.padding(.bottom, 16)
						
					SearchBar(text: $searchText)
						.padding(.bottom, 12)
					
					SortButtonsView(selectedSortOption: $selectedSortOption)
						.padding(.bottom, 16)
						.padding(.horizontal,16)
					
					List {
						ForEach(filteredAndSortedDoctors) { doctor in
							DoctorRow(doctor: doctor)
								.onTapGesture {
									navigationPath.append(doctor)
								}
								.background(Colors.customLightGray)
								.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
								.listRowBackground(Colors.customLightGray.opacity(0.2))
								.listRowSeparatorTint(Colors.customLightGray)
								.clipShape(RoundedRectangle(cornerRadius: 15))
						}
					}
					.listStyle(PlainListStyle())
					.padding(.horizontal,16)
					.cornerRadius(8)
					.navigationDestination(for: Doctor.self) {
						doctor in
						DoctorDetailView(doctor: doctor)
					}
					.scrollIndicators(.hidden)
					.background(Colors.customLightGray)
				}
				.background(Colors.customLightGray)
			}
		}
		.onAppear(perform: {
			Task {
				await viewModel.loadDoctors()
			}
		})
		
		var filteredAndSortedDoctors: [Doctor] {
			var doctors = viewModel.doctors
			
			if !searchText.isEmpty {
				doctors = doctors.filter { $0.lastName.lowercased().contains(searchText.lowercased()) }
			}
			
			if let sortOption = selectedSortOption {
				switch sortOption {
				case .price(let isAscending):
					doctors = doctors.sorted {isAscending ? $0.homePrice < $1.homePrice : $0.homePrice > $1.homePrice }
				case .experience(let isAscending):
					doctors = doctors.sorted { isAscending ? $0.workExperience > $1.workExperience : $0.workExperience < $1.workExperience }
				case .rating(let isAscending):
					doctors = doctors.sorted { isAscending ? $0.ratingsRating > $1.ratingsRating : $0.ratingsRating < $1.ratingsRating }
				}
			}
			return doctors
		}
	}
}





