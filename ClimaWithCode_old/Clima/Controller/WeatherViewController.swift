//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftUI
import SnapKit

class WeatherViewController: UIViewController  {
    
    
    // MARK: - UI
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: Constants.background)
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var mainStackView = UIStackView()
    private var headerStackView = UIStackView()
    private var tempStackView = UIStackView()
    
    private lazy var geoButton : UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: Constants.geoSF), for: .normal)
        element.tintColor = .label
        element.addTarget(self, action: #selector(locationPressed), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }() 
   
    private lazy var searchButton : UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: Constants.searchSF), for: .normal)
        element.tintColor = .label
        element.addTarget(self, action: #selector(saerchPressed), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var conditionImageView : UIImageView = {
        let element = UIImageView()
        element.image = UIImage(systemName: Constants.coditionSF)
        element.tintColor = UIColor(named: Constants.weatherColor)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var temperatureLabel : UILabel = {
        let element = UILabel()
        element.tintColor = .label
        element.font = .systemFont(ofSize: 80, weight: .bold)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }() 
    
    private lazy var tempTypeLabel : UILabel = {
        let element = UILabel()
        element.tintColor = .label
        element.font = .systemFont(ofSize: 100, weight: .light)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    var cityLabel : UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 30)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var searchTextField : UITextField = {
        let element = UITextField()
        element.placeholder = Constants.search
        element.borderStyle = .roundedRect
        element.textAlignment = .right
        element.font = .systemFont(ofSize: 25)
        element.tintColor = .label
        element.textColor = .label
        element.backgroundColor = .systemFill
        //element.background = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let emptyView = UIView()
    
    // MARK: - Variables
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
//        setView()
//        setupConstrains()
//        //setupConstrains()
//       
//       
//        locationManager.delegate = self
//        
//        locationManager.requestWhenInUseAuthorization()
//        
//      
//        weatherManager.delegate = self
//        searchTextField.delegate = self
    }

    @objc func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    @objc func saerchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
}

extension WeatherViewController {
 
    // MARK: - Setup View
    private func setView(){
        
        temperatureLabel.text = "21"
        tempTypeLabel.text = Constants.celsius
        cityLabel.text = "London"
        
        headerStackView = UIStackView.init(axis: .horizontal, distribution: .fill, alignment: .trailing, spacing: 10, subViews: [geoButton, searchTextField, searchButton])
        
        tempStackView = UIStackView.init(axis: .horizontal, distribution: .fill, alignment: .center, spacing: 10, subViews: [temperatureLabel, tempTypeLabel])
        
        mainStackView = UIStackView.init(axis: .vertical, distribution: .fill, alignment: .trailing, spacing: 10, subViews: [headerStackView, conditionImageView, tempStackView, cityLabel, emptyView])      
        
        //mainStackView.backgroundColor = .green
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstrains(){
        
        // MARK: - SnapKit Layuot
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mainStackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide ).inset(24)
        }
        
        geoButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        } 
        searchTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        } 
        headerStackView.snp.makeConstraints { make in
            make.width.equalTo(mainStackView.snp.width)
        }
        searchButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        conditionImageView.snp.makeConstraints { make in
            make.width.height.equalTo(120)
        }

    }
}

// MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

// MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.startUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            weatherManager.fetchWeather(lat, lon)
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

// MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            //self.cityLabel.text = weather.cityName
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}


//
//struct ViewControllerProvider: PreviewProvider {
//    static var previews: some View {
//        WeatherViewController().showPreview()
//    }
//}
