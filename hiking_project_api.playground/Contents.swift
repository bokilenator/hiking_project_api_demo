
import Foundation

let api_key = ""

//Data we're getting:
  //name
  //summary
  //difficulty
  //stars
  //url
  //imgMedium
  //length
  //longitude
  //latitude
  //conditionStatus
  //conditionDetails


// set search parameters
var search_lat = "40.0274"
var search_long = "-105.2519"
var search_distance = "200"
var search_rating = "0"
var search_sort = "quality"
//search_sort = "distance" //uncomment to sort by how far the trail is from the national park center

// create api url
let npsURL: NSURL = NSURL(string: "https://www.hikingproject.com/data/get-trails?lat=\(search_lat)&lon=\(search_long)&maxDistance=\(search_distance)&minStars=\(search_rating)&sort=\(search_sort)&key=\(api_key)")!

// collect data from api
let data = NSData(contentsOf: npsURL as URL)!
let swiftyjson = try JSON(data: data as Data)

print("Search Results:")

// print trails from api call
let total = swiftyjson["trails"].count
for i in 0..<total {
  print("\n------------------------------------------------\n")
  
  let name = swiftyjson["trails"][i]["name"]
  let summary = swiftyjson["trails"][i]["summary"]
  let difficulty = swiftyjson["trails"][i]["difficulty"]
  let rating = swiftyjson["trails"][i]["stars"]
  let url = swiftyjson["trails"][i]["url"]
  let img = swiftyjson["trails"][i]["imgMedium"]
  let length = swiftyjson["trails"][i]["length"]
  let longitude = swiftyjson["trails"][i]["longitude"]
  let latitude = swiftyjson["trails"][i]["latitude"]
  let condition = swiftyjson["trails"][i]["conditionStatus"]
  let condition_details = swiftyjson["trails"][i]["conditionDetails"]
  
  print("Trail name: \(name)")
  print("\nRating: \(rating)")
  print("Difficulty: \(difficulty)")
  print("Length: \(length)")

  print("\nSummary: \(summary)")
  print("More Details: \(url)")
  
  print("\nPicture: \(img)")
  print("Coordinates: \(latitude), \(longitude)")
  
  print("\nCondition: \(condition)")
  print("Details: \(condition_details)")
  
}
