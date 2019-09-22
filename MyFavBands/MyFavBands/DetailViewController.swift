//
//  DetailViewController.swift
//  MyFavBands
//
//  Created by Samantha Thomas on 9/22/19.
//  Copyright © 2019 Samantha Thomas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{

    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productimageView: UIImageView!
    
    //@IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView()
    {
        // Update the user interface for the detail item.
        if detailItem != nil
        {
            //Updated lines.
            if let photo = productImageView
            {
                photo.image = UIImage(named:detailItem!)
            }
        }
        else
        {
            productImageView.image = UIImage(named:"main.jpg")
            title = "My Bands"
        }
     }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureView()
    }

    //Updated lines.
    var detailItem: String?
    {
        didSet
        {
            // Update the view.
            configureView()
        }
    }
}

