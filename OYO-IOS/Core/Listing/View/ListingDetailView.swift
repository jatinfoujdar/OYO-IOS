import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    let listing: ListingModel
    @State private var cameraPosition: MapCameraPosition
    
    
    init(lisitng: ListingModel){
        self.listing = lisitng
        let region = MKCoordinateRegion(
            center: lisitng.city == "Los Angeles" ? .losAngeles : .miami,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .topLeading){
                ListingImageCarouselView()
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
                Text("\(listing.title)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        Text("\(String(format: "%g", listing.rating))")
                        
                        Text(" - ")
                        
                        Text("32 reviews")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .underline()
                        
                    }
                    .foregroundStyle(.black)
                    
                    Text("\(listing.city), \(listing.state)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            HStack{
                VStack(alignment: .leading){
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    
                    HStack{
                        Text("\(listing.numberOfGuests) guests - ")
                        Text("\(listing.numberOfBedrooms) bedroom - ")
                        Text("\(listing.numberOfBeds) beds - ")
                        Text("\(listing.numberOfBathroom) baths ")
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
                ForEach(listing.feature){feature in
                    HStack(spacing:12){
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading){
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll sleep ")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 16){
                        ForEach(1...listing.numberOfBedrooms, id: \.self){bedroom in
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
                
                ForEach(listing.amenities){amenity in
                    HStack{
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)
                        
                        Text(amenity.imageName)
                        Spacer()
                    }
                }
            }
            .padding()
            
            
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
            
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom,70)
        .overlay(alignment: .bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("₹\(listing.pricePerNight)")
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
                            .font(.headline)
                            .fontWeight(.bold)
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
    ListingDetailView(lisitng: DeveloperPreview.shared.listings[0] )
}
