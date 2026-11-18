'use strict';

// {% include_md path/to/file.md %}
// Renders a Markdown file from source/ (front matter stripped) in place,
// including any tags or {% for %} loops inside it.
const fs = require('fs');
const path = require('path');
const { parse } = require('hexo-front-matter');

hexo.extend.tag.register('include_md', function (args) {
  const file = path.join(hexo.source_dir, args[0]);
  const { _content } = parse(fs.readFileSync(file, 'utf8'));
  return hexo.post.render(file, { content: _content, engine: 'markdown' })
    .then(data => data.content);
}, { async: true });
