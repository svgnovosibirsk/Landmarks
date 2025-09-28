//
//  MapView.swift
//  Landmarks
//
//  Created by Sergey on 31.08.2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    @AppStorage("MapView.zoom") private var zoom: Zoom = .medium

    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id: Zoom {
            return self
        }
    }
    
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
    
    @State private var region: MKCoordinateRegion =
    MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286,
                                       longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2,
                               longitudeDelta: 0.2)
    )
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
//            span: MKCoordinateSpan(latitudeDelta: 0.2,
//                                   longitudeDelta: 0.2)
        )
    }
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
