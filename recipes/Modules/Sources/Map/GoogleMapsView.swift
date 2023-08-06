//
//  SwiftUIView.swift
//  
//
//  Created by Inés Rojas on 6/08/23.
//

import SwiftUI
import GoogleMaps
import AppCore

public struct GoogleMapsView: UIViewRepresentable {
    private let zoom: Float = 15.0
    private let latitude: Double
    private let longitude: Double
    private let recipe: Recipe
    
    public init(
        recipe: Recipe,
        latitude: Double,
        longitude: Double
    ) {
        self.recipe = recipe
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(
            withLatitude: self.latitude,
            longitude: self.longitude,
            zoom: zoom
        )
        let mapView = GMSMapView.map(
            withFrame: CGRect.zero,
            camera: camera
        )
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(
            latitude: self.latitude,
            longitude: self.longitude
        )
        marker.title = self.recipe.country
        marker.snippet = self.recipe.name
        marker.map = mapView
        return mapView
    }
    
    public func updateUIView(_ mapView: GMSMapView, context: Context) {
                let camera = GMSCameraPosition.camera(withLatitude: self.latitude, longitude: self.longitude, zoom: zoom)
                mapView.camera = camera
        mapView.animate(toLocation: CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        ))
    }
}

struct GoogleMapsView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsView(
            recipe: Dummy.getInstance().recipe1,
            latitude: Dummy.getInstance().recipe1.latitude,
            longitude: Dummy.getInstance().recipe1.longitude
        )
    }
}
