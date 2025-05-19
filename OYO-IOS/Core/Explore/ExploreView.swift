//
//  ExploreView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 18/05/25.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        ScrollView{
            SearchFilterBarView()
            LazyVStack(spacing: 35){
                ForEach(0 ... 10, id: \.self){listing in
                    ListingItemView()
                        .frame(height: 400)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack{
        ExploreView()
    }
}
