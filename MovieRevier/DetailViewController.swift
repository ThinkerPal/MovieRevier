//
//  DetailViewController.swift
//  MovieRevier
//
//  Created by Rui Yang Tan on 4/9/18.
//  Copyright © 2018 Rui Yang Tan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  

    

    @IBOutlet weak var tableView: UITableView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let movie = movie {
            self.title = "\(String(describing: movie.name)) \((movie.year))"
        }
    }

     override func viewDidLoad() {
        super.viewDidLoad()
        
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
//        navigationItem.rightBarButtonItem = addButton
        configureView()
//
    }

    var movie: Movie? {
        didSet {
            // Update the view.
            configureView()
        }
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let movie = fetchedResultsController.object(at: indexPath)
        configureCell(cell, withMovie: movie)
        return cell
    }
    
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = fetchedResultsController.managedObjectContext
            context.delete(fetchedResultsController.object(at: indexPath))
            
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func configureCell(_ cell: UITableViewCell, withMovie movie: Movie) {
        cell.textLabel!.text = movie.name!
        cell.detailTextLabel!.text = String(movie.year)
    }
    


}

