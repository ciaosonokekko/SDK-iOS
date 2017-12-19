//
//  ViewController.swift
//  RecastAI
//
//  Created by plieb on 03/29/2016.
//  Copyright (c) 2017 plieb. All rights reserved.
//

import UIKit
import RecastAI

/**
Class ViewController Example of implementations for Text & Voice Requests
 */
class ViewController: UIViewController
{
    //Outlets
    @IBOutlet weak var requestTextField: UITextField!
    
    //Vars
    var bot : RecastAIClient?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.bot = RecastAIClient(token : "d4dafe14b27a35492ecb6c4c21606d3d")
//        self.bot = RecastAIClient(token : "YOUR_TOKEN", language: "en")
    }
    
    /**
     Method called when the request was successful
     
     - parameter response: the response returned from the Recast API
     
     - returns: void
     */
    func recastRequestDone(_ response : Response)
    {
        print(response.timestamp)
        print(response.status)
        print(response.intents as Any)
        print(response.language)
        print(response.source)
    }
    
    /**
     Method called when the converse request was successful
     
     - parameter response: the response returned from the Recast API
     
     - returns: void
     */
    func recastRequestDone(_ response : ConverseResponse)
    {
        print(response.reply() as Any)
        print(response.action?.slug as Any)
    }
    
    /**
     Method called when the request failed
     
     - parameter error: error returned from the Recast API
     
     - returns: void
     */
    func recastRequestError(_ error : Error)
    {
        print("Error : \(error)")
    }
    
    /**
     Make text request to Recast.AI API
     */
    @IBAction func makeRequest()
    {
        if (!(self.requestTextField.text?.isEmpty)!)
        {
            //Call makeRequest with string parameter to make a text request
//            self.bot?.analyseText(self.requestTextField.text!, successHandler: recastRequestDone, failureHandle: recastRequestError)
//            self.bot?.converseText(self.requestTextField.text!, converseToken: "YOUR_CONVERSATION_UNIQUE_ID", successHandler: recastRequestDone, failureHandle: recastRequestError)
        }
    }
    
    /**
     Make File request to Recast.AI API
     */
    func makeFileRequest()
    {
        if (!(self.requestTextField.text?.isEmpty)!)
        {
            let url = URL(string: self.requestTextField.text!)!
            //Call makeRequest with string parameter to make a text request
            self.bot?.analyseFile(url, successHandler: recastRequestDone, failureHandle: recastRequestError)
        }
    }
}
