# AngryBoat Rails

[![Linters](https://github.com/angryboat/angry_boat-rails/actions/workflows/lint.yml/badge.svg)](https://github.com/angryboat/angry_boat-rails/actions/workflows/lint.yml) [![Unit Test](https://github.com/angryboat/angry_boat-rails/actions/workflows/test.yml/badge.svg)](https://github.com/angryboat/angry_boat-rails/actions/workflows/test.yml)

## Rubocop

Provides a default configuration for Rubocop. You can inherit from the `main` branches version by adding this to your `.rubocop.yml`

```yaml
inherit_from:
  - https://raw.githubusercontent.com/angryboat/angry_boat-rails/main/rubocop/config.yml
```

## RSpec Integration

Add `require 'angry_boat/rspec'` to your `spec_helper.rb`

### Shared Examples

- `angry_boat.model_factory_sanity`

  ```ruby
  RSpec.describe Person, type: :model do
    include_examples 'angry_boat.model_factory_sanity', -> { FactoryBot.build(:person) }
  end
  ```
