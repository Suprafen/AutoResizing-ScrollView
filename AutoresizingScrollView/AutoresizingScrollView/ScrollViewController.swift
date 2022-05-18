//
//  ViewController.swift
//  AutoresizingScrollView
//
//  Created by Ivan Pryhara on 18.05.22.
//

import UIKit

class ScrollViewController: UIViewController {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    let baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.text = "Title goes here"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let firstNotation: ElementUIView = {
        let view = ElementUIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), titleText: "Title goes here", descriptionText: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.", image: UIImage(systemName: "gear")!)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let secondNotation: ElementUIView = {
        let view = ElementUIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), titleText: "Title goes here", descriptionText: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur", image: UIImage(systemName: "gear")!)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let thirdNotation: ElementUIView = {
        let view = ElementUIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), titleText: "Title goes here", descriptionText: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.", image: UIImage(systemName: "gear")!)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let confirmButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Click"
        configuration.baseBackgroundColor = .systemBlue
        configuration.buttonSize = .large
        
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            baseView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            baseView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            baseView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            baseView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            baseView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -20),

            firstNotation.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            firstNotation.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20),
            firstNotation.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -20),

            secondNotation.topAnchor.constraint(equalTo: firstNotation.bottomAnchor, constant: 30),
            secondNotation.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20),
            secondNotation.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -20),

            thirdNotation.topAnchor.constraint(equalTo: secondNotation.bottomAnchor, constant: 30),
            thirdNotation.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20),
            thirdNotation.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -20),

            confirmButton.topAnchor.constraint(greaterThanOrEqualTo: thirdNotation.bottomAnchor, constant: 30),
            confirmButton.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20),
            confirmButton.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -20),
            confirmButton.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -20)
        ])
    }
    // MARK: Helper Methods
    func configureView() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Autoresizing scroll view"
        self.baseView.addSubview(titleLabel)
        self.baseView.addSubview(firstNotation)
        self.baseView.addSubview(secondNotation)
        self.baseView.addSubview(thirdNotation)
        self.baseView.addSubview(confirmButton)
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(baseView)
    }
    
    // MARK: Selectors
    @objc func confirmButtonTapped() {
        // Do action
    }
}
