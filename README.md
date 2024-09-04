# Table of Contents

1.  [Purpose/goal](#orgfecea77)
2.  [Thing that I tried](#orgbb274c5)
3.  [Questions](#orgcf5d68f)


<a id="orgfecea77"></a>

# Purpose/goal

The overall goal is to efficiently extract out the scraping and filtering process already written by [Devdocs](https://github.com/freeCodeCamp/devdocs), and implement into our own project, Open Pair.


<a id="orgbb274c5"></a>

# Thing that I tried

Since I concluded that most if not all of the scraping functionality is written in the lib directory, I started by seeing if I can build an empty app (I chose vanilla JS and Vite), and then just utilize the scraping functionality in there &#x2013; of course emulating the source project's environment as much as possible (Thor, Rake etc.). In that process, I encountered a lot of problems with dependency loading &#x2013; primely with the html-pipeline. Here was the main error:

\`\`\`
/Users/marcosandrade/roaming/code/learning/devdocs-scraper-test/devdocs-only-scraper/devdocs-scrapers/lib/docs/core/filter.rb:4:in \`<module:Docs>': uninitialized constant HTML (NameError)
  class Filter < ::HTML::Pipeline::Filter
\`\`\`

I couldn't figure out of it was a problem with the module, or a problem with the fetch method not getting some HTML, hence the 'uninitialized constant HTML' error

Also, I noticed a lot of 'tasks' are handled by thor, but didn't really know to what extent I would have to re-engineer the project if I wanted to just use the methods and skip the CLI (thor). I wondered if I could just use these methods at the bottom of doc.rb in order to just get that documentation.

I went down a lot of rabbit holes, I think a lot of which were unneeded, and now am pretty confused on where to go from here/ what the REAL problem is.

I notice that there are a lot of HTTP methods defined in Doc.rb as well, such as

\`\`\`
    def fetch(url, opts)
      headers = {}

if opts.key?(:github<sub>token</sub>) and url.start<sub>with</sub>?('https://api.github.com/')
  headers['Authorization'] = "token #{opts[:github<sub>token</sub>]}"
elsif ENV['GITHUB<sub>TOKEN</sub>'] and url.start<sub>with</sub>?('https://api.github.com/')
  headers['Authorization'] = "token #{ENV['GITHUB<sub>TOKEN</sub>']}"
end

opts[:logger].debug("Fetching #{url}")
response = Request.run(url, { connecttimeout: 15, headers: headers })

  if response.success?
    response.body
  else
    reason = response.timed<sub>out</sub>? ? "Timed out while connecting to #{url}" : "Couldn't fetch #{url} (response code #{response.code})"
    opts[:logger].error(reason)
    raise reason
  end
end

def fetch<sub>doc</sub>(url, opts)
  body = fetch(url, opts)
  Nokogiri::HTML.parse(body, nil, 'UTF-8')
end

def fetch<sub>json</sub>(url, opts)
  JSON.parse fetch(url, opts)
end

\`\`\`

If I just 'import' the module, can I just call these methods at will?


<a id="orgcf5d68f"></a>

# Questions

I suppose my biggest questions are:

1.  How easy or difficult would it be to just extract the currently implemented code for scraping from the source devdocs repo, and would it be worth it just to write my own JS version &#x2013; and maybe use devdocs as an adjacent guide?

2.  Is there a way that dependency loading is handled in Ruby that is messing me up, or are my difficulties probably a result of something else? I definitely would like to know about how Ruby handles file loading, the usage of modules in other places in the project and so on.

3.  How would you approach the problem? However high level, or granular you would be willing to answer that question.
