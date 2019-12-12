
Pod::Spec.new do |spec|


  spec.name         = "Autofiller"
  spec.version      = "0.0.1"
  spec.summary      = "Lightweight library for connecting login and password field into Password Autofill form"
  spec.swift_version = "5.0"

  spec.description  = <<-DESC
  This library moves UITextFields into their common ancestor view so Password Autofill could see connection between them
                   DESC

  spec.homepage     = "http://github.com/djachenko/Autofiller"
  spec.license      = { :type => "MIT", :file => "LICENSE.txt" }

  spec.author             = { "Igor Djachenko" => "i.s.djachenko@gmail.com" }
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/djachenko/Autofiller.git", :tag => "#{spec.version}" }


  spec.source_files  = "Autofiller/*.{h,swift}", "Autofiller/Helpers/*.swift"

end
