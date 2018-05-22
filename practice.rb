
<%= f.text_field :genre_id, list: "genre_autocomplete" %>
<datalist id="genre_autocomplete">
 <% Genre.all.each do |genre| %>
   <option value="<%= genre.name %>">
 <% end %>
</datalist>
<br>
