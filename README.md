# lita-mingle

[![Build Status](https://travis-ci.org/visioncritical/lita-mingle.png?branch=master)](https://travis-ci.org/visioncritical/lita-mingle)

A Lita Plugin for creating/updating cards in Mingle.

## Installation

Add lita-mingle to your Lita instance's Gemfile:

```ruby
gem "lita-mingle"
```

## Configuration

This plugin comes with 4 configurations options:

### Required

* server - The URL for your Mingle server
* user - A Mingle user
* hmac_token - The HMAC token value for your specified user

### Example

```ruby
config.handlers.mingle.server = 'https://your.mingle.server'
config.handlers.mingle.user = 'hermes.conrad'
config.handlers.mingle.hmac_token = 'HMACTOKEN'
```

### Optional

* administrator - Your desired contact information. Will replace `%{administrator}` in the following line:

`Please contact %{administrator}.`

Defaults to: 'your Mingle administrator'.

### Example

```ruby
config.handlers.mingle.administrator = '#some_channel'
# OR
config.handlers.mingle.administrator = '@some_group'
# OR
config.handlers.mingle.administrator = 'planetexpress@domain.local'
```

## Usage

```
mingle projects - Lists all the projects for a mingle server (id, name)
mingle [PROJECT_ID] [CARD_TYPE] with name [CARD_NAME] - Creates a mingle card under the specified project
mingle [PROJECT_ID] [CARD_NUM] [DESCRIPTION] - Updates the body of a specified mingle card
```

## License

The MIT License (MIT)

Copyright (c) 2016 Vision Critical

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
