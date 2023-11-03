//
//  LessonDetailViewController.swift
//  ToDo
//
//  Created by Артур Олехно on 03/11/2023.
//

import UIKit
import WebKit

class LessonDetailViewController: UIViewController {
    
    private var gitURL: String?
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private var linklabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Link to GIT"
        label.textColor = .systemBlue
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        view.addSubview(linklabel)
        configureConstrains()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClicLabel(sender:)))
        linklabel.isUserInteractionEnabled = true
        linklabel.addGestureRecognizer(tap)
    }
    
    @objc func onClicLabel(sender:UITapGestureRecognizer) {
        openUrl(urlString: gitURL)
    }

    func openUrl(urlString:String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    private func configureConstrains() {
        let webViewConstraints = [
            webView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300)
        ]
        let linkTexsdftConstrain = [
            linklabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linklabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 25)
        ]
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(linkTexsdftConstrain)
    }
    
    public func configure(videuUrl: String, gitUrl: String) {
        guard let url = URL(string: videuUrl) else {return}
        webView.load(URLRequest(url: url))
        gitURL = gitUrl
    }
}
