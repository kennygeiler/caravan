 $(document).ready(function(){
 handler = Gmaps.build('Google');
  handler.buildMap({ provider: {
  }, internal: {id: 'map'}}, function(){
    // markers = handler.addMarkers(#{raw @hash.to_json});
    handler.fitMapToBounds();
  });
})