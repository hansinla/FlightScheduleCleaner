//
//  main.m
//  FlightScheduleCleaner
//
//  Created by Hans van Riet on 10/7/13.
//  Copyright (c) 2013 Hans van Riet. All rights reserved.
//

#import <Foundation/Foundation.h>

//  The converted code is limited to 2 KB.
//  Upgrade your plan to remove this limitation.
// 
func main(argc: Int, argv: [Int8]?) -> Int {
    autoreleasepool {
        var arrivals: [AnyHashable] = []
        //        NSString *arrivalsRawFile = @"/Users/hansvanriet/Documents/zCoding/XCode Projects/FlightScheduleCleaner/FlightScheduleCleaner/LAX_ARRIVALS.txt";
        //        NSString *arrivalsProcessedFile = @"/Users/hansvanriet/Documents/zCoding/XCode Projects/FlightScheduleCleaner/FlightScheduleCleaner/LAX_ARRIVALS_CLEAN.txt";
        let arrivalsRawFile = "/Users/hans/Documents/zCoding/XCode/FlightScheduleCleaner/FlightScheduleCleaner/LAX_ARRIVALS.txt"
        let arrivalsProcessedFile = "/Users/hans/Documents/zCoding/XCode/FlightScheduleCleaner/FlightScheduleCleaner/LAX_ARRIVALS_CLEAN.txt"
        var error: Error?
        // Read in a file as a string w/ith error checking
        let flightSchedule = try? String(contentsOfFile: arrivalsRawFile, encoding: .utf8)
        if flightSchedule == nil {
            if let anError = error {
                print("Error reading file: \(anError)")
            }
            return 1
        }
        //Break it into array of strings
        let range = NSRange(location: 0, length: 5)
        var airline: String
        var flightNumber: String
        var originAirportCode: String
        var originAirportName: String
        var timeString: String
        var flightString: String
        let flights = flightSchedule?.components(separatedBy: "\n")
        for rawFlight: String? in flights ?? [] {
            let flight = (rawFlight?.components(separatedBy: ",") as NSArray?)?.subarray(with: range)
            airline = flight?[0] as? String ?? ""
            flightNumber = flight?[1] as? String ?? ""
            originAirportCode = flight?[2] as? String ?? ""
            originAirportName = flight?[3] as? String ?? ""
            timeString = flight?[4] as? String ?? ""
            if timeString.count > 5 {
                timeString = (timeString as NSString).substring(with: range)
// 
//  The converted code is limited to 2 KB.
//  Upgrade your plan to remove this limitation.
// 
//  %< ----------------------------------------------------------------------------------------- %<
