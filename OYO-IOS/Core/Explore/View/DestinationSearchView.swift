import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @ObservedObject var viewModel: ExploreViewModel
    @Binding var show: Bool
  
    @State private var selectedOptions: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
   

    var body: some View {
        VStack {
            // Top Bar
            HStack {
                Button {
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }

                Spacer()

                if !viewModel.searchLocation.isEmpty || numGuests > 0 || startDate != endDate {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        startDate = Date()
                        endDate = Date()
                        numGuests = 0
                        selectedOptions = .location
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()

            ScrollView {
                VStack(spacing: 16) {
                    // Location Picker
                    PickerContainer(selected: selectedOptions == .location, onTap: {
                        selectedOptions = .location
                    }) {
                        if selectedOptions == .location {
                            Text("Where to?")
                                .font(.title2)
                                .fontWeight(.semibold)

                            HStack {
                                Image(systemName: "magnifyingglass")
                                TextField("Search destinations", text: $viewModel.searchLocation)
                                    .font(.subheadline)
                                    .onSubmit {
                                        viewModel.updateListingForLocation()
                                        show.toggle()
                                    }
                            }
                            .frame(height: 44)
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            )
                        } else {
                            CollapsedPickerView(title: "Where", description: viewModel.searchLocation.isEmpty ? "Add destination" : viewModel.searchLocation)
                        }
                    }



                    // Dates Picker
                    PickerContainer(selected: selectedOptions == .dates, onTap: {
                        selectedOptions = .dates
                    }) {
                        if selectedOptions == .dates {
                            Text("When's your trip?")
                                .font(.title2)
                                .fontWeight(.semibold)

                            DatePicker("From", selection: $startDate, displayedComponents: .date)
                            Divider()
                            DatePicker("To", selection: $endDate, displayedComponents: .date)
                        } else {
                            let dateSummary = startDate == endDate ? "Add dates" :
                                "\(formattedDate(startDate)) - \(formattedDate(endDate))"
                            CollapsedPickerView(title: "When", description: dateSummary)
                        }
                    }

                    // Guests Picker
                    PickerContainer(selected: selectedOptions == .guests, onTap: {
                        selectedOptions = .guests
                    }) {
                        if selectedOptions == .guests {
                            Text("Who's coming?")
                                .font(.title2)
                                .fontWeight(.semibold)

                            Stepper {
                                Text("\(numGuests) Adult\(numGuests == 1 ? "" : "s")")
                            } onIncrement: {
                                numGuests += 1
                            } onDecrement: {
                                if numGuests > 0 { numGuests -= 1 }
                            }
                        } else {
                            let guestDesc = numGuests == 0 ? "Add guests" : "\(numGuests) guest\(numGuests == 1 ? "" : "s")"
                            CollapsedPickerView(title: "Who", description: guestDesc)
                        }
                    }

                    // Tags View
                  
                    
                }
                .padding()
            }

            Spacer()
        }
        .background(Color(.systemGroupedBackground))
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

// MARK: - PickerContainer (Reusable View Wrapper)
struct PickerContainer<Content: View>: View {
    let selected: Bool
    let onTap: () -> Void
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: content)
            .padding()
            .frame(height: selected ? nil : 64, alignment: .top)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 5)
            .onTapGesture {
                withAnimation(.snappy) {
                    onTap()
                }
            }
    }
}

// MARK: - CollapsedPickerView
struct CollapsedPickerView: View {
    let title: String
    let description: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.gray)

            Spacer()

            Text(description)
                .foregroundStyle(.black)
        }
        .font(.subheadline)
        .fontWeight(.semibold)
    }
}

// MARK: - Preview
#Preview {
    DestinationSearchView(viewModel: ExploreViewModel(service: ExploreService()), show: .constant(true))
}
