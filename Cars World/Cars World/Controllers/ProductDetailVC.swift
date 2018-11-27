//
//  ProductDetail.swift
//  Cars World
//
//  Created by Apple on 26/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import ImageSlideshow
import SDWebImage

class ProductDetailVC: UIViewController {
    
    @IBOutlet weak var mainStackView:UIView!
    @IBOutlet var slider: ImageSlideshow!
    
    var sliderImageArray = [String]()
    var sliderImageSource = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        addBackButton()
        self.title = "Product Detail"
        self.sliderImageArray.append("http://216.200.116.25/around-uae/assets/uploads/combinations/5bdb0533d973a369def9c590/1541080685735-f9BLeua073rnfRb8I1pejkPjxNf7XqYj-1541080672371.png")
        self.sliderImageArray.append("http://216.200.116.25/around-uae/assets/uploads/combinations/5bdb0533d973a369def9c590/1541080685735-f9BLeua073rnfRb8I1pejkPjxNf7XqYj-1541080672371.png")
        self.sliderImageArray.append("http://216.200.116.25/around-uae/assets/uploads/combinations/5bdb0533d973a369def9c590/1541080685735-f9BLeua073rnfRb8I1pejkPjxNf7XqYj-1541080672371.png")
        //setSlider()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        mainStackView.layer.borderWidth = 1
        mainStackView.layer.borderColor = #colorLiteral(red: 0.925272584, green: 0.9294125438, blue: 0.9334286451, alpha: 1)
    }
    
    func setSlider(){
        self.slider.backgroundColor = UIColor.clear
        self.slider.slideshowInterval = 3.0
        self.slider.pageControlPosition = PageControlPosition.insideScrollView
        self.slider.pageControl.currentPageIndicatorTintColor = UIColor(red: 35/255, green: 111/255, blue: 164/255, alpha: 1.0)
        self.slider.pageControl.pageIndicatorTintColor = UIColor.white
        self.slider.contentScaleMode = UIViewContentMode.scaleToFill
        self.slider.clipsToBounds = true
        self.slider.activityIndicator = DefaultActivityIndicator()
       
        _ = self.sliderImageSource.map { ImageSource(image: $0) }
        var sdWebImages = [SDWebImageSource]()
        for images in self.sliderImageArray {
            sdWebImages.append(SDWebImageSource(urlString: images)!)
        }
        self.slider.setImageInputs(sdWebImages)
        
        let recognizer = UITapGestureRecognizer(target: self, action: nil)
        self.slider.addGestureRecognizer(recognizer)
    }
}
