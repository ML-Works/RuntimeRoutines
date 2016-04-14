Pod::Spec.new do |s|
  s.name             = "RuntimeRoutines"
  s.version          = "0.1.0"
  s.summary          = "A block-based way to access Objective-C runtime primitives"

  s.description      = <<-DESC
                        RuntimeRoutines allows you to access classes, protocols,
                        properties, methods, attrbutes and many other with block-based syntax.
                       DESC

  s.homepage         = "https://github.com/ML-Works/RuntimeRoutines"
  s.license          = 'MIT'
  s.author           = { "Anton Bukov" => "k06aaa@gmail.com" }
  s.source           = { :git => "https://github.com/ML-Works/RuntimeRoutines.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/k06a'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
