# args.rb

A simple command line arguments parser

## Examples

Accessing arguments with args.rb

```shell
$ ./bin/args --config config/database.yml --verbose --version 5.1 --options 1 2 3 4 5
```

```ruby

args :config
# => 'config/database.yml'

args :verbose, as: :bool
# => true

args :version, as: :float
# => 5.1

args :options, as: :array
# => ['1', '2', '3', '4', '5']

args :unknown
# => nil
```
