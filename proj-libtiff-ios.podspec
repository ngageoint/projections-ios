Pod::Spec.new do |s|
  s.name             = 'proj-libtff-ios'
  s.version          = '1.0.0'
  s.license          =  {:type => 'MIT', :file => 'LICENSE' }
  s.summary          = 'PROJ-LibTIFF iOS'
  s.homepage         = 'https://github.com/alexbejann/proj-libtiff-ios'
  s.authors          = { 'NGA' => '', 'BIT Systems' => '', 'Brian Osborn' => 'bosborn@caci.com', 'Alex Bejan' => ''}
  s.source           = { :git => 'https://github.com/alexbejann/proj-libtiff-ios.git', :tag => s.version }
  s.requires_arc     = true
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }

  s.platform         = :ios, '12.0'
  s.ios.deployment_target = '12.0'

  s.source_files = 'proj-libtiff-ios/**/*.{h,m}'

  s.exclude_files = 'proj-libtiff-ios/**/Info.plist'
  s.resource_bundle = { 'proj-libtiff-ios' => ['proj-ios/**/*.plist'] }
  s.frameworks = 'Foundation'

  s.libraries = 'sqlite3', 'c++'

  s.dependency 'PROJ-LibTIFF', '~> 9.3.1'

end
