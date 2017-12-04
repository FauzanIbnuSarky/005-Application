//
//  ViewController.swift
//  Stopwatch
//
//  Created by Master on 11/10/17.
//  Copyright © 2017 Master. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //declare variable counter
    var counter = 0.0
    //declare timer
    var timer = Timer()
    //declare isPlayying
    var isPlaying = false
    
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var lblStart: UIButton!
    @IBOutlet weak var lblPause: UIButton!
    @IBOutlet weak var lblReset: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //menampilkan teks ke table timer
        lblTimer.text = String(counter)
        //agar button pause tidak aktif
        lblPause.isEnabled = false
    }
    @IBAction func btnStart(_ sender: Any) {
        //
        if(isPlaying){
            return
        }
        //
        
        lblStart.isEnabled = false
        
        //
        lblPause.isEnabled = true
        
        //
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        
        //mengatur isplayyoing nya true
        isPlaying = true
    }
    
    func UpdateTimer() {
        counter = counter + 0.1
        lblTimer.text = String(format: "%.1f", counter)
    }
    

    
    @IBAction func btnpause(_ sender: Any) {
        lblStart.isEnabled = true
        lblPause.isEnabled = false
        timer.invalidate()
        isPlaying = false
        
        
        
    }

    @IBAction func btnReset(_ sender: Any) {
        //agar button start aktif 
        lblStart.isEnabled = true
        lblPause.isEnabled = false
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        lblTimer.text = String(counter)
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

