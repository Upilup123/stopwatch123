//
//  ViewController.swift
//  stopwatch123
//
//  Created by Luthfi Aly on 10/12/17.
//  Copyright © 2017 Luthfialy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //declare variable counter
    var counter = 0.0
    //declare timer
    var timer = Timer()
    //declare isPlaying
    var isPlaying = false
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var lblStart: UIButton!
    @IBOutlet weak var lblPause: UIButton!
    @IBOutlet weak var lblStop: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //menampilkan teks ke lblTimer
        lblTimer.text = String(counter)
        //agar button pause tidak aktif
        lblPause.isEnabled = false
    }
    @IBAction func btnStart(_ sender: Any) {
        // untuk mengecek apakah sedang playing atau tidak
        if(isPlaying) {
            return
        }
        //button start tidak aktif
        lblStart.isEnabled = false
        //button pause aktif
        lblPause.isEnabled = true
        
        //mengatur timer sebagai schedule Timer dengan interval 0.1 dan memanggil updateTimer
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        //mengatur isPlaying nya true
        isPlaying = true
    }
    
    func updateTimer() {
        counter = counter + 0.1
        lblTimer.text = String(format: "%.1f", counter)
    }
    
    @IBAction func btnPause(_ sender: Any) {
        //agar button start aktif
        lblStart.isEnabled = true
        //agar button pause tidak aktif
        lblPause.isEnabled = true
        
        //menampilkan data yang valid
        timer.invalidate()
        
        //mengatur isPlaying false
        
        isPlaying = false
        
    }
    
    @IBAction func btnReset(_ sender: Any) {
        //agar button start aktif
        lblStart.isEnabled = true
        //agar button pause tidak aktif
        lblPause.isEnabled = false
        
        //menampilkan data yang valid
        timer.invalidate()
        //mengatur isPlaying false
        isPlaying = false
        
        //mengatur counter nya menjadi 0 kembali
        
        counter = 0.0
        
        //menampilkan timer ke label
        //fungsi dari String(counter) adalah mengubah nilai desimal counter ke dalam bentuk string
        lblTimer.text = String(counter)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

