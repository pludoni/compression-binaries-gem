# Compression

[![Gem Version](https://badge.fury.io/rb/compression-binaries.svg)](https://badge.fury.io/rb/compression-binaries)

Ships zopfli and brotli binaries


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'compression-binaries'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install compression-binaries

## Usage

After installing that tool, the ``bro`` executable should be in your path:

```
bundle exec bro --version
```

## Current Version

bro: v0.5.2 (11 Aug 2016)
zopfli: 1.0.1 (22 Aug 2015)


## Integration with Rails asset pipeline (Sprockets)

Add that snippet to Rakefile or to ``lib/tasks/assets.rake``. Running ``rake assets:precompile`` will also generate .br und .gz (Zopfli) files.

```ruby
namespace :assets do
  task :gzip => :environment do
    logger = Logger.new(STDOUT)
    asset_root = Rails.root.join('public', 'assets')
    zopfli_iterations = 20
    Dir["#{asset_root}/**/*.{js,css,html,svg}"].each do |asset|
      gz_asset_name = "#{asset}.br"
      next if File.exist? gz_asset_name
      sh "bro --input #{asset} --output #{gz_asset_name}"
      sh "zopfli -i#{zopfli_iterations} #{asset}"
    end
  end
end

Rake::Task['assets:precompile'].enhance { Rake::Task['assets:gzip'].invoke }
```

## Update 3rd party instructions

```
git submodules init
git submodules update

cd brotli
git fetch
git checkout vSOMEBRANCH
make

cd ../zopfli
git fetch
git checkout vSOMEBRANCH
make
```

* Copy over the binaries in brotli/bin/bro to the correct architecture in libexec.
* Copy over the binaries in zopfli/zopfli to the correct architecture in libexec.
* Commit changes to submodules & libexec binaries

* Do that step twice, once on a linux (64bit) and OSX/Darwin machine
* 32bit version: There is a Dockerfile to make a quick 32bit env.

Run ``rake run_docker``

```
cd /build/zopfli/ && make && cp /build/zopfli/zopfli /build/libexec/zopfli-linux-x86
cd /build/brotli/ && make && cp /build/brotli/bin/bro /build/libexec/bro-linux-x86
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


