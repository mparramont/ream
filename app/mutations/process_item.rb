# Define a command that signs up a user.
class ProcessItem < Mutations::Command
  required do
    duck :item
  end

  def execute
    binding.pry
    item
  end
end
