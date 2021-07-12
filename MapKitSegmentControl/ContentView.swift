//
//  ContentView.swift
//  MapKitSegmentControl
//
//  Created by Anthony on 12/07/21.
//

import SwiftUI
import MapKit
import UIKit


struct LocationItem {
    var title: String
    var coordinates: CLLocationCoordinate2D
}

struct ContentView: View {
    
    @State private var selectedSegment = 0
    @State private var locations = [
        LocationItem(title: "Utah", coordinates: CLLocationCoordinate2D(latitude: 40.7608, longitude: -111.8910)),
        LocationItem(title: "California", coordinates: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Picker("Escolha um lugar", selection: $selectedSegment) {
                        ForEach(0 ..< locations.count) {
                            Text(self.locations[$0].title).tag($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                     .padding()
                }
                // mapview would go here
//                Text("\(self.locations[selectedSegment].coordinates.latitude)     \(self.locations[selectedSegment].coordinates.longitude)")
                MapView(coordinates: locations[selectedSegment].coordinates)
            }
            .navigationTitle("Locais")
        }
    }
}

struct MapView: UIViewRepresentable {
    var coordinates: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        uiView.setRegion(region, animated: true)
    }
}
