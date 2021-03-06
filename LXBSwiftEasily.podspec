#

Pod::Spec.new do |s|
  
	s.name         = "LXBSwiftEasily"
  s.version      = "0.1.0"
  s.summary      = "some extension、methods"

  s.description  = <<-DESC
										A Framework work with swift, some extension、
    methods
									 DESC

  s.homepage     = "https://github.com/chlxb/SwiftEasily"

  s.license      = "MIT (example)"

  s.author       = "liuxiaobing"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/chlxb/SwiftEasily.git", :branch => "master" }
#s.source       = { :git => "https://github.com/chlxb/SwiftEasily.git", :tag => "#{s.version}" }

  s.swift_version = '4.2'

  s.source_files  = "SwiftEasilyExample/Classes/**/*.swift"
  s.exclude_files = "Classes/Exclude"
	s.license           = { :type => "MIT", :file => "LICENSE" }	

	s.static_framework = true
end
