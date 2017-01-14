//
//  ViewController.swift
//  s04PageTheScroll
//
//  Created by bernadette on 1/13/17.
//  Copyright © 2017 Bernadette P. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    // store content size (how much content you're adding)
    var contentWidth: CGFloat = 0.0
    
    // create empty array of images
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()


    
    }
    
    // --> ADD VIEWDIDAPPEAR
    // in viewDidAppear, we will have the (screen's) frame data available to us here
    
    override func viewDidAppear(_ animated: Bool) {
        
        let scrollWidth = scrollView.frame.size.width
        
        // putting the images (icon0.png, etc) into the array
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)   // hold a reference to it
            images.append(imageView)
            
            // add to scrollView
            var newX: CGFloat = 0.0     // 0.0 is top left corner of screen
            
            // find x-axis' center
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            
            // set frame on image, after it has been added to the scrollView
            // x is 'newX' (center on x-axis), offset by half the width of the image (75) -> to center the img
            // y is halfway down the height, offset by half the height of the image (75) -> to center the img
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        // to show what's behind or next / not clipped to the bounds of the scrollView
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

