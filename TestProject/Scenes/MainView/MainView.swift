//
//  MainView.swift
//  TestProject
//
//  Created by Rinat Khaeritdinov on 19.10.2024.
//

import SwiftUI

struct MainView: View {
	@State private var selectedTab: Tab = .home
	
	var body: some View {
		ZStack(alignment: .bottom) {
			DoctorsListView()
		}
		CustomTabBar(selectedTab: $selectedTab)
			.frame(height: 30)
			.background(Color.white)
	}
}
