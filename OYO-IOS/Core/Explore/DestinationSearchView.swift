//
//  DestinationSearchView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 20/05/25.
//

import SwiftUI

struct DestinationSearchView: View {
    @Binding var show : Bool
    @State private var destination = ""
    
    var body: some View {
        VStack{
            Button{
                withAnimation(.snappy){
                    show.toggle()
                }
            }label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            VStack(alignment: .leading){
                Text("Where to?")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack{
                    Image(systemName: "magnifyingglass")
                        .imageScale(.small)
                    
                    TextField("Search destinations", text: $destination)
                        .font(.subheadline)
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1.0)
                        .foregroundStyle(Color(.systemGray4))
                }
            }
        }
        .padding()
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}
