Pod::Spec.new do |s|
  s.name         =  'DrawingLabel'
  s.version      =  '1.0'
  s.license      =  {:type => 'zlib'}
  s.summary      =  'A collection of objects, which creates different UILabel styles such as multiple strokes, shadows, inner shadow and gradients'
  s.homepage     =  'http://github.com/selim1377/DrawingLabel.git'
  s.author       =  { 'Selim Bakdemir' => 'selim.bakdemir@gmail.com' }
  s.source       =  { :git => 'https://github.com/selim1377/DrawingLabel.git', :tag => '1.0' }
  s.platform     =  :ios
  s.source_files =  'DrawingLabelExamples/Classes/*.{h,m}'
  s.requires_arc =  true
  s.framework    = 'CoreGraphics'
  s.platform     = :ios, '6.0'
end