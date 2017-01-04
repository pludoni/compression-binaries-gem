# Compression

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

## Update 3rd party instructions

``
git submodules init
git submodules update

cd brotli
git checkout vSOMEBRANCH
make

cd ../zopfli
git checkout vSOMEBRANCH
make
``

* Copy over the binaries in brotli/bin/bro to the correct architecture in libexec.
* Copy over the binaries in zopfli/zopfli to the correct architecture in libexec.


* Do that step twice, once on a linux (64bit) and OSX/Darwin machine
* 32bit version: There is a Dockerfile to make a quick 32bit env.

Run ``rake run_docker``

``
cd /build/zopfli/ && make && cp /build/zopfli/zopfli /build/libexec/zopfli-linux-x86
cd /build/brotli/ && make && cp /build/brotli/bin/bro /build/libexec/bro-linux-x86
``

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


