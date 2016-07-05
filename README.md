# Quotesplit

[![Build Status](https://travis-ci.org/benpickles/quotesplit.svg?branch=master)](https://travis-ci.org/benpickles/quotesplit)

Quote-aware whitespace string splitting like `Shellwords.split` but doesn't raise `ArgumentError: Unmatched double quote`.

```ruby
require 'quotesplit'

Quotesplit.split("It's a Wonderful Life")
# => ["It's", "a", "Wonderful", "Life"]
```

```ruby
require 'shellwords'

Shellwords.split("It's a Wonderful Life")
# ArgumentError: Unmatched double quote: "It's a Wonderful Life"
```
