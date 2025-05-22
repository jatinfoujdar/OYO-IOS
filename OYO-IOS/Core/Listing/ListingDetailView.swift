import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView{
            ZStack(alignment: .topLeading){
                ListingImageCraouselView()
                    .frame(height: 320)
            
                Button{
                dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
            }
            VStack(alignment: .leading){
                Text("Mumbai Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        Text("4.8")
                        
                        Text(" - ")
                        
                        Text("32 reviews")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .underline()
                        
                    }
                    .foregroundStyle(.black)
                    
                    Text("Mumbai , Maharashtra")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            HStack{
                VStack(alignment: .leading){
                    Text("Entire Villa hosted by Ram Sharma")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    
                    HStack{
                        Text("4 guests - ")
                        Text("4 bedroom - ")
                        Text("4 beds - ")
                        Text("3 baths ")
                    }
                    .font(.caption)
                    .fontWeight(.semibold)
                    
                }
                Spacer()
                
                Image("p1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                ForEach(0..<2){feature in
                    HStack(spacing:12){
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading){
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhosts are experienced, highly rated, and committed to providing great stays for their guests.")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .padding(.vertical)
            
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll sleep ")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 16){
                        ForEach(1..<5){bedroom in
                            VStack{
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                                    
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            
            Divider()
            
            VStack(alignment:.leading, spacing: 16){
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(0..<5){feature in
                    HStack{
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        
                        Text("Wifi")
                        Spacer()
                    }
                }
            }
            .padding()
            
            
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
            
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom,50)
        .overlay(alignment: .bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("₹500")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                        
                    }
                    Spacer()
                    
                    Button{
                        
                    }label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView()
}
