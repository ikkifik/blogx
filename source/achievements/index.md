---
title: achievements
layout: page
---

<!--
  Content comes from source/_data/*.yml through the data('...') helper in
  scripts/data-tag.js. Keep each <section> free of blank lines: Markdown ends
  an HTML block at a blank line and would treat indented lines after it as code.
-->

<section class="awards">
  <h2 class="page-h2">Awards</h2>
  <table>
    <colgroup>
      <col span="1" style="width: 70%;">
      <col span="1" style="width: 10%;">
    </colgroup>
    <tbody>
      {%- for item in data('awards.awards') %}
      <tr>
        <td>{{ item.title }}</td>
        <td style="text-align: right;">{{ item.year }}</td>
      </tr>
      {%- endfor %}
    </tbody>
  </table>
</section>

<br>

<section class="publications">
  <h2 class="page-h2">Selected Publications</h2>
  <table>
    <colgroup>
      <col span="1" style="width: 20%;">
      <col span="1" style="width: 80%;">
    </colgroup>
    <tbody>
      {%- for group in ['conferences', 'journal'] %}
      {%- for item in data('publications.' + group) %}
      <tr>
        <td style="font-weight: bold;">
          [{{ item.publisher }}]
          {%- if item.best_paper %}
          <br><span style="color: lightcoral; font-weight: bold; font-size: 14px;">*Best Paper Award</span>
          {%- endif %}
        </td>
        <td>
          <b>{{ item.title }}</b><br>
          {{ item.authors }}<br>
          <a href="{{ item.doi }}"><b>Paper</b></a>
        </td>
      </tr>
      {%- endfor %}
      {%- endfor %}
    </tbody>
  </table>
</section>
