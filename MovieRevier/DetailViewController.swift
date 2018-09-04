//
//  DetailViewController.swift
//  MovieRevier
//
//  Created by Rui Yang Tan on 4/9/18.
//  Copyright © 2018 Rui Yang Tan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let movie = movie {
            self.title = "\(String(describing: movie.name)) \(movie.year)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var movie: Movie? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

