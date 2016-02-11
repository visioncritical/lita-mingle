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
