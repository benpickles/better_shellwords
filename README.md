# Better Shellwords

If you've ever wanted to use `Shellwords.split` but encountered `ArgumentError: Unmatched double quote` you'll understand why I wanted something better.

```ruby
require 'shellwords'

Shellwords.split("It is a Wonderful Life")
# => ["It", "is", "a", "Wonderful", "Life"]

Shellwords.split("It's a Wonderful Life")
# ArgumentError: Unmatched double quote: "It's a Wonderful Life"
```
