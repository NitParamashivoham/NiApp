//
//  Loc.swift
//  ni
//
//  Created by Nitesh on 2018-06-15.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit

import MapKit
class Loc: UIViewController, UIWebViewDelegate, UISearchBarDelegate{
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func searchButoon(_ sender: UIBarButtonItem) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Enter City or Postal code"
        present(searchController, animated: true, completion: nil)
        }
    
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //Ignoring Use
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        
        // Activity Indicator
        
        let activityindicator = UIActivityIndicatorView()
        activityindicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityindicator.center = self.view.center
        activityindicator.hidesWhenStopped = true
        activityindicator.startAnimating()
        
        self.view.addSubview(activityindicator)
        
        //Hide Search BAr
        
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        //Create search requests to show up on Map
        
        let searchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
            
            activityindicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            if response == nil
            {print("Error")
            }
            else
            {
                //Remove Anotations
                //  let annotations = self.mapView.annotations
                //  self.mapView.removeAnnotations(annotations)
                
                
                //Getting data - extrating to get annotation
                let lati = response?.boundingRegion.center.latitude
                let longi = response?.boundingRegion.center.longitude
                
                
                //Create Annotation
                let annotation = MKPointAnnotation()
                
                annotation.title = searchBar.text
                annotation.coordinate = CLLocationCoordinate2DMake(lati!, longi! )
                //self.mapView.addAnnotation(annotation)
                
                //Zooming In
                let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lati!, longi!)
                let span = MKCoordinateSpanMake(4, 4)
                let region = MKCoordinateRegionMake(coordinate, span)
                self.mapView.setRegion(region, animated: true)
                
            }
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Background")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        let locations = [
            ["title": "Smithers, BC", "subtitle": "  22323 Telkwa High Road, Smithers, BC", "latitude": 54.8471185, "longitude": -127.103886],
            ["title": "Calgary, Satsang Center","subtitle": " 35 Saddlecrest Close NE, Calgary, AB", "latitude": 51.1337251, "longitude": -113.9450684],
            ["title": "Richmond, Paduka Mandir","subtitle": " 12580 Jack Bell Drive, Richmond, BC", "latitude": 49.177946, "longitude": -123.0864256],
            ["title": "Surrey, Paduka Mandir", "subtitle": "  13727 74 Avenue, Surrey, BC", "latitude": 49.1375581, "longitude": -122.8436114],
            
            ["title": "Vancouver, BC", "subtitle": " 109-14280, 19A Avenue, Surrey, BC", "latitude": 49.0371773, "longitude": -122.829581],
            ["title": "Toronto Adheenam","subtitle": "10-1960 Ellesmere Rd, Toronto, ON", "latitude": 43.7761257, "longitude": -79.2412243],
            ["title": "Richmond, Paduka Mandir","subtitle": " 12580 Jack Bell Drive, Richmond, BC",    "latitude": 49.177946, "longitude": -123.0864256],
            ["title": "Ottawa, Satsang Center", "subtitle": "415 Gilmour St, Apt. 714, Ottawa, ON", "latitude": 45.414069, "longitude": -75.6978406],
            
            ["title": "Montreal, Satsang Center", "subtitle": "67 CH Oxford, Baie-D'Urfe, Québec", "latitude": 45.4089265, "longitude": -73.9342486],
            ["title": "Goyave, Paduka Mandir","subtitle": "Chemin de Sarcelle, Goyave, Basse-Terre", "latitude":16.1567202, "longitude": -61.5943731],
            ["title": "Ohio, Vedic Temple","subtitle": "820 Pollock Rd, Delaware, OH, 43015", "latitude": 49.177946, "longitude": -123.0864256],
            ["title": "Seattle, Vedic Temple", "subtitle": "1770 NW Maple St, Issaquah WA 98027", "latitude": 47.5432678, "longitude": -122.066423],
            ["title": "LA, Hindu Temple", "subtitle": " 9720 Central Ave Montclair, CA",
             "latitude": 34.076864, "longitude": -117.6926971],
            ["title": "Bay Area, Vedic Temple","subtitle": "513 Los Coches Street Milpitas, CA-95035", "latitude": 37.431302, "longitude": -121.8987287],
            ["title": "Phoenix, Vedic Temple","subtitle": "12002 N 68th St  Scottsdale, AZ 85254", "latitude": 33.5954256, "longitude": -111.938066],
            ["title": "Pau, Satsang Center", "subtitle": "Résidence Le Doyen -Bâtiment B, 3 av du doyen vizioz, Pau", "latitude": 43.3198336,"longitude": -0.3700356 ],
            ["title": "Grasse, Satsang Center", "subtitle": " 20 Chemin du Collet d'Esquirp, Grasse", "latitude": 43.6432109,"longitude": 6.9573716 ],
            ["title": "Villeneuve, Satsang Center", "subtitle": " 43, Lotissement Le Pommier, Villeneuve-de-Berg", "latitude": 44.5723133,"longitude": 4.5075852 ],
            ["title": "Nantes, Satsang Center", "subtitle": " 19 Allée des Jonquilles, Le Pellerin", "latitude": 47.1970361,"longitude": -1.7528596 ],
            ["title": "Paris, Satsang Center", "subtitle": " 10 Rue Joseph Leguay, Fontenay-aux-Roses", "latitude": 48.7873953,"longitude": 2.2922732 ],
            ["title": "La Courneuve, Satsang Center", "subtitle": " 16 Rue Beaufils, La Courneuve", "latitude": 48.9263129,"longitude": 2.3809935 ],
            ["title": "Ghent, Paduka Mandir", "subtitle": " Loofblommestraat 39 A0101, Sint-Denijs-Westrem, Ghen", "latitude": 51.0214195,"longitude": 3.6665838 ],
            ["title": "Cologne, Satsang Center", "subtitle": " Gutenbergstraße 25, Cologne", "latitude": 50.9486291,"longitude": 6.9225813 ],
            ["title": "Rastatt, Satsang Center", "subtitle": " Steinmetzstraße 3, Rastatt", "latitude": 48.8595165,"longitude": 8.211881 ],
            ["title": "Prague, Satsang Center", "subtitle": " Prague, Czechia", "latitude": 50.0593325,"longitude":14.1854489 ],
            ["title": "Brno, Satsang Center", "subtitle": " Husova 110, Bilovice nad Svitavou, Brno", "latitude": 49.2476419,"longitude": 16.6669256],
            ["title": "Vienna, Satsang Center", "subtitle": " Wallgasse 5/7, Vienna", "latitude": 48.1899072,"longitude": 16.336592 ],
            ["title": "Budapest, Satsang Center", "subtitle": " Egressy út 113/E I/3", "latitude": 47.5200903,"longitude": 19.1255639 ],
            ["title": "Tenja, Satsang Center", "subtitle": " M.Vlacica 92, Tenja", "latitude": 44.4488886,"longitude": 16.5676144 ],
            ["title": "Sofia, Satsang Center", "subtitle": " 158 Tzar Simeon, Ap. 13", "latitude": 42.6388078,"longitude": 23.183864],
            ["title": "Tampere, Satsang Center", "subtitle": "  Lahtomäenkatu 3 B 25, Tampere", "latitude": 61.4943052,"longitude": 23.8844997 ],
            ["title": "Suva, Satsang Center", "subtitle": " 33 Rakua Street, Off Nailuva, Suva", "latitude": -18.1420324,"longitude": 178.4414488 ],
            ["title": "Hobart, Satsang Center", "subtitle": " 58 Hampden Road, Battery Point, Tasmania", "latitude": -42.8897576,"longitude": 147.3317864 ],
            ["title": "Melbourne Adheenam", "subtitle": " 14/684-700 Frankston-Dandenong Rd/, Carrum Downs, Victoria", "latitude": -38.0873549,"longitude": 145.1791206 ],
            ["title": "Bendigo, Paduka Mandir", "subtitle": " 37 Kronk Street, Golden Square, Victoria", "latitude": -36.7678192,"longitude": 144.2366402 ],
            ["title": "Sydney, Paduka Mandir", "subtitle": " 10/1-3, Cottonwood Crescent, Sydney, New South Wales", "latitude": -33.7805705,"longitude": 151.1150497 ],
            ["title": "Brisane, Satsang Center", "subtitle": " 3 Cervantes Street, MacGregor, Queensland", "latitude": -27.5646143,"longitude": 153.0637389 ],
            ["title": "Cairns, Satsang Center", "subtitle": " 276 McLeod Street, Cairns North, Queensland", "latitude": -16.9090392,"longitude": 145.7583358 ],
            ["title": "Alice Springs, Satsang Center", "subtitle": " 15 Plowman Street, Alice Springs, Northern Territory", "latitude": -23.7068587,"longitude": 133.8540503 ],
            ["title": "Perth, Paduka Mandir", "subtitle": "  2/196 High Road, Riverton, Western Australia", "latitude": -32.03837,"longitude": 115.8849013 ],
            ["title": "Sai Kung, Satsang Center", "subtitle": " Sai Kung House C, Yee Hong Garden, Tan Cheung Road", "latitude": 22.383843,"longitude": 114.2672133 ],
            ["title": "Tuen Mun, Paduka Mandir", "subtitle": "  Room 2924, Hing Shing House, Tai Hing Street", "latitude": 22.402738,"longitude": 113.9672453 ],
            ["title": "Vadodara, Satsang Center", "subtitle": " 189 Sardarnagar Society, Nizampura Main, Sardar Nagar, Vadodara ", "latitude": 22.3307497,"longitude": 73.1745331 ],
            ["title": "Nagpur, Paduka Mandir", "subtitle": " Shruti Kirti Apartment, Badil Kheda, Nagpur", "latitude": 21.1038806,"longitude": 79.074717 ],
            ["title": "Amravati, Satsang Center", "subtitle": " Atharva Apartment, Flat No.6, 3rd Floor, Near Circuit House, In front of IG Bungalow, Amravati", "latitude": 20.9040729,"longitude": 77.6917054 ],
            ["title": "Hyderabad Adheeman", "subtitle": " Rajarajeshwari Temple, Satamrai, Shamshabad, Hyderabad", "latitude": 17.3197639,"longitude": 78.3042353],
            ["title": "Pune, Satsang Center", "subtitle": "Flat No:3B-10, Bhoir Estate Dange Chowk, Dhange Chowk Flyover, Pimpri-Chinchwad", "latitude": 18.6139892,"longitude": 73.7653194 ],
            ["title": "Bandra, Satsang Center", "subtitle": " Ursula Apt., Flat 2, Bldg 1, Rajaramwadi, Off Hill Rd, Bandra West, Mumbai", "latitude": 19.055115,"longitude": 72.828102 ],
            ["title": "Vile Parle, Paduka Mandir", "subtitle": " 702, Vasant Smruti, Nanda Patkar Road Extension, Vile Parle East", "latitude": 19.0966846,"longitude": 72.8480432 ],
            ["title": "Mulund, Paduka Mandir", "subtitle": " B/401, Sainath Heights, Neelam Nagar, Mumbai", "latitude": 19.1741425,"longitude": 72.9657272 ],
            ["title": "Thane, Paduka Mandir", "subtitle": "  C-5, 504, Vedant Complex, Vartak Nagar, Thane", "latitude": 19.2058578,"longitude": 72.9586918 ],
            ["title": "Perambur, Satsang Center", "subtitle": " 16/35, Loco Scheme 2nd Cross Street, Jawahar Nagar, Chennai", "latitude": 13.1096182,"longitude": 80.2238413],
            
            ["title": "Avadi, Adheenam", "subtitle": " 330, LIG-1, TNHB, Avadi", "latitude": 13.1143312,"longitude": 80.0954705 ],
            ["title": "Tambaram, Satsang Center", "subtitle": " Sandilyam Plot No.8, Kalamegam Street, Tambaram, Chennai", "latitude": 12.9248174,"longitude": 80.1288471 ],
            ["title": "Thondai Mandala Adheenam", "subtitle": " VCP St, Big Kanchipuram, Kanchipuram", "latitude": 12.7852359, "longitude": 79.6703788 ],
            
            ["title": "Tumakuru, Paduka Mandir", "subtitle": " Arpana, 4th Cross, Ganapathi Temple Road, near Water tank, behind Sarvodaya high school, Chennabasaveswara layout, Upparhalli, Tumakuru", "latitude": 13.1337555,"longitude": 77.0848604 ],
            ["title": "Bengaluru Adheenam", "subtitle": " Nithyananda Dhyanapeetam, Bengaluru, Karnataka", "latitude": 12.7771959, "longitude": 77.3703941 ]
            
            
        ]
        
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location["title"] as? String
            annotation.subtitle = location["subtitle"] as? String
            
            
            annotation.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! Double, longitude: location["longitude"] as! Double)
            mapView.addAnnotation(annotation)
        }
        
   }
    
    
    
    
}
