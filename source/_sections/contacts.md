<!--
  Content comes from source/_data/contacts.yml through the data('...') helper in
  scripts/data-tag.js. Keep the <section> free of blank lines: Markdown ends
  an HTML block at a blank line and would treat indented lines after it as code.
-->

<section class="contacts">
  <h2 class="page-h2">Contact</h2>
  <p class="home-contact">
    {%- for item in data('contacts.contacts') %}
    &lt;{{ item.type }}&gt; <a href="{{ item.link }}" target="_blank" rel="noopener noreferrer">{{ item.text }}</a>
    {%- if not loop.last %}<br>{% endif %}
    {%- endfor %}
  </p>
</section>
