Pod::Spec.new do |s|

  s.name 		         = 'Mailer'
  s.version 		     = '0.1.0'
  s.summary          = 'Manager for mail clients'

  s.description      = 'This framework allows users to send you emails using the most handy mail client for them.'

  s.homepage         = 'https://github.com/Pimine/Mailer.git'
  s.license 		     = { :type => 'MIT', :file => 'LICENSE' }
  s.authors 		     = { 'Den Andreychuk' => 'denis.andrei4uk@yandex.ua' }

  s.source 		       = { 
    :git => 'https://github.com/Pimine/Mailer.git', 
    :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.swift_version   = ['5.1', '5.2']
  s.source_files    = 'Sources/**/*.swift'

end
