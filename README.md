# AutoResizing-ScrollView
Scroll View with a size depends on content it holds

If you want to achieve the same kind of functionality like in the scroll view I posted here you should remember, that you must provide height constraints to the scroll view, from the very top to the bottom. In addition sub views should appear in the conteiner-content-view(just a custom view, that holds elements that you want to appear in the scroll view).

Usually scroll view itself fills screen entirely, so here nothing special:
      
    scrollView.topAnchor.constraint(equalTo: margins.topAnchor),
    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
    
Here goes our next layer it's base view(aka container-content-view). I put exclamation mark for the most important parts. This is the most confusing part. We need to provide height and width anchors for base view that relates to scroll view's height and width anchors respectively. For the width anchor we set 'equal to' constraint, otherwise scroll view expanded it's content view horizontaly, but not vertically. Meanwhile height anchor is set to 'greate than or equal to'. We do this because sometimes our content view can fit to screen size, hence scroll view and content view will have initial size, which is scroll view's height.
     
     !!! baseView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
     !!! baseView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
     baseView.topAnchor.constraint(equalTo: scrollView.topAnchor),
     baseView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
     baseView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
     baseView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
     
  Then you just make sure that your elements goes one after another and they have enough constraints for height and width. But in this case it's simply chasing previous element with its bottom anchor.
  
     titleLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 20),
     titleLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20),
     titleLabel.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -20),

     firstElement.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
     firstElement.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20),
     firstElement.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -20),

     secondElement.topAnchor.constraint(equalTo: firstElement.bottomAnchor, constant: 30),
     secondElement.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20),
     secondElement.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -20),

     thirdElement.topAnchor.constraint(equalTo: secondElement.bottomAnchor, constant: 30),
     thirdElement.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20),
     thirdElement.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -20),
     confirmButton.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -20)


For full code I encourage you to clone the repository and see how this stuff works. 
