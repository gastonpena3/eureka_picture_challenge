//
//  GoogleMapsManager.swift
//  Eureka_picture_challege
//
//  Created by Gastón Pena on 05/02/2023.
//

import SwiftUI
import GoogleMaps

struct GoogleMapsView: UIViewRepresentable {
    
    @StateObject var locationManager = LocationManager()
    
    private let zoom: Float = 15.0
    private var latitude: Double?
    private var longitude: Double?
    
    init(latitude: Double?, longitude: Double?) {
        
        GMSServices.provideAPIKey(APIConfig.shared.gMapsApiKey)
        
        self.latitude = latitude
        self.longitude = longitude
    }
    
    //Create Google Maps View with Store Photo location or User Location if its new photo
    func makeUIView(context: Self.Context) -> GMSMapView {

        let camera = GMSCameraPosition.camera(withLatitude: latitude ?? locationManager.latitude, longitude: longitude ?? locationManager.longitude, zoom: zoom)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        
        mapView.animate(toLocation: CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude))
    }
}

struct GoogleMapsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        var locationManager = LocationManager()
        
        GoogleMapsView(latitude: locationManager.latitude, longitude: locationManager.longitude)
    }
}
