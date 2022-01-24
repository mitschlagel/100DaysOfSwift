//
//  DetailViewController.swift
//  Project1
//
//  Created by Spencer Jones on 1/21/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    //@IBOutlet tells us this is connected to image builder
    // UIImageView! is an implicitly unwrapped optional. look it up.
    @IBOutlet var imageView: UIImageView!
   
    var selectedImage: String?
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
