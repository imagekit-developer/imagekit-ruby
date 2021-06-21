# Development Guide


**1. To modify version open `lib/imagekit/sdk/version.rb` and change value of `VERSION`.**

**2. Setup dependency for projects**
```shell
gem install bundler
bundle install
```

**2. Run test cases**
```shell
bundle exec rake
```

**3. To build gem**
```shell
gem build imagekit.gemspec
```
