require 'json'

class NameListsModel
  include ActiveModel::Model

  def index
    JSON.parse(File.read Rails.root.join('storage', 'namelists.json'))
  end

  def item(id)
    filename = Rails.root.join('storage', 'namelists', id + '.json')
    if !File.exist?(filename)
      raise NoSuchEntityException
    end
    JSON.parse(File.read filename)
  end
end