
<grid drag="100 10" drop="top" bg="white" align="left" pad="0 20px">
 <% title %>
</grid>

<grid drag="37 75" drop="3 15" bg="white" style="border-radius:15px"/>

<grid drag="35 71" drop="4 17" align="topleft">
<% left %>
</grid>


<grid drag="57 75" drop="41 15" align="centre">
<% right %>
</grid>

<grid drag="54 4" drop="-3 -6"  align="centre">
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