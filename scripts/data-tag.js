// Look up a value in source/_data by a dotted path, e.g. "awards.awards".
function lookup(path) {
  const keys = path.split('.');
  let result = hexo.locals.get('data');
  for (const key of keys) {
    if (result && key in result) {
      result = result[key];
    } else {
      return '';
    }
  }
  return result;
}

// {% data profile.name %} -> prints the value
hexo.extend.tag.register('data', function(args) {
  return lookup(args[0]);
});

// data('awards.awards') inside {% for %} / {% if %} / {{ }} -> returns the raw value
hexo.extend.tag.env.addGlobal('data', lookup);
