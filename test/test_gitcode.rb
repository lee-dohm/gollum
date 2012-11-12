# ~*~ encoding: utf-8 ~*~
require File.expand_path( '../helper', __FILE__ )
require File.expand_path( '../wiki_factory', __FILE__ )

context "gitcode" do

  def page_with_content c
    index = @wiki.repo.index
    index.add 'Sample-Html.md', c 
    index.commit 'adding file html sample'

    page = @wiki.page 'Sample Html'
    page
  end

  setup do
    # context
    @wiki, @path, @cleanup = WikiFactory.create 'examples/test.git'

    # given
    p = page_with_content "a\n\n```html:github/gollum/master/test/file_view/1_file.txt```\n\nb"

    # when rendering the page
    @rendered = Gollum::Markup.new(p).render
  end

  test 'that the rendered output is correctly fetched and rendered as html code' do
    assert_equal %Q{<p>a</p>\n\n<div class=\"highlight\"><pre><span class=\"nt\">&lt;ol</span> <span class=\"na\">class=</span><span class=\"s\">\"tree\"</span><span class=\"nt\">&gt;</span>\n  <span class=\"nt\">&lt;li</span> <span class=\"na\">class=</span><span class=\"s\">\"file\"</span><span class=\"nt\">&gt;</span>\n    <span class=\"nt\">&lt;a</span> <span class=\"na\">href=</span><span class=\"s\">\"0\"</span><span class=\"nt\">&gt;&lt;span</span> <span class=\"na\">class=</span><span class=\"s\">\"icon\"</span><span class=\"nt\">&gt;&lt;/span&gt;</span>0<span class=\"nt\">&lt;/a&gt;</span>\n  <span class=\"nt\">&lt;/li&gt;</span>\n<span class=\"nt\">&lt;/ol&gt;</span>\n</pre></div>\n\n<p>b</p>}, @rendered
  end

  test 'contents' do
    g = Gollum::Gitcode.new 'github/gollum/master/test/file_view/1_file.txt'

    assert_equal g.contents, %{<ol class=\"tree\">\n  <li class=\"file\">\n    <a href=\"0\"><span class=\"icon\"></span>0</a>\n  </li>\n</ol>\n}
  end

  teardown do
    @cleanup.call
  end
end
