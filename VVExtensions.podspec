Pod::Spec.new do |s|
  s.name = "VVExtensions"
  s.version = "0.0.2"
  s.summary = "Some useful extensions will help you a lot when Swift dev."

  s.description = <<-DESC
  					A collection of useful extensions for the Swift Standard Library, Foundation, and UIKit. And it may improve tons fo development efficiency.
                   DESC

  s.homepage = "https://github.com/qiuncheng/VVExtensions"

  s.license = {:type => "MIT", :file => "LICENSE"}

  s.author = {"Qiuncheng" => "qiuncheng@gmail.com"}
  s.social_media_url = "https://twitter.com/vsccw"

  s.platform = :ios, "9.0"
  s.swift_version = "4.2"

  s.source = {:git => "https://github.com/qiuncheng/VVExtensions.git", :tag => "#{s.version}"}

  s.source_files = "VVExtensions/*.{swift}"

  s.requires_arc = true
end
