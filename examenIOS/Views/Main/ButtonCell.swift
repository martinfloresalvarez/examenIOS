//
//  ButtonCell.swift
//  examenIOS
//
//  Created by Martin Flores Alvarez on 11/10/22.
//

import Foundation
import UIKit

import FirebaseFirestore
import FirebaseStorage

class ButtonCell: UITableViewCell {
  
  let database = Firestore.firestore()
  
  let buttonTake = UIButton()
  let photoView = UIImageView()
  let activityIndicator = UIActivityIndicatorView(style: .large)
  let urlLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupLayouts()
  }
  
  private func setupViews() {
    contentView.addSubview(photoView)
    contentView.addSubview(buttonTake)
    contentView.addSubview(urlLabel)
    contentView.addSubview(activityIndicator)
  }
  
  private func setupLayouts() {
    photoView.translatesAutoresizingMaskIntoConstraints = false
    buttonTake.translatesAutoresizingMaskIntoConstraints = false
    urlLabel.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      photoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      photoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      photoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      photoView.heightAnchor.constraint(equalToConstant: 200)
    ])
    
    NSLayoutConstraint.activate([
      buttonTake.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      buttonTake.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 20),
      buttonTake.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
    ])
    
    NSLayoutConstraint.activate([
      urlLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      urlLabel.topAnchor.constraint(equalTo: buttonTake.bottomAnchor, constant: 20),
      urlLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      urlLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
    ])
    
    NSLayoutConstraint.activate([
      activityIndicator.centerXAnchor.constraint(equalTo: buttonTake.centerXAnchor, constant: 0),
      activityIndicator.centerYAnchor.constraint(equalTo: buttonTake.centerYAnchor, constant: 0)
    ])
  }
  
  func setup(with photo: UIImage) {
    urlLabel.text = "Url: "
    photoView.image = photo
    buttonTake.setTitle("Upload photo", for: .normal)
    buttonTake.setTitleColor(.blue, for: .normal)
    buttonTake.frame = CGRect(x: 0, y: 0, width: 200, height: 44)
    buttonTake.addTarget(self, action: #selector(uploadPhoto), for: .touchUpInside)
    activityIndicator.hidesWhenStopped = true
    urlLabel.numberOfLines = 0
  }
  
  @objc func uploadPhoto() {
    
    uploadImage()
    /*
     var ref: DocumentReference? = nil
     ref = database.collection("users").addDocument(data: [
     "first": "Martin",
     "last": "Flores",
     "born": 1987
     ]) { err in
     if let err = err {
     print("Error adding document: \(err)")
     } else {
     print("Document added with ID: \(ref!.documentID)")
     }
     }
     
     database.collection("users").getDocuments() { (querySnapshot, err) in
     if let err = err {
     print("Error getting documents: \(err)")
     } else {
     for document in querySnapshot!.documents {
     print("\(document.documentID) => \(document.data())")
     }
     }
     }*/
    
  }
  
  // TODO: quedo pendiente la subida con el nombre del usuario
  // TODO: separar en un controlador

  func uploadImage() {
    
    let imageName: String = String("test.png")
    let storageRef = Storage.storage().reference().child("profilePic").child(imageName)
    guard let compressImage = resizeImage(image: photoView.image!, newWidth: 300) else {
      return
    }
    activityIndicator.startAnimating()
    
    if let uploadData = compressImage.pngData() {
      storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
        self.activityIndicator.stopAnimating()
        
        if error != nil {
          print("error \(error.debugDescription)")
        } else {
          
          // TODO: permitir que el usuario pueda ir a la url de la imagen subida 
          storageRef.downloadURL(completion: { (url, error) in
            if let urlText = url?.absoluteString {
              self.urlLabel.text = urlText
              
            }
          })
          
          print("metadata \(metadata.debugDescription)")
        }
      })
      
    }
  }
  
  // TODO: crear un manejador mas correcto de imagenes y separar en otro archivo
  
  func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
    
    let scale = newWidth / image.size.width
    let newHeight = image.size.height * scale
    UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
    image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
