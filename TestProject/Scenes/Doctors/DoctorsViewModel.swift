//
//  DoctorsViewModel.swift
//  TestProject
//
//  Created by Rinat Khaeritdinov on 18.10.2024.
//

import SwiftUI

class DoctorsViewModel: ObservableObject {
	@Published var doctors: [Doctor] = []
	
	private let doctorService = TransportFactory.make()
	
	func loadDoctors() async {
		do {
			let fetchedDoctors = try await doctorService.fetchDoctors()
			let transformedDoctors = TransformDTO.transformUsersToDoctors(users: fetchedDoctors)

			DispatchQueue.main.async {
				self.doctors = transformedDoctors
			}
		} catch {
			print("Error loading doctors: \(error)")
		}
	}
}

