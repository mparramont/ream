# Define a command that signs up a user.
class ProcessItem < Mutations::Command
  required do
    duck :data
  end

  def execute
    item = Item.create!(data: data.stringify_keys)
    item
  end
end
