# carrierwave-optimize-image

This gem allows you to compress lossless images with the help of ffmpeg library on carrierwave gem.
This library is inspired from carrierwave-imageoptimizer.


## Installation

Then add this line to your application's Gemfile:

    gem 'carrierwave-optimize-image'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carrierwave-optimize-image



## Usage

To add image compression to your CarrierWave uploader, first include the module:

```ruby
class MyUploader < CarrierWave::Uploader::Base
   include CarrierWave::OptimzeImage
  ...
end
```

Then apply to eacg versions via:

```ruby
class TestUploader < CarrierWave::Uploader::Base
  ...
  process optimize: [level: 10]
end
```

##### Lossy optimization

Pass an optional `level` parameter to specific lossy image quality level (0-100), default is lossless level is 30.
The lessel the value, the better the qaulity.
 
## system requiremets

To use this gem ffmpeg library should be install on you system or ypu can follow the below steps to install it.

Ubuntu
```
sudo apt-get install ffmpeg
```
Mac OS

```
brew install ffmpeg 
```


## Contributing


1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

