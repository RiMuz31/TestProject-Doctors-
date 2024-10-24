//
//  CustomTabBar.swift
//  TestProject
//
//  Created by Rinat Khaeritdinov on 23.10.2024.
//

import SwiftUI

struct CustomTabBar: View {
	@Binding var selectedTab: Tab
	
	var body: some View {
		HStack(spacing: 0) {
			TabBarButton(title: "Главная", iconName: "house.fill", tab: .home, selectedTab: $selectedTab)
			TabBarButton(title: "Приёмы", iconName: "calendar", tab: .appointments, selectedTab: $selectedTab)
			TabBarButton(title: "Чат", iconName: "message.fill", tab: .chat, selectedTab: $selectedTab)
			TabBarButton(title: "Профиль", iconName: "person.fill", tab: .profile, selectedTab: $selectedTab)
		}
		.frame(height: 94)
		.background(Colors.customWhite)
		.overlay(
			Rectangle()
				.fill(Colors.customSilver) 
				.frame(height: 1)
				.padding(.top, 0),  alignment: .top
		)
	}
}

struct TabBarButton: View {
	let title: String
	let iconName: String
	let tab: Tab
	@Binding var selectedTab: Tab
	
	var body: some View {
		Button(action: {
			selectedTab = tab
		}) {
			VStack {
				Image(systemName: iconName)
					.font(.system(size: 24))
					.foregroundColor(selectedTab == tab ? Colors.customPink : Colors.customLightGray)
				Text(title)
					.font(.caption)
					.foregroundColor(selectedTab == tab ? Colors.customPink : Colors.customMediumGray)
			}
			.frame(maxWidth: .infinity)
		}
	}
}

enum Tab {
	case home, appointments, chat, profile
}
