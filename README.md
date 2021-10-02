# AngryBoat Rails

## RSpec Integration

### Shared Examples

- `angry_boat.model_factory_sanity`

  ```ruby
  RSpec.describe Person, type: :model do
    include_examples 'angry_boat.model_factory_sanity', -> { FactoryBot.build(:person) }
  end
  ```
