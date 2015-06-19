require 'spec_helper'

describe Video do
  it { should belong_to(:category)}
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:description)}
  it { should have_many(:reviews).order('created_at DESC')}
end

describe "search by title" do
  it "returns an empty array if there no match" do
    futurama = Video.create(title: "futurama", description: "Space Travel!")
    back_to_future = Video.create(title: "back_to_future", description:"Time Travel!")
    expect(Video.search_by_title("hello")).to eq([])
  end
  it "returns an array of one video for an exact match" do
    futurama = Video.create(title: "futurama", description: "Space Travel!")
    back_to_future = Video.create(title: "back_to_future", description:"Time Travel!")
    expect(Video.search_by_title("futurama")).to eq([futurama])
  end

  it "returns an array of one video for a partial match" do
    futurama = Video.create(title: "futurama", description: "Space Travel!")
    back_to_future = Video.create(title: "back to future", description:"Time Travel!")
    expect(Video.search_by_title("back")).to eq([back_to_future])
  end

  it "returns an array of all matches ordered by created_at" do
    futurama = Video.create(title: "futurama", description: "Space Travel!", created_at: 1.day.ago)
    back_to_future = Video.create(title: "back to futurama", description:"Time Travel!")
    expect(Video.search_by_title("futurama")).to eq([back_to_future, futurama])
  end

  it "returns an ampty array for a search with an empty string" do
    futurama = Video.create(title: "futurama", description: "Space Travel!", created_at: 1.day.ago)
    back_to_future = Video.create(title: "back to futurama", description:"Time Travel!")
    expect(Video.search_by_title("")).to eq([])
  end


end
