require 'spec_helper'

describe Category do
  it "saved itself" do
    category=Category.new(name:"Cat")
    category.save
    expect(Category.last.name).to eq("Cat")
  end

  it "has many videos" do
    comedies=Category.create(name:"Drama")
    video1=Video.create(title:"first", description:"first_desc", category:comedies)
    video2=Video.create(title:"second", description:"second_desc", category:comedies)
    expect(comedies.videos).to eq([video1, video2])
  end
end
