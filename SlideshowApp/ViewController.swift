//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 楡井謙一 on 2018/04/28.
//  Copyright © 2018年 knirei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter: Int = 0
    var isSlideshowPlayed: Bool = false
    let imageName = ["pic1", "pic2", "pic3"]
    var timer: Timer!

    @IBOutlet weak var originalImage: UIImageView!
    
    @IBOutlet weak var forwardImageButton: UIButton!
    @IBOutlet weak var backwardImageButton: UIButton!
    @IBOutlet weak var toggleSlideshowButton: UIButton!
    
    @IBAction func forwardImage(_ sender: Any) {
        counter += 1
        originalImage.image = UIImage(named: imageName[counter%3])
    }
    
    @IBAction func backwardImage(_ sender: Any) {
        if counter == 0 {
            counter = 3
        }
        counter -= 1
        originalImage.image = UIImage(named: imageName[counter%3])
    }
    
    @IBAction func toggleSlideshow(_ sender: Any) { // 再生/停止ボタンが押された
        if isSlideshowPlayed == false { // スライドショーが停止中だった場合
            isSlideshowPlayed = true
            
            // ボタン設定
            forwardImageButton.isEnabled = false
            backwardImageButton.isEnabled = false
            toggleSlideshowButton.setTitle("停止", for:UIControlState.normal)
            
            // 自動再生のためのタイマーを開始
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoForwardImage), userInfo: nil, repeats: true)
            }

        }
        else { // ライドショーが再生中だった場合
            isSlideshowPlayed = false
            
            // ボタン設定
            forwardImageButton.isEnabled = true
            backwardImageButton.isEnabled = true
            toggleSlideshowButton.setTitle("再生", for:UIControlState.normal)

            // 自動再生のためのタイマーを停止
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
        }
    }
    
    @objc func autoForwardImage() {
        counter += 1
        originalImage.image = UIImage(named: imageName[counter%3])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if isSlideshowPlayed == true { // スライドショーが再生中だった場合
            self.timer.invalidate()
            self.timer = nil
        }
  
        let selectedViewController:SelectedViewController = segue.destination as! SelectedViewController
        selectedViewController.imageNumber = counter%3
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        if isSlideshowPlayed == true { // スライドショーが再生中だった場合
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoForwardImage), userInfo: nil, repeats: true)
        }
    }
}

