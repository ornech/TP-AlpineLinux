
<grid drag="100 10" drop="top" bg="white" align="left" pad="0 20px">
 <% title %>
</grid>

<grid drag="90 75" drop="5 12"  align="centre">
<% middle %>
</grid>

<grid drag="90 5" drop="5 -6"  align="centre">
<%? source %>
</grid>

<% content %>

<style>
.horizontal_dotted_line{
  border-bottom: 2px dotted gray;
} 
} 
</style>

<grid drag="94 0" drop="3 -6" class="horizontal_dotted_line">
</grid>