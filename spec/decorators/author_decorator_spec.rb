require 'spec_helper'

describe AuthorDecorator do
  let(:author) { Author.create(name: "boo") }

  subject { decorate author }

  describe do
    its(:reverse_name) { should eq("oob") }

    its(:form) {
      should match %r|^<form accept-charset="UTF-8" action="/authors/#{author.id}" class="edit_author" id="edit_author_#{author.id}" method="post">|
      should match %r|<input id="author_name" name="author\[name\]" type="text" value="boo" />|
      should match %r|</form>$|
    }

    its(:link) { should eq %(<a href="/authors/#{author.id}">boo</a>) }

    its(:url) { should eq "http://test.host/authors/#{author.id}" }
  end
end
