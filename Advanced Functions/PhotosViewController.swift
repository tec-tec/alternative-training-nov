//
//  PhotosViewController.swift
//  Advanced Functions
//
//  Created by Ludovic Ollagnier on 24/11/2015.
//  Copyright © 2015 Tec-Tec. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var lastImageSelectedImageView: UIImageView!
    @IBOutlet weak var fromLibraryButton: UIButton! {

        didSet {
            fromLibraryButton.hidden = !UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary)
        }
    }
    @IBOutlet weak var fromCameraButton: UIButton!  {

        didSet {
            fromCameraButton.hidden = !UIImagePickerController.isSourceTypeAvailable(.Camera)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func photoFromCamera(sender: AnyObject) {
        presentPhotoPickerFrom(.Camera)
    }

    @IBAction func photoFromLibrary(sender: AnyObject) {
        presentPhotoPickerFrom(.PhotoLibrary)
    }

    func presentPhotoPickerFrom(source: UIImagePickerControllerSourceType) {

        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = source
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            lastImageSelectedImageView.image = image;
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
