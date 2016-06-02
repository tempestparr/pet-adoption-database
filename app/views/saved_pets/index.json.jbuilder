json.array!(@saved_pets) do |saved_pet|
  json.extract! saved_pet, :id
  json.url saved_pet_url(saved_pet, format: :json)
end
