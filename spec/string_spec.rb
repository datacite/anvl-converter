require 'spec_helper'

describe String do
  context "from_anvl" do
    it "convert" do
      str = "_status: public"
      expect(str.from_anvl).to eq("_status"=>"public")
    end

    it "escaped newlines" do
      str = "name: Josiah%0ACarberry"
      expect(str.from_anvl).to eq("name"=>"Josiah\nCarberry")
    end

    it "ignore comment" do
      str = "# first draft"
      expect(str.from_anvl).to eq({})
    end

    it "draft example" do
      str = <<-DOC
entry:
# first draft
who:          Gilbert, W.S. | Sullivan, Arthur
what:         The Yeomen of
              the Guard
when/created: 1888
      DOC
      anvl = str.from_anvl
      expect(anvl["entry"]).to eq("")
      expect(anvl["who"]).to eq("Gilbert, W.S. | Sullivan, Arthur")
      expect(anvl["what"]).to eq("The Yeomen of the Guard")
      expect(anvl["when/created"]).to eq("1888")
    end

    it "draft example using symbol keys" do
      str = <<-DOC
entry:
# first draft
who:          Gilbert, W.S. | Sullivan, Arthur
what:         The Yeomen of
              the Guard
when/created: 1888
      DOC
      anvl = str.from_anvl
      expect(anvl[:entry]).to eq("")
      expect(anvl[:who]).to eq("Gilbert, W.S. | Sullivan, Arthur")
      expect(anvl[:what]).to eq("The Yeomen of the Guard")
      expect(anvl[:"when/created"]).to eq("1888")
    end
  end
end