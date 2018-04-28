//
//  SelectedViewController.swift
//  SlideshowApp
//
//  Created by 楡井謙一 on 2018/04/28.
//  Copyright © 2018年 knirei. All rights reserved.
//

import UIKit

class SelectedViewController: UIViewController {

    @IBOutlet weak var selectedImage: UIImageView!

    var imageNumber: Int = 0
    let imageName = ["pic1", "pic2", "pic3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        selectedImage.image = UIImage(named: imageName[imageNumber])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
