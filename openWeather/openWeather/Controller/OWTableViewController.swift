//
//  OWTableViewController.swift
//  openWeather
//
//  Created by Federico Frias on 8/10/16.
//  Copyright © 2016 ffrias. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class OWTableViewController: UITableViewController {
    
    var cityWeathers = [OWCityModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    func getWeather(){
        var parameters = [String:String]()
        parameters["appid"] = Constants.ApiKey
        
        for city in Constants.Cities{
        
            parameters["q"] = city
            
            APICli.sharedInstance.getDataWeather(Constants.BaseUrl,resource: Constants.Resource, params: parameters){(result)->Void in
                
                let name = result["name"].stringValue
                let description = result["weather"][0]["description"].stringValue
                
                let url = "http://openweathermap.org/img/w/"+result["weather"][0]["icon"].stringValue+".png"
                
                var icon = UIImage()
                Alamofire.request(.GET, url)
                    .responseImage { response in
                        if let imageDownloaded = UIImage(data: response.data!){
                            icon = imageDownloaded
                            let cityWeather = OWCityModel(name: name, description: description, icon: icon)
                            self.cityWeathers.append(cityWeather)
                            self.tableView.reloadData()
                        }
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = OWTableViewCell()
        cell = tableView.dequeueReusableCellWithIdentifier("OWTableViewCell", forIndexPath: indexPath) as! OWTableViewCell
        
        cell.city.text = cityWeathers[indexPath.row].name
        cell.weatherDescription.text = cityWeathers[indexPath.row].description
        cell.icon.image = cityWeathers[indexPath.row].icon
    
        return cell
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cityWeathers.count
    }

    

}
