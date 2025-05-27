//
//  SearchFilterBarView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 19/05/25.
//

import SwiftUI

struct SearchFilterBarView: View {
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2){
                Text("Where to?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Any Week . Add Guest")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button(action: {}, label:{
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
            
        }
        .padding()
        .overlay{
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4),radius: 2)
            
        }
        .padding(.horizontal)
        IconScrollView()
          
    }
}

#Preview {
    SearchFilterBarView()
}
