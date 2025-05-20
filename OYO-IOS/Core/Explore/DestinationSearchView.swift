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
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .shadow(radius: 10)
        
        VStack{
            HStack{
                Text("When")
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text("Add dates")
                    .font(.title3)
                    .fontWeight(.semibold)
                
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
        }
        
        
        VStack{
            HStack{
                Text("Who")
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text("Add guests")
                    .font(.title3)
                    .fontWeight(.semibold)
                
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}
