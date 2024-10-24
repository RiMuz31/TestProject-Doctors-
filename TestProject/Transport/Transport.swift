//
//  Transport.swift
//  TestProject
//
//  Created by Rinat Khaeritdinov on 21.10.2024.
//

import Foundation

public protocol Transport: AnyObject {
	func fetchDoctors() async throws -> [User]
}
class ApiResponseTransport: Transport {

	func fetchDoctors() async throws -> [User] {
		guard let url = Bundle.main.url(forResource: "jsonObject", withExtension: "json") else {
			throw URLError(.badURL)
		}
		
		let (data, _) = try await URLSession.shared.data(from: url)
		let list = try JSONDecoder().decode(ApiResponse.self, from: data)
		return list.data.users
	}
}

public struct TransportFactory {
	public static func make() -> Transport {
		ApiResponseTransport()
	}
}


