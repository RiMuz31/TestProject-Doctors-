//
//  TransformDTO.swift
//  TestProject
//
//  Created by Rinat Khaeritdinov on 21.10.2024.
//

import Foundation

class TransformDTO {
	static func transformUserToDoctor(_ user: User) -> Doctor {
		let randomWorkExperience = Int.random(in: 10...40)
		let specialization = "Педиатр"
		let defaultAvatarUrl = Bundle.main.url(forResource: "NoPhoto", withExtension: "png")!
		let urlAbsoluteString = defaultAvatarUrl.absoluteString
		return Doctor(
			id: user.id,
			firstName: user.firstName,
			patronymic: user.patronymic ?? urlAbsoluteString,
			lastName: user.lastName,
			ratingsRating: user.ratingsRating,
			homePrice: user.homePrice,
			avatar: user.avatar ?? urlAbsoluteString,
			workExperience: randomWorkExperience,
			specialization: specialization
		)
	}
	static func transformUsersToDoctors(users: [User]) -> [Doctor] {
		return users.map { transformUserToDoctor($0) }.sorted { $0.lastName < $1.lastName }
	}
}

public struct Doctor: Codable, Identifiable, Hashable {
	
	public static func == (lhs: Doctor, rhs: Doctor) -> Bool {
		return lhs.id == rhs.id &&
		lhs.firstName == rhs.firstName &&
		lhs.lastName == rhs.lastName
	}
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(firstName)
		hasher.combine(lastName)
	}
	
	public let id: String
	let firstName: String
	let patronymic: String
	let lastName: String
	let ratingsRating: Double
	let homePrice: Int
	let avatar: String?
	let workExperience: Int
	let specialization: String
}
