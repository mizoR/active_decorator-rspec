require 'spec_helper'

describe AuthorDecorator do
  let(:author) { Author.create(name: "boo") }

  subject { decorate author }

  describe do
    its(:reverse_name) { should eq("oob") }

    its(:form) {
      should match %r|^<form class=\"edit_author\" id=\"edit_author_#{author.id}\" action=\"/authors/#{author.id}\" accept-charset=\"UTF-8\" method=\"post\">|
      should match %r|<input type=\"text\" value=\"boo\" name=\"author\[name\]\" id=\"author_name\" />|
      should match %r|</form>$|
    }

    its(:link) { should eq %(<a href="/authors/#{author.id}">boo</a>) }

    its(:url) { should eq "http://test.host/authors/#{author.id}" }

    its(:link_if_admin) { should eq %(<a href="/authors/#{author.id}">boo</a>) }
  end
end
